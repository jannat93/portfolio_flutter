import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../widgets/common_widgets.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: 'Research & Recognition',
            title: 'Achievements',
            subtitle: 'Published researcher, competition finalist, and community leader.',
          ),

          // Education section
          RevealWidget(
            delay: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Education',
                    style: AppTheme.syneStyle(
                        size: 18, weight: FontWeight.w700)),
                const SizedBox(height: 12),
                ...PortfolioData.education.asMap().entries.map((entry) {
                  final i = entry.key;
                  final edu = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: GlassCard(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 4,
                            height: 60,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [AppTheme.accent, AppTheme.teal],
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  edu['year']!.toUpperCase(),
                                  style: AppTheme.dmStyle(
                                    size: 10,
                                    color: AppTheme.teal2,
                                    weight: FontWeight.w500,
                                  ).copyWith(letterSpacing: 1.5),
                                ),
                                const SizedBox(height: 3),
                                Text(edu['degree']!,
                                    style: AppTheme.syneStyle(
                                        size: 13, weight: FontWeight.w700)),
                                Text(edu['inst']!,
                                    style: AppTheme.dmStyle(size: 12)),
                                if (edu['gpa']!.isNotEmpty) ...[
                                  const SizedBox(height: 6),
                                  BadgeChip(edu['gpa']!, colorType: 'accent'),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 28),
              ],
            ),
          ),

          Text('Highlights',
              style:
                  AppTheme.syneStyle(size: 18, weight: FontWeight.w700)),
          const SizedBox(height: 12),

          ...PortfolioData.achievements.asMap().entries.map((entry) {
            final i = entry.key;
            final ach = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: RevealWidget(
                delay: 50 + i * 60,
                child: GlassCard(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ach['icon'] as String,
                          style: const TextStyle(fontSize: 22)),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ach['title'] as String,
                              style: AppTheme.syneStyle(
                                  size: 13, weight: FontWeight.w600),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              ach['body'] as String,
                              style: AppTheme.dmStyle(size: 12, height: 1.6),
                            ),
                          ],
                        ),
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
