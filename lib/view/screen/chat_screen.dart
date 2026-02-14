import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/chat_controller.dart';
import 'package:flutter_application_1/view/widget/chat/customchatbubble.dart';
import 'package:flutter_application_1/view/widget/chat/customchatinput.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Check if arguments are null to avoid Crash
    if (Get.arguments == null) {
      return const Scaffold(body: Center(child: Text("خطأ: لا توجد بيانات للمحادثة")));
    }

    final String orderId = Get.arguments['orderId'] ?? "0";
    final String receiverId = Get.arguments['receiverId'] ?? "0";
    final String receiverName = Get.arguments['receiverName'] ?? "Unknown";

    ChatControllerImp controller = Get.put(ChatControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(receiverName),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: controller.getChatStream(orderId),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("ابدأ المحادثة الآن..."));
                }

                return ListView.builder(
                  reverse: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var doc = snapshot.data!.docs[index];
                    var data = doc.data() as Map<String, dynamic>;
                    bool isMe = data['sender_id'] == controller.userId;

                    return CustomChatBubble(
                      data: data,
                      isMe: isMe,
                      onLongPress: isMe
                          ? () {
                              Get.defaultDialog(
                                title: "حذف",
                                middleText: "هل تريد حذف هذه الرسالة؟",
                                textConfirm: "نعم",
                                textCancel: "لا",
                                onConfirm: () {
                                  controller.deleteMessage(doc.id);
                                  Get.back();
                                },
                              );
                            }
                          : null,
                    );
                  },
                );
              },
            ),
          ),
          CustomChatInput(
            controller: controller,
            orderId: orderId,
            receiverId: receiverId,
          ),
        ],
      ),
    );
  }
}
