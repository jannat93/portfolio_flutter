import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../widgets/common_widgets.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
            label: 'Selected Work',
            title: 'Projects',
            subtitle: 'Production-grade apps and research prototypes built to solve real problems.',
          ),
          ...PortfolioData.projects.asMap().entries.map((entry) {
            final i = entry.key;
            final p = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: RevealWidget(
                delay: i * 80,
                child: _ProjectCard(project: p),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  final Map<String, dynamic> project;
  const _ProjectCard({required this.project});

  @override
  Widget build(BuildContext context) {
    final link = project['link'] as String;
    return GlassCard(
      borderColor: AppTheme.teal.withOpacity(0.3),
      onTap: link.isNotEmpty ? () => launchUrl(Uri.parse(link)) : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppTheme.teal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: AppTheme.teal.withOpacity(0.2), width: 0.5),
                ),
                child: Center(
                  child: Text(project['icon'] as String,
                      style: const TextStyle(fontSize: 20)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  project['title'] as String,
                  style: AppTheme.syneStyle(size: 15, weight: FontWeight.w700),
                ),
              ),
              if (project['badge'] != null)
                BadgeChip(
                  project['badge'] as String,
                  colorType: project['badgeColor'] as String? ?? 'teal',
                ),
              if (link.isNotEmpty) ...[
                const SizedBox(width: 8),
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: AppTheme.cardBorder, width: 0.5),
                  ),
                  child: const Center(
                    child: Icon(Icons.open_in_new_rounded,
                        size: 14, color: AppTheme.textTertiary),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 12),
          Text(
            project['desc'] as String,
            style: AppTheme.dmStyle(size: 13, height: 1.75),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: (project['stack'] as List<String>)
                .map((t) => StackTag(t))
                .toList(),
          ),
        ],
      ),
    );
  }
}
