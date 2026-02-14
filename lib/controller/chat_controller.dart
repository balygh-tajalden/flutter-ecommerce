import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/services/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

abstract class ChatController extends GetxController {
  void sendMessage(String orderId, String receiverId);
  Future<void> sendImage(String orderId, String receiverId);
  Future<void> deleteMessage(String messageId);
  void markAsRead(String messageId);
}

class ChatControllerImp extends ChatController {
  late TextEditingController textController;
  MyServices myServices = Get.find();
  
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  // تم الاستغناء عن Firebase Storage واستبداله بـ Cloudinary
  // FirebaseStorage storage = FirebaseStorage.instanceFor(bucket: "ecommerce-3faa8.firebasestorage.app");
  
  ImagePicker picker = ImagePicker();

  String? userId;
  String? username;

  // Cloudinary Configuration
  final String cloudName = "ddxcysutt"; 
  final String uploadPreset = "chat_preset"; 
  
  @override
  void onInit() {
    textController = TextEditingController();
    userId = myServices.sharedPreferences.getString("id");
    username = myServices.sharedPreferences.getString("username");
    super.onInit();
  }

  Future<String?> uploadToCloudinary(File file) async {
    final url = Uri.parse("https://api.cloudinary.com/v1_1/$cloudName/image/upload");
    
    var request = http.MultipartRequest("POST", url);
    request.fields['upload_preset'] = uploadPreset;
    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseData = await response.stream.toBytes();
        var responseString = String.fromCharCodes(responseData);
        var jsonResponse = jsonDecode(responseString);
        return jsonResponse['secure_url'];
      } else {
        print("Cloudinary Upload Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Cloudinary Upload Exception: $e");
      return null;
    }
  }

  @override
  void sendMessage(String orderId, String receiverId) {
    if (textController.text.trim().isNotEmpty) {
      String msg = textController.text.trim();
      textController.clear();
      
      firestore.collection("orders_chat").add({
        "order_id": orderId,
        "sender_id": userId ?? "anonymous",
        "receiver_id": receiverId,
        "username": username ?? "Anonymous",
        "message": msg,
        "type": "text",
        "time": FieldValue.serverTimestamp(),
        "is_read": false,
      });
    }
  }

  @override
  Future<void> sendImage(String orderId, String receiverId) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File file = File(image.path);
      
      try {
        Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);
        
        String? downloadUrl = await uploadToCloudinary(file);
        
        Get.back(); // Close loading dialog

        if (downloadUrl != null) {
          // Save to Firestore
          firestore.collection("orders_chat").add({
            "order_id": orderId,
            "sender_id": userId ?? "anonymous",
            "receiver_id": receiverId,
            "username": username ?? "Anonymous",
            "message": downloadUrl,
            "type": "image",
            "time": FieldValue.serverTimestamp(),
            "is_read": false,
          });
        } else {
          Get.snackbar("Error", "فشل في رفع الصورة إلى Cloudinary", backgroundColor: Colors.red, colorText: Colors.white);
        }
      } catch (e) {
        Get.back(); // Close loading dialog
        Get.snackbar("Error", "فشل في رفع الصورة: $e", backgroundColor: Colors.red, colorText: Colors.white);
      }
    }
  }

  @override
  void markAsRead(String messageId) {
    firestore.collection("orders_chat").doc(messageId).update({"is_read": true});
  }

  @override
  Future<void> deleteMessage(String messageId) async {
    await firestore.collection("orders_chat").doc(messageId).delete();
  }

  Stream<QuerySnapshot> getChatStream(String orderId) {
    Stream<QuerySnapshot> stream = firestore.collection("orders_chat")
        .where("order_id", isEqualTo: orderId)
        .orderBy("time", descending: true)
        .snapshots();

    // Auto mark as read when new messages arrive in the stream
    stream.listen((snapshot) {
      for (var doc in snapshot.docs) {
        var data = doc.data() as Map<String, dynamic>;
        if (data['receiver_id'] == userId && data['is_read'] == false) {
          markAsRead(doc.id);
        }
      }
    });

    return stream;
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
