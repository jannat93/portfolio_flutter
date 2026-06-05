import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';
import '../data/portfolio_data.dart';
import '../widgets/common_widgets.dart';

class HeroScreen extends StatelessWidget {
  final void Function(int) onNavigate;
  const HeroScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return MeshBackground(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 60, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RevealWidget(
              delay: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppTheme.teal.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: AppTheme.teal.withOpacity(0.3),
                    width: 0.5,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const PulseDot(),
                    const SizedBox(width: 8),
                    Text(
                      'Available for opportunities',
                      style: AppTheme.dmStyle(
                        size: 12,
                        color: AppTheme.teal2,
                        weight: FontWeight.w500,
                      ).copyWith(letterSpacing: 0.5),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 28),
            RevealWidget(
              delay: 50,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [AppTheme.accent, AppTheme.accent2],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.accent.withOpacity(0.2),
                      blurRadius: 20,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: const CircleAvatar(
                  radius: 64,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('images/myphoto.jpeg'),
                ),
              ),
            ),
            const SizedBox(height: 24),
            RevealWidget(
              delay: 100,
              child: Text(
                'Jannatul',
                style: AppTheme.syneStyle(
                  size: 36,
                  weight: FontWeight.w800,
                  color: AppTheme.textPrimary,
                ).copyWith(letterSpacing: -2, height: 1.0),
                textAlign: TextAlign.center,
              ),
            ),
            RevealWidget(
              delay: 150,
              child: ShaderMask(
                shaderCallback: (bounds) => LinearGradient(
                  colors: [AppTheme.accent, AppTheme.accent2],
                ).createShader(bounds),
                child: Text(
                  'Nayeem',
                  style: AppTheme.syneStyle(
                    size: 24,
                    weight: FontWeight.w800,
                    color: Colors.white,
                  ).copyWith(letterSpacing: -2, height: 1.0),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 16),
            RevealWidget(
              delay: 200,
              child: SizedBox(
                height: 32,
                child: AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Full-Stack Developer',
                      textStyle: AppTheme.dmStyle(
                        size: 16,
                        color: AppTheme.accent3,
                        weight: FontWeight.w500,
                      ),
                      speed: const Duration(milliseconds: 80),
                    ),
                    TypewriterAnimatedText(
                      'Flutter & Dart Expert',
                      textStyle: AppTheme.dmStyle(
                        size: 16,
                        color: AppTheme.accent3,
                        weight: FontWeight.w500,
                      ),
                      speed: const Duration(milliseconds: 80),
                    ),
                    TypewriterAnimatedText(
                      'Django Backend Developer',
                      textStyle: AppTheme.dmStyle(
                        size: 16,
                        color: AppTheme.teal2,
                        weight: FontWeight.w500,
                      ),
                      speed: const Duration(milliseconds: 80),
                    ),
                    TypewriterAnimatedText(
                      'ML Integration Specialist',
                      textStyle: AppTheme.dmStyle(
                        size: 16,
                        color: AppTheme.teal2,
                        weight: FontWeight.w500,
                      ),
                      speed: const Duration(milliseconds: 80),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            RevealWidget(
              delay: 250,
              child: Text(
                PortfolioData.summary,
                style: AppTheme.dmStyle(size: 14, height: 1.8),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 28),
            RevealWidget(
              delay: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _PrimaryBtn(
                    label: 'View Projects',
                    onTap: () => onNavigate(3),
                  ),
                  const SizedBox(width: 12),
                  _SecondaryBtn(
                    label: 'Contact Me',
                    onTap: () => onNavigate(5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            RevealWidget(
              delay: 400,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.cardBg,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppTheme.cardBorder, width: 0.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: PortfolioData.stats
                      .map((s) => _StatItem(
                    value: s['value'],
                    label: s['label'],
                  ))
                      .toList(),
                ),
              ),
            ),
            const SizedBox(height: 32),
            RevealWidget(
              delay: 500,
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 8,
                runSpacing: 8,
                children: [
                  _InfoChip(icon: Icons.location_on_rounded, label: 'Chattogram, BD'),
                  _InfoChip(icon: Icons.email_rounded, label: PortfolioData.email),
                  _InfoChip(icon: Icons.phone_rounded, label: PortfolioData.phone),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;
  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: AppTheme.syneStyle(
                size: 12, color: AppTheme.accent3, weight: FontWeight.w700)),
        const SizedBox(height: 4),
        Text(
          label.toUpperCase(),
          style: AppTheme.dmStyle(size: 10, color: AppTheme.textTertiary)
              .copyWith(letterSpacing: 1),
        ),
      ],
    );
  }
}

class _PrimaryBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _PrimaryBtn({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppTheme.accent, AppTheme.accent2]),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(label,
            style: AppTheme.dmStyle(
                size: 14, color: Colors.white, weight: FontWeight.w500)),
      ),
    );
  }
}

class _SecondaryBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _SecondaryBtn({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: AppTheme.cardBorder, width: 0.5),
        ),
        child: Text(label,
            style: AppTheme.dmStyle(
                size: 10, color: AppTheme.textSecondary, weight: FontWeight.w500)),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: AppTheme.bg3,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppTheme.cardBorder, width: 0.5),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: AppTheme.accent2),
          const SizedBox(width: 6),
          Text(label,
              style: AppTheme.dmStyle(
                  size: 12, color: AppTheme.textSecondary)),
        ],
      ),
    );
  }
}