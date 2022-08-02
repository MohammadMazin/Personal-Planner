import 'package:flutter/material.dart';
import 'package:personal_planner/screens/login.dart';
import 'package:personal_planner/utils/appTheme.dart';
import 'package:personal_planner/widgets/button.dart';
import 'package:personal_planner/widgets/onboardItem.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({
    Key? key,
  }) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: 80),
          child: PageView(
            controller: controller,
            onPageChanged: (index) => setState(() {
              isLastPage = index == 2;
            }),
            children: const [
              OnboardItem(
                imgUrl: 'assets/onboard1.json',
                title: 'Simple Yet Powerful Tool to Manage Your Daily Tasks',
                subtitle:
                    'Set task priorities, group tasks, get reminders and many more',
              ),
              OnboardItem(
                imgUrl: 'assets/onboard2.json',
                title: 'Keep Track of Your Daily Expenses',
                subtitle:
                    'All your payment information in one place, making it easy for you know where your money is spent',
              ),
              OnboardItem(
                imgUrl: 'assets/onboard3.json',
                title: 'Personal Planner, a Way to Organise Yourself Better',
                subtitle: '',
              ),
            ],
          ),
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Button(
                title: 'Get Started',
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showLogin', true);

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                  );
                },
              ))
          : Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => controller.jumpToPage(2),
                    child: Text('Skip',
                        style: TextStyle(
                          color: AppTheme.primary,
                        )),
                  ),
                  Center(
                      child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: WormEffect(activeDotColor: AppTheme.secondary),
                  )),
                  TextButton(
                    onPressed: () => controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut),
                    child: Icon(Icons.arrow_forward, color: AppTheme.primary),
                  ),
                ],
              ),
            ),
    );
  }
}
