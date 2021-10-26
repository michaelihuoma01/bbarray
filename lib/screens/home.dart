import 'package:bbarray/screens/album_screen.dart';
import 'package:bbarray/screens/post_screen.dart';
import 'package:bbarray/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome \nto the app',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w800)),
            const SizedBox(height: 10),
            const Text('Press a button to get started',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            const SizedBox(height: 40),
            ButtonWidget(
                title: 'Discover an album',
                height: 80,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AlbumScreen(),
                      ));
                }),
            const SizedBox(height: 20),
            ButtonWidget(
              title: 'Discover a post',
              height: 80,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PostScreen(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
