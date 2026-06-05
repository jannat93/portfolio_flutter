import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'screens/hero_screen.dart';
import 'screens/skills_screen.dart';
import 'screens/experience_screen.dart';
import 'screens/projects_screen.dart';
import 'screens/achievements_screen.dart';
import 'screens/contact_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppTheme.bg2,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jannatul Nayeem',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  void _navigateTo(int index) {
    setState(() => _currentIndex = index);
  }

  static const List<({String label, IconData icon, IconData activeIcon})> _tabs = [
    (label: 'Home', icon: Icons.home_outlined, activeIcon: Icons.home_rounded),
    (label: 'Skills', icon: Icons.code_outlined, activeIcon: Icons.code_rounded),
    (label: 'Work', icon: Icons.work_outline_rounded, activeIcon: Icons.work_rounded),
    (label: 'Projects', icon: Icons.grid_view_outlined, activeIcon: Icons.grid_view_rounded),
    (label: 'Wins', icon: Icons.emoji_events_outlined, activeIcon: Icons.emoji_events_rounded),
    (label: 'Contact', icon: Icons.mail_outline_rounded, activeIcon: Icons.mail_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        backgroundColor: AppTheme.bg.withOpacity(0.85),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: AppTheme.bg.withOpacity(0.7),
            border: Border(
              bottom: BorderSide(color: AppTheme.cardBorder, width: 0.5),
            ),
          ),
        ),
        title: Row(
          children: [
            ShaderMask(
              shaderCallback: (b) => LinearGradient(
                colors: [AppTheme.accent, AppTheme.accent2],
              ).createShader(b),
              child: Text(
                'JN.',
                style: TextStyle(
                  fontFamily: 'Syne',
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: AppTheme.teal.withOpacity(0.1),
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                    color: AppTheme.teal.withOpacity(0.3), width: 0.5),
              ),
              child: Text(
                'Portfolio',
                style: TextStyle(
                  fontSize: 11,
                  color: AppTheme.teal2,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
        actions: [
          _tabs[_currentIndex].label != 'Home'
              ? Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Center(
                    child: Text(
                      _tabs[_currentIndex].label,
                      style: TextStyle(
                        color: AppTheme.textTertiary,
                        fontSize: 13,
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          HeroScreen(onNavigate: _navigateTo),
          const SkillsScreen(),
          const ExperienceScreen(),
          const ProjectsScreen(),
          const AchievementsScreen(),
          const ContactScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppTheme.bg2,
          border: Border(
            top: BorderSide(color: AppTheme.cardBorder, width: 0.5),
          ),
        ),
        child: SafeArea(
          child: SizedBox(
            height: 62,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _tabs.asMap().entries.map((entry) {
                final i = entry.key;
                final tab = entry.value;
                final active = i == _currentIndex;
                return GestureDetector(
                  onTap: () => setState(() => _currentIndex = i),
                  behavior: HitTestBehavior.opaque,
                  child: SizedBox(
                    width: 56,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: active
                                ? AppTheme.accent.withOpacity(0.15)
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Icon(
                            active ? tab.activeIcon : tab.icon,
                            size: 20,
                            color: active
                                ? AppTheme.accent2
                                : AppTheme.textTertiary,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          tab.label,
                          style: TextStyle(
                            fontSize: 10,
                            color: active
                                ? AppTheme.accent3
                                : AppTheme.textTertiary,
                            fontWeight: active
                                ? FontWeight.w500
                                : FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
