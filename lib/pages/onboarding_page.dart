import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:onboarding_screen_app/widgets/onboarding_card.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'qrcode.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  static final PageController _pageController = PageController(initialPage: 0);

  final List<Widget> _onBoardingPages = [];

  @override
  void initState() {
    super.initState();
    _onBoardingPages.addAll([
      OnboardingCard(
        image: "assets/images/parking.jpg",
        title: 'Welcome to Smart Parking System!',
        description:
            'Introducing the Smart Parking System platform and providing an overview of the application\'s purpose.',
        buttonText: 'Next',
        onPressed: () {
          _pageController.animateToPage(
            1,
            duration: Durations.long1,
            curve: Curves.linear,
          );
        },
      ),
      OnboardingCard(
        image: "assets/images/parking2.jpg",
        title: 'Smart Free Place Navigation For Parking System',
        description:
            'Directing users to open parking places in the parking lot.',
        buttonText: 'Next',
        onPressed: () {
          _pageController.animateToPage(
            2,
            duration: Durations.long1,
            curve: Curves.linear,
          );
        },
      ),
      OnboardingCard(
        image: "assets/images/parking3.jpg",
        title: 'Security For Your Car',
        buttonText: 'Next',
        onPressed: () {
          _pageController.animateToPage(3,
              duration: Durations.long1, curve: Curves.linear);
        },
        description: '',
      ),
      OnboardingCard(
        image: "assets/images/login_info.jpg",
        title: 'Security For Your Info',
        buttonText: 'Done',
        description: 'Login Or Sign Up An Account',
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => QRCODE()));
        },
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 50.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: _onBoardingPages,
              ),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: _onBoardingPages.length,
              effect: ExpandingDotsEffect(
                activeDotColor: Theme.of(context).colorScheme.primary,
                dotColor: Theme.of(context).colorScheme.secondary,
              ),
              onDotClicked: (index) {
                _pageController.animateToPage(
                  index,
                  duration: Durations.long1,
                  curve: Curves.linear,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
