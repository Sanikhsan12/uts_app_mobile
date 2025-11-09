import 'package:flutter/material.dart';
import '../services/news_service.dart';
import '../models/news_model.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final NewsService _newsService = NewsService();
  late Future<List<Article>> _futureArticles;

  @override
  void initState() {
    super.initState();
    _futureArticles = _newsService.fetchTopHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ! Judul Halaman
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Berita Terbaru',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            // ! Daftar Berita
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: FutureBuilder<List<Article>>(
                    future: _futureArticles,
                    builder: (context, snapshot) {
                      // ! Loading handler
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      // ! Error handler
                      if (snapshot.hasError) {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Error: ${snapshot.error}',
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        );
                      }

                      // ! Data handler
                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        final articles = snapshot.data!;
                        return ListView.separated(
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return _buildNewsCard(articles[index]);
                          },
                          separatorBuilder: (context, index) {
                            return const Divider(
                              height: 1,
                              thickness: 1,
                              indent: 16,
                              endIndent: 16,
                            );
                          },
                        );
                      }
                      return const Center(
                        child: Text('Tidak ada berita tersedia.'),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCard(Article articles) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16.0),
      leading: articles.urlToImage != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                articles.urlToImage!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey,
                    child: const Icon(Icons.broken_image, color: Colors.white),
                  );
                },
              ),
            )
          : Container(
              width: 100,
              height: 100,
              color: Colors.grey,
              child: const Icon(Icons.image_not_supported, color: Colors.white),
            ),
      title: Text(
        articles.title,
        maxLines: 2,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        articles.description ?? 'Deskripsi tidak tersedia.',
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Fitur buka tautan belum diimplementasi.')),
        );
      },
    );
  }
}
