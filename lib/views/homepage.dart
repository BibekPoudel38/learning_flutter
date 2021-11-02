import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controller/themecontroller.dart';
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
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: const Icon(Icons.account_circle_outlined),
        //   ),
        // ],
      ),
      drawer: sideDrawer(),
      body: Container(
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(4),
              height: 150,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Card(
                      child: Container(
                        height: 100,
                        color: Colors.yellow.shade300,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 150,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Hello World",
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                                Text("This is a message to World")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 120,
                    color: Colors.orange,
                    child: Image.asset(
                      "assets/bgimage.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      // body: Container(
      //   color: Colors.white,
      //   // child: chatsList(),
      //   child: GridView.builder(
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 2,
      //     ),
      //     itemCount: chats.length,
      //     itemBuilder: (context, index) {
      //       return SizedBox(
      //         height: 150,
      //         child: Card(
      //           child: Column(
      //             children: [
      //               Image.network(
      //                 chats[index].profilePicture.toString(),
      //                 height: 120,
      //               ),
      //               ListTile(
      //                 title: Text(chats[index].username.toString()),
      //                 subtitle: Text(chats[index].message.toString()),
      //               ),
      //             ],
      //           ),
      //         ),
      //       );
      //     },
      //   ),
      // ),
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
          trailing: chats[index].seen
              ? const Icon(Icons.done_all)
              : const Icon(Icons.pending),
        );
      },
    );
  }

  Drawer sideDrawer() {
    return Drawer(
      child: ListView(
        children: [
          GetBuilder<ThemeController>(
              init: ThemeController(),
              builder: (themeController) {
                return SwitchListTile(
                  value: themeController.isDarkTheme,
                  title: const Text("Switch to dark theme"),
                  onChanged: (value) {
                    themeController.toggleTheme();
                  },
                );
              }),
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
