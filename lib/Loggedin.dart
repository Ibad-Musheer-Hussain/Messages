import 'package:flutter/material.dart';
import 'package:message/Chat.dart';
import 'package:message/Friends.dart';

class Loggedin extends StatefulWidget {
  const Loggedin({super.key});

  @override
  State<Loggedin> createState() => _LoggedinState();
}

class _LoggedinState extends State<Loggedin> {
  final TextEditingController pass = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  int selectedIndex = 0;
  String appbarText = "Messenger App";
  void sendMessage() {
    String message = pass.text;
    if (message.isNotEmpty) {
      setState(() {
        Messages.add(Chat(sender: "YourName", message: message, userID: false));
        pass.clear();
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
    }
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[400],
        title: Center(child: Text(appbarText)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      surfaceTintColor: Colors.black,
                      title: Text('Log Out'),
                      content: Text('Are you sure you want to log out?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('Sign Out',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.red,
                              )),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.pop(context); // Close the dialog
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              )),
          Container(
            width: MediaQuery.of(context).size.width / 60,
          )
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 5,
          ),
          Container(
            height: 80,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: FriendList.length,
              itemBuilder: (BuildContext context, int index) {
                Friends friend = FriendList[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      appbarText = friend.name;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 9),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: index == selectedIndex
                            ? Colors.grey[500]
                            : Colors.grey[300],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            child: Text(friend.initials),
                            backgroundColor: Colors.grey[400],
                          ),
                          Container(
                            height: 5,
                          ),
                          Text(
                            friend.name,
                            style: TextStyle(
                                color: index == selectedIndex
                                    ? Colors.white
                                    : Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height - 245,
                child: ListView.builder(
                  controller: _scrollController,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: Messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    Chat chat = Messages[index];
                    bool showContainer =
                        index == 0 || chat.userID == Messages[index - 1].userID;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: chat.userID
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 8, right: 8),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                            child: Text(
                              chat.message,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                        ),
                        Container(
                          height: 2,
                        ),
                        if (showContainer) Container(height: 10),
                      ],
                    );
                  },
                ),
              ),
              Container(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.image,
                          size: 28,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.attach_file,
                          size: 28,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.gif_box,
                          size: 28,
                        )),
                    Flexible(
                        child: Container(
                      height: 52, // Set a fixed height or adjust as needed
                      child: SingleChildScrollView(
                        child: TextField(
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          controller: pass,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey)),
                              fillColor: Colors.grey,
                              filled: true,
                              hintText: "Message",
                              hintStyle: TextStyle(color: Colors.white)),
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                        ),
                      ),
                    )),
                    IconButton(
                        onPressed: () {
                          sendMessage();
                        },
                        icon: Icon(
                          Icons.send,
                          size: 28,
                        )),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
