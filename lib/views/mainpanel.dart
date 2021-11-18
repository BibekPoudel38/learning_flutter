import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_app/views/homepage.dart';
import 'package:movie_app/views/search.dart';

class MainPanel extends StatefulWidget {
  const MainPanel({Key? key}) : super(key: key);

  @override
  _MainPanelState createState() => _MainPanelState();
}

class _MainPanelState extends State<MainPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Profile"),
        ],
      ),
      body: Container(
        child: PageView(
          children: [
            Homepage(),
            SearchPage(),
          ],
        ),
      ),
    );
  }
}
