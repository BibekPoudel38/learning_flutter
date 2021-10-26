import 'package:flutter/material.dart';
import 'package:movie_app/models/listModel.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<ListModel> chats = [
    ListModel(
      username: "Aarambha",
      profilePicture:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/1024px-User_icon_2.svg.png",
      date: "Today",
      message: "Hello there how are you",
      seen: false,
    ),
    ListModel(
      username: "Pokhara",
      profilePicture:
          "https://i.pinimg.com/originals/8b/16/7a/8b167af653c2399dd93b952a48740620.jpg",
      date: "Yesterday",
      message: "It was raining yesterday",
      seen: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle_outlined),
          ),
        ],
      ),
      drawer: sideDrawer(),
      body: Container(
        // child: chatsList(),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: chats.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 150,
              child: Card(
                child: Column(
                  children: [
                    Image.network(
                      chats[index].profilePicture.toString(),
                      height: 120,
                    ),
                    ListTile(
                      title: Text(chats[index].username.toString()),
                      subtitle: Text(chats[index].message.toString()),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  ListView chatsList() {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (context, index) {
        // List<String> fruits = ["apple", "ball", "Cat", "Dog"];

        return ListTile(
            title: Text(chats[index].username.toString()),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                chats[index].profilePicture.toString(),
              ),
            ),
            subtitle: Text(chats[index].message.toString()),
            trailing:
                chats[index].seen ? Icon(Icons.done_all) : Icon(Icons.pending));
      },
    );
  }

  Drawer sideDrawer() {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 150,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/bgimage.jpeg",
                  fit: BoxFit.cover,
                ),
                const Text("Movie"),
              ],
            ),
          ),
          const ListTile(
            title: Text("Homepage"),
            leading: Icon(Icons.home),
          ),
          const ListTile(
            title: Text("About us"),
            leading: Icon(Icons.note),
          ),
        ],
      ),
    );
  }
}
