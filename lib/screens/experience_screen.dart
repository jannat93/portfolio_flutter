import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../widgets/common_widgets.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: 'Work History',
            title: 'Experience',
            subtitle: 'Production-level work across internships and academic roles.',
          ),
          // Timeline
          ...PortfolioData.experiences.asMap().entries.map((entry) {
            final i = entry.key;
            final exp = entry.value;
            return RevealWidget(
              delay: i * 100,
              child: _TimelineItem(
                exp: exp,
                isLast: i == PortfolioData.experiences.length - 1,
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final Map<String, dynamic> exp;
  final bool isLast;
  const _TimelineItem({required this.exp, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline line + dot
          SizedBox(
            width: 28,
            child: Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: AppTheme.accent,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme.bg, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.accent.withOpacity(0.3),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 1,
                      color: AppTheme.cardBorder,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (exp['date'] as String).toUpperCase(),
                    style: AppTheme.dmStyle(
                      size: 11,
                      color: AppTheme.teal2,
                      weight: FontWeight.w500,
                    ).copyWith(letterSpacing: 1.5),
                  ),
                  const SizedBox(height: 4),
                  Text(exp['company'] as String,
                      style: AppTheme.syneStyle(
                          size: 18, weight: FontWeight.w700)),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${exp['role']} · ${exp['location']}',
                          style: AppTheme.dmStyle(
                              size: 13,
                              color: AppTheme.accent3,
                              weight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  GlassCard(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...(exp['points'] as List<String>).map(
                          (p) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: Container(
                                    width: 5,
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: AppTheme.accent2,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(p,
                                      style: AppTheme.dmStyle(
                                          size: 13, height: 1.7)),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (exp['award'] != null) ...[
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            decoration: BoxDecoration(
                              color: AppTheme.gold.withOpacity(0.12),
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color: AppTheme.gold.withOpacity(0.3),
                                  width: 0.5),
                            ),
                            child: Text(
                              exp['award'] as String,
                              style: AppTheme.dmStyle(
                                  size: 12,
                                  color: AppTheme.gold,
                                  weight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ],
                    ),
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
