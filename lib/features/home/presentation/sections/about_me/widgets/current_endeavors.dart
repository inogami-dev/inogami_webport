import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/text.dart';
import 'package:my_portfolio/features/home/domain/my_extensions/build_context_extension.dart';
import 'package:my_portfolio/features/home/presentation/sections/about_me/widgets/current_endeavor_card.dart';

class CurrentEndeavors extends StatelessWidget {
  final double width;

  const CurrentEndeavors({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.isMobile;

    return Container(
      // width: width,
      // color: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16,
        children: [
          MyText(text: "Current Endeavors"),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              CurrentEndeavorCard(
                width: width,
                title: "Temp 1",
                description:
                    "knadkn kwjdbkajd wdkjabdjk wkknadkn kwjdbkajd wdkjabdjk wkakd wdaakd wdknknadkn kwjdbkajd wdkjabdjk wkakd wdaadkn kwjdbkajd wdkjabdjk wkakd wdaknadkn kwjdbkajd wdkjabdjk wkakd wdaa",
              ),
              CurrentEndeavorCard(
                width: width,
                cardEntryNumber: 2,
                title: "Temp 2",
                description:
                    "mnBDmna d man dmw nkna dkn kwjdbkajd wdkjabdjk wkakd wdakn adkn kwjdbkajd wdkjabdjk wkakd wdadwdand mnwd adn amknadkn kwjdbkajd wdkjabdjk wkakd wdad awmd amndbad",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
