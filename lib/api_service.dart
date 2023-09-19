import 'dart:convert';
import 'package:http/http.dart';
import 'package:news/model/news_model.dart';

class ApiService{
    final all_news_url = 'https://newsapi.org/v2/everything?q=bitcoin&apiKey=ac69be4d9a83424588f8980dd60eb8bd';
    final breaking_news_url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=ac69be4d9a83424588f8980dd60eb8bd';


    // create the function for getting the data all

    Future<List<Apimodel>> getAllNews()async{
        try{
            Response response = await get(Uri.parse(all_news_url));
            if(response.statusCode==200){
                Map<String,dynamic> json = jsonDecode(response.body);
                List<dynamic> body = json['articles'];
                List<Apimodel> articles = body.map((items) => Apimodel.fromJson(items)).toList();
                return articles;
            }else{
                throw ('Sorry We are shut down');
            }
        }catch(e){
            throw e;
        }
    }

    // functino for get the top or breaking news

    Future<List<Apimodel>> getBreakingNews()async{
        try{
            Response response = await get(Uri.parse(breaking_news_url));
            if(response.statusCode == 200){
                Map<String, dynamic> json = jsonDecode(response.body);
                List<dynamic> body = json['articles'];
                List<Apimodel> articleList = body.map((item) => Apimodel.fromJson(item)).toList();
                return articleList;
            }else{
                throw ('no data found');
            }
        }catch (e){
            throw e;
        }
    }

}