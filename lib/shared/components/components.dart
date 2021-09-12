import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/webview_Screen.dart';

Widget buildArticaleItem(context, data) => InkWell(
      onTap: () {
        print(data['url']);
        navigateTo(context, WebViewScreen(data['url'], data['title']));
      },
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('${data['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('${data['title']}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: Theme.of(context).textTheme.bodyText1),
                    Text(
                      '${data['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
Widget getSeperatedLine() => Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey,
    );
void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: widget,
    );
  }));
}
