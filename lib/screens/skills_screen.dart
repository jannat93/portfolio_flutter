import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../widgets/common_widgets.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: 'Technical Expertise',
            title: 'What I Build With',
            subtitle: 'A full-stack toolkit spanning mobile, backend, AI, and design.',
          ),
          ...PortfolioData.skillCategories.asMap().entries.map((entry) {
            final i = entry.key;
            final cat = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: RevealWidget(
                delay: i * 80,
                child: GlassCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(cat['icon'] as String,
                              style: const TextStyle(fontSize: 22)),
                          const SizedBox(width: 12),
                          Text(
                            cat['title'] as String,
                            style: AppTheme.syneStyle(
                                size: 15, weight: FontWeight.w600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: (cat['tags'] as List<String>)
                            .map((t) => SkillTag(t, isTeal: cat['color'] == 'teal'))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
