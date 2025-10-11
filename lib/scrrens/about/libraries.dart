import 'package:flutter/material.dart';

class LibrariesPage extends StatelessWidget {
  const LibrariesPage({super.key});

  final List<Library> _libraries = const [
    Library(
      name: 'Material',
      version: 'Built-in',
      description: 'Flutter\'s Material Design component library',
      website: 'https://flutter.dev',
      license: 'BSD-3-Clause',
      icon: Icons.design_services_rounded,
      color: Colors.blue,
      features: [
        'Material Design components',
        'Theming and styling',
        'Navigation patterns',
        'Widget library',
        'Animation support',
      ],
    ),
    Library(
      name: 'Cupertino Icons',
      version: '1.0.8',
      description: 'iOS-style icon pack for Flutter apps',
      website: 'https://pub.dev/packages/cupertino_icons',
      license: 'MIT',
      icon: Icons.phone_iphone_rounded,
      color: Colors.purple,
      features: [
        'iOS-style icons',
        'High-quality vector icons',
        'Easy integration',
        'Regular updates',
        'Cross-platform consistency',
      ],
    ),
    Library(
      name: 'Smooth Page Indicator',
      version: '1.0.0+2',
      description: 'Beautiful and customizable page indicators',
      website: 'https://pub.dev/packages/smooth_page_indicator',
      license: 'MIT',
      icon: Icons.animation_rounded,
      color: Colors.orange,
      features: [
        'Smooth animations',
        'Customizable effects',
        'Multiple indicator types',
        'Gesture support',
        'Performance optimized',
      ],
    ),
    Library(
      name: 'Shared Preferences',
      version: '2.2.2',
      description: 'Persistent storage for simple data',
      website: 'https://pub.dev/packages/shared_preferences',
      license: 'BSD-3-Clause',
      icon: Icons.storage_rounded,
      color: Colors.green,
      features: [
        'Key-value storage',
        'Platform persistence',
        'Simple API',
        'Async operations',
        'Data serialization',
      ],
    ),
    Library(
      name: 'Provider',
      version: '6.1.1',
      description: 'State management wrapper around InheritedWidget',
      website: 'https://pub.dev/packages/provider',
      license: 'MIT',
      icon: Icons.settings_rounded,
      color: Colors.red,
      features: [
        'Simple state management',
        'Dependency injection',
        'Performance optimized',
        'Minimal boilerplate',
        'Flutter team recommended',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.indigo.shade700,
                      Colors.indigo.shade400,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.library_books_rounded,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Libraries & Dependencies',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Open-source libraries powering Eucossa',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Summary Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.indigo.shade50,
                          Colors.purple.shade50,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.indigo.shade100,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.code_rounded,
                              color: Colors.indigo.shade700,
                              size: 24,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Powered by Open Source',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.indigo.shade800,
                                    ),
                                  ),
                                  Text(
                                    '${_libraries.length} amazing libraries',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.indigo.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Eucossa Mobile App is built with amazing open-source libraries that help deliver a smooth and feature-rich experience. We\'re grateful to the Flutter community and all the contributors.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.indigo.shade700,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Libraries Grid
                  ..._libraries.map((library) => _buildLibraryCard(context, library)).toList(),

                  const SizedBox(height: 30),

                  // Open Source Love
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.green.shade600,
                          Colors.green.shade400,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.favorite_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Love Open Source?',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'These libraries are maintained by amazing developers worldwide. Consider supporting them or contributing to their projects.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                _showContributionDialog(context);
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                side: const BorderSide(color: Colors.white),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: const Text('Learn More'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Open Flutter packages
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.green.shade600,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: const Text('Explore Packages'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLibraryCard(BuildContext context, Library library) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  library.color.withOpacity(0.1),
                  library.color.withOpacity(0.05),
                ],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: library.color.withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    library.icon,
                    color: library.color,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        library.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: library.color,
                        ),
                      ),
                      Text(
                        'Version ${library.version}',
                        style: TextStyle(
                          fontSize: 14,
                          color: library.color.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: library.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: library.color.withOpacity(0.3),
                    ),
                  ),
                  child: Text(
                    library.license,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: library.color,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Description
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  library.description,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),

                // Features
                Text(
                  'Key Features:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: library.color,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: library.features.map((feature) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: library.color.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      feature,
                      style: TextStyle(
                        fontSize: 12,
                        color: library.color,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )).toList(),
                ),
              ],
            ),
          ),

          // Actions
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      _showLibraryDetails(context, library);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: library.color,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.info_outline_rounded, size: 18),
                        SizedBox(width: 6),
                        Text('Details'),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: 20,
                  color: Colors.grey[300],
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      // Open website
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: library.color,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.open_in_new_rounded, size: 18),
                        SizedBox(width: 6),
                        Text('Website'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLibraryDetails(BuildContext context, Library library) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    library.color.withOpacity(0.15),
                    library.color.withOpacity(0.08),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: library.color.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      library.icon,
                      color: library.color,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          library.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: library.color,
                          ),
                        ),
                        Text(
                          'Version ${library.version} • ${library.license} License',
                          style: TextStyle(
                            fontSize: 14,
                            color: library.color.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close_rounded,
                      color: library.color,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      library.description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24),

                    const Text(
                      'Features',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...library.features.map((feature) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.check_circle_rounded,
                            color: library.color,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              feature,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )).toList(),

                    const SizedBox(height: 24),

                    const Text(
                      'Usage in Eucossa',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildUsageExample(library),

                    const SizedBox(height: 24),

                    const Text(
                      'License Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'This library is distributed under the ${library.license} license. You can find the complete license text on the official website.',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Footer
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                border: Border(
                  top: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: library.color,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Close'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Open website
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: library.color,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Visit Website'),
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

  Widget _buildUsageExample(Library library) {
    String usage = '';
    switch (library.name) {
      case 'Material':
        usage = 'Used throughout the app for UI components, theming, and Material Design compliance.';
      case 'Cupertino Icons':
        usage = 'Provides iOS-style icons for cross-platform consistency and visual appeal.';
      case 'Smooth Page Indicator':
        usage = 'Powers the beautiful onboarding screen indicators with smooth animations.';
      case 'Shared Preferences':
        usage = 'Manages user preferences, login state, and app settings persistence.';
      case 'Provider':
        usage = 'Handles state management across the app for efficient data flow.';
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: library.color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: library.color.withOpacity(0.2),
        ),
      ),
      child: Text(
        usage,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black87,
          height: 1.5,
        ),
      ),
    );
  }

  void _showContributionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.emoji_people_rounded,
                  color: Colors.indigo,
                  size: 30,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Contribute to Open Source',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'These libraries are maintained by the Flutter community. You can contribute by reporting issues, suggesting features, or even submitting code improvements.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.indigo,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Learn More'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // Open contribution guide
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Get Started'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Library {
  final String name;
  final String version;
  final String description;
  final String website;
  final String license;
  final IconData icon;
  final Color color;
  final List<String> features;

  const Library({
    required this.name,
    required this.version,
    required this.description,
    required this.website,
    required this.license,
    required this.icon,
    required this.color,
    required this.features,
  });
}