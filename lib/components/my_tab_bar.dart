import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  
  const MyTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: [
          //first Tab
          Tab(
            icon: Icon(Icons.home),
          ),
          
          //Second Tab
          Tab(
            icon: Icon(Icons.settings),
          ),

          //Third Tab
          Tab(
            icon: Icon(Icons.person),
          ),

        ]
      ),
    );
  }
}