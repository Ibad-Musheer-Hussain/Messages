class Chat {
  final String sender;
  final String message;
  final bool userID;

  Chat({required this.sender, required this.message, required this.userID});
}

List<Chat> Messages = [
  Chat(sender: "Mitch", message: "Hello!", userID: true),
  Chat(sender: "Mitch", message: "Hello!\n\n\n\n\n.", userID: true),
  Chat(sender: "Mitch", message: "Hello!", userID: false),
  Chat(sender: "Mitch", message: "Hello!", userID: true),
  Chat(sender: "Mitch", message: "Hello!", userID: false),
  Chat(sender: "Mitch", message: "Hello!", userID: true),
  Chat(sender: "Mitch", message: "Hello!", userID: false),
  Chat(sender: "Mitch", message: "Hello!", userID: false),
  Chat(sender: "Mitch", message: "Hello!", userID: true),
  Chat(sender: "Mitch", message: "Hello!", userID: false),
  Chat(sender: "Mitch", message: "Hello!", userID: false),
  Chat(sender: "Mitch", message: "Hello!", userID: true),
  Chat(sender: "Mitch", message: "Hello!", userID: false),
  Chat(sender: "Mitch", message: "Hello!", userID: true),
  Chat(sender: "Mitch", message: "Hello!", userID: false),
  Chat(sender: "Mitch", message: "Hello!", userID: false),
  Chat(sender: "Mitch", message: "Hello!", userID: true),
  Chat(sender: "Mitch", message: "Hello!", userID: false),
];
