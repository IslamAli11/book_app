import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../layout/home_screen.dart';
import '../shared/component/component.dart';
import '../shared/constants.dart';
import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);
  PageController pageIndicatorController = PageController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:backgroundColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: backgroundColor,
        actions: [
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            Text(
              'Books',
              style: defaultTextStyle(
                  fontSize: 34,
                  textColor: Colors.teal),
            ),
            SizedBox(
              height: height * .04,
            ),
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) =>
                    BoardingItem(model: boarding[index]),
                itemCount: boarding.length,
                controller: pageIndicatorController,
              ),
            ),
            SmoothPageIndicator(
              controller: pageIndicatorController,
              count: boarding.length,
              axisDirection: Axis.horizontal,
              effect: const SlideEffect(
                spacing: 2.0,
                radius: 11.0,
                dotWidth: 35.0,
                dotHeight: 12.0,
                paintStyle: PaintingStyle.stroke,
                strokeWidth: 1.5,
                //  dotColor:  Colors.white,
                activeDotColor: Colors.orange,
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            DefaultTextButton(
                fontSize: 18,
                text: 'Get Started',
                textColor: Colors.white,
                width: double.infinity,
                height: 40,
                color: Colors.teal,
                radius: 10.0,
                onPressed: () {
                  navigateAndRemove(context, HomeScreen());
                }),
            SizedBox(
              height: height * .02,
            ),

          ],
        ),
      ),
    );
  }
}
