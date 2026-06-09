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
    final frontendRepo = project['frontendRepo'] as String?;
    final backendRepo = project['backendRepo'] as String?;
    final liveLink = project['liveLink'] as String?;

    // Check if there are any actionable links at all
    final hasActions = link.isNotEmpty || frontendRepo != null || backendRepo != null || liveLink != null;

    return GlassCard(
      borderColor: AppTheme.teal.withOpacity(0.3),
      // Removed parent onTap to allow child buttons to receive clean touch events
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
            ],
          ),
          const SizedBox(height: 12),
          Text(
            project['desc'] as String,
            style: AppTheme.dmStyle(size: 13, height: 1.75),
          ),
          const SizedBox(height: 12),

          // Technical Stack Tags
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: (project['stack'] as List<String>)
                .map((t) => StackTag(t))
                .toList(),
          ),

          // Unified Action Buttons Block (Brought to the bottom for clean UI hierarchy)
          if (hasActions) ...[
            const SizedBox(height: 16),
            const Divider(height: 1, color: Colors.white10), // Clean separator line
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                // Main Project Link (e.g., Case Study / LinkedIn Post / Doc)
                if (link.isNotEmpty)
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppTheme.teal.withOpacity(0.5)),
                      foregroundColor: AppTheme.teal,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    onPressed: () => launchUrl(Uri.parse(link)),
                    icon: const Icon(Icons.article_outlined, size: 14),
                    label: const Text('Overview', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                // Live App/Backend Deployment
                if (liveLink != null)
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.teal,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    ),
                    onPressed: () => launchUrl(Uri.parse(liveLink)),
                    icon: const Icon(Icons.language, size: 14),
                    label: const Text('Live Demo', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                  ),
                // Frontend Code Repository
                if (frontendRepo != null)
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: AppTheme.textSecondary,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    ),
                    onPressed: () => launchUrl(Uri.parse(frontendRepo)),
                    icon: const Icon(Icons.code, size: 14),
                    label: const Text('Frontend', style: TextStyle(fontSize: 11)),
                  ),
                // Backend Code Repository
                if (backendRepo != null)
                  TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: AppTheme.textSecondary,
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    ),
                    onPressed: () => launchUrl(Uri.parse(backendRepo)),
                    icon: const Icon(Icons.storage, size: 14),
                    label: const Text('Backend', style: TextStyle(fontSize: 11)),
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
