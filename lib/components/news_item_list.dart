import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/news_model.dart';

class NewsItemList extends StatelessWidget {
  final Apimodel apimodel;

  NewsItemList({required this.apimodel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            height: 250,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            imageUrl: apimodel.urlToImage.toString(),
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => Container(),
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.brown),
                child: Text(
                  apimodel.source!.name.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(apimodel.publishedAt.toString()),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(apimodel.author == null ? '' :
            'written by ' + apimodel.author.toString(),
            style: TextStyle(),
          ),
          SizedBox(height: 8.0,),
          Text(apimodel.title == null ? '' :
             apimodel.title.toString(),
            style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
