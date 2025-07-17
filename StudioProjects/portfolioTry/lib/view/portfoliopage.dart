import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioPage extends StatefulWidget {
  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Attach key to scaffold
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.grey[900]),
              child: Text(
                'Risala K M',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            NavDrawerItem(title: 'Home'),
            NavDrawerItem(title: 'About'),
            NavDrawerItem(title: 'Skills'),
            NavDrawerItem(title: 'Project'),
            NavDrawerItem(title: 'Contact'),
          ],
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth < 600) {
              return PreferredSize(
                preferredSize: Size.fromHeight(150),
                child: Container(
                  height: 100,
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left side: Logo + Menu button
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.menu, color: Colors.grey[500]),
                              onPressed: () {
                                _scaffoldKey.currentState?.openDrawer(); // Open drawer
                              },
                            ),
                          ],
                        ),

                        // Right side: Download Button
                        ElevatedButton(
                          onPressed: () async {
                            final url = Uri.parse('https://drive.google.com/file/d/1Je7zZ6vH91fYBQHK6qkrliV3wh3mRzjE/view?usp=sharing');
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url, mode: LaunchMode.externalApplication);
                            }
                          },
                          child: Text("Download CV"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.grey[500],
                            side: BorderSide(color: Colors.grey, width: 2),
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
            else {
              // Large screen AppBar
              return AppBar(
                backgroundColor: Colors.black,
                // leading: Padding(
                //   padding: const EdgeInsets.only(left: 16.0),
                //   child: Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text(
                //       "R.",
                //       style: TextStyle(
                //         color: Colors.grey[500],
                //         fontSize: 30,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    NavItem(title: "Home"),
                    NavItem(title: "About"),
                    NavItem(title: "Skills"),
                    NavItem(title: "Project"),
                    NavItem(title: "Contact"),
                  ],
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        final url = Uri.parse('https://drive.google.com/file/d/1Je7zZ6vH91fYBQHK6qkrliV3wh3mRzjE/view?usp=sharing');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url, mode: LaunchMode.externalApplication);
                        }
                      },
                      child: Text("Download CV"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.grey[500],
                        side: BorderSide(color: Colors.grey, width: 2),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        textStyle: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 600, color: Colors.amber, child: Center(child: Text('Home Section'))),
            Container(height: 600, color: Colors.teal, child: Center(child: Text('About Section'))),
            Container(height: 600, color: Colors.pinkAccent, child: Center(child: Text('Projects Section'))),
            Container(height: 600, color: Colors.deepPurple, child: Center(child: Text('Contact Section'))),
          ],
        ),
      ),
    );
  }
}

class NavDrawerItem extends StatelessWidget {
  final String title;
  const NavDrawerItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
      onTap: () {
        // Close drawer and maybe scroll to section
        Navigator.pop(context);
      },
    );
  }
}



class NavItem extends StatelessWidget {
  final String title;
  const NavItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey[400],
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
