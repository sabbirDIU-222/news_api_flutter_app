import 'package:flutter/material.dart';
import 'package:news/api_service.dart';
import 'package:news/components/news_item_list.dart';
import 'package:news/model/news_model.dart';

class BreakingNews extends StatefulWidget {
  const BreakingNews({Key? key}) : super(key: key);

  @override
  State<BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<BreakingNews> {
  ApiService apiService = ApiService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getBreakingNews(),
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
