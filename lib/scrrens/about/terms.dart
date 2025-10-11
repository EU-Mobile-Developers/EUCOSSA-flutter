import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({super.key});

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
                      Colors.blue.shade700,
                      Colors.blue.shade500,
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
                          Icons.description_rounded,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Terms & Conditions',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'User Agreement & Policies',
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
                  // Last Updated Info
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.blue.shade100,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.update_rounded,
                          color: Colors.blue.shade700,
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
                                  color: Colors.blue.shade700,
                                ),
                              ),
                              Text(
                                'December 1, 2024',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.blue.shade800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Introduction
                  _buildSectionHeader(
                    icon: Icons.info_rounded,
                    title: 'Introduction',
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 12),
                  _buildParagraph(
                    'Welcome to Eucossa Mobile App. By accessing or using our application, you agree to be bound by these Terms and Conditions. Please read them carefully before using our services.',
                  ),

                  const SizedBox(height: 30),

                  // Account Terms
                  _buildSectionHeader(
                    icon: Icons.person_rounded,
                    title: 'Account Terms',
                    color: Colors.green,
                  ),
                  const SizedBox(height: 12),
                  _buildTermItem(
                    '1. You must be at least 16 years old to use this app.',
                  ),
                  _buildTermItem(
                    '2. You are responsible for maintaining the security of your account and password.',
                  ),
                  _buildTermItem(
                    '3. You must provide accurate and complete information when creating an account.',
                  ),
                  _buildTermItem(
                    '4. One person may not maintain more than one account.',
                  ),

                  const SizedBox(height: 30),

                  // Acceptable Use
                  _buildSectionHeader(
                    icon: Icons.security_rounded,
                    title: 'Acceptable Use',
                    color: Colors.orange,
                  ),
                  const SizedBox(height: 12),
                  _buildParagraph(
                    'You agree not to misuse the Eucossa services. For example, you must not:',
                  ),
                  const SizedBox(height: 8),
                  _buildTermItem(
                    '• Attempt to access, tamper with, or use non-public areas of the service',
                  ),
                  _buildTermItem(
                    '• Probe, scan, or test the vulnerability of any system or network',
                  ),
                  _buildTermItem(
                    '• Breach or otherwise circumvent any security or authentication measures',
                  ),
                  _buildTermItem(
                    '• Interfere with or disrupt any user, host, or network',
                  ),
                  _buildTermItem(
                    '• Share inappropriate, offensive, or harmful content',
                  ),
                  _buildTermItem(
                    '• Violate the privacy or infringe the rights of others',
                  ),

                  const SizedBox(height: 30),

                  // Content Ownership
                  _buildSectionHeader(
                    icon: Icons.copyright_rounded,
                    title: 'Content & Intellectual Property',
                    color: Colors.purple,
                  ),
                  const SizedBox(height: 12),
                  _buildParagraph(
                    'All content provided through the Eucossa app, including but not limited to text, graphics, logos, and software, is the property of Eucossa or its content suppliers and protected by intellectual property laws.',
                  ),
                  const SizedBox(height: 8),
                  _buildTermItem(
                    'You retain ownership of any content you submit, post, or display on or through the service.',
                  ),
                  _buildTermItem(
                    'By submitting content, you grant Eucossa a worldwide, non-exclusive, royalty-free license to use, distribute, and display such content.',
                  ),

                  const SizedBox(height: 30),

                  // Privacy
                  _buildSectionHeader(
                    icon: Icons.privacy_tip_rounded,
                    title: 'Privacy & Data Protection',
                    color: Colors.teal,
                  ),
                  const SizedBox(height: 12),
                  _buildParagraph(
                    'Your privacy is important to us. Our Privacy Policy explains how we collect, use, and protect your personal information. By using our services, you agree to the collection and use of information in accordance with our Privacy Policy.',
                  ),

                  const SizedBox(height: 30),

                  // Termination
                  _buildSectionHeader(
                    icon: Icons.cancel_rounded,
                    title: 'Termination',
                    color: Colors.red,
                  ),
                  const SizedBox(height: 12),
                  _buildParagraph(
                    'We may terminate or suspend your account immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms.',
                  ),

                  const SizedBox(height: 30),

                  // Limitation of Liability
                  _buildSectionHeader(
                    icon: Icons.warning_rounded,
                    title: 'Limitation of Liability',
                    color: Colors.amber,
                  ),
                  const SizedBox(height: 12),
                  _buildParagraph(
                    'In no event shall Eucossa, nor its directors, employees, partners, agents, suppliers, or affiliates, be liable for any indirect, incidental, special, consequential or punitive damages, including without limitation, loss of profits, data, use, goodwill, or other intangible losses.',
                  ),

                  const SizedBox(height: 30),

                  // Changes to Terms
                  _buildSectionHeader(
                    icon: Icons.update_rounded,
                    title: 'Changes to Terms',
                    color: Colors.indigo,
                  ),
                  const SizedBox(height: 12),
                  _buildParagraph(
                    'We reserve the right, at our sole discretion, to modify or replace these Terms at any time. We will provide notice of any changes by posting the new Terms on this page and updating the "Last Updated" date.',
                  ),

                  const SizedBox(height: 30),

                  // Governing Law
                  _buildSectionHeader(
                    icon: Icons.gavel_rounded,
                    title: 'Governing Law',
                    color: Colors.brown,
                  ),
                  const SizedBox(height: 12),
                  _buildParagraph(
                    'These Terms shall be governed and construed in accordance with the laws of Kenya, without regard to its conflict of law provisions.',
                  ),

                  const SizedBox(height: 30),

                  // Contact Information
                  _buildSectionHeader(
                    icon: Icons.contact_support_rounded,
                    title: 'Contact Us',
                    color: Colors.pink,
                  ),
                  const SizedBox(height: 12),
                  _buildParagraph(
                    'If you have any questions about these Terms, please contact us at:',
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Eucossa Club',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[800],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Egerton University',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Email: contact@eucossa.com',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),

                  // Acceptance Card
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue.shade600,
                          Colors.blue.shade400,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.3),
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
                          'By using Eucossa Mobile App',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'You acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 16),
                        OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Text(
                            'I Understand',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
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

  Widget _buildTermItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 2, right: 12),
            child: Icon(
              Icons.circle_rounded,
              size: 6,
              color: Colors.blue.shade600,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}