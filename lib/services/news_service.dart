import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NewsService {
  // ! Data
  final String _baseUrl = 'https://newsapi.org/v2/top-headlines';
  final String _apiKey = dotenv.env['NEWS_API_KEY'] ?? 'API_KEY_NOT_FOUND';

  Future<List<Article>> fetchTopHeadlines({String country = 'us'}) async {
    final url = Uri.parse('$_baseUrl?country=$country&apiKey=$_apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        if (data['status'] == 'ok') {
          final List articlesJson = data['articles'];
          return articlesJson.map((json) => Article.fromJson(json)).toList();
        } else {
          throw Exception('API Tidak Merespon: ${data['message']}');
        }
      } else {
        throw Exception('Gagal load Berita: ${response.reasonPhrase}');
      }
    } catch (e) {
      throw Exception('Error fetching Berita: $e');
    }
  }
}
