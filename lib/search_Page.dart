import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});


  @override
  Widget build(BuildContext context) {
    
    List<String> categories = [
      'IGTV ',
      'Travel',
      'Food',
      'Architecture',
      'Style',
      'Music',
      'Art',
      'Decor',
      'Beauty',
      'DIY',
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(Icons.search),
                hintText: "Search",
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
            actions: [IconButton(icon: Icon(Icons.person_add), onPressed: () {})],
          ),
          SliverAppBar(
            title: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: List.generate(10, (index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    categories[index],
                  ),
                ),
              )),),
            ),
          ),
        ],
      ),
    );
  }
}