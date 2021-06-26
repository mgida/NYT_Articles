import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nyt_articles/model/article.dart';
import 'package:nyt_articles/ui/components/articles_list_item.dart';
import 'package:nyt_articles/ui/screens/detail_screen.dart';

class ArticlesListView extends StatelessWidget {
  const ArticlesListView({
    Key? key,
    required this.context,
    required this.articles,
  }) : super(key: key);

  final BuildContext context;
  final List<Article>? articles;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return GridView.builder(
      itemCount:
          (articles == null || articles?.length == 0) ? 0 : articles?.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            navigateToDetailScreen(context, index);
          },
          child: ArticlesListItem(article: articles![index]),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: orientation == Orientation.landscape ? 2 : 1,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: 1 / 1,
      ),
      shrinkWrap: true,
    );
  }

  void navigateToDetailScreen(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(
          article: articles![index],
        ),
      ),
    );
  }
}
