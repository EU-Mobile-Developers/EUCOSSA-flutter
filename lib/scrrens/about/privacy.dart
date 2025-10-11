import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 180,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.teal.shade700,
                      Colors.teal.shade500,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 2,
                          ),
                        ),
                        child: const Icon(
                          Icons.privacy_tip_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Your Data Protection & Privacy',
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Last Updated & Summary
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.teal.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.teal.shade100,
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.update_rounded,
                              color: Colors.teal.shade700,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Last Updated',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.teal.shade700,
                                    ),
                                  ),
                                  Text(
                                    'December 1, 2024',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.teal.shade800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          height: 1,
                          color: Colors.teal.shade100,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'At Eucossa, we are committed to protecting your privacy and ensuring the security of your personal information. This policy explains how we collect, use, and safeguard your data.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.teal.shade800,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Information We Collect
                  _buildSectionHeader(
                    icon: Icons.collections_bookmark_rounded,
                    title: 'Information We Collect',
                    color: Colors.teal,
                  ),
                  const SizedBox(height: 12),
                  _buildParagraph(
                    'We collect information to provide better services to our users. The types of information we collect include:',
                  ),
                  const SizedBox(height: 16),
                  
                  _buildInfoCard(
                    icon: Icons.person_rounded,
                    title: 'Personal Information',
                    items: [
                      'Name and email address',
                      'Profile information and preferences',
                      'University affiliation (Egerton University)',
                      'GitHub username (optional)',
                    ],
                    color: Colors.blue,
                  ),

                  const SizedBox(height: 16),

                  _buildInfoCard(
                    icon: Icons.analytics_rounded,
                    title: 'Usage Data',
                    items: [
                      'App usage statistics and analytics',
                      'Feature interaction data',
                      'Device information and operating system',
                      'Crash reports and performance data',
                    ],
                    color: Colors.purple,
                  ),

                  const SizedBox(height: 16),

                  _buildInfoCard(
                    icon: Icons.content_copy_rounded,
                    title: 'User Content',
                    items: [
                      'Posts and comments in communities',
                      'Resource downloads and bookmarks',
                      'Event registrations and participation',
                      'Profile bio and preferences',
                    ],
                    color: Colors.orange,
                  ),

                  const SizedBox(height: 30),

                  // How We Use Information
                  _buildSectionHeader(
                    icon: Icons.auto_awesome_rounded,
                    title: 'How We Use Your Information',
                    color: Colors.green,
                  ),
                  const SizedBox(height: 12),
                  _buildParagraph(
                    'We use the information we collect for the following purposes:',
                  ),
                  const SizedBox(height: 12),
                  
                  _buildUsageItem(
                    icon: Icons.person_rounded,
                    title: 'Personalization',
                    description: 'Customize your experience and show relevant content based on your interests and preferences.',
                  ),
                  _buildUsageItem(
                    icon: Icons.rocket_launch_rounded,
                    title: 'Service Improvement',
                    description: 'Enhance our app features, fix bugs, and develop new functionalities based on usage patterns.',
                  ),
                  _buildUsageItem(
                    icon: Icons.notifications_rounded,
                    title: 'Communication',
                    description: 'Send important updates, event notifications, and community announcements.',
                  ),
                  _buildUsageItem(
                    icon: Icons.security_rounded,
                    title: 'Security',
                    description: 'Protect against fraud, unauthorized access, and ensure platform security.',
                  ),

                  const SizedBox(height: 30),

                  // Data Sharing
                  _buildSectionHeader(
                    icon: Icons.share_rounded,
                    title: 'Data Sharing & Disclosure',
                    color: Colors.red,
                  ),
                  const SizedBox(height: 12),
                  _buildParagraph(
                    'We do not sell your personal information. We may share your data only in the following circumstances:',
                  ),
                  const SizedBox(height: 12),
                  
                  _buildDisclosureItem(
                    'With your explicit consent for specific purposes',
                    Colors.green,
                  ),
                  _buildDisclosureItem(
                    'With Egerton University administration for official club activities',
                    Colors.blue,
                  ),
                  _buildDisclosureItem(
                    'With service providers who assist in app operations (under strict confidentiality)',
                    Colors.orange,
                  ),
                  _buildDisclosureItem(
                    'When required by law or to protect our legal rights',
                    Colors.red,
                  ),

                  const SizedBox(height: 30),

                  // Data Security
                  _buildSectionHeader(
                    icon: Icons.lock_rounded,
                    title: 'Data Security',
                    color: Colors.indigo,
                  ),
                  const SizedBox(height: 12),
                  _buildParagraph(
                    'We implement appropriate technical and organizational security measures to protect your personal information against unauthorized access, alteration, disclosure, or destruction.',
                  ),
                  const SizedBox(height: 16),
                  
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.indigo.shade100,
                      ),
                    ),
                    child: Column(
                      children: [
                        _buildSecurityFeature(
                          '🔒 End-to-end encryption for sensitive data',
                        ),
                        _buildSecurityFeature(
                          '🛡️ Regular security audits and updates',
                        ),
                        _buildSecurityFeature(
                          '📱 Secure authentication methods',
                        ),
                        _buildSecurityFeature(
                          '🚫 Limited data access to authorized personnel only',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Your Rights
                  _buildSectionHeader(
                    icon: Icons.manage_accounts_rounded,
                    title: 'Your Privacy Rights',
                    color: Colors.purple,
                  ),
                  const SizedBox(height: 12),
                  _buildParagraph(
                    'You have the following rights regarding your personal information:',
                  ),
                  const SizedBox(height: 12),
                  
                  _buildRightItem(
                    icon: Icons.visibility_rounded,
                    title: 'Right to Access',
                    description: 'Request a copy of your personal data we hold.',
                  ),
                  _buildRightItem(
                    icon: Icons.edit_rounded,
                    title: 'Right to Rectification',
                    description: 'Correct inaccurate or incomplete personal data.',
                  ),
                  _buildRightItem(
                    icon: Icons.delete_rounded,
                    title: 'Right to Erasure',
                    description: 'Request deletion of your personal data.',
                  ),
                  _buildRightItem(
                    icon: Icons.control_camera_rounded,
                    title: 'Right to Restrict Processing',
                    description: 'Limit how we use your personal data.',
                  ),

                  const SizedBox(height: 30),

                  // Data Retention
                  _buildSectionHeader(
                    icon: Icons.schedule_rounded,
                    title: 'Data Retention',
                    color: Colors.amber,
                  ),
                  const SizedBox(height: 12),
                  _buildParagraph(
                    'We retain your personal information only for as long as necessary to fulfill the purposes outlined in this policy, unless a longer retention period is required or permitted by law.',
                  ),
                  const SizedBox(height: 12),
                  _buildParagraph(
                    'Account data is typically retained for 2 years after account deletion to comply with legal obligations and prevent fraud.',
                  ),

                  const SizedBox(height: 30),

                  // Children's Privacy
                  _buildSectionHeader(
                    icon: Icons.child_care_rounded,
                    title: "Children's Privacy",
                    color: Colors.pink,
                  ),
                  const SizedBox(height: 12),
                  _buildParagraph(
                    'Our services are not directed to individuals under 16. We do not knowingly collect personal information from children under 16. If we become aware that we have collected personal information from a child under 16, we will take steps to delete such information.',
                  ),

                  const SizedBox(height: 30),

                  // Changes to Policy
                  _buildSectionHeader(
                    icon: Icons.update_rounded,
                    title: 'Changes to This Policy',
                    color: Colors.brown,
                  ),
                  const SizedBox(height: 12),
                  _buildParagraph(
                    'We may update this privacy policy from time to time. We will notify you of any changes by posting the new policy on this page and updating the "Last Updated" date. We encourage you to review this policy periodically.',
                  ),

                  const SizedBox(height: 30),

                  // Contact Information
                  _buildSectionHeader(
                    icon: Icons.contact_mail_rounded,
                    title: 'Contact Us',
                    color: Colors.cyan,
                  ),
                  const SizedBox(height: 12),
                  _buildParagraph(
                    'If you have any questions or concerns about this Privacy Policy or our data practices, please contact us:',
                  ),
                  const SizedBox(height: 16),
                  
                  Container(
                    padding: const EdgeInsets.all(20),
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
                    child: Column(
                      children: [
                        _buildContactItem(
                          Icons.email_rounded,
                          'Email',
                          'privacy@eucossa.com',
                        ),
                        const SizedBox(height: 12),
                        _buildContactItem(
                          Icons.school_rounded,
                          'Address',
                          'Eucossa Club, Egerton University',
                        ),
                        const SizedBox(height: 12),
                        _buildContactItem(
                          Icons.schedule_rounded,
                          'Response Time',
                          'Within 48 hours',
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Acceptance Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.teal.shade600,
                          Colors.teal.shade400,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.teal.withOpacity(0.3),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Icon(
                          Icons.verified_user_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Your Privacy Matters',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'By using Eucossa Mobile App, you acknowledge that you have read and understood how we protect and handle your personal information.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  side: const BorderSide(color: Colors.white),
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'I Understand',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  // Navigate to data settings
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.teal.shade600,
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Manage Data',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
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

  Widget _buildSectionHeader({
    required IconData icon,
    required String title,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color,
            size: 22,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 15,
        color: Colors.grey[700],
        height: 1.6,
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required List<String> items,
    required Color color,
  }) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4, right: 8),
                  child: Icon(
                    Icons.circle_rounded,
                    size: 6,
                    color: color,
                  ),
                ),
                Expanded(
                  child: Text(
                    item,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          )).toList(),
        ],
      ),
    );
  }

  Widget _buildUsageItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.green.shade100,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: Colors.green.shade600,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.green.shade700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisclosureItem(String text, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: color.withOpacity(0.2),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_rounded,
            color: color,
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityFeature(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.indigo.shade700,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRightItem({
    required IconData icon,
    required String title,
    required String description,
  }) {
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
              color: Colors.purple.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.purple,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.teal.shade600,
          size: 20,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal.shade700,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}