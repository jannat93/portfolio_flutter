import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../widgets/common_widgets.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _msgCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _msgCtrl.dispose();
    super.dispose();
  }

  void _sendEmail() async {
    final name = _nameCtrl.text.trim();
    final email = _emailCtrl.text.trim();
    final msg = _msgCtrl.text.trim();
    if (name.isEmpty || email.isEmpty || msg.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields.')),
      );
      return;
    }
    final uri = Uri(
      scheme: 'mailto',
      path: PortfolioData.email,
      queryParameters: {
        'subject': 'Portfolio Contact from $name',
        'body': 'From: $name\nEmail: $email\n\n$msg',
      },
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Copied: $text'),
        backgroundColor: AppTheme.accent,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: "Let's Connect",
            title: 'Get in Touch',
            subtitle: 'Open to opportunities, collaborations, and exciting projects.',
          ),

          // Contact cards
          RevealWidget(
            delay: 0,
            child: Column(
              children: [
                _ContactTile(
                  icon: Icons.email_rounded,
                  label: 'Email',
                  value: PortfolioData.email,
                  onTap: () => launchUrl(Uri.parse('mailto:${PortfolioData.email}')),
                  onLongPress: () => _copyToClipboard(PortfolioData.email),
                ),
                const SizedBox(height: 10),
                _ContactTile(
                  icon: Icons.phone_rounded,
                  label: 'Phone',
                  value: PortfolioData.phone,
                  onTap: () => launchUrl(Uri.parse('tel:${PortfolioData.phone}')),
                  onLongPress: () => _copyToClipboard(PortfolioData.phone),
                ),
                const SizedBox(height: 10),
                _ContactTile(
                  icon: Icons.work_rounded,
                  label: 'LinkedIn',
                  value: 'Connect on LinkedIn',
                  onTap: () => launchUrl(Uri.parse(PortfolioData.linkedin)),
                  onLongPress: null,
                ),
                const SizedBox(height: 10),
                _ContactTile(
                  icon: Icons.code_rounded,
                  label: 'GitHub',
                  value: 'View my repositories',
                  onTap: () => launchUrl(Uri.parse(PortfolioData.github)),
                  onLongPress: null,
                ),
                const SizedBox(height: 10),
                _ContactTile(
                  icon: Icons.location_on_rounded,
                  label: 'Location',
                  value: PortfolioData.location,
                  onTap: null,
                  onLongPress: null,
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          RevealWidget(
            delay: 100,
            child: Text('Send a Message',
                style: AppTheme.syneStyle(size: 18, weight: FontWeight.w700)),
          ),
          const SizedBox(height: 16),

          // Form
          RevealWidget(
            delay: 150,
            child: GlassCard(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _FormField(
                    label: 'Your Name',
                    controller: _nameCtrl,
                    hint: 'Ahmed Hassan',
                  ),
                  const SizedBox(height: 14),
                  _FormField(
                    label: 'Email Address',
                    controller: _emailCtrl,
                    hint: 'you@company.com',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 14),
                  _FormField(
                    label: 'Message',
                    controller: _msgCtrl,
                    hint: 'Tell me about your project or opportunity...',
                    maxLines: 4,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: _sendEmail,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppTheme.accent, AppTheme.accent2],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Send Message',
                        textAlign: TextAlign.center,
                        style: AppTheme.dmStyle(
                            size: 15,
                            color: Colors.white,
                            weight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Footer
          RevealWidget(
            delay: 200,
            child: Center(
              child: Column(
                children: [
                  ShaderMask(
                    shaderCallback: (b) => LinearGradient(
                      colors: [AppTheme.accent, AppTheme.accent2],
                    ).createShader(b),
                    child: Text(
                      'JN.',
                      style: AppTheme.syneStyle(
                          size: 32,
                          weight: FontWeight.w800,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '© 2025 Jannatul Nayeem · Chattogram, Bangladesh',
                    style: AppTheme.dmStyle(size: 12, color: AppTheme.textTertiary),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  const _ContactTile({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.cardBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.cardBorder, width: 0.5),
        ),
        child: Row(
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: AppTheme.accent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
                border:
                    Border.all(color: AppTheme.cardBorder, width: 0.5),
              ),
              child: Icon(icon, size: 18, color: AppTheme.accent2),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: AppTheme.dmStyle(
                          size: 11,
                          color: AppTheme.textTertiary,
                          weight: FontWeight.w500)
                          .copyWith(letterSpacing: 0.5)),
                  Text(value,
                      style: AppTheme.dmStyle(
                          size: 13,
                          color: AppTheme.textPrimary,
                          weight: FontWeight.w400)),
                ],
              ),
            ),
            if (onTap != null)
              Icon(Icons.arrow_forward_ios_rounded,
                  size: 14, color: AppTheme.textTertiary),
          ],
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final TextInputType keyboardType;
  const _FormField({
    required this.label,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: AppTheme.dmStyle(
                  size: 10,
                  color: AppTheme.textTertiary,
                  weight: FontWeight.w500)
              .copyWith(letterSpacing: 1.5),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: AppTheme.dmStyle(size: 14, color: AppTheme.textPrimary),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: AppTheme.dmStyle(size: 14, color: AppTheme.textTertiary),
            filled: true,
            fillColor: AppTheme.bg3,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: AppTheme.cardBorder, width: 0.5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: AppTheme.cardBorder, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: AppTheme.accent, width: 1),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          ),
        ),
      ],
    );
  }
}
