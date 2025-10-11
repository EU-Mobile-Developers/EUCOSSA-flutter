import 'package:flutter/material.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({super.key});

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  final List<ResourceCategory> _categories = [
    ResourceCategory(
      name: 'Mobile Development',
      icon: Icons.phone_iphone_rounded,
      color: Colors.blue,
      count: 47,
    ),
    ResourceCategory(
      name: 'Web Development',
      icon: Icons.code_rounded,
      color: Colors.green,
      count: 32,
    ),
    ResourceCategory(
      name: 'Data Science',
      icon: Icons.analytics_rounded,
      color: Colors.orange,
      count: 28,
    ),
    ResourceCategory(
      name: 'AI & Machine Learning',
      icon: Icons.smart_toy_rounded,
      color: Colors.purple,
      count: 35,
    ),
    ResourceCategory(
      name: 'Cybersecurity',
      icon: Icons.security_rounded,
      color: Colors.red,
      count: 19,
    ),
    ResourceCategory(
      name: 'Cloud Computing',
      icon: Icons.cloud_rounded,
      color: Colors.teal,
      count: 22,
    ),
  ];

  final List<Resource> _featuredResources = [
    Resource(
      id: '1',
      title: 'Flutter Complete Guide 2024',
      description: 'Comprehensive guide covering Flutter basics to advanced topics including state management, animations, and API integration.',
      type: ResourceType.pdf,
      category: 'Mobile Development',
      fileSize: '4.2 MB',
      pages: 156,
      uploadDate: '2 days ago',
      downloads: 342,
      rating: 4.8,
      author: 'Eucossa Team',
      imageUrl: 'https://images.unsplash.com/photo-1551650975-87deedd944c3?w=500',
      isBookmarked: true,
    ),
    Resource(
      id: '2',
      title: 'Python Data Science Handbook',
      description: 'Essential Python libraries for data analysis, visualization, and machine learning with practical examples.',
      type: ResourceType.pdf,
      category: 'Data Science',
      fileSize: '3.1 MB',
      pages: 89,
      uploadDate: '1 week ago',
      downloads: 287,
      rating: 4.6,
      author: 'Dr. Sarah Chen',
      imageUrl: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=500',
      isBookmarked: false,
    ),
  ];

  final List<Resource> _recentResources = [
    Resource(
      id: '3',
      title: 'React Native Workshop Notes',
      description: 'Complete notes from the React Native workshop covering component building and native module integration.',
      type: ResourceType.note,
      category: 'Mobile Development',
      fileSize: '1.8 MB',
      pages: 45,
      uploadDate: '5 hours ago',
      downloads: 134,
      rating: 4.5,
      author: 'Mike Johnson',
      imageUrl: 'https://images.unsplash.com/photo-1633356122544-f134324a6cee?w=500',
      isBookmarked: false,
    ),
    Resource(
      id: '4',
      title: 'Web Security Best Practices',
      description: 'Essential security practices for web applications including authentication, authorization, and data protection.',
      type: ResourceType.pdf,
      category: 'Cybersecurity',
      fileSize: '2.5 MB',
      pages: 67,
      uploadDate: '1 day ago',
      downloads: 98,
      rating: 4.7,
      author: 'Security Team',
      imageUrl: 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=500',
      isBookmarked: true,
    ),
    Resource(
      id: '5',
      title: 'Machine Learning Algorithms',
      description: 'Visual guide to popular ML algorithms with mathematical foundations and implementation examples.',
      type: ResourceType.note,
      category: 'AI & Machine Learning',
      fileSize: '3.7 MB',
      pages: 112,
      uploadDate: '3 days ago',
      downloads: 156,
      rating: 4.9,
      author: 'AI Community',
      imageUrl: 'https://images.unsplash.com/photo-1555255707-c07966088b7b?w=500',
      isBookmarked: false,
    ),
    Resource(
      id: '6',
      title: 'AWS Cloud Architecture',
      description: 'Building scalable cloud infrastructure on AWS with best practices and cost optimization strategies.',
      type: ResourceType.pdf,
      category: 'Cloud Computing',
      fileSize: '5.2 MB',
      pages: 134,
      uploadDate: '2 weeks ago',
      downloads: 203,
      rating: 4.4,
      author: 'Cloud Experts',
      imageUrl: 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=500',
      isBookmarked: true,
    ),
  ];

  final List<String> _filterOptions = ['All', 'PDF', 'Notes', 'Videos', 'Code'];
  int _selectedFilterIndex = 0;
  String _searchQuery = '';
  int _selectedCategoryIndex = -1; // -1 means all categories

  List<Resource> get _filteredResources {
    var resources = _recentResources;

    // Filter by search query
    if (_searchQuery.isNotEmpty) {
      resources = resources.where((resource) =>
          resource.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          resource.description.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          resource.category.toLowerCase().contains(_searchQuery.toLowerCase())).toList();
    }

    // Filter by category
    if (_selectedCategoryIndex != -1) {
      final category = _categories[_selectedCategoryIndex];
      resources = resources.where((resource) =>
          resource.category == category.name).toList();
    }

    // Filter by type
    if (_selectedFilterIndex > 0) {
      final type = _filterOptions[_selectedFilterIndex];
      resources = resources.where((resource) =>
          resource.type.name.toLowerCase() == type.toLowerCase()).toList();
    }

    return resources;
  }

  void _toggleBookmark(Resource resource) {
    setState(() {
      resource.isBookmarked = !resource.isBookmarked;
    });
  }

  void _downloadResource(Resource resource) {
    // Simulate download
    setState(() {
      resource.downloads++;
    });
    _showDownloadSuccess(context, resource);
  }

  void _showResourceDetails(BuildContext context, Resource resource) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => ResourceDetailsSheet(
        resource: resource,
        onDownload: () => _downloadResource(resource),
        onBookmark: () => _toggleBookmark(resource),
      ),
    );
  }

  void _showDownloadSuccess(BuildContext context, Resource resource) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(Icons.download_rounded, color: Colors.white),
            SizedBox(width: 8),
            Text('Downloading "${resource.title}"...'),
          ],
        ),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

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
                      Colors.blue.shade700,
                      Colors.blue.shade400,
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
                        'Learning Resources',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Curated materials for your tech journey',
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
                          hintText: 'Search resources...',
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          prefixIcon: Icon(Icons.search_rounded, color: Colors.grey[500]),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Filter Chips
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _filterOptions.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ChoiceChip(
                              label: Text(_filterOptions[index]),
                              selected: _selectedFilterIndex == index,
                              onSelected: (selected) {
                                setState(() {
                                  _selectedFilterIndex = index;
                                });
                              },
                              backgroundColor: Colors.white,
                              selectedColor: Colors.blue,
                              labelStyle: TextStyle(
                                color: _selectedFilterIndex == index ? Colors.white : Colors.grey[700],
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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Featured Resources
                  if (_featuredResources.isNotEmpty) ...[
                    _buildSectionHeader('Featured Resources', Icons.star_rounded, Colors.amber),
                    const SizedBox(height: 16),
                    ..._featuredResources.map((resource) => _buildFeaturedResourceCard(resource)).toList(),
                    const SizedBox(height: 32),
                  ],

                  // Categories
                  _buildSectionHeader('Browse by Category', Icons.category_rounded, Colors.green),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 1.4,
                    ),
                    itemCount: _categories.length,
                    itemBuilder: (context, index) {
                      final category = _categories[index];
                      return _buildCategoryCard(category, index);
                    },
                  ),

                  const SizedBox(height: 32),

                  // Recent Resources
                  _buildSectionHeader('Recent Resources', Icons.access_time_rounded, Colors.purple),
                  const SizedBox(height: 16),
                  if (_filteredResources.isEmpty)
                    _buildEmptyState()
                  else
                    ..._filteredResources.map((resource) => _buildResourceCard(resource)).toList(),

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

  Widget _buildFeaturedResourceCard(Resource resource) {
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
                image: NetworkImage(resource.imageUrl),
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
                  // Type Badge
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: _getResourceTypeColor(resource.type).withOpacity(0.9),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        resource.type.name.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
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
                Text(
                  resource.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  resource.description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    // Rating
                    _buildResourceStat(Icons.star_rounded, '${resource.rating}', Colors.amber),
                    const SizedBox(width: 16),
                    // Downloads
                    _buildResourceStat(Icons.download_rounded, '${resource.downloads}', Colors.blue),
                    const SizedBox(width: 16),
                    // Pages
                    _buildResourceStat(Icons.description_rounded, '${resource.pages}p', Colors.green),
                    const Spacer(),
                    // File Size
                    Text(
                      resource.fileSize,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w600,
                      ),
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
                    onPressed: () => _showResourceDetails(context, resource),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blue,
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
                  child: ElevatedButton(
                    onPressed: () => _downloadResource(resource),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.download_rounded, size: 18),
                        SizedBox(width: 6),
                        Text('Download'),
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

  Widget _buildCategoryCard(ResourceCategory category, int index) {
    final isSelected = _selectedCategoryIndex == index;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategoryIndex = isSelected ? -1 : index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? category.color.withOpacity(0.2) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: isSelected ? Border.all(color: category.color, width: 2) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: category.color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                category.icon,
                color: category.color,
                size: 24,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category.name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? category.color : Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              '${category.count} resources',
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? category.color.withOpacity(0.8) : Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResourceCard(Resource resource) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
          // Resource Icon
          Container(
            width: 70,
            height: 90,
            decoration: BoxDecoration(
              color: _getResourceTypeColor(resource.type).withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  _getResourceTypeIcon(resource.type),
                  color: _getResourceTypeColor(resource.type),
                  size: 28,
                ),
                const SizedBox(height: 4),
                Text(
                  resource.type.name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    color: _getResourceTypeColor(resource.type),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          resource.title,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: () => _toggleBookmark(resource),
                        icon: Icon(
                          resource.isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                          color: resource.isBookmarked ? Colors.amber : Colors.grey[400],
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    resource.description,
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
                      // Category
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          resource.category,
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      // Downloads
                      Row(
                        children: [
                          Icon(Icons.download_rounded, size: 12, color: Colors.grey[500]),
                          const SizedBox(width: 2),
                          Text(
                            '${resource.downloads}',
                            style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      // Rating
                      Row(
                        children: [
                          Icon(Icons.star_rounded, size: 12, color: Colors.amber),
                          const SizedBox(width: 2),
                          Text(
                            '${resource.rating}',
                            style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResourceStat(IconData icon, String value, Color color) {
    return Row(
      children: [
        Icon(icon, size: 16, color: color),
        const SizedBox(width: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
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
            'No resources found',
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

  Color _getResourceTypeColor(ResourceType type) {
    switch (type) {
      case ResourceType.pdf:
        return Colors.red;
      case ResourceType.note:
        return Colors.blue;
      case ResourceType.video:
        return Colors.purple;
      case ResourceType.code:
        return Colors.green;
    }
  }

  IconData _getResourceTypeIcon(ResourceType type) {
    switch (type) {
      case ResourceType.pdf:
        return Icons.picture_as_pdf_rounded;
      case ResourceType.note:
        return Icons.note_alt_rounded;
      case ResourceType.video:
        return Icons.video_library_rounded;
      case ResourceType.code:
        return Icons.code_rounded;
    }
  }
}

class ResourceDetailsSheet extends StatelessWidget {
  final Resource resource;
  final VoidCallback onDownload;
  final VoidCallback onBookmark;

  const ResourceDetailsSheet({
    super.key,
    required this.resource,
    required this.onDownload,
    required this.onBookmark,
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
                image: NetworkImage(resource.imageUrl),
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
                          resource.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          resource.category,
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
                      color: Colors.blue.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.blue.withOpacity(0.2)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildDetailStat('Pages', '${resource.pages}', Icons.description_rounded),
                        _buildDetailStat('Downloads', '${resource.downloads}', Icons.download_rounded),
                        _buildDetailStat('Rating', '${resource.rating}', Icons.star_rounded),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Description
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    resource.description,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      height: 1.6,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Resource Details
                  const Text(
                    'Resource Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildDetailItem('Author', resource.author, Icons.person_rounded),
                  _buildDetailItem('File Size', resource.fileSize, Icons.storage_rounded),
                  _buildDetailItem('Upload Date', resource.uploadDate, Icons.calendar_today_rounded),
                  _buildDetailItem('Category', resource.category, Icons.category_rounded),
                  _buildDetailItem('Type', resource.type.name.toUpperCase(), Icons.description_rounded),

                  const SizedBox(height: 24),

                  // What You'll Learn
                  const Text(
                    'What You\'ll Learn',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _buildLearningItem('Comprehensive understanding of ${resource.category}'),
                  _buildLearningItem('Practical examples and real-world applications'),
                  _buildLearningItem('Best practices and industry standards'),
                  _buildLearningItem('Hands-on exercises and projects'),
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
                IconButton(
                  onPressed: onBookmark,
                  icon: Icon(
                    resource.isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                    color: resource.isBookmarked ? Colors.amber : Colors.grey[600],
                    size: 24,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blue,
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
                    onPressed: onDownload,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.download_rounded, size: 18),
                        SizedBox(width: 6),
                        Text('Download'),
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

  Widget _buildDetailStat(String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 24),
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
          Icon(icon, color: Colors.blue, size: 20),
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

  Widget _buildLearningItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle_rounded, color: Colors.green, size: 18),
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

enum ResourceType { pdf, note, video, code }

class Resource {
  final String id;
  final String title;
  final String description;
  final ResourceType type;
  final String category;
  final String fileSize;
  final int pages;
  final String uploadDate;
  int downloads;
  final double rating;
  final String author;
  final String imageUrl;
  bool isBookmarked;

  Resource({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.category,
    required this.fileSize,
    required this.pages,
    required this.uploadDate,
    required this.downloads,
    required this.rating,
    required this.author,
    required this.imageUrl,
    required this.isBookmarked,
  });
}

class ResourceCategory {
  final String name;
  final IconData icon;
  final Color color;
  final int count;

  const ResourceCategory({
    required this.name,
    required this.icon,
    required this.color,
    required this.count,
  });
}