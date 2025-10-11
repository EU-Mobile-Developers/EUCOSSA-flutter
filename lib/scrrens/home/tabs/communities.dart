import 'package:flutter/material.dart';

class CommunitiesPage extends StatefulWidget {
  const CommunitiesPage({super.key});

  @override
  State<CommunitiesPage> createState() => _CommunitiesPageState();
}

class _CommunitiesPageState extends State<CommunitiesPage> {
  final List<Community> _featuredCommunities = [
    Community(
      id: '1',
      name: 'Flutter Developers Kenya',
      description: 'A vibrant community of Flutter enthusiasts building cross-platform apps with Dart. Share knowledge, collaborate on projects, and grow together.',
      memberCount: 1250,
      onlineCount: 89,
      category: 'Mobile Development',
      icon: Icons.phone_iphone_rounded,
      color: Colors.blue,
      isJoined: true,
      recentActivity: '2 hours ago',
      tags: ['Flutter', 'Dart', 'Mobile', 'UI/UX'],
      imageUrl: 'https://images.unsplash.com/photo-1551650975-87deedd944c3?w=500',
    ),
    Community(
      id: '2',
      name: 'AI & Machine Learning',
      description: 'Explore the frontiers of artificial intelligence, machine learning, and data science. Perfect for students interested in AI research and applications.',
      memberCount: 890,
      onlineCount: 45,
      category: 'Artificial Intelligence',
      icon: Icons.smart_toy_rounded,
      color: Colors.purple,
      isJoined: false,
      recentActivity: '5 hours ago',
      tags: ['AI', 'ML', 'Python', 'Data Science'],
      imageUrl: 'https://images.unsplash.com/photo-1555255707-c07966088b7b?w=500',
    ),
  ];

  final List<Community> _allCommunities = [
    Community(
      id: '3',
      name: 'Web Development',
      description: 'Full-stack web development community focusing on modern technologies like React, Node.js, and cloud platforms.',
      memberCount: 1100,
      onlineCount: 67,
      category: 'Web Development',
      icon: Icons.code_rounded,
      color: Colors.green,
      isJoined: true,
      recentActivity: '1 hour ago',
      tags: ['React', 'Node.js', 'JavaScript', 'CSS'],
      imageUrl: 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?w=500',
    ),
    Community(
      id: '4',
      name: 'Cybersecurity Enthusiasts',
      description: 'Learn about cybersecurity, ethical hacking, and information security best practices. Protect digital assets and build secure systems.',
      memberCount: 650,
      onlineCount: 23,
      category: 'Security',
      icon: Icons.security_rounded,
      color: Colors.red,
      isJoined: false,
      recentActivity: '3 hours ago',
      tags: ['Security', 'Ethical Hacking', 'Networking'],
      imageUrl: 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=500',
    ),
    Community(
      id: '5',
      name: 'Data Science & Analytics',
      description: 'Dive into data analysis, visualization, and statistical modeling. Work with real datasets and build data-driven solutions.',
      memberCount: 720,
      onlineCount: 34,
      category: 'Data Science',
      icon: Icons.analytics_rounded,
      color: Colors.orange,
      isJoined: false,
      recentActivity: '6 hours ago',
      tags: ['Python', 'R', 'SQL', 'Visualization'],
      imageUrl: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=500',
    ),
    Community(
      id: '6',
      name: 'Game Development',
      description: 'Create amazing games using Unity, Unreal Engine, and other game development frameworks. Perfect for creative developers.',
      memberCount: 480,
      onlineCount: 18,
      category: 'Game Dev',
      icon: Icons.sports_esports_rounded,
      color: Colors.pink,
      isJoined: true,
      recentActivity: 'Just now',
      tags: ['Unity', 'C#', '3D Modeling', 'Game Design'],
      imageUrl: 'https://images.unsplash.com/photo-1550745165-9bc0b252726f?w=500',
    ),
    Community(
      id: '7',
      name: 'IoT & Embedded Systems',
      description: 'Build connected devices and explore the Internet of Things. Work with Arduino, Raspberry Pi, and embedded systems.',
      memberCount: 320,
      onlineCount: 12,
      category: 'Hardware',
      icon: Icons.memory_rounded,
      color: Colors.teal,
      isJoined: false,
      recentActivity: '8 hours ago',
      tags: ['Arduino', 'Raspberry Pi', 'Electronics', 'IoT'],
      imageUrl: 'https://images.unsplash.com/photo-1558618666-fcd25856cd49?w=500',
    ),
    Community(
      id: '8',
      name: 'Blockchain & Web3',
      description: 'Explore blockchain technology, smart contracts, and decentralized applications. Shape the future of the internet.',
      memberCount: 540,
      onlineCount: 29,
      category: 'Blockchain',
      icon: Icons.account_balance_wallet_rounded,
      color: Colors.amber,
      isJoined: false,
      recentActivity: '4 hours ago',
      tags: ['Blockchain', 'Smart Contracts', 'Web3', 'Crypto'],
      imageUrl: 'https://images.unsplash.com/photo-1639762681485-074b7f938ba0?w=500',
    ),
  ];

  final List<String> _categories = [
    'All',
    'Mobile',
    'Web',
    'AI/ML',
    'Security',
    'Data',
    'Game Dev',
    'Hardware',
    'Blockchain'
  ];

  int _selectedCategoryIndex = 0;
  String _searchQuery = '';

  List<Community> get _filteredCommunities {
    var communities = _allCommunities;
    
    // Filter by search query
    if (_searchQuery.isNotEmpty) {
      communities = communities.where((community) =>
          community.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          community.description.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          community.tags.any((tag) => tag.toLowerCase().contains(_searchQuery.toLowerCase()))
      ).toList();
    }
    
    // Filter by category
    if (_selectedCategoryIndex > 0) {
      final category = _categories[_selectedCategoryIndex];
      communities = communities.where((community) =>
          community.category.toLowerCase().contains(category.toLowerCase())
      ).toList();
    }
    
    return communities;
  }

  void _joinCommunity(Community community) {
    setState(() {
      community.isJoined = true;
    });
    _showJoinSuccess(context, community);
  }

  void _leaveCommunity(Community community) {
    setState(() {
      community.isJoined = false;
    });
    _showLeaveDialog(context, community);
  }

  void _showCommunityDetails(BuildContext context, Community community) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CommunityDetailsSheet(
        community: community,
        onJoin: () => _joinCommunity(community),
        onLeave: () => _leaveCommunity(community),
      ),
    );
  }

  void _showJoinSuccess(BuildContext context, Community community) {
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
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.group_add_rounded,
                  color: Colors.green,
                  size: 40,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Welcome to ${community.name}!',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'You\'ve successfully joined the community. Start connecting with ${community.memberCount}+ members!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Explore Community'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLeaveDialog(BuildContext context, Community community) {
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
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.group_remove_rounded,
                  color: Colors.red,
                  size: 40,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Leave Community?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Are you sure you want to leave ${community.name}?',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.grey,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Cancel'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // Additional leave logic can go here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Leave'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 200,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.green.shade700,
                        Colors.green.shade400,
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
                            Icons.people_alt_rounded,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Tech Communities',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Connect, Learn, and Grow Together',
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
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(100),
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      // Search Bar
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              _searchQuery = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Search communities...',
                            hintStyle: TextStyle(color: Colors.grey[500]),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            prefixIcon: Icon(Icons.search_rounded, color: Colors.grey[500]),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Category Chips
                      SizedBox(
                        height: 40,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _categories.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: ChoiceChip(
                                label: Text(_categories[index]),
                                selected: _selectedCategoryIndex == index,
                                onSelected: (selected) {
                                  setState(() {
                                    _selectedCategoryIndex = index;
                                  });
                                },
                                backgroundColor: Colors.white,
                                selectedColor: Colors.green,
                                labelStyle: TextStyle(
                                  color: _selectedCategoryIndex == index ? Colors.white : Colors.grey[700],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Featured Communities
            if (_featuredCommunities.isNotEmpty) ...[
              const Text(
                'Featured Communities',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 12),
              ..._featuredCommunities.map((community) => _buildCommunityCard(community, true)).toList(),
              const SizedBox(height: 24),
            ],

            // All Communities
            const Text(
              'All Communities',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            if (_filteredCommunities.isEmpty)
              _buildEmptyState()
            else
              ..._filteredCommunities.map((community) => _buildCommunityCard(community, false)).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildCommunityCard(Community community, bool isFeatured) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
          // Header with Image
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              image: DecorationImage(
                image: NetworkImage(community.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.6),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  // Featured Badge
                  if (isFeatured)
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.star_rounded, size: 14, color: Colors.white),
                            SizedBox(width: 4),
                            Text(
                              'Featured',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  // Online Indicator
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${community.onlineCount} online',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Title
                  Positioned(
                    bottom: 12,
                    left: 16,
                    right: 16,
                    child: Text(
                      community.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category and Members
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: community.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        community.category,
                        style: TextStyle(
                          fontSize: 12,
                          color: community.color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Icon(Icons.people_rounded, size: 16, color: Colors.grey[500]),
                    const SizedBox(width: 4),
                    Text(
                      '${community.memberCount} members',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Description
                Text(
                  community.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),

                // Tags
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: community.tags.map((tag) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      tag,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[700],
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
                  child: OutlinedButton(
                    onPressed: () => _showCommunityDetails(context, community),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: community.color,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('View Details'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: community.isJoined
                      ? ElevatedButton(
                          onPressed: () => _leaveCommunity(community),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            foregroundColor: Colors.grey[700],
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Joined'),
                        )
                      : ElevatedButton(
                          onPressed: () => _joinCommunity(community),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: community.color,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Join Community'),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Icon(
            Icons.search_off_rounded,
            size: 80,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 16),
          const Text(
            'No communities found',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try adjusting your search or browse different categories',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}

class CommunityDetailsSheet extends StatelessWidget {
  final Community community;
  final VoidCallback onJoin;
  final VoidCallback onLeave;

  const CommunityDetailsSheet({
    super.key,
    required this.community,
    required this.onJoin,
    required this.onLeave,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            height: 200,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              image: DecorationImage(
                image: NetworkImage(community.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 16,
                    right: 16,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.close_rounded, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          community.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          community.category,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Quick Stats
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: community.color.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: community.color.withOpacity(0.2)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildDetailStat('Members', '${community.memberCount}+', Icons.people_rounded),
                        _buildDetailStat('Online', '${community.onlineCount}', Icons.circle_rounded),
                        _buildDetailStat('Activity', community.recentActivity, Icons.access_time_rounded),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Description
                  const Text(
                    'About this Community',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    community.description,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Tags
                  const Text(
                    'Topics & Technologies',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: community.tags.map((tag) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: community.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: community.color.withOpacity(0.3)),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          color: community.color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Community Guidelines
                  const Text(
                    'Community Guidelines',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildGuidelineItem('Be respectful and inclusive to all members'),
                  _buildGuidelineItem('Share knowledge and help others learn'),
                  _buildGuidelineItem('No spam or self-promotion without value'),
                  _buildGuidelineItem('Keep discussions relevant to the community theme'),
                ],
              ),
            ),
          ),

          // Action Buttons
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border:  Border(
                  top: BorderSide(color: Colors.grey[300]!),
                ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: community.color,
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
                  child: community.isJoined
                      ? ElevatedButton(
                          onPressed: onLeave,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[300],
                            foregroundColor: Colors.grey[700],
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Leave Community'),
                        )
                      : ElevatedButton(
                          onPressed: onJoin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: community.color,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Join Community'),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailStat(String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: community.color, size: 24),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildGuidelineItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle_rounded, color: community.color, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Community {
  final String id;
  final String name;
  final String description;
  final int memberCount;
  final int onlineCount;
  final String category;
  final IconData icon;
  final Color color;
  bool isJoined;
  final String recentActivity;
  final List<String> tags;
  final String imageUrl;

  Community({
    required this.id,
    required this.name,
    required this.description,
    required this.memberCount,
    required this.onlineCount,
    required this.category,
    required this.icon,
    required this.color,
    required this.isJoined,
    required this.recentActivity,
    required this.tags,
    required this.imageUrl,
  });
}