import 'package:flutter/material.dart';
import 'package:news/screens/all_news.dart';
import 'package:news/screens/breaking_news.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            'NEWS',
          ),
          bottom: const TabBar(
            indicatorColor: Colors.black,
            tabs: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Breaking NEWS',style: TextStyle(letterSpacing: 2),),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Today\'s NEWS',style: TextStyle(letterSpacing: 2),),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            BreakingNews(),
            AllNews(),
          ],
        ),
      ),
    );
  }
}
