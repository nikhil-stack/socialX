import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialx/services/auth_services.dart';
import 'package:socialx/services/http_services.dart';
import 'package:socialx/services/store_locally.dart';

TextEditingController searchController = TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isloading = true;
  dynamic apiData = [];
  List<dynamic> news = [];
  List<dynamic> defaultNews = [];

  String? errorMessage = "";

  @override
  void initState() {
    _getNewes();
    super.initState();
  }

  void _getNewes() async {
    final data = await HttpServices().getService();
    apiData = data;

    setState(() {
      news = apiData['articles'];
      defaultNews = news;
      _isloading = false;
    });
  }

  Widget calculateTime(String dt) {
    final DateTime dateOne = DateTime.now();
    final DateTime dateTwo = DateTime.parse(dt);

    final Duration duration = dateOne.difference(dateTwo);
    int hrs = duration.inHours;
    return Text(
      '$hrs hours ago ',
      style: const TextStyle(color: Colors.grey, fontSize: 14),
    );
  }

  Widget reduceAuthorSize(String title) {
    if (title.length >= 20) {
      title = title.substring(0, 20);
    }
    return Text(
      title,
      style: const TextStyle(
          color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w800),
    );
  }

  Future<void> signOut() async {
    try {
      await Auth().signOut();
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget reduceStringSize(String title, String type) {
    if (title.length >= 70) {
      title = title.substring(0, 70);
    }
    return Text(
      title,
      style: TextStyle(
        color: Colors.blue,
        fontSize: 12,
        fontWeight: type == 'title' ? FontWeight.w700 : FontWeight.normal,
      ),
    );
  }

  void searchNews(String query) {
    news = defaultNews;
    final suggestions = news.where((element) {
      final newsTitle = element['title'].toString().toLowerCase();
      final input = query.toLowerCase();

      return newsTitle.contains(input);
    }).toList();

    setState(() {
      news = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            InkWell(
              onTap: () {},
              child: const Icon(
                Icons.search,
                color: Colors.blue,
                size: 32,
              ),
            ),
            Expanded(
              flex: 3,
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: 'search in feed',
                      hintStyle: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                      ),
                      border: InputBorder.none,
                    ),
                    onChanged: searchNews,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () => signOut(),
                  child: const Text(
                    'Logout',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ))
          ],
        ),
      ),
      body: _isloading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: news.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    height: 136,
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 2.0,
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: [
                                        calculateTime(
                                            news[index]['publishedAt']),
                                        Expanded(
                                            child: reduceAuthorSize(news[index]
                                                    ['author'] ??
                                                'N.A')),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: reduceStringSize(
                                          news[index]['title'], 'title')),
                                  Expanded(
                                      flex: 1,
                                      child: reduceStringSize(
                                          news[index]['description'] ?? 'N.A',
                                          '')),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: Image.network(news[index]
                                            ['urlToImage'] !=
                                        null
                                    ? '${news[index]['urlToImage']}'
                                    : 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png'))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
