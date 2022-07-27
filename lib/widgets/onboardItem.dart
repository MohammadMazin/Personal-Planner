import 'package:flutter/material.dart';
import 'package:personal_planner/utils/appTheme.dart';

class OnboardItem extends StatelessWidget {
  const OnboardItem({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String imgUrl;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imgUrl,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.07,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FittedBox(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppTheme.textLight,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
