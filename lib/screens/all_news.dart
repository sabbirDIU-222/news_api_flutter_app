import 'package:flutter/material.dart';

import '../api_service.dart';
import '../components/news_item_list.dart';
import '../model/news_model.dart';

class AllNews extends StatefulWidget {
  const AllNews({Key? key}) : super(key: key);

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getAllNews(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Apimodel> articleList = snapshot.data ?? [];
            return ListView.builder(
              itemCount: articleList.length,
              itemBuilder: (context, index) {
                return NewsItemList(apimodel: articleList[index],);
              },
            );
          }
          return Container(
            child: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
