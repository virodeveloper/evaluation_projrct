import 'package:evaluation_projrct/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:evaluation_projrct/extension/article_extension.dart';

class ArticlesListScreen extends StatefulWidget {
  const ArticlesListScreen({
    required this.getArticles,
    Key? key,
  }) : super(key: key);

  final Future<Result> getArticles;
  @override
  State<ArticlesListScreen> createState() => _ArticlesListScreenState();
}

class _ArticlesListScreenState extends State<ArticlesListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Articles'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: FutureBuilder<Result>(
            future: widget.getArticles,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData && snapshot.data != null) {
                  return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, int index) {
                      final article = snapshot.data?.docs[index];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            article!.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(article.publishingDate),
                          const Divider(),
                        ],
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text('No Result Found'),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
          ),
        ),
      ),
    );
  }
}
