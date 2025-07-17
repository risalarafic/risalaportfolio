import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/education.dart';
import '../models/serviceclass.dart';
import '../models/skillIndicator.dart';


class PortfolioHomePage extends StatefulWidget {
  @override
  _PortfolioHomePageState createState() => _PortfolioHomePageState();
}

final GlobalKey _homeKey = GlobalKey();
final GlobalKey _aboutKey = GlobalKey();
final GlobalKey _skillKey = GlobalKey();
final GlobalKey _serviceKey = GlobalKey();
final GlobalKey _projectsKey = GlobalKey();
final GlobalKey _contactKey = GlobalKey();

final ScrollController _scrollController = ScrollController();
bool _showBackToTopButton = false;


class _PortfolioHomePageState extends State<PortfolioHomePage>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _slideController;
  late AnimationController _scaleController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset >= 400) {
        setState(() {
          _showBackToTopButton = true;
        });
      } else {
        setState(() {
          _showBackToTopButton = false;
        });
      }
    });
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );
    _scaleController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );

    _fadeController.forward();
    _slideController.forward();
    _scaleController.forward();
  }
  void _scrollToContact() {
    Scrollable.ensureVisible(
      _contactKey.currentContext!,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }


  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    _scaleController.dispose();
    super.dispose();
  }
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFF5F5DC),
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(
                    key: _homeKey,
                    child: _buildHeroSection(onHireMeTap: _scrollToContact),),
                Container(
                    key: _aboutKey,
                    child: _buildAboutSection()),
                MyEducationSection(),
                // _buildStatsSection(),
                Container(
                    key: _serviceKey,
                    child: _buildServicesSection()),
                Container(
                    key: _skillKey,
                    child: _buildSkillsSection()),
                Container(
                    key: _projectsKey,
                    child: _buildProjectsSection()),
                Container(
                    key: _contactKey,
                    child: _buildConnectSection())
              ],
            ),
          ),
        if (_showBackToTopButton)
    Positioned(
      bottom: 20,
      right: 20,
      child: FloatingActionButton(
        backgroundColor: Color(0xFFA89078),
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
        child: Icon(Icons.arrow_upward, color: Colors.white),
      ),)
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60), // Adjust as needed
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isSmallScreen = MediaQuery.of(context).size.width < 800;

          return AppBar(
            backgroundColor: const Color(0xFFA89078),
            elevation: 0,
            title: const Text(
              'Risala K M',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: isSmallScreen
                ? [
              Theme(
                data: Theme.of(context).copyWith(
                  popupMenuTheme: PopupMenuThemeData(
                    color: Color(0xFFF5F5DC), // 🔸 Background color
                    textStyle: TextStyle(
                      color: Colors.black, // 🔸 Text color
                      fontSize: 16,
                    ),
                  ),
                ),
                child: PopupMenuButton<String>(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onSelected: (value) {
                    switch (value) {
                      case 'Home':
                        _scrollController.animateTo(
                          0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                        break;
                      case 'About Me':
                        _scrollToSection(_aboutKey);
                        break;
                      case 'Services':
                        _scrollToSection(_serviceKey);
                        break;
                      case 'Projects':
                        _scrollToSection(_projectsKey);
                        break;
                      case 'Contact':
                        _scrollToSection(_contactKey);
                        break;
                    }
                  },
                  itemBuilder: (context) => const [
                    PopupMenuItem(value: 'Home', child: Text('Home')),
                    PopupMenuItem(value: 'About Me', child: Text('About Me')),
                    PopupMenuItem(value: 'Services', child: Text('Services')),
                    PopupMenuItem(value: 'Projects', child: Text('Projects')),
                    PopupMenuItem(value: 'Contact', child: Text('Contact')),
                  ],
                ),
              ),
            ]
                : [
              _buildNavItem('Home', () => _scrollController.animateTo(0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut)),
              _buildNavItem('About Me', () => _scrollToSection(_aboutKey)),
              _buildNavItem('Services', () => _scrollToSection(_serviceKey)),
              _buildNavItem('Projects', () => _scrollToSection(_projectsKey)),
              _buildNavItem('Contact', () => _scrollToSection(_contactKey)),
              const SizedBox(width: 20),
            ],

          );
        },
      ),
    );
  }




  Widget _buildNavItem(String title, VoidCallback onTap) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildTextSection(bool isMobile, VoidCallback onHireMeTap) {
    return SlideTransition(
      position: _slideAnimation,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Column(
          crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hello, I\'m',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: isMobile ? 18 : 24,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Risala K M',
              style: TextStyle(
                color: Colors.black,
                fontSize: isMobile ? 32 : 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Flutter Developer',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: isMobile ? 16 : 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'I specialize in creating beautiful, performant mobile applications using Flutter. With expertise in cross-platform development, I bring ideas to life through clean code and intuitive user experiences.',
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: isMobile ? 14 : 16,
                height: 1.6,
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment:
              isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                _buildAnimatedButton('Hire Me', Color(0xFFD1BFAE),
                    onTap: onHireMeTap),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async {
                    final url = Uri.parse(
                        'https://drive.google.com/file/d/1zIGtpJ7XVsaPso0M3NnfGlIVG3SpRbTc/view?usp=sharing');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url, mode: LaunchMode.externalApplication);                    }
                  },
                  child: Text(
                    "Download CV",
                    style: TextStyle(
                      color: Color(0xFFD1BFAE),
                      fontSize: isMobile ? 14 : 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Color(0xFFD1BFAE),
                    side: BorderSide(color: Color(0xFFD1BFAE), width: 2),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection(bool isMobile) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Container(
        height: isMobile ? 240 : 500,
        width: isMobile ? 240 : 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Image.asset(
            'assets/images/meNew.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }


  Widget _buildHeroSection({required VoidCallback onHireMeTap}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 700;

        return Container(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 60, vertical: isMobile ? 40 : 60),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFF5F5DC), Color(0xFFF5F5DC)],
            ),
          ),
          child: isMobile
              ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTextSection(isMobile, onHireMeTap),
              const SizedBox(height: 40),
              _buildImageSection(isMobile),
            ],
          )
              : Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: _buildTextSection(isMobile, onHireMeTap)),
              SizedBox(width: 35,),
              Expanded(child: _buildImageSection(isMobile)),
            ],
          ),
        );
      },
    );
  }

  Widget _buildAnimatedButton(String text, Color color, {required VoidCallback onTap}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }


  Widget _buildIntroText(bool isMobile) {
    return Text(
      'I\'m a passionate Flutter developer focused on creating fast, beautiful, and cross-platform mobile apps. '
          'I enjoy turning ideas into smooth, functional user experiences with clean and scalable code. '
          'A fast learner and team player, I\'m always eager to explore new technologies and grow.',
      style: TextStyle(
        color: Colors.black,
        fontSize: isMobile ? 16 : 18,
        height: 1.6,
      ),
      textAlign: isMobile ? TextAlign.center : TextAlign.start,
    );
  }

  Widget _buildInfoCard() {
    return Card(
      elevation: 4,
      color: Color(0xFFFCFCF0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("About Me", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Color(0xFFD1BFAE))),
            const SizedBox(height: 20),
            _buildRichInfo("Name: ", "Risala K M"),
            _buildRichInfo("Phone: ", "+91 8086136129"),
            _buildRichInfo("Age: ", "24 Years"),
            _buildRichInfo("Degree: ", "BTech Computer Science and Engineering"),
            _buildRichInfo("Email: ", "thathurisala@gmail.com"),
            _buildRichInfo("City: ", "Ernakulam, Kerala, India"),
          ],
        ),
      ),
    );
  }

  Widget _buildRichInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAboutSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 700;

        return Container(
          width: double.infinity, // Full screen width
          color: Color(0xFFFEFEF5),
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200), // Limit content width
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'About me',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    color: const Color(0xFFD1BFAE),
                    width: 150,
                    height: 2,
                  ),
                  const SizedBox(height: 30),
                  isMobile
                      ? Column(
                    children: [
                      _buildIntroText(isMobile),
                      const SizedBox(height: 20),
                      _buildInfoCard(),
                    ],
                  )
                      : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildIntroText(isMobile),
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildInfoCard(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }



  Widget _buildStatsSection() {
    return Container(
      padding: EdgeInsets.all(60),
      color: Color(0xFF0f3460),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildStatCard('5+', 'Years of Experience', 'Building mobile apps'),
          _buildStatCard('20+', 'Projects', 'Completed successfully'),
          _buildStatCard('15+', 'Happy Clients', 'Satisfied customers'),
          _buildStatCard('3+', 'Awards', 'Recognition received'),
        ],
      ),
    );
  }

  Widget _buildStatCard(String number, String title, String subtitle) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(
              color: Color(0xFF6c63ff),
              fontSize: 48,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 5),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 4; // Default for large screen

        if (constraints.maxWidth < 600) {
          crossAxisCount = 1; // Mobile
        } else if (constraints.maxWidth < 900) {
          crossAxisCount = 2; // Tablet
        } else if (constraints.maxWidth < 1200) {
          crossAxisCount = 3; // Small desktop
        }

        return Container(
          padding: const EdgeInsets.all(40),
          color: const Color(0xFFF5F5DC),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Services I Provide',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: constraints.maxWidth < 600 ? 24 : 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: const Color(0xFFD1BFAE),
                width: constraints.maxWidth < 600 ? 180 : 285,
                height: 2,
              ),
              const SizedBox(height: 40),
              GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                childAspectRatio: 1,
                children: [
                  ServiceCard(
                    icon: Icons.mobile_friendly,
                    title: 'Mobile App Development',
                    description:
                    'Creating cross-platform mobile applications with Flutter for iOS and Android',
                  ),
                  ServiceCard(
                    icon: Icons.web,
                    title: 'Web Development',
                    description:
                    'Building responsive web applications using Flutter Web and modern frameworks',
                  ),
                  ServiceCard(
                    icon: Icons.design_services,
                    title: 'UI/UX Design',
                    description:
                    'Designing intuitive and beautiful user interfaces with great user experience',
                  ),
                  ServiceCard(
                    icon: Icons.api,
                    title: 'API Integration',
                    description:
                    'Integrating RESTful APIs and third-party services into mobile applications',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }


  Widget _buildServiceCard(IconData icon, String title, String description) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        transform: _isHovered
            ? Matrix4.translationValues(0, -10, 0) // Move up 10px on hover
            : Matrix4.identity(),
        decoration: BoxDecoration(
          boxShadow: _isHovered
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ]
              : [],
          color: Color(0xFFFEFEF5),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color:Color(0xFFEA7435) .withOpacity(0.3)),
        ),

        child: Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: Color(0xFFEA7435),
                size: 40,
              ),
              SizedBox(height: 20),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Text(
                description,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSkillsSection() {
    return Container(
      width: double.infinity, // This makes the container span full screen width
      color: const Color(0xFFF5F5DC),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth = constraints.maxWidth;

          double spacing = maxWidth < 600 ? 20 : 40;
          double itemWidth;

          if (maxWidth >= 1200) {
            itemWidth = (maxWidth - 3 * spacing) / 4;
          } else if (maxWidth >= 900) {
            itemWidth = (maxWidth - 2 * spacing) / 3;
          } else if (maxWidth >= 600) {
            itemWidth = (maxWidth - spacing) / 2;
          } else {
            itemWidth = maxWidth;
          }

          return Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'My Skills',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: maxWidth < 600 ? 28 : 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  color: const Color(0xFFD1BFAE),
                  width: 150,
                  height: 2,
                ),
                const SizedBox(height: 40),
                Wrap(
                  spacing: spacing,
                  runSpacing: 30,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildSkillCard('Flutter', 'Proficient in developing responsive cross-platform apps using Flutter.', 0.9, itemWidth),
                    _buildSkillCard('Dart', 'Strong foundation in Dart for building clean, efficient Flutter applications.', 0.85, itemWidth),
                    _buildSkillCard('Firebase', 'Skilled in using Firebase for authentication, real-time database, and cloud functions.', 0.8, itemWidth),
                    _buildSkillCard('REST APIs', 'Experienced in integrating and handling RESTful APIs using HTTP and Dio.', 0.85, itemWidth),
                    _buildSkillCard('SQLite', 'Worked with local databases like SQLite for offline data storage.', 0.75, itemWidth),
                    _buildSkillCard('Git', 'Proficient in using Git for code versioning, branching, and team collaboration.', 0.8, itemWidth),
                    _buildSkillCard('UI/UX Design', 'Focused on building intuitive and elegant UIs using Flutter widgets.', 0.7, itemWidth),
                    _buildSkillCard('State Management', 'Experienced with GetX, Provider, and BLoC for scalable app state handling.', 0.8, itemWidth),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }


  Widget _buildSkillCard(String title, String description, double proficiency, double width) {
    return SizedBox(
      width: width,
      child: SkillIndicatorCard(
        title: title,
        description: description,
        proficiency: proficiency,
      ),
    );
  }




  Widget _buildSkillIndicatorCard(String title, String description, double proficiency) {
    return StatefulBuilder(
      builder: (context, setState) {
        bool isHovered = false;

        return MouseRegion(
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 200),
            transform: isHovered
                ? Matrix4.translationValues(0, -8, 0) // Move up 8px on hover
                : Matrix4.identity(),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: isHovered
                  ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 15,
                  offset: Offset(0, 8),
                ),
                BoxShadow(
                  color: Color(0xFFEA7435).withOpacity(0.1),
                  blurRadius: 20,
                  offset: Offset(0, 4),
                ),
              ]
                  : [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: proficiency,
                          backgroundColor: Colors.orange[100],
                          valueColor: AlwaysStoppedAnimation(Color(0xFFEA7435)),
                          minHeight: 6,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      "${(proficiency * 100).toInt()}%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildProjectsSection() {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;
        int crossAxisCount;

        if (screenWidth >= 1200) {
          crossAxisCount = 3; // Desktop
        } else if (screenWidth >= 800) {
          crossAxisCount = 2; // Tablet
        } else {
          crossAxisCount = 1; // Mobile
        }

        double aspectRatio = screenWidth < 600 ? 0.9 : 0.8;

        return Container(
          padding: const EdgeInsets.all(40),
          color: const Color(0xFFF5F5DC),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Projects',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth < 600 ? 28 : 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: const Color(0xFFD1BFAE),
                width: 130,
                height: 2,
              ),
              const SizedBox(height: 20),
              Text(
                'Check out some of my recent projects showcasing my Flutter development skills.',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: screenWidth < 600 ? 16 : 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                childAspectRatio: aspectRatio,
                children: [
                  _buildProjectCard(
                    'New Mom Helping App',
                    'A supportive app for new moms with baby care tips, feeding reminders, wellness tools, and emotional support, all in one place.',
                    Icons.shopping_cart,
                    'assets/images/app1pic.png',
                  ),
                  _buildProjectCard(
                    'GPay Clone App',
                    'A UI clone of the Google Pay application, replicating its clean design, intuitive layout, and key interface components for learning and practice.',
                    Icons.cloud,
                    'assets/images/app2pic.png',
                  ),
                  _buildProjectCard(
                    'Blood Donation App',
                    'An app that connects blood donors and recipients, making it easier to request or donate blood based on location, blood group, and availability.',
                    Icons.task_alt,
                    'assets/images/app3pic.png',
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildProjectCard(String title, String description, IconData icon, String imagepath) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFFEFEF5),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black.withOpacity(0.8),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          AspectRatio(
            aspectRatio: 4 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagepath,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  // Widget _buildProjectCard(String title, String description, IconData icon, String imagepath) {
  //   return MouseRegion(
  //     cursor: SystemMouseCursors.click,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Text(
  //           title,
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             color: Colors.black.withOpacity(0.8),
  //             fontSize: 22,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         const SizedBox(height: 20),
  //         AspectRatio(
  //           aspectRatio: 4 / 3, // Adjust as needed (e.g., 3/2 or 16/9)
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(12),
  //             child: Image.asset(
  //               imagepath,
  //               fit: BoxFit.contain, // ensures full image is shown
  //             ),
  //           ),
  //         ),
  //         const SizedBox(height: 20),
  //         Text(
  //           description,
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             color: Colors.black.withOpacity(0.6),
  //             fontSize: 16,
  //             height: 1.5,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }


  // Widget _buildProjectCard(String title, String description, IconData icon, String imagepath) {
  //   return MouseRegion(
  //     cursor: SystemMouseCursors.click,
  //     child: SizedBox(
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         children: [
  //           Text(
  //             title,
  //             style: TextStyle(
  //               color: Colors.black.withOpacity(0.8),
  //               fontSize: 22,
  //               fontWeight: FontWeight.bold,
  //             ),
  //           ),
  //           SizedBox(height: 30,),
  //           Image.asset(
  //             imagepath,
  //             fit: BoxFit.contain,
  //             height: 250, // Slightly bigger
  //             width: double.infinity, // Fill the container width
  //           ),
  //           SizedBox(height: 25,),
  //           Text(
  //             description,
  //             textAlign: TextAlign.center,
  //             style: TextStyle(
  //               color: Colors.black.withOpacity(0.6),
  //               fontSize: 16,
  //               height: 1.5,
  //             ),
  //           ),
  //         ],
  //       ),
  //     )
  //
  //   );
  // }


  Widget _buildConnectSection() {
    return Container(
      padding: EdgeInsets.all(40),
      color: Color(0xFFF5F5DC),
      child: LayoutBuilder(
        builder: (context, constraints) {
          bool isMobile = constraints.maxWidth < 600;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Connect with me',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                color: Color(0xFFD1BFAE),
                width: 260,
                height: 2,
              ),
              SizedBox(height: 20),
              Text(
                'Let\'s bring your ideas to life! Feel free to reach out for collaboration or just a friendly hello.',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              isMobile
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildContactInfo(),
                  SizedBox(height: 30),
                  _buildSocialLinks(),
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildContactInfo(),
                        SizedBox(height: 30),
                        _buildSocialLinks(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }


  Widget _buildContactForm() {
    return Column(
      children: [
        _buildTextField('Name', 'Enter your name'),
        SizedBox(height: 20),
        _buildTextField('Email', 'Enter your email'),
        SizedBox(height: 20),
        _buildTextField('Subject', 'Enter subject'),
        SizedBox(height: 20),
        _buildTextField('Message', 'Enter your message', maxLines: 4),
        SizedBox(height: 30),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF6c63ff),
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Send Message',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, String hint, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          maxLines: maxLines,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.white54),
            filled: true,
            fillColor: Color(0xFF0f3460),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xFF6c63ff)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContactInfo() {
    return Center( // This will keep it centered on all screen sizes
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 500, // Make it responsive instead of fixed width
        ),
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Color(0xFFA89078),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Color(0xFFEA7435).withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Contact Information',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25),
            _buildContactItem(
              Icons.email,
              'Email',
              'risalarafic@gmail.com',
              onTap: () async {
                final Uri emailUri = Uri(
                  scheme: 'mailto',
                  path: 'risalarafic@gmail.com',
                );
                if (await canLaunchUrl(emailUri)) {
                  await launchUrl(emailUri);
                }
              },
            ),
            SizedBox(height: 20),
            _buildContactItem(Icons.phone, 'Phone', '   +91-8086136129'),
            SizedBox(height: 20),
            _buildContactItem(Icons.location_on, 'Location', '   Ernakulam, Kerala, India'),
            SizedBox(height: 20),
            _buildContactItem(Icons.language, 'Website', '   www.risala.dev'),
          ],
        ),
      ),
    );
  }



  Widget _buildContactItem(IconData icon, String label, String value, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0), // Responsive horizontal padding
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(width: 12),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$label: ',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: value.trim(),
                      style: TextStyle(
                        color: onTap != null ? Colors.white : Colors.white,
                        decoration: onTap != null ? TextDecoration.underline : TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildSocialLinks() {
    return Container(
      width: 300,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5DC),
        borderRadius: BorderRadius.circular(15),
        // border: Border.all(color: Color(0xFFEA7435).withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Follow Me',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildSocialIcon('assets/images/githublogo.png', 'GitHub'),
              _buildSocialIcon('assets/images/linkedinlogo.png', 'LinkedIn'),
              _buildSocialIcon('assets/images/whatsapplogo.png', 'WhatsApp'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(String social, String platform) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        child: GestureDetector(
          onTap: () => _launchSocialLink(platform),
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFFFEFEF5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Color(0xFFBDA991)),
            ),
            child: Image.asset(social,height: 25,)
          ),
        ),
      ),
    );
  }

}

void _launchSocialLink(String platform) async {
  final urls = {
    'linkedin': 'https://www.linkedin.com/in/risala-km/',
    'github': 'https://github.com/risalarafic',
    'whatsapp': 'https://wa.me/918086136129',
  };

  final url = urls[platform.toLowerCase()];
  if (url != null && await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  } else {
    print('Could not launch $url');
  }
}