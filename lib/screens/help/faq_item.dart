import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class FaqItem extends StatelessWidget {
  final String question;
  final String answer;
  final bool link;

  const FaqItem({
    Key key,
    this.question,
    this.answer,
    this.link,
  }) : super(key: key);

  _launchURL(String urlString) async {
    await launch(
      urlString,
    );
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          question,
          style: _theme.textTheme.headline.copyWith(
            color: Colors.blue,
          ),
        ),
        (link == null || link == false
            ? Text(
                answer,
                style: _theme.textTheme.body1
                    .copyWith(fontSize: _theme.textTheme.body1.fontSize + 2),
              )
            : InkWell(
                onTap: () => _launchURL(answer),
                child: Text(
                  answer,
                  style: _theme.textTheme.body1
                      .copyWith(fontSize: _theme.textTheme.body1.fontSize + 2),
                ),
              )),
      ],
    );
  }
}
