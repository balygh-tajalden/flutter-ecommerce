import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String? senderId;
  String? receiverId;
  String? orderId;
  String? message;
  String? type; // text or image
  dynamic time;
  bool? isRead;

  ChatModel({
    this.senderId,
    this.receiverId,
    this.orderId,
    this.message,
    this.type,
    this.time,
    this.isRead,
  });

  ChatModel.fromJson(Map<String, dynamic> json) {
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    orderId = json['order_id'];
    message = json['message'];
    type = json['type'];
    time = json['time'];
    isRead = json['is_read'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['order_id'] = orderId;
    data['message'] = message;
    data['type'] = type;
    data['time'] = time ?? FieldValue.serverTimestamp();
    data['is_read'] = isRead ?? false;
    return data;
  }
}
