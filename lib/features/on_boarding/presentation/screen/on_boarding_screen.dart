import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();

  int currentIndex = 0;

  final List<Map<String, String>> pages = [
    {
      'image': 'assets/images/onboarding1.png',
      'title': 'Welcome to NEXT HIRE',
      'description': 'Start building your freelance future today.',
      'button': 'Start',
    },
    {
      'image': 'assets/images/onboarding2.png',
      'title': 'Your Freelance Future Starts Here',
      'description':
          'Build your profile, improve your score, and connect with the right projects faster than ever.',
      'button': 'Next',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // MAIN CONTENT
          Expanded(
            child: PageView.builder(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // SCREENSHOT
                      Image.asset(
                        height: 300,
                        width: 300,
                        pages[index]['image']!,
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(height: 40),

                      /// TEXT GROUP
                      Column(
                        children: [
                          Text(
                            pages[index]['title']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            pages[index]['description']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      /// NEXT BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 58,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF0D2B52),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          onPressed: () {
                            if (currentIndex == 0) {
                              // move to second page
                              controller.animateToPage(
                                1,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.ease,
                              );
                            } else {
                              // go to home
                              // context.go('/home');
                            }
                          },
                          child: Text(
                            pages[index]['button']!,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      /// SKIP BUTTON
                      if (index == 0)
                        SizedBox(
                          width: double.infinity,
                          height: 58,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFF0D2B52)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Skip',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF0D2B52),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),

                      const SizedBox(height: 40),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
