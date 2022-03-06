import 'package:evaluation_projrct/helpers/validation_helper.dart';
import 'package:evaluation_projrct/pages/article_listing_page.dart';
import 'package:evaluation_projrct/service/api_services.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchQuery = 'election';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: SizedBox(
                  width: 350,
                  height: 70,
                  child: TextFormField(
                    onChanged: (value) {
                      searchQuery = value;
                    },
                    validator: (value) => SearchValidator.validate(value),
                    decoration: const InputDecoration(
                        label: Text('Search'),
                        border: OutlineInputBorder(),
                        hintText: 'Search articles here'),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ArticlesListScreen(
                          getArticles:
                              APIService().fetchArticlesBySearch(searchQuery),
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Search'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
