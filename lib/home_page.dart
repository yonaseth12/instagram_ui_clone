import 'package:flutter/material.dart';
import 'data/comment.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> profileImages = [0,1,2,3,4,5,6,7].map((index) => 'images/user_$index.jpg').toList();   // The list from 0 to 7 can be created with: List.generate(8, (index) => index)
  List<String> profileNames = ['Andy', 'Maria', 'Ramos S.', 'Katy', 'Eve', 'Lilly', 'Creed', 'Xiang'];
  Future<void> onRefresh() async{
    await Future.delayed(Duration(seconds:1));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset(
        'images/instagram_title.png',
        height: 50,
        ),
      actions: [
        IconButton(icon: Icon(Icons.add_circle_outline), onPressed: (){}),
        IconButton(icon: Icon(Icons.favorite_outline), highlightColor: Colors.pink[200], onPressed: (){}),
        IconButton(icon: Icon(Icons.chat_bubble_outline), onPressed: (){}),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //STORY
              StoryCircleWidget(profileImages: profileImages, profileNames: profileNames, storyNumber: 8, circleRadius: 35,),
              Divider(),
              //POSTS
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(22, (index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //HEADER OF POST
                    Row(children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                            radius: 14,
                            backgroundImage: AssetImage(
                              'images/story.jpg',
                            ),
                            child: CircleAvatar(
                              radius: 13,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundImage: AssetImage(profileImages[(index+5) % 8],),
                              ),
                            ),
                          ),
                      ),
                        Text(profileNames[(index+6)%8], style: TextStyle(fontSize: 10)),
                        Spacer(),
                        IconButton(icon: Icon(Icons.more_vert), onPressed: () {},)
                    ],),
                    //IMAGE OF POST
                    FadeInImage.assetNetwork(
                      placeholder: 'images/loading_image.gif',
                      placeholderFit: BoxFit.fitWidth,
                      image: 'images/post_${(index+10)%22}.jpg',
                      width: MediaQuery.of(context).size.width,
                      // height: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                    ),
                    //BOTTOM OF POST
                    Row(children:[
                      IconButton(icon: Icon(Icons.favorite_border), highlightColor: Colors.pink[200], onPressed: () {}),
                      IconButton(icon: Icon(Icons.chat_bubble_outline), highlightColor: Colors.grey, onPressed: () {}),
                      IconButton(icon: Icon(Icons.label_outline), highlightColor: Colors.grey, onPressed: () {}),
                      Spacer(),
                      IconButton(icon: Icon(Icons.bookmark_border), onPressed: () {}),
                    ],),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(text: TextSpan(
                            //style: TextStyle(fontColor: Colors.black),
                            children: [
                              TextSpan(text: 'Liked by '),
                              TextSpan(text: profileNames[(index+3)%8], style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' and '),
                              TextSpan(text: '${Random().nextInt(40)+2} others', style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          )),
                          RichText(text: TextSpan(
                            //style: TextStyle(fontColor: Colors.black),
                            children: [
                              TextSpan(text: profileNames[(index+4)%8], style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' ' + comments[index]),
                            ],
                          )),
                          Text('View all ${Random().nextInt(420)+4} comments', style: TextStyle(color: Colors.black38)),
                        ],
                      ),
                    ),
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StoryCircleWidget extends StatelessWidget {
  const StoryCircleWidget({
    super.key,
    required this.profileImages,
    required this.profileNames,
    required this.storyNumber,
    required this.circleRadius,
  });

  final List<String> profileImages;
  final List<String> profileNames;
  final int storyNumber;
  final int circleRadius;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(storyNumber, (index) => Container(
          padding: EdgeInsets.all(6),
          child: Column(
            children: [
              CircleAvatar(
                radius: circleRadius * 1.0,
                backgroundImage: AssetImage(
                  'images/story.jpg',
                ),
                child: CircleAvatar(
                  radius: circleRadius - 2.0,
                  child: CircleAvatar(
                    radius: circleRadius - 4,
                    backgroundImage: AssetImage(profileImages[index],),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(profileNames[index], style: TextStyle(fontSize: 12, color: Colors.black87,),),
            ],
          ),
        ))
      ),
    );
  }
}