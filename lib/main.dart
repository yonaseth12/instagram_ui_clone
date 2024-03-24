import 'package:flutter/material.dart';
import 'package:instagram_ui_clone/home_page.dart';
import 'package:instagram_ui_clone/search_page.dart';
import 'package:instagram_ui_clone/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(color: Color.fromRGBO(40, 40, 40, 1)),
        appBarTheme: AppBarTheme(elevation: 1, color: Colors.white),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class PageBone extends StatefulWidget {

  @override
  State<PageBone> createState() => _PageBoneState();
}

class _PageBoneState extends State<PageBone> {

  String selectedPage = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selectedPage == 'home' ? HomePage() : SearchPage(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                setState(() {
                  selectedPage = 'home';
                });
              },
              color: selectedPage == 'home' ? Colors.pink[800]: Color.fromRGBO(40, 
              40, 40, 1),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                setState(() {
                  selectedPage = 'search';
                });
              },
              color: selectedPage == 'search' ? Colors.pink[800]: Color.fromRGBO(40, 40, 40, 1),
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.ondemand_video),
              onPressed: () {},
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.card_travel),
              onPressed: () {},
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
