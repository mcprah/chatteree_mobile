import 'package:chatteree_mobile/models/user_model.dart';

class MessageRepository {
  List<Map<String, dynamic>> fetchMessageListFromRepo() {
    List<Map<String, dynamic>> messagesList = [
      {
        "from": User(
          id: 1,
          profileImageUrl: "https://i.pravatar.cc/150?u=a042581f4e29026704d",
          username: "@user1",
          email: "user1@example.com",
          name: "John Doe",
          onlineStatus: true,
        ),
        "date_time": "08:00am",
        "unread_count": 2,
        "message_snippet": "Hello there!",
      },
      {
        "from": User(
          id: 2,
          profileImageUrl: "https://i.pravatar.cc/150?u=a042581f4e29026704d",
          username: "@jane_doe",
          email: "jane.doe@example.com",
          name: "Jane Doe",
          onlineStatus: false,
        ),
        "date_time": "1d",
        "unread_count": 0,
        "message_snippet": "Can we meet tomorrow?",
      },
      {
        "from": User(
          id: 3,
          profileImageUrl: "",
          username: "@user123",
          email: "user123@example.com",
          name: "User 123",
          onlineStatus: true,
        ),
        "date_time": "03:15pm",
        "unread_count": 7,
        "message_snippet": "Looking forward to the event!",
      },
      {
        "from": User(
          id: 4,
          profileImageUrl: "https://i.pravatar.cc/150?u=a042581f4e290267045",
          username: "@alex_smith",
          email: "alex.smith@example.com",
          name: "Alex Smith",
          onlineStatus: false,
        ),
        "date_time": "09:45am",
        "unread_count": 1,
        "message_snippet": "Just checking in.",
      },
      {
        "from": User(
          id: 5,
          profileImageUrl: "https://i.pravatar.cc/150?u=a042581f4e29022314d",
          username: "@mike_johnson",
          email: "mike.johnson@example.com",
          name: "Mike Johnson",
          onlineStatus: false,
        ),
        "date_time": "5d",
        "unread_count": 0,
        "message_snippet": "Thanks for your help!",
      },
    ];

    return messagesList;
  }
}
