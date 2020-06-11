import 'dart:io';

import 'package:corona_tracker/screens/help/faq_item.dart';
import 'package:flutter/material.dart';

class Help extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'FAQs',
            style: _theme.textTheme.display1,
          ),
          FaqItem(
            question: 'Are you official?',
            answer: 'No',
          ),
          FaqItem(
            question:
                'What are your sources? How is the data gathered for this project?',
            answer:
                'I am consuming APIs provided by https://www.covid19india.org. They are using state bulletins and official handles to update our numbers. The data is validated by a group of volunteers and published into a Google sheet and an API. API is available for all at api.covid19india.org.',
          ),
          FaqItem(
            question:
                'Why does covid19india.org have more positive count than MoH?',
            answer:
                'MoHFW updates the data at a scheduled time. However, we update them based on state press bulletins, official handles and reliable news channels which could be more recent.',
          ),
          FaqItem(
            question: 'Who are you?',
            answer: 'My name is Aditya Harshey. I am a software engineer.',
          ),
          FaqItem(
            question: 'Helpline numbers[By State]',
            answer:
                'https://www.mohfw.gov.in/pdf/coronvavirushelplinenumber.pdf',
            link: true,
          ),
          FaqItem(
            question: 'Offical Website?',
            answer: 'https://www.mohfw.gov.in',
            link: true,
          )
        ],
      ),
    );
  }
}
