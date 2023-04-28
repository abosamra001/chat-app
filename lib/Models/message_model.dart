class MessageModel {
  MessageModel({required this.text, required this.id});
  String text;
  String id;

  factory MessageModel.fromJson(data) {
    return MessageModel(text: data['message'], id: data['id']);
  }
}
