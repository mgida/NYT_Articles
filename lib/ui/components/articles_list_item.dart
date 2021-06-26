import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:nyt_articles/model/article.dart';
import 'package:nyt_articles/utils/helper_format.dart';

class ArticlesListItem extends StatelessWidget {
  const ArticlesListItem({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article? article;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    Size size = MediaQuery.of(context).size;

    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: size.width,
              height: size.height * 0.05,
              child: InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                child: CachedNetworkImage(
                  imageUrl: article?.multimedia?[0]?.url ??
                      "https://www.generationsforpeace.org/wp-content/uploads/2018/07/empty.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 6.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: size.width * 0.03,
                    child: Opacity(
                      opacity: 0.7,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          article?.title ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: textTheme.bodyText2,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Opacity(
                    opacity: 0.7,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        HelperFormat.formattedPublishedDate(
                                article?.publishedDate ?? '') ??
                            '',
                        style: textTheme.bodyText2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.001,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 2.0, horizontal: 6.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                article?.abstract ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: textTheme.subtitle1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
