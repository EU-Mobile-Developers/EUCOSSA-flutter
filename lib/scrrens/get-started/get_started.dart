import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

void main() {
  runApp(const EucossaApp());
}

class EucossaApp extends StatelessWidget {
  const EucossaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eucossa Mobile',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingItem> _onboardingItems = [
    OnboardingItem(
      title: "Tech Resources",
      description: "Access curated PDFs, notes, and learning materials to boost your tech skills",
      image: Icons.library_books_outlined,
      color: Colors.deepPurple,
    ),
    OnboardingItem(
      title: "Join Communities",
      description: "Connect with like-minded developers in organized tech communities",
      image: Icons.people_alt_outlined,
      color: Colors.blue,
    ),
    OnboardingItem(
      title: "Hackathons & Events",
      description: "Participate in exciting hackathons and tech events",
      image: Icons.event_outlined,
      color: Colors.green,
    ),
    OnboardingItem(
      title: "Your Tech Profile",
      description: "Manage your account, preferences, and privacy settings",
      image: Icons.person_outline,
      color: Colors.orange,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Skip button
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const GetStartedScreen()),
                    );
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            
            // PageView for onboarding items
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _onboardingItems.length,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(item: _onboardingItems[index]);
                },
              ),
            ),
            
            // Page indicator
            SmoothPageIndicator(
              controller: _pageController,
              count: _onboardingItems.length,
              effect: WormEffect(
                activeDotColor: _onboardingItems[_currentPage].color,
                dotColor: Colors.grey[300]!,
                dotHeight: 10,
                dotWidth: 10,
                spacing: 8,
              ),
            ),
            
            // Navigation buttons
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back button
                  TextButton(
                    onPressed: _currentPage > 0
                        ? () {
                            _pageController.previousPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        : null,
                    child: Text(
                      "Back",
                      style: TextStyle(
                        color: _currentPage > 0 
                            ? _onboardingItems[_currentPage].color 
                            : Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  
                  // Next/Get Started button
                  ElevatedButton(
                    onPressed: () {
                      if (_currentPage < _onboardingItems.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const GetStartedScreen()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _onboardingItems[_currentPage].color,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      elevation: 2,
                    ),
                    child: Text(
                      _currentPage < _onboardingItems.length - 1 ? "Next" : "Get Started",
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingItem {
  final String title;
  final String description;
  final IconData image;
  final Color color;

  OnboardingItem({
    required this.title,
    required this.description,
    required this.image,
    required this.color,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Animated icon container
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: item.color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              item.image,
              size: 80,
              color: item.color,
            ),
          ),
          
          const SizedBox(height: 40),
          
          // Title
          Text(
            item.title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: item.color,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 16),
          
          // Description
          Text(
            item.description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade50,
              Colors.white,
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo/icon
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.rocket_launch_outlined,
                color: Colors.white,
                size: 60,
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Welcome text
            const Text(
              "Welcome to Eucossa",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                "Your tech community companion for resources, hackathons, and connections",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Get Started button
            ElevatedButton(
              onPressed: () {
                // Navigate to main app
                print("Get Started pressed!");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                elevation: 2,
              ),
              child: const Text(
                "Get Started",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Sign in option
            TextButton(
              onPressed: () {
                // Navigate to login screen
                print("Sign In pressed!");
              },
              child: const Text(
                "Already have an account? Sign In",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}