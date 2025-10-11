import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final String _userName = "Alex";
  final int _points = 1250;
  final String _userLevel = "Tech Explorer";

  final List<QuickAction> _quickActions = [
    QuickAction(
      title: "Resources",
      icon: Icons.library_books_rounded,
      color: Colors.blue,
      route: "/resources",
    ),
    QuickAction(
      title: "Communities",
      icon: Icons.people_alt_rounded,
      color: Colors.green,
      route: "/communities",
    ),
    QuickAction(
      title: "Hackathons",
      icon: Icons.emoji_events_rounded,
      color: Colors.orange,
      route: "/hackathons",
    ),
    QuickAction(
      title: "Events",
      icon: Icons.event_rounded,
      color: Colors.purple,
      route: "/events",
    ),
  ];

  final List<Event> _upcomingEvents = [
    Event(
      id: '1',
      title: 'Flutter Workshop Series',
      description: 'Learn Flutter from basics to advanced concepts with hands-on projects',
      date: 'Tomorrow, 2:00 PM',
      location: 'Tech Lab, CS Department',
      type: 'Workshop',
      attendees: 45,
      imageUrl: 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?w=500',
      isRegistered: true,
    ),
    Event(
      id: '2',
      title: 'Tech Career Fair 2024',
      description: 'Connect with top tech companies and explore internship opportunities',
      date: 'March 20, 9:00 AM',
      location: 'Main Campus Hall',
      type: 'Career',
      attendees: 200,
      imageUrl: 'https://images.unsplash.com/photo-1540575467063-178a50c2df87?w=500',
      isRegistered: false,
    ),
    Event(
      id: '3',
      title: 'AI & ML Community Meetup',
      description: 'Monthly meetup for AI enthusiasts to share projects and ideas',
      date: 'March 25, 4:00 PM',
      location: 'Eucossa Club Room',
      type: 'Meetup',
      attendees: 35,
      imageUrl: 'https://images.unsplash.com/photo-1555255707-c07966088b7b?w=500',
      isRegistered: true,
    ),
  ];

  final List<Resource> _recentResources = [
    Resource(
      title: 'Flutter State Management Guide',
      type: 'PDF',
      category: 'Mobile Development',
      uploadTime: '2 hours ago',
      downloads: 128,
      icon: Icons.picture_as_pdf_rounded,
      color: Colors.red,
    ),
    Resource(
      title: 'Python for Data Science',
      type: 'Notebook',
      category: 'Data Science',
      uploadTime: '1 day ago',
      downloads: 89,
      icon: Icons.note_alt_rounded,
      color: Colors.blue,
    ),
    Resource(
      title: 'Web Security Best Practices',
      type: 'Video',
      category: 'Cybersecurity',
      uploadTime: '3 days ago',
      downloads: 67,
      icon: Icons.video_library_rounded,
      color: Colors.purple,
    ),
  ];

  final List<CommunityUpdate> _communityUpdates = [
    CommunityUpdate(
      community: 'Flutter Developers Kenya',
      update: 'New Flutter 3.0 features discussion started',
      time: '30 minutes ago',
      membersOnline: 23,
    ),
    CommunityUpdate(
      community: 'AI & Machine Learning',
      update: 'Weekly Kaggle competition announced',
      time: '2 hours ago',
      membersOnline: 15,
    ),
    CommunityUpdate(
      community: 'Web Development',
      update: 'React vs Vue.js debate happening now',
      time: '5 hours ago',
      membersOnline: 31,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          // Header with User Info
          SliverAppBar(
            expandedHeight: 180,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.deepPurple.shade700,
                      Colors.purple.shade400,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.3),
                                  width: 2,
                                ),
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white.withOpacity(0.2),
                                    Colors.white.withOpacity(0.1),
                                  ],
                                ),
                              ),
                              child: const Icon(
                                Icons.person_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Welcome back, $_userName! 👋',
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Ready to code something amazing today?',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white.withOpacity(0.9),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Points and Level
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.2),
                            ),
                          ),
                          child: Row(
                            children: [
                              _buildStatItem(Icons.star_rounded, '$_points', 'Points', Colors.amber),
                              Container(
                                width: 1,
                                height: 30,
                                color: Colors.white.withOpacity(0.3),
                                margin: const EdgeInsets.symmetric(horizontal: 16),
                              ),
                              _buildStatItem(Icons.workspace_premium_rounded, _userLevel, 'Level', Colors.cyan),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.trending_up_rounded, size: 14, color: Colors.white),
                                    SizedBox(width: 4),
                                    Text(
                                      'Active',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Main Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Quick Actions
                  _buildSectionHeader('Quick Access', Icons.flash_on_rounded, Colors.orange),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.6,
                    ),
                    itemCount: _quickActions.length,
                    itemBuilder: (context, index) {
                      final action = _quickActions[index];
                      return _buildQuickActionCard(action);
                    },
                  ),

                  const SizedBox(height: 32),

                  // Upcoming Events
                  _buildSectionHeader('Upcoming Events', Icons.event_rounded, Colors.red),
                  const SizedBox(height: 16),
                  ..._upcomingEvents.map((event) => _buildEventCard(event)).toList(),

                  const SizedBox(height: 32),

                  // Recent Resources
                  _buildSectionHeader('Recent Resources', Icons.library_books_rounded, Colors.blue),
                  const SizedBox(height: 16),
                  ..._recentResources.map((resource) => _buildResourceCard(resource)).toList(),

                  const SizedBox(height: 32),

                  // Community Updates
                  _buildSectionHeader('Community Updates', Icons.people_alt_rounded, Colors.green),
                  const SizedBox(height: 16),
                  ..._communityUpdates.map((update) => _buildCommunityUpdate(update)).toList(),

                  const SizedBox(height: 40),

                  // Motivational Section
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.deepPurple.shade600,
                          Colors.purple.shade400,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.rocket_launch_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Keep Learning, Keep Building!',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'The Eucossa community is here to support your tech journey. Never stop exploring new technologies and building amazing projects.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                // Explore more
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                side: const BorderSide(color: Colors.white),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: const Text('Explore Resources'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Join community
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.deepPurple,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: const Text('Join Community'),
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

  Widget _buildSectionHeader(String title, IconData icon, Color color) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color,
            size: 20,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: color,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            // View all action
          },
          child: Text(
            'View All',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem(IconData icon, String value, String label, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: color),
            const SizedBox(width: 6),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionCard(QuickAction action) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            // Navigate to action route
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: action.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    action.icon,
                    color: action.color,
                    size: 24,
                  ),
                ),
                Text(
                  action.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEventCard(Event event) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Event Image
          Container(
            width: 80,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              image: DecorationImage(
                image: NetworkImage(event.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Type Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getEventColor(event.type).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      event.type,
                      style: TextStyle(
                        fontSize: 12,
                        color: _getEventColor(event.type),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    event.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    event.description,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.access_time_rounded, size: 14, color: Colors.grey[500]),
                      const SizedBox(width: 4),
                      Text(
                        event.date,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      const SizedBox(width: 12),
                      Icon(Icons.location_on_rounded, size: 14, color: Colors.grey[500]),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          event.location,
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Register Button
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: event.isRegistered
                ? Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.check_rounded, size: 14, color: Colors.green),
                        SizedBox(width: 4),
                        Text(
                          'Registered',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.green,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                : ElevatedButton(
                    onPressed: () {
                      // Register for event
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildResourceCard(Resource resource) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: resource.color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              resource.icon,
              color: resource.color,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  resource.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: resource.color.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        resource.type,
                        style: TextStyle(
                          fontSize: 10,
                          color: resource.color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      resource.category,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                resource.uploadTime,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.download_rounded, size: 12, color: Colors.grey[500]),
                  const SizedBox(width: 4),
                  Text(
                    '${resource.downloads}',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCommunityUpdate(CommunityUpdate update) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.people_rounded,
              color: Colors.green,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  update.community,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  update.update,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.access_time_rounded, size: 12, color: Colors.grey[500]),
                    const SizedBox(width: 4),
                    Text(
                      update.time,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[500],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${update.membersOnline} online',
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getEventColor(String type) {
    switch (type.toLowerCase()) {
      case 'workshop':
        return Colors.blue;
      case 'career':
        return Colors.green;
      case 'meetup':
        return Colors.orange;
      default:
        return Colors.purple;
    }
  }
}

class QuickAction {
  final String title;
  final IconData icon;
  final Color color;
  final String route;

  const QuickAction({
    required this.title,
    required this.icon,
    required this.color,
    required this.route,
  });
}

class Event {
  final String id;
  final String title;
  final String description;
  final String date;
  final String location;
  final String type;
  final int attendees;
  final String imageUrl;
  bool isRegistered;

  Event({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.location,
    required this.type,
    required this.attendees,
    required this.imageUrl,
    required this.isRegistered,
  });
}

class Resource {
  final String title;
  final String type;
  final String category;
  final String uploadTime;
  final int downloads;
  final IconData icon;
  final Color color;

  const Resource({
    required this.title,
    required this.type,
    required this.category,
    required this.uploadTime,
    required this.downloads,
    required this.icon,
    required this.color,
  });
}

class CommunityUpdate {
  final String community;
  final String update;
  final String time;
  final int membersOnline;

  const CommunityUpdate({
    required this.community,
    required this.update,
    required this.time,
    required this.membersOnline,
  });
}