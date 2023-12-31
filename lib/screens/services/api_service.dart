import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import '../model/article_model.dart';

class ApiService {
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=919adc211ebb4534bbacb2482b981d80";

  Future<List<Article>> getArticle() async {
    Response res = await get(Uri.parse(endPointUrl));

    if (res.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw Exception("Can't get the Articles");
    }
  }
}
