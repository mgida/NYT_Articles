import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nyt_articles/model/article.dart';
import 'package:nyt_articles/utils/helper_format.dart';

class DetailScreen extends StatelessWidget {
  final Article? article;

  DetailScreen({required this.article});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('DETAIL'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  height: size.height * 0.35,
                  child: InkWell(
                    customBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(16.0),
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: article?.multimedia?[0].url ??
                          "https://www.generationsforpeace.org/wp-content/uploads/2018/07/empty.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    article?.title ?? '',
                    style: textTheme.headline6,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Opacity(
                    opacity: 0.7,
                    child: Text(
                      article?.abstract ?? '',
                      style: textTheme.subtitle1,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.001,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Opacity(
                    opacity: 0.7,
                    child: Text(
                      HelperFormat.formattedPublishedDate(
                              article?.publishedDate ?? '') ??
                          '',
                      style: textTheme.subtitle1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
