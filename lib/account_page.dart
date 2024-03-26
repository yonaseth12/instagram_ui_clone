import 'package:flutter/material.dart';
import 'package:instagram_ui_clone/home_page.dart' show StoryCircleWidget;

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 40,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(children: [Text('237', style: TextStyle(fontWeight: FontWeight.bold)), Text('Posts')],),
                            Column(children: [Text('8780', style: TextStyle(fontWeight: FontWeight.bold)), Text('Followers')],),
                            Column(children: [Text('40', style: TextStyle(fontWeight: FontWeight.bold)), Text('Following')],),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Text('Haruki', style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 2),
                  Text('On quest to utopia'),
                  SizedBox(height: 2),
                  Text('m.youtube.com/yonaseth12.dev/', style: TextStyle(color: Colors.blue),),
                  SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                            child: Text('Edit Profile', textAlign: TextAlign.center,),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                            child: Text('Ad Tools', textAlign: TextAlign.center,),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                            child: Text('Insights', textAlign: TextAlign.center,),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ]),
                  ),
                  //STORIES
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20.0, 0),
                      child: Row(
                        children: [
                          StoryCircleWidget(
                            profileNames: List.generate(4, (n) => 'story $n'),
                            profileImages: List.generate(4, (n) => 'images/user_${n+2}.jpg'),
                            storyNumber: 4,
                            circleRadius: 32,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              tabs: [
                Tab(icon: Icon(Icons.grid_3x3_outlined)),
                Tab(icon: Icon(Icons.video_call)),
                Tab(icon: Icon(Icons.shop)),
                Tab(icon: Icon(Icons.person)),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                AccountTab(tabNumber : 1),
                AccountTab(tabNumber : 2),
                AccountTab(tabNumber : 3),
                AccountTab(tabNumber : 4),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}


class AccountTab extends StatelessWidget {
  const AccountTab({super.key, required this.tabNumber});

  final int tabNumber;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 5,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder:  (context, index) {
        return Padding(
          padding: EdgeInsets.all(2.0),
          child: Container(
            color: switch (tabNumber) {
              1 => Colors.blue[100],
              2 => Colors.pink[100],
              3 => Colors.deepPurple[100],
              4 => Colors.green[100],
              // TODO: Handle this case.
              int() => null,
            } 
          ),
        );
      }
    );
  }
}