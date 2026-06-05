import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../theme/app_theme.dart';

// ── Section Header ──────────────────────────────────────────────────
class SectionHeader extends StatelessWidget {
  final String label;
  final String title;
  final String? subtitle;
  const SectionHeader({
    super.key,
    required this.label,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: AppTheme.dmStyle(
            size: 11,
            weight: FontWeight.w500,
            color: AppTheme.accent2,
            height: 1,
          ).copyWith(letterSpacing: 2.5),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: AppTheme.syneStyle(size: 28, weight: FontWeight.w800),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(subtitle!,
              style: AppTheme.dmStyle(size: 14, height: 1.7)),
        ],
        const SizedBox(height: 8),
        Container(
          width: 36,
          height: 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppTheme.accent, AppTheme.accent.withOpacity(0)],
            ),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 28),
      ],
    );
  }
}

// ── Glassy Card ──────────────────────────────────────────────────────
class GlassCard extends StatefulWidget {
  final Widget child;
  final EdgeInsets? padding;
  final Color? borderColor;
  final VoidCallback? onTap;
  const GlassCard({
    super.key,
    required this.child,
    this.padding,
    this.borderColor,
    this.onTap,
  });

  @override
  State<GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<GlassCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          transform: Matrix4.translationValues(0, _hovered ? -4 : 0, 0),
          padding: widget.padding ?? const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.cardBg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hovered
                  ? (widget.borderColor ?? AppTheme.accent).withOpacity(0.8)
                  : (widget.borderColor ?? AppTheme.cardBorder),
              width: 0.5,
            ),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}

// ── Skill Tag ────────────────────────────────────────────────────────
class SkillTag extends StatelessWidget {
  final String label;
  final bool isTeal;
  const SkillTag(this.label, {super.key, this.isTeal = false});

  @override
  Widget build(BuildContext context) {
    final color = isTeal ? AppTheme.teal2 : AppTheme.accent3;
    final bg = isTeal
        ? AppTheme.teal.withOpacity(0.1)
        : AppTheme.accent.withOpacity(0.1);
    final border = isTeal
        ? AppTheme.teal.withOpacity(0.2)
        : AppTheme.accent.withOpacity(0.2);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: border, width: 0.5),
      ),
      child: Text(label,
          style: AppTheme.dmStyle(size: 12, color: color, weight: FontWeight.w400)),
    );
  }
}

// ── Stack Tag (project) ───────────────────────────────────────────────
class StackTag extends StatelessWidget {
  final String label;
  const StackTag(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: Colors.white.withOpacity(0.08), width: 0.5),
      ),
      child: Text(label,
          style: AppTheme.dmStyle(size: 11, color: AppTheme.textTertiary)),
    );
  }
}

// ── Badge ────────────────────────────────────────────────────────────
class BadgeChip extends StatelessWidget {
  final String label;
  final String colorType; // 'teal' | 'gold' | 'accent'
  const BadgeChip(this.label, {super.key, this.colorType = 'teal'});

  @override
  Widget build(BuildContext context) {
    Color text;
    Color bg;
    Color border;
    switch (colorType) {
      case 'gold':
        text = AppTheme.gold;
        bg = AppTheme.gold.withOpacity(0.12);
        border = AppTheme.gold.withOpacity(0.3);
        break;
      case 'accent':
        text = AppTheme.accent3;
        bg = AppTheme.accent.withOpacity(0.12);
        border = AppTheme.accent.withOpacity(0.3);
        break;
      default:
        text = AppTheme.teal2;
        bg = AppTheme.teal.withOpacity(0.12);
        border = AppTheme.teal.withOpacity(0.3);
    }
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: border, width: 0.5),
      ),
      child: Text(label,
          style: AppTheme.dmStyle(size: 11, color: text, weight: FontWeight.w500)),
    );
  }
}

// ── Animated Reveal ───────────────────────────────────────────────────
class RevealWidget extends StatelessWidget {
  final Widget child;
  final int delay;
  const RevealWidget({super.key, required this.child, this.delay = 0});

  @override
  Widget build(BuildContext context) {
    return child
        .animate()
        .fadeIn(delay: Duration(milliseconds: delay), duration: 600.ms)
        .slideY(begin: 0.15, end: 0, delay: Duration(milliseconds: delay), duration: 600.ms, curve: Curves.easeOut);
  }
}

// ── Gradient Mesh Background ─────────────────────────────────────────
class MeshBackground extends StatelessWidget {
  final Widget child;
  const MeshBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(painter: _MeshPainter()),
        ),
        child,
      ],
    );
  }
}

class _MeshPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..shader = RadialGradient(
        center: const Alignment(-0.6, -0.2),
        radius: 0.8,
        colors: [
          AppTheme.accent.withOpacity(0.12),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint1);

    final paint2 = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0.7, 0.5),
        radius: 0.7,
        colors: [
          AppTheme.teal.withOpacity(0.07),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ── Dot indicator (pulse) ─────────────────────────────────────────────
class PulseDot extends StatefulWidget {
  const PulseDot({super.key});
  @override
  State<PulseDot> createState() => _PulseDotState();
}

class _PulseDotState extends State<PulseDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..repeat(reverse: true);
    _anim = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _anim,
      child: Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(
          color: AppTheme.teal,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
