class PortfolioData {
  static const String name = 'Jannatul Nayeem';
  static const String tagline = 'Full-Stack & Flutter Developer';
  static const String location = 'Hathazari, Chattogram, Bangladesh';
  static const String email = 'jannatul.nayeem6053@gmail.com';
  static const String phone = '+880 1864 776053';

  // Professional Links updated from document
  static const String linkedin = 'https://www.linkedin.com/in/jannatul-nayeem-867305333';
  static const String github = 'https://github.com/jannat93';
  static const String portfolio = 'https://portfolio-topaz-nu-97.vercel.app/';

  static const String summary =
      'Passionate software developer building impactful, production-grade mobile apps and scalable Django backends. Proven ability to lead teams, deliver under pressure, and contribute to end-to-end product development.';

  static const List<Map<String, dynamic>> stats = [
    {'value': '8+', 'label': 'Projects'},
    {'value': '3+', 'label': 'Internships'},
    {'value': 'Top 25', 'label': 'BDApps'},
    {'value': '3.95', 'label': 'Last GPA'},
  ];

  static const List<Map<String, dynamic>> skillCategories = [
    {
      'icon': '📱',
      'title': 'Mobile & Frontend',
      'color': 'accent',
      'tags': [
        'Flutter', 'Dart', 'Riverpod', 'GetX', 'Firebase',
        'FCM', 'Hive', 'SQLite', 'Figma', 'Animations',
      ],
    },
    {
      'icon': '⚙️',
      'title': 'Backend & Web',
      'color': 'teal',
      'tags': [
        'Django', 'DRF', 'Node.js', 'Express.js', 'Flask',
        'REST APIs', 'JWT Auth', 'PostgreSQL', 'MySQL', 'cPanel',
      ],
    },
    {
      'icon': '🧠',
      'title': 'AI & Machine Learning',
      'color': 'accent',
      'tags': [
        'Scikit-learn', 'NLP', 'Data Preprocessing',
        'Model Integration', 'Python',
      ],
    },
    {
      'icon': '🛠',
      'title': 'Languages & Tools',
      'color': 'teal',
      'tags': [
        'Python', 'JavaScript', 'C/C++', 'PHP', 'SQL',
        'Git', 'Postman', 'LaTeX', 'Agile/Scrum',
      ],
    },
  ];

  static const List<Map<String, dynamic>> experiences = [
    {
      'date': '2023 – 2024',
      'company': 'Nexgenix',
      'role': 'Flutter & Django Developer Intern',
      'location': 'Chattogram, Bangladesh',
      'award': '⭐ Best Intern of the Month',
      'certificateLink': 'https://drive.google.com/file/d/1PFOGCIpksJUltffi903luEk07pL7uxFt/view?usp=sharing',
      'points': [
        'Built & deployed Aspire Internship Platform backend (Django) — student applications, company matching, workflow automation.',
        'Led Flutter development for Ain Bondhu Legal Support Platform; sole backend developer using Django REST APIs.',
        'Built full-stack Expense Tracker with Flutter + Django backend and monthly summaries.',
        'Led Flutter dev for Ashpash News App and Water Tracking App.',
        'Optimized DB models; implemented auth/authorization for scalable performance.',
        'Contributed to PsyCoach mental health platform features.',
      ],
    },
    {
      'date': '2024',
      'company': 'Gao Tec Inc.',
      'role': 'Software Engineering Intern',
      'location': 'Remote (Canada)',
      'award': null,
      'points': [
        'Supported frontend development and maintained technical documentation for enterprise-level systems.',
      ],
    },
    {
      'date': '1 Year',
      'company': 'IIUC',
      'role': 'Teaching Assistant',
      'location': 'Chattogram, Bangladesh',
      'award': null,
      'points': [
        'Conducted lab sessions for Software Development, Compiler Design, and DBMS.',
        'Mentored 50+ students in programming, debugging, and core CS concepts.',
      ],
    },
  ];

  static const List<Map<String, dynamic>> projects = [
    {
      'icon': '⚖️',
      'title': 'Ain Bondhu Legal Platform',
      'badge': 'Featured',
      'badgeColor': 'teal',
      'desc': 'Legal support app with scalable Django REST backend. Led full Flutter UI development and API integration.',
      'stack': ['Flutter', 'Django REST', 'JWT'],
      'link': 'https://www.linkedin.com/feed/update/urn:li:activity:7397933846819717120/?originTrackingId=BFuQO%2BmE8RjPRAdUqx1ekg%3D%3D', // Showcase Link
      'frontendRepo': 'https://github.com/thenexgenix/Ainbondhu_Mobile_Application_Flutter',
      'backendRepo': 'https://github.com/thenexgenix/Ain_Bondhu_backend.git',
    },
    {
      'icon': '💼',
      'title': 'Aspire Internship Platform',
      'badge': 'Nexgenix',
      'badgeColor': 'teal',
      'desc': 'Built and deployed a backend system enabling student applications, company matching, and workflow automation.',
      'stack': ['Django', 'Python', 'PostgreSQL'],
      'link': 'https://github.com/thenexgenix/Aspire-Internship',
      'liveLink': 'https://aspireinternship.thenexgenix.com/',
    },
    {
      'icon': '💰',
      'title': 'Expense Tracker App',
      'badge': null,
      'badgeColor': null,
      'desc': 'Full-stack mobile app with expense categorization, monthly summaries, and secure authentication.',
      'stack': ['Flutter', 'Django', 'SQLite'],
      'link': 'https://docs.google.com/document/d/1D1I8W3tagVNoJfG_zTWAbJgrXgeMI7PB_fTUNgK6GrI/edit?tab=t.0',
    },
    {
      'icon': '🧠',
      'title': 'Postpartum Depression App',
      'badge': 'Top 25 BDApps',
      'badgeColor': 'purple',
      'desc': 'Screening tools, personalized recommendations, and emergency alert features for postpartum mental health.',
      'stack': ['Flutter', 'Firebase', 'ML'],
      'link': 'https://docs.google.com/document/d/1WRL0NtJRDQX7AUc5B_DI9SJjLYIK26c0A1Quo0BKMkE/edit?usp=sharing',
    },
    {
      'icon': '🛡',
      'title': 'Nirapod360 Safety App',
      'badge': null,
      'badgeColor': null,
      'desc': 'ML-based abnormal activity detection with real-time mobile notifications for personal safety.',
      'stack': ['Flutter', 'Flask', 'Scikit-learn'],
      'link': 'https://docs.google.com/document/d/1v4_gGpp4ZhvmI2PnpwjMQXX4zzeQMSv2Y4OxAvgyFFY/edit?usp=sharing',
    },
    {
      'icon': '🎮',
      'title': 'Fortune Game Teller',
      'badge': null,
      'badgeColor': null,
      'desc': 'Prediction app implementing OS scheduling algorithms (FCFS, Round Robin, SJF) for unique fortune logic.',
      'stack': ['Dart', 'OS Algorithms', 'Flutter'],
      'link': 'https://docs.google.com/document/d/1QAJM5Th9ZMhXttlq41zGGgs2-nVBZ1PFy6uEAHNXFmU/edit?usp=sharing',
    },
    {
      'icon': '🩸',
      'title': 'IIUC Blood Bank System',
      'badge': 'Ongoing',
      'badgeColor': 'gold',
      'desc': 'University blood bank platform connecting donors and recipients, streamlining emergency blood requests.',
      'stack': ['Flutter', 'Django', 'Firebase'],
      'link': '',
    },
    {
      'icon': '📁',
      'title': 'Personal Portfolio & Mini Apps',
      'badge': 'Open Source',
      'badgeColor': 'teal',
      'desc': 'Built To-Do App (Riverpod + Firebase), Quizard quiz app (GetX), and Facebook Clone using PHP/CSS.',
      'stack': ['Riverpod', 'GetX', 'PHP', 'CSS'],
      'link': 'https://github.com/jannat93',
    },
  ];

  static const List<Map<String, dynamic>> achievements = [
    {
      'icon': '📄',
      'title': 'IEEE Published Paper',
      'body': 'Sustainability of Jute & Tea Production in Bangladesh Using Machine Learning — IEEE QPAIN 2025',
      'url': 'https://ieeexplore.ieee.org/document/11171947',
    },
    {
      'icon': '🔬',
      'title': 'Ongoing Research',
      'body': 'Explainable Ensemble Framework for Early Detection of Postpartum Depression via Mobile Screening',
      'url': '',
    },
    {
      'icon': '🏆',
      'title': 'Top 25 — BDApps Innovation Summit',
      'body': 'Nationwide recognition for competitive mobile app development',
      'url': '',
    },
    {
      'icon': '💡',
      'title': 'Finalist — Nexgen Hackathon',
      'body': 'Innovative software solution development',
      'url': '',
    },
    {
      'icon': '🎓',
      'title': 'Finalist — IEEE 3MT (CUET/RUET)',
      'body': 'Research presentation competition — 3 Minute Thesis',
      'url': '',
    },
    {
      'icon': '🚀',
      'title': 'NASA Space Apps Challenge',
      'body': 'Participant in 2024 & 2025 — global data-driven scientific solutions',
      'url': '',
    },
    {
      'icon': '👑',
      'title': 'District Co-Leader — ICT Olympiad',
      'body': 'Leadership role in ICT Olympiad Bangladesh 2025',
      'url': '',
    },
    {
      'icon': '🌐',
      'title': 'Ambassador — ICRTCS',
      'body': 'International Conference on Recent Trends in Computer Science',
      'url': '',
    },
  ];

  static const List<Map<String, String>> education = [
    {
      'year': 'Expected 2026',
      'degree': 'B.Sc. in Computer Science & Engineering',
      'inst': 'International Islamic University Chittagong',
      'gpa': 'CGPA 3.628 / 4.00 · Last Sem 3.951',
    },
    {
      'year': 'Pre-University',
      'degree': 'HSC & SSC (Science)',
      'inst': 'Both with GPA 5.00 / 5.00',
      'gpa': 'Perfect GPA',
    },
    {
      'year': 'Certifications',
      'degree': 'Flutter & Firebase, Competitive Programming, Digital Skills',
      'inst': 'Various Institutions',
      'gpa': '',
    },
  ];
}