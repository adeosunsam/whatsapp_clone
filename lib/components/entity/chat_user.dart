class ChatUser {
  final String id, time, name, image, message;
  final bool isRead, isSent;
  final int? unreadCount;
  ChatUser({
    required this.isRead,
    this.unreadCount,
    required this.id,
    required this.time,
    required this.name,
    required this.image,
    required this.message,
    required this.isSent,
  });
}

List<ChatUser> users = [
  ChatUser(
    id: "2",
    time: "Yesterday",
    name: "Vikran",
    image: "assets/images/image.jpeg",
    message: "Hey man, you busy?",
    isRead: false,
    unreadCount: 1,
    isSent: false,
  ),
  ChatUser(
    id: "3",
    time: "Yesterday",
    name: "Reagan.NET",
    image: "assets/images/image.jpeg",
    message: "Aw far",
    isRead: true,
    isSent: true,
  ),
  ChatUser(
    id: "4",
    time: "Yesterday",
    name: "+233 34 542 8790",
    image: "assets/images/image.jpeg",
    message: "Thanks man",
    isRead: true,
    isSent: false,
  ),
  ChatUser(
    id: "5",
    time: "Yesterday",
    name: "+234 705 821 0912",
    image: "assets/images/image.jpeg",
    message: "Thanks man",
    isRead: true,
    isSent: false,
  ),
  ChatUser(
    id: "6",
    time: "Yesterday",
    name: "+234 707 354 2312",
    image: "assets/images/image.jpeg",
    message: "Are we still having our section today?",
    isRead: true,
    isSent: true,
  ),
  ChatUser(
    id: "7",
    time: "Yesterday",
    name: "Last Gen",
    image: "assets/images/image.jpeg",
    message: "dude, talk to me.",
    isRead: false,
    unreadCount: 4,
    isSent: false,
  ),
  ChatUser(
    id: "8",
    time: "Yesterday",
    name: "Sample Portfolio",
    image: "assets/images/image.jpeg",
    message: "are you still interested?",
    isRead: false,
    unreadCount: 2,
    isSent: false,
  ),
];
