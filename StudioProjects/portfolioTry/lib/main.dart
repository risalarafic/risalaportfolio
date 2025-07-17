import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfoliotry/view/portfoliopage.dart';
import 'package:portfoliotry/view/try.dart';

void main() {
  runApp(PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PortfolioHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
//
// class PortfolioHomePage extends StatefulWidget {
//   @override
//   _PortfolioHomePageState createState() => _PortfolioHomePageState();
// }
//
// class _PortfolioHomePageState extends State<PortfolioHomePage>
//     with TickerProviderStateMixin {
//   late AnimationController _heroController;
//   late AnimationController _servicesController;
//   late AnimationController _skillsController;
//   late AnimationController _portfolioController;
//
//   late Animation<double> _heroAnimation;
//   late Animation<double> _servicesAnimation;
//   late Animation<double> _skillsAnimation;
//   late Animation<double> _portfolioAnimation;
//
//   final ScrollController _scrollController = ScrollController();
//   bool _isMenuOpen = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     _heroController = AnimationController(
//       duration: Duration(milliseconds: 1000),
//       vsync: this,
//     );
//     _servicesController = AnimationController(
//       duration: Duration(milliseconds: 800),
//       vsync: this,
//     );
//     _skillsController = AnimationController(
//       duration: Duration(milliseconds: 1200),
//       vsync: this,
//     );
//     _portfolioController = AnimationController(
//       duration: Duration(milliseconds: 1000),
//       vsync: this,
//     );
//
//     _heroAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _heroController, curve: Curves.easeInOut),
//     );
//     _servicesAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _servicesController, curve: Curves.easeInOut),
//     );
//     _skillsAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _skillsController, curve: Curves.easeInOut),
//     );
//     _portfolioAnimation = Tween<double>(begin: 0, end: 1).animate(
//       CurvedAnimation(parent: _portfolioController, curve: Curves.easeInOut),
//     );
//
//     _heroController.forward();
//
//     _scrollController.addListener(_onScroll);
//   }
//
//   void _onScroll() {
//     final offset = _scrollController.offset;
//
//     if (offset > 200 && !_servicesController.isAnimating && _servicesController.value == 0) {
//       _servicesController.forward();
//     }
//     if (offset > 600 && !_skillsController.isAnimating && _skillsController.value == 0) {
//       _skillsController.forward();
//     }
//     if (offset > 1000 && !_portfolioController.isAnimating && _portfolioController.value == 0) {
//       _portfolioController.forward();
//     }
//   }
//
//   @override
//   void dispose() {
//     _heroController.dispose();
//     _servicesController.dispose();
//     _skillsController.dispose();
//     _portfolioController.dispose();
//     _scrollController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               Color(0xFF1F2937),
//               Color(0xFF7C3AED),
//               Color(0xFF1F2937),
//             ],
//           ),
//         ),
//         child: Column(
//           children: [
//             _buildAppBar(),
//             Expanded(
//               child: SingleChildScrollView(
//                 controller: _scrollController,
//                 child: Column(
//                   children: [
//                     _buildHeroSection(),
//                     _buildServicesSection(),
//                     _buildSkillsSection(),
//                     _buildPortfolioSection(),
//                     _buildContactSection(),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildAppBar() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//       decoration: BoxDecoration(
//         color: Color(0xFF1F2937).withOpacity(0.9),
//         border: Border(
//           bottom: BorderSide(color: Colors.purple.withOpacity(0.2)),
//         ),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             'RISALA RAFIC',
//             style: TextStyle(
//               color: Color(0xFFA855F7),
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           if (MediaQuery.of(context).size.width > 768)
//             Row(
//               children: [
//                 _navItem('SERVICES'),
//                 SizedBox(width: 30),
//                 _navItem('TECHNOLOGIES'),
//                 SizedBox(width: 30),
//                 _navItem('PORTFOLIO'),
//                 SizedBox(width: 30),
//                 _navItem('CONTACT'),
//               ],
//             )
//           else
//             IconButton(
//               icon: Icon(_isMenuOpen ? Icons.close : Icons.menu, color: Colors.white),
//               onPressed: () => setState(() => _isMenuOpen = !_isMenuOpen),
//             ),
//         ],
//       ),
//     );
//   }
//
//   Widget _navItem(String text) {
//     return InkWell(
//       onTap: () {},
//       child: Text(
//         text,
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeroSection() {
//     return AnimatedBuilder(
//       animation: _heroAnimation,
//       builder: (context, child) {
//         return Transform.translate(
//           offset: Offset(0, 50 * (1 - _heroAnimation.value)),
//           child: Opacity(
//             opacity: _heroAnimation.value,
//             child: Container(
//               padding: EdgeInsets.all(40),
//               child: LayoutBuilder(
//                 builder: (context, constraints) {
//                   bool isMobile = constraints.maxWidth < 768;
//                   return Column(
//                     children: [
//                       if (isMobile) ...[
//                         _buildHeroImage(),
//                         SizedBox(height: 30),
//                         _buildHeroText(),
//                       ] else
//                         Row(
//                           children: [
//                             Expanded(child: _buildHeroText()),
//                             SizedBox(width: 50),
//                             Expanded(child: _buildHeroImage()),
//                           ],
//                         ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildHeroText() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         RichText(
//           text: TextSpan(
//             style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, height: 1.1),
//             children: [
//               TextSpan(text: 'FLUTTER\n', style: TextStyle(color: Color(0xFFA855F7))),
//               TextSpan(text: 'DEVELOPER', style: TextStyle(color: Colors.white)),
//             ],
//           ),
//         ),
//         SizedBox(height: 20),
//         Text(
//           'I am Risala, a Flutter developer with a passion for creating beautiful and responsive android apps. I specialize in modern web technologies and mobile app development.',
//           style: TextStyle(
//             color: Colors.grey[300],
//             fontSize: 16,
//             height: 1.6,
//           ),
//         ),
//         SizedBox(height: 30),
//         ElevatedButton(
//           onPressed: () {},
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Color(0xFF7C3AED),
//             padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
//           ),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text('VIEW MORE', style: TextStyle(color: Colors.white)),
//               SizedBox(width: 10),
//               Icon(Icons.arrow_forward, color: Colors.white, size: 18),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildHeroImage() {
//     return Container(
//       width: 300,
//       height: 380,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         gradient: LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [Color(0xFF7C3AED), Color(0xFFEC4899)],
//         ),
//       ),
//       child: Container(
//         margin: EdgeInsets.all(15),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Color(0xFF374151),
//         ),
//         child: Center(
//           child: Container(
//             width: 120,
//             height: 120,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               color: Color(0xFF7C3AED),
//             ),
//             child: Icon(Icons.person, size: 60, color: Colors.white),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildServicesSection() {
//     final services = [
//       {
//         'icon': Icons.web,
//         'title': 'Website Development',
//         'description': 'I create modern, responsive websites using the latest technologies. Whether it\'s a simple landing page or a complex web application, I ensure your site looks great and works perfectly on all devices.'
//       },
//       {
//         'icon': Icons.design_services,
//         'title': 'Web Design',
//         'description': 'I design beautiful and intuitive user interfaces that provide excellent user experience. From wireframes to final designs, I create visually appealing websites that engage your audience.'
//       },
//       {
//         'icon': Icons.article,
//         'title': 'WordPress Development',
//         'description': 'I specialize in WordPress development, creating custom themes and plugins. I can transform your design into a fully functional WordPress site with easy content management.'
//       },
//     ];
//
//     return AnimatedBuilder(
//       animation: _servicesAnimation,
//       builder: (context, child) {
//         return Container(
//           padding: EdgeInsets.all(40),
//           child: Column(
//             children: [
//               Text(
//                 'MY SERVICES',
//                 style: TextStyle(
//                   color: Color(0xFFA855F7),
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 50),
//               LayoutBuilder(
//                 builder: (context, constraints) {
//                   int crossAxisCount = constraints.maxWidth > 900 ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
//                   return GridView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: crossAxisCount,
//                       childAspectRatio: 0.8,
//                       crossAxisSpacing: 20,
//                       mainAxisSpacing: 20,
//                     ),
//                     itemCount: services.length,
//                     itemBuilder: (context, index) {
//                       return Transform.translate(
//                         offset: Offset(0, 50 * (1 - _servicesAnimation.value)),
//                         child: Opacity(
//                           opacity: _servicesAnimation.value,
//                           child: Container(
//                             padding: EdgeInsets.all(25),
//                             decoration: BoxDecoration(
//                               color: Color(0xFF374151).withOpacity(0.5),
//                               borderRadius: BorderRadius.circular(15),
//                               border: Border.all(color: Colors.purple.withOpacity(0.2)),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Icon(
//                                   services[index]['icon'] as IconData,
//                                   size: 40,
//                                   color: Color(0xFFA855F7),
//                                 ),
//                                 SizedBox(height: 20),
//                                 Text(
//                                   services[index]['title'] as String,
//                                   style: TextStyle(
//                                     color: Color(0xFFA855F7),
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 SizedBox(height: 15),
//                                 Expanded(
//                                   child: Text(
//                                     services[index]['description'] as String,
//                                     style: TextStyle(
//                                       color: Colors.grey[300],
//                                       fontSize: 14,
//                                       height: 1.5,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildSkillsSection() {
//     final skills = [
//       {'name': 'HTML5', 'color': Colors.orange},
//       {'name': 'CSS3', 'color': Colors.blue},
//       {'name': 'JavaScript', 'color': Colors.yellow},
//       {'name': 'Flutter', 'color': Colors.lightBlue},
//       {'name': 'Figma', 'color': Colors.purple},
//       {'name': 'React', 'color': Colors.cyan},
//       {'name': 'Node.js', 'color': Colors.green},
//       {'name': 'Git', 'color': Colors.red},
//       {'name': 'WordPress', 'color': Colors.indigo},
//       {'name': 'PHP', 'color': Colors.deepPurple},
//     ];
//
//     return AnimatedBuilder(
//       animation: _skillsAnimation,
//       builder: (context, child) {
//         return Container(
//           padding: EdgeInsets.all(40),
//           child: Column(
//             children: [
//               Text(
//                 'SKILLS',
//                 style: TextStyle(
//                   color: Color(0xFFA855F7),
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'The skills, tools and technologies I use:',
//                 style: TextStyle(
//                   color: Colors.grey[300],
//                   fontSize: 16,
//                 ),
//               ),
//               SizedBox(height: 40),
//               LayoutBuilder(
//                 builder: (context, constraints) {
//                   int crossAxisCount = constraints.maxWidth > 900 ? 5 : (constraints.maxWidth > 600 ? 3 : 2);
//                   return GridView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: crossAxisCount,
//                       childAspectRatio: 1,
//                       crossAxisSpacing: 15,
//                       mainAxisSpacing: 15,
//                     ),
//                     itemCount: skills.length,
//                     itemBuilder: (context, index) {
//                       return AnimatedContainer(
//                         duration: Duration(milliseconds: 300 + (index * 100)),
//                         transform: Matrix4.identity()
//                           ..translate(0.0, 30 * (1 - _skillsAnimation.value)),
//                         child: Opacity(
//                           opacity: _skillsAnimation.value,
//                           child: Container(
//                             padding: EdgeInsets.all(20),
//                             decoration: BoxDecoration(
//                               color: Color(0xFF374151).withOpacity(0.5),
//                               borderRadius: BorderRadius.circular(15),
//                               border: Border.all(color: Colors.purple.withOpacity(0.2)),
//                             ),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   width: 50,
//                                   height: 50,
//                                   decoration: BoxDecoration(
//                                     color: skills[index]['color'] as Color,
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                   child: Icon(
//                                     Icons.code,
//                                     color: Colors.white,
//                                     size: 24,
//                                   ),
//                                 ),
//                                 SizedBox(height: 10),
//                                 Text(
//                                   skills[index]['name'] as String,
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildPortfolioSection() {
//     final projects = [
//       {'title': 'E-Commerce Website', 'category': 'Website Coding', 'tech': 'HTML, CSS, JS'},
//       {'title': 'Restaurant App', 'category': 'Mobile Development', 'tech': 'Flutter, Dart'},
//       {'title': 'Portfolio Website', 'category': 'Website Coding', 'tech': 'React, Tailwind'},
//       {'title': 'Google Pay Clone', 'category': 'Mobile Development', 'tech': 'Flutter, Firebase'},
//       {'title': 'Travel Blog', 'category': 'Website Coding', 'tech': 'WordPress, PHP'},
//       {'title': 'Task Manager', 'category': 'Web Application', 'tech': 'React, Node.js'},
//     ];
//
//     return AnimatedBuilder(
//       animation: _portfolioAnimation,
//       builder: (context, child) {
//         return Container(
//           padding: EdgeInsets.all(40),
//           child: Column(
//             children: [
//               Text(
//                 'PORTFOLIO',
//                 style: TextStyle(
//                   color: Color(0xFFA855F7),
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 50),
//               LayoutBuilder(
//                 builder: (context, constraints) {
//                   int crossAxisCount = constraints.maxWidth > 900 ? 3 : (constraints.maxWidth > 600 ? 2 : 1);
//                   return GridView.builder(
//                     shrinkWrap: true,
//                     physics: NeverScrollableScrollPhysics(),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: crossAxisCount,
//                       childAspectRatio: 0.75,
//                       crossAxisSpacing: 20,
//                       mainAxisSpacing: 20,
//                     ),
//                     itemCount: projects.length,
//                     itemBuilder: (context, index) {
//                       return AnimatedContainer(
//                         duration: Duration(milliseconds: 300 + (index * 150)),
//                         transform: Matrix4.identity()
//                           ..translate(0.0, 50 * (1 - _portfolioAnimation.value)),
//                         child: Opacity(
//                           opacity: _portfolioAnimation.value,
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: Color(0xFF374151).withOpacity(0.5),
//                               borderRadius: BorderRadius.circular(15),
//                               border: Border.all(color: Colors.purple.withOpacity(0.2)),
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                   flex: 3,
//                                   child: Container(
//                                     width: double.infinity,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
//                                       gradient: LinearGradient(
//                                         colors: [Color(0xFF7C3AED), Color(0xFFEC4899)],
//                                       ),
//                                     ),
//                                     child: Container(
//                                       margin: EdgeInsets.all(15),
//                                       decoration: BoxDecoration(
//                                         borderRadius: BorderRadius.circular(10),
//                                         color: Color(0xFF4B5563),
//                                       ),
//                                       child: Center(
//                                         child: Icon(
//                                           Icons.rocket_launch,
//                                           size: 40,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Expanded(
//                                   flex: 2,
//                                   child: Padding(
//                                     padding: EdgeInsets.all(20),
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           projects[index]['title']!,
//                                           style: TextStyle(
//                                             color: Colors.white,
//                                             fontSize: 16,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         SizedBox(height: 5),
//                                         Text(
//                                           projects[index]['category']!,
//                                           style: TextStyle(
//                                             color: Color(0xFFA855F7),
//                                             fontSize: 12,
//                                           ),
//                                         ),
//                                         SizedBox(height: 5),
//                                         Text(
//                                           projects[index]['tech']!,
//                                           style: TextStyle(
//                                             color: Colors.grey[400],
//                                             fontSize: 11,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildContactSection() {
//     return Container(
//       padding: EdgeInsets.all(40),
//       child: LayoutBuilder(
//         builder: (context, constraints) {
//           bool isMobile = constraints.maxWidth < 768;
//           return Column(
//             children: [
//               if (isMobile) ...[
//                 _buildContactInfo(),
//                 SizedBox(height: 30),
//                 _buildContactForm(),
//               ] else
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(child: _buildContactInfo()),
//                     SizedBox(width: 50),
//                     Expanded(child: _buildContactForm()),
//                   ],
//                 ),
//             ],
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildContactInfo() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'DO YOU HAVE A PROJECT TO DISCUSS?',
//           style: TextStyle(
//             color: Color(0xFFA855F7),
//             fontSize: 28,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 20),
//         Text(
//           'GET IN TOUCH 📧',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 22,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 30),
//         Text(
//           'CONTACT:',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 5),
//         Text(
//           'risalarafic@gmail.com',
//           style: TextStyle(
//             color: Colors.grey[300],
//             fontSize: 14,
//           ),
//         ),
//         SizedBox(height: 20),
//         Text(
//           'SOCIAL MEDIA:',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 10),
//         Row(
//           children: [
//             _socialIcon(Icons.code),
//             SizedBox(width: 15),
//             _socialIcon(Icons.work),
//             SizedBox(width: 15),
//             _socialIcon(Icons.alternate_email),
//             SizedBox(width: 15),
//             _socialIcon(Icons.chat),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _socialIcon(IconData icon) {
//     return Container(
//       width: 40,
//       height: 40,
//       decoration: BoxDecoration(
//         color: Color(0xFF374151),
//         shape: BoxShape.circle,
//       ),
//       child: Icon(icon, color: Colors.white, size: 20),
//     );
//   }
//
//   Widget _buildContactForm() {
//     return Container(
//       padding: EdgeInsets.all(30),
//       decoration: BoxDecoration(
//         color: Color(0xFF374151).withOpacity(0.5),
//         borderRadius: BorderRadius.circular(15),
//         border: Border.all(color: Colors.purple.withOpacity(0.2)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'CONTACT FORM',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 25),
//           _buildTextField('Name', 'Your name'),
//           SizedBox(height: 20),
//           _buildTextField('Email', 'your.email@example.com'),
//           SizedBox(height: 20),
//           _buildTextField('Message', 'Your message here...', maxLines: 4),
//           SizedBox(height: 25),
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Message sent! (Demo only)')),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFF7C3AED),
//                 padding: EdgeInsets.symmetric(vertical: 15),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//               ),
//               child: Text(
//                 'SEND',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTextField(String label, String hint, {int maxLines = 1}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         SizedBox(height: 8),
//         TextField(
//           maxLines: maxLines,
//           style: TextStyle(color: Colors.white),
//           decoration: InputDecoration(
//             hintText: hint,
//             hintStyle: TextStyle(color: Colors.grey[400]),
//             filled: true,
//             fillColor: Color(0xFF4B5563),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Colors.grey[600]!),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(8),
//               borderSide: BorderSide(color: Color(0xFF7C3AED)),
//             ),
//             contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
//           ),
//         ),
//       ],
//     );
//   }
// }