# Jannatul Nayeem — Flutter Portfolio App

A sleek, dark-themed personal portfolio app built with Flutter.

## ✨ Features

- **6-tab navigation** — Home, Skills, Experience, Projects, Achievements, Contact
- **Animated hero** screen with typewriter role animation
- **Mesh gradient** background with glassy cards
- **Timeline** experience section
- **Project cards** with stack tags and live link support
- **Contact form** that opens your email client
- **Smooth reveal animations** using `flutter_animate`
- **Deep purple + teal** dark aesthetic with Syne + DM Sans fonts

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry, bottom nav shell
├── theme/
│   └── app_theme.dart           # Colors, text styles
├── data/
│   └── portfolio_data.dart      # All your content (edit here!)
├── widgets/
│   └── common_widgets.dart      # Reusable components
└── screens/
    ├── hero_screen.dart          # Home / landing
    ├── skills_screen.dart        # Tech skills grid
    ├── experience_screen.dart    # Work timeline
    ├── projects_screen.dart      # Project cards
    ├── achievements_screen.dart  # Research + awards + education
    └── contact_screen.dart       # Contact form + links
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK ≥ 3.0.0
- Dart SDK ≥ 3.0.0
- Android Studio / VS Code with Flutter extension

### Setup

```bash
# 1. Clone / extract project
cd jannatul_portfolio

# 2. Install dependencies
flutter pub get

# 3. Run on device or emulator
flutter run

# 4. Build APK
flutter build apk --release
```

## 🎨 Customization

### Update your content
Edit **`lib/data/portfolio_data.dart`** — all text, projects, skills, and links live there.

### Update real links
Search for `'https://linkedin.com'` and `'https://github.com'` in `portfolio_data.dart` and replace with your actual URLs.

### Add your photo
1. Add `assets/images/` folder
2. Put `profile.jpg` inside
3. In `hero_screen.dart`, replace the initials avatar with:
```dart
CircleAvatar(
  radius: 48,
  backgroundImage: AssetImage('assets/images/profile.jpg'),
)
```

### Video intro
To add a video intro section, add `video_player` or `youtube_player_flutter` package and embed it in the Hero screen.

## 📦 Dependencies

| Package | Purpose |
|---|---|
| `google_fonts` | Syne + DM Sans typefaces |
| `animated_text_kit` | Typewriter role animation |
| `flutter_animate` | Reveal / fade-in animations |
| `url_launcher` | Open links, email, phone |
| `lottie` | (Optional) Lottie animations |
| `flutter_svg` | (Optional) SVG icons |

## 🎬 AI Video Intro (separate tool)

To create your talking-head intro video:
1. **HeyGen** (heygen.com) — upload photo → get AI avatar video
2. **D-ID** (d-id.com) — photo + script → video
3. Upload to YouTube, use `youtube_player_flutter` to embed in app

Suggested script (60 sec):
> "Hi, I'm Jannatul Nayeem — a Full-Stack and Flutter developer from Chattogram, Bangladesh. I build production-grade mobile apps and scalable Django backends. I've shipped apps in legal tech, mental health, and expense tracking at Nexgenix. I'm also a published IEEE researcher and Top 25 BDApps finalist. Let's build something impactful together."

---

Built with 💜 using Flutter
