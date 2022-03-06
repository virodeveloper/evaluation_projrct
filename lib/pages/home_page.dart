import 'package:evaluation_projrct/pages/article_listing_page.dart';
import 'package:evaluation_projrct/pages/search_page.dart';
import 'package:evaluation_projrct/service/api_services.dart';
import 'package:evaluation_projrct/widgets/custom_row_item.dart';
import 'package:evaluation_projrct/widgets/custom_row_title.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NYC'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTitle(title: 'Search'),
          CustomRowItem(
            itemTitle: 'Search Articles',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SearchPage(),
              ));
            },
          ),
          const CustomTitle(title: 'Popular'),
          CustomRowItem(
            itemTitle: 'Most Viewed',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ArticlesListScreen(
                  getArticles: APIService().fetchArticlesByMostViewed(),
                ),
              ),
            ),
          ),
          CustomRowItem(
            itemTitle: 'Most Shared',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ArticlesListScreen(
                  getArticles: APIService().fetchArticlesByMostShared(),
                ),
              ),
            ),
          ),
          CustomRowItem(
            itemTitle: 'Most Emailed',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ArticlesListScreen(
                  getArticles: APIService().fetchArticlesByMostEmailed(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
