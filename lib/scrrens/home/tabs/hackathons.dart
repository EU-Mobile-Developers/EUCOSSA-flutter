import 'package:flutter/material.dart';

class HackathonsPage extends StatefulWidget {
  const HackathonsPage({super.key});

  @override
  State<HackathonsPage> createState() => _HackathonsPageState();
}

class _HackathonsPageState extends State<HackathonsPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Hackathon> _upcomingHackathons = [
    Hackathon(
      id: '1',
      name: 'Eucossa Tech Innovation Challenge 2024',
      description: 'Annual flagship hackathon focusing on solving local community challenges using technology. Join us for 48 hours of coding, innovation, and networking.',
      date: 'March 15-17, 2024',
      location: 'Egerton University, Tech Hub',
      imageUrl: 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=500',
      participants: 150,
      duration: '48 Hours',
      prize: 'KES 100,000',
      difficulty: 'Intermediate',
      themes: ['Community Tech', 'Education', 'Sustainability'],
      isRegistered: false,
      status: HackathonStatus.upcoming,
    ),
    Hackathon(
      id: '2',
      name: 'Flutter Forward Kenya',
      description: 'Focus on building cross-platform mobile applications using Flutter and Dart. Perfect for mobile developers looking to showcase their skills.',
      date: 'April 5-6, 2024',
      location: 'Virtual & On-campus',
      imageUrl: 'https://images.unsplash.com/photo-1517077304055-6e89abbf09b0?w=500',
      participants: 80,
      duration: '36 Hours',
      prize: 'KES 50,000 + Mentorship',
      difficulty: 'Beginner-Friendly',
      themes: ['Mobile Development', 'Flutter', 'UI/UX'],
      isRegistered: true,
      status: HackathonStatus.upcoming,
    ),
    Hackathon(
      id: '3',
      name: 'AI & Machine Learning Showdown',
      description: 'Explore the frontiers of artificial intelligence and machine learning. Build intelligent solutions for real-world problems.',
      date: 'May 20-22, 2024',
      location: 'Computer Science Department',
      imageUrl: 'https://images.unsplash.com/photo-1555949963-aa79dcee981c?w=500',
      participants: 60,
      duration: '72 Hours',
      prize: 'KES 150,000 + Cloud Credits',
      difficulty: 'Advanced',
      themes: ['AI/ML', 'Data Science', 'Neural Networks'],
      isRegistered: false,
      status: HackathonStatus.upcoming,
    ),
  ];

  final List<Hackathon> _ongoingHackathons = [
    Hackathon(
      id: '4',
      name: 'Campus Hack Weekly',
      description: 'Weekly mini-hackathon series focusing on rapid prototyping and quick problem-solving.',
      date: 'Ongoing - Every Friday',
      location: 'Eucossa Club Room',
      imageUrl: 'https://images.unsplash.com/photo-1547658719-da2b51169166?w=500',
      participants: 25,
      duration: '6 Hours',
      prize: 'Swag & Recognition',
      difficulty: 'All Levels',
      themes: ['Rapid Prototyping', 'Team Building', 'Skill Development'],
      isRegistered: true,
      status: HackathonStatus.ongoing,
    ),
  ];

  final List<Hackathon> _pastHackathons = [
    Hackathon(
      id: '5',
      name: 'FinTech Innovation Challenge 2023',
      description: 'Focused on developing financial technology solutions for the Kenyan market.',
      date: 'November 10-12, 2023',
      location: 'Egerton University',
      imageUrl: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=500',
      participants: 120,
      duration: '48 Hours',
      prize: 'KES 75,000',
      difficulty: 'Intermediate',
      themes: ['FinTech', 'Blockchain', 'Digital Payments'],
      isRegistered: false,
      status: HackathonStatus.past,
      winner: 'Team PayFlow',
    ),
    Hackathon(
      id: '6',
      name: 'GreenTech Sustainability Hack',
      description: 'Developing sustainable technology solutions for environmental challenges.',
      date: 'September 15-16, 2023',
      location: 'Virtual',
      imageUrl: 'https://images.unsplash.com/photo-1569163139394-de44cb54d5a8?w=500',
      participants: 90,
      duration: '36 Hours',
      prize: 'KES 60,000 + Incubation',
      difficulty: 'Beginner-Friendly',
      themes: ['Sustainability', 'Climate Tech', 'Clean Energy'],
      isRegistered: false,
      status: HackathonStatus.past,
      winner: 'Team EcoSaver',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _registerForHackathon(Hackathon hackathon) {
    setState(() {
      hackathon.isRegistered = true;
    });
    _showRegistrationSuccess(context, hackathon);
  }

  void _showHackathonDetails(BuildContext context, Hackathon hackathon) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => HackathonDetailsSheet(hackathon: hackathon),
    );
  }

  void _showRegistrationSuccess(BuildContext context, Hackathon hackathon) {
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
                child: const Icon(
                  Icons.check_circle_rounded,
                  color: Colors.green,
                  size: 40,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Registration Successful!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'You\'ve successfully registered for ${hackathon.name}',
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
                child: const Text('Awesome!'),
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
                        Colors.orange.shade700,
                        Colors.orange.shade400,
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
                            Icons.emoji_events_rounded,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Hackathons & Events',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Code. Create. Innovate.',
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
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white.withOpacity(0.7),
                labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                tabs: const [
                  Tab(text: 'Upcoming'),
                  Tab(text: 'Ongoing'),
                  Tab(text: 'Past'),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildHackathonList(_upcomingHackathons),
            _buildHackathonList(_ongoingHackathons),
            _buildHackathonList(_pastHackathons),
          ],
        ),
      ),
    );
  }

  Widget _buildHackathonList(List<Hackathon> hackathons) {
    if (hackathons.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy_rounded,
              size: 80,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 16),
            Text(
              'No hackathons available',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[500],
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Check back later for new events',
              style: TextStyle(
                color: Colors.grey[400],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: hackathons.length,
      itemBuilder: (context, index) {
        final hackathon = hackathons[index];
        return HackathonCard(
          hackathon: hackathon,
          onTap: () => _showHackathonDetails(context, hackathon),
          onRegister: () => _registerForHackathon(hackathon),
        );
      },
    );
  }
}

class HackathonCard extends StatelessWidget {
  final Hackathon hackathon;
  final VoidCallback onTap;
  final VoidCallback onRegister;

  const HackathonCard({
    super.key,
    required this.hackathon,
    required this.onTap,
    required this.onRegister,
  });

  @override
  Widget build(BuildContext context) {
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
          // Image Header
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              image: DecorationImage(
                image: NetworkImage(hackathon.imageUrl),
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
                  // Status Badge
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: _getStatusColor(hackathon.status).withOpacity(0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        _getStatusText(hackathon.status),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  // Title
                  Positioned(
                    bottom: 12,
                    left: 16,
                    right: 16,
                    child: Text(
                      hackathon.name,
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
                // Basic Info
                Row(
                  children: [
                    _buildInfoChip(
                      Icons.calendar_today_rounded,
                      hackathon.date,
                      Colors.blue,
                    ),
                    const SizedBox(width: 8),
                    _buildInfoChip(
                      Icons.location_on_rounded,
                      hackathon.location,
                      Colors.green,
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Description
                Text(
                  hackathon.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),

                // Themes
                Wrap(
                  spacing: 8,
                  runSpacing: 4,
                  children: hackathon.themes.map((theme) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      theme,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.orange.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )).toList(),
                ),
                const SizedBox(height: 12),

                // Stats
                Row(
                  children: [
                    _buildStatItem(
                      Icons.people_rounded,
                      '${hackathon.participants}+',
                      Colors.purple,
                    ),
                    const SizedBox(width: 16),
                    _buildStatItem(
                      Icons.schedule_rounded,
                      hackathon.duration,
                      Colors.red,
                    ),
                    const SizedBox(width: 16),
                    _buildStatItem(
                      Icons.emoji_events_rounded,
                      hackathon.prize,
                      Colors.amber,
                    ),
                  ],
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
                    onPressed: onTap,
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.orange,
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
                  child: hackathon.isRegistered
                      ? ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.check_rounded, size: 18),
                              SizedBox(width: 6),
                              Text('Registered'),
                            ],
                          ),
                        )
                      : ElevatedButton(
                          onPressed: onRegister,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Register Now'),
                        ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String text, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(HackathonStatus status) {
    switch (status) {
      case HackathonStatus.upcoming:
        return Colors.blue;
      case HackathonStatus.ongoing:
        return Colors.green;
      case HackathonStatus.past:
        return Colors.grey;
    }
  }

  String _getStatusText(HackathonStatus status) {
    switch (status) {
      case HackathonStatus.upcoming:
        return 'Upcoming';
      case HackathonStatus.ongoing:
        return 'Live Now';
      case HackathonStatus.past:
        return 'Completed';
    }
  }
}

class HackathonDetailsSheet extends StatelessWidget {
  final Hackathon hackathon;

  const HackathonDetailsSheet({super.key, required this.hackathon});

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
                image: NetworkImage(hackathon.imageUrl),
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
                          hackathon.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          hackathon.description,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            height: 1.4,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
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
                      color: Colors.orange.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.orange.withOpacity(0.2)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildDetailStat('Date', hackathon.date, Icons.calendar_today_rounded),
                        _buildDetailStat('Location', hackathon.location, Icons.location_on_rounded),
                        _buildDetailStat('Duration', hackathon.duration, Icons.schedule_rounded),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Prize Pool
                  const Text(
                    'Prize Pool',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.emoji_events_rounded, color: Colors.amber.shade700),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            hackathon.prize,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.amber.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Themes & Tracks
                  const Text(
                    'Themes & Tracks',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: hackathon.themes.map((theme) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.orange.withOpacity(0.3)),
                      ),
                      child: Text(
                        theme,
                        style: TextStyle(
                          color: Colors.orange.shade700,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )).toList(),
                  ),

                  const SizedBox(height: 24),

                  // Additional Info
                  const Text(
                    'Event Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildDetailItem('Difficulty Level', hackathon.difficulty, Icons.school_rounded),
                  _buildDetailItem('Participants', '${hackathon.participants}+ expected', Icons.people_rounded),
                  if (hackathon.status == HackathonStatus.past && hackathon.winner != null)
                    _buildDetailItem('Winner', hackathon.winner!, Icons.emoji_events_rounded),

                  const SizedBox(height: 24),

                  // Description
                  const Text(
                    'Full Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    hackathon.description,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Action Buttons
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
                      foregroundColor: Colors.orange,
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
                  child: hackathon.isRegistered
                      ? ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('View Registration'),
                        )
                      : ElevatedButton(
                          onPressed: () {
                            // Implement registration
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Register Now'),
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
        Icon(icon, color: Colors.orange, size: 24),
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

  Widget _buildDetailItem(String title, String value, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.orange, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum HackathonStatus { upcoming, ongoing, past }

class Hackathon {
  final String id;
  final String name;
  final String description;
  final String date;
  final String location;
  final String imageUrl;
  final int participants;
  final String duration;
  final String prize;
  final String difficulty;
  final List<String> themes;
  bool isRegistered;
  final HackathonStatus status;
  final String? winner;

  Hackathon({
    required this.id,
    required this.name,
    required this.description,
    required this.date,
    required this.location,
    required this.imageUrl,
    required this.participants,
    required this.duration,
    required this.prize,
    required this.difficulty,
    required this.themes,
    required this.isRegistered,
    required this.status,
    this.winner,
  });
}