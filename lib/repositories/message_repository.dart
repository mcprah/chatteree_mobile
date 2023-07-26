class MessageRepository {
  List<Map<String, dynamic>> fetchMessageListFromRepo() {
    List<Map<String, dynamic>> messagesList = [
      {
        "from": {
          "id": 2,
          "profile_image_url":
              "https://i.pravatar.cc/150?u=a042581f4e29026704d",
          "username": "@jane_doe",
          "email": "jane.doe@example.com",
          "name": "Jane Doe",
          "online_status": false,
        },
        "date_time": "1d",
        "unread_count": 0,
        "value": [
          {
            "user_id": 2,
            "text": "Thanks for your help!",
          }
        ],
      },
      {
        "from": {
          "id": 3,
          "profile_image_url": "",
          "username": "@user123",
          "email": "user123@example.com",
          "name": "User 123",
          "online_status": true,
        },
        "date_time": "03:15pm",
        "unread_count": 7,
        "value": [
          {"user_id": 3, "text": "Looking forward to the event!"}
        ],
      },
      {
        "from": {
          "id": 4,
          "profile_image_url":
              "https://i.pravatar.cc/150?u=a042581f4e290267045",
          "username": "@alex_smith",
          "email": "alex.smith@example.com",
          "name": "Alex Smith",
          "online_status": true,
        },
        "date_time": "09:45am",
        "unread_count": 1,
        "value": [
          {
            "user_id": 4,
            "text": "Just checking in.",
          }
        ],
      },
      {
        "from": {
          "id": 5,
          "profile_image_url":
              "https://i.pravatar.cc/150?u=a042581f4e29022314d",
          "username": "@mike_johnson",
          "email": "mike.johnson@example.com",
          "name": "Mike Johnson",
          "online_status": false,
        },
        "date_time": "5d",
        "unread_count": 0,
        "value": [
          {
            "user_id": 123,
            "text": "Hello, You're welcome",
          },
          {
            "user_id": 3,
            "text": "Thanks for your help!",
          },
          {
            "user_id": 5,
            "text":
                "You for look sharp make we go see am before the day go end else la wu!"
          },
        ],
      },
    ];

    return messagesList;
  }
}
