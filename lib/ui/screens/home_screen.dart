import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:nyt_articles/model/result.dart';
import 'package:nyt_articles/rest_api/article_service.dart';
import 'package:nyt_articles/ui/components/articles_list_view.dart';
import 'package:nyt_articles/utils/constants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('NYT BEST STORIES'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
        child: _buildBody(context),
      ),
    );
  }

  FutureBuilder<Response<Result>> _buildBody(BuildContext context) {
    return FutureBuilder(
        future: Provider.of<ArticleService>(context, listen: false)
            .getBestArticles(kApiKey),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('NO INTERNET CONNECTION'),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _buildBody(context);
                        });
                      },
                      child: Text('RETRY'),
                    ),
                  ],
                ),
              );
            }
            final articleResult = snapshot.data?.body;
            final articles = articleResult?.articles;
            return ArticlesListView(context: context, articles: articles);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
