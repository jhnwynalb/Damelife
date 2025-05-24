
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_page.dart';
import 'community.dart';
import 'market_page.dart';
import 'map.dart';
import 'calendar.dart';
import 'announcement.dart';
import 'about_NDMU.dart';
import 'lostandfound.dart';
import 'terms_policies.dart';
import 'feedback.dart';
import 'report.dart';
import 'support.dart';
import 'help.dart';
import 'calculator.dart';
import 'games.dart';
import 'hub.dart';
import 'WelcomeScreen.dart';
import 'community_page.dart';
import 'about_DAMELIFE.dart';
import 'settings.dart';
import 'searchbar.dart';

import 'privacy.dart';

class menu extends StatefulWidget {
  const menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  bool showProfileOptions = false;
  int selectedIndex = 4;

  final List<Widget> routes = const [
    home(),
    community(),
    profile(),
    news(),
    menu(),
  ];

  final List<IconData> icons = [
    Icons.home_max_rounded,
    Icons.group_rounded,
    Icons.person_rounded,
    Icons.store_rounded,
    Icons.menu,
  ];

  void navigateToPage(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => routes[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
          toolbarHeight: 50,
          title: const Text(
            'Menu',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 24, 24, 24),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchPage()));
              },
              icon: const Icon(
                Icons.search_sharp,
                color: Color.fromARGB(255, 24, 24, 24),
                size: 25,
              ),
            ),

            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Settings()));
              },
              icon: const Icon(
                Icons.settings,
                color: Color.fromARGB(255, 24, 24, 24),
                size: 25,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 85),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 245, 245),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 138, 137, 137),
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 6.0,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage('assets/profile.jpg'),
                            radius: 30,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Juan Dela Cruz",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 32, 32, 32),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  "20230001",
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 32, 32, 32),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showProfileOptions = !showProfileOptions;
                              });
                            },
                            child: CircleAvatar(
                              radius: 18,
                              backgroundColor: const Color.fromARGB(
                                255,
                                230,
                                230,
                                230,
                              ),
                              child: AnimatedRotation(
                                turns: showProfileOptions ? 0.5 : 0,
                                duration: const Duration(milliseconds: 200),
                                child: const Icon(
                                  Icons.keyboard_arrow_up,
                                  size: 30,
                                  color: Color.fromARGB(255, 57, 56, 56),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Divider(
                        thickness: 1,
                        height: 1,
                        color: Color.fromARGB(255, 100, 100, 100),
                      ),
                      if (showProfileOptions)
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const profile(),
                                ),
                              );
                            },
                            child: Row(
                              children: const [
                                CircleAvatar(
                                  radius: 16,
                                  backgroundColor: Color.fromARGB(
                                    255,
                                    0,
                                    64,
                                    1,
                                  ),
                                  child: Icon(
                                    Icons.person,
                                    size: 25,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Text(
                                  "View my Profile",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(221, 118, 117, 117),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const MenuListWidget(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Colors.white,
        elevation: 20,
        shadowColor: const Color.fromARGB(255, 74, 74, 74),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            final isSelected = index == selectedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
                navigateToPage(index);
              },
              child: SizedBox(
                width: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 5,
                      width: 50,
                      decoration: BoxDecoration(
                        color:
                            isSelected
                                ? const Color.fromARGB(255, 0, 64, 1)
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    isSelected
                        ? ShaderMask(
                          shaderCallback:
                              (bounds) => const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 1, 135, 1),
                                  Color.fromARGB(255, 0, 64, 1),
                                  Color.fromARGB(255, 0, 34, 5),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(bounds),
                          child: Icon(
                            icons[index],
                            size: 30,
                            color: Colors.white,
                          ),
                        )
                        : Icon(
                          icons[index],
                          size: 30,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class MenuListWidget extends StatefulWidget {
  const MenuListWidget({super.key});

  @override
  State<MenuListWidget> createState() => _MenuListWidgetState();
}

class _MenuListWidgetState extends State<MenuListWidget> {
  bool seeMore = false;
  bool helpExpanded = false;
  bool settingsExpanded = false;
  bool aboutExpanded = false;
  bool acadExpanded = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> menuItems = [
      MenuItem(Icons.map, "Campus Map", () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MapPage()),
        );
      }),
      MenuItem(Icons.feed_rounded, "Campus Community", () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Community()),
        );
      }),
      MenuItem(Icons.satellite_rounded, "Lost & Found", () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Lostandfound()),
        );
      }),
      MenuItem(Icons.announcement, "Announcements", () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Announcement()),
        );
      }),
      MenuItem(Icons.calendar_month_rounded, "Academic Calendar", () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CalendarHomePage()),
        );
      }),
      MenuItem(Icons.store_rounded, "University Market", () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => news()),
        );
      }),
      MenuItem(Icons.group_rounded, "Groups", () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => community()),
        );
      }),
    ];

    return Column(
      children: [
        Column(children: seeMore ? menuItems : menuItems.take(4).toList()),
        TextButton(
          onPressed: () {
            setState(() {
              seeMore = !seeMore;
            });
          },
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15), // Rounded corners
            ),
            // Text color
          ),
          child: Ink(
            width: 350,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 1, 135, 1),
                  Color.fromARGB(255, 0, 64, 1),
                  Color.fromARGB(255, 0, 34, 5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 138, 137, 137),
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                textAlign: TextAlign.center,
                seeMore ? "See Less" : "See More",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),
        const Divider(
          indent: 15,
          endIndent: 15,
          height: 3,
          color: Color.fromARGB(255, 217, 213, 213),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              acadExpanded = !acadExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: const Icon(
                Icons.bookmark,
                color: Color.fromARGB(255, 24, 24, 24),
                size: 30,
              ),
              title: const Text(
                "Academics & Recreational",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 24, 24, 24),
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: AnimatedRotation(
                turns: acadExpanded ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Color.fromARGB(255, 57, 56, 56),
                ),
              ),
            ),
          ),
        ),
        if (acadExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Hub()),
                );
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 245, 245),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 138, 137, 137),
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 15),
                    Icon(
                      Icons.library_books_rounded,
                      color: Color.fromARGB(255, 81, 81, 81),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'E-Materials Hub',
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 30, 30),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        if (acadExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Calculator()),
                );
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 245, 245),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 138, 137, 137),
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 15),
                    Icon(
                      Icons.calculate_rounded,
                      color: Color.fromARGB(255, 81, 81, 81),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'GPA Calculator',
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 30, 30),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (acadExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Games()),
                );
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 245, 245),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 138, 137, 137),
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 15),
                    Icon(
                      Icons.games_rounded,
                      color: Color.fromARGB(255, 81, 81, 81),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Games',
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 30, 30),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        const Divider(
          indent: 15,
          endIndent: 15,
          height: 3,
          thickness: 1,
          color: Color.fromARGB(255, 217, 213, 213),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              helpExpanded = !helpExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: const Icon(
                Icons.support,
                color: Color.fromARGB(255, 24, 24, 24),
                size: 30,
              ),
              title: const Text(
                "Help & Support",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 24, 24, 24),
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: AnimatedRotation(
                turns: helpExpanded ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Color.fromARGB(255, 57, 56, 56),
                ),
              ),
            ),
          ),
        ),
        if (helpExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Help()),
                );
              },

              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 1, 135, 1),
                      Color.fromARGB(255, 0, 64, 1),
                      Color.fromARGB(255, 0, 34, 5),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 138, 137, 137),
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.headset_mic,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Feel Free to Ask for Help',
                      style: TextStyle(
                        color: Color.fromARGB(255, 254, 254, 254),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (helpExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FeedbackPage()),
                );
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 245, 245),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 138, 137, 137),
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 15),
                    Icon(Icons.message, color: Color.fromARGB(255, 81, 81, 81)),
                    SizedBox(width: 15),
                    Text(
                      'Feedback',
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 30, 30),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        if (helpExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SupportPage()),
                );
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 245, 245),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 138, 137, 137),
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 15),
                    Icon(
                      Icons.inbox_rounded,
                      color: Color.fromARGB(255, 81, 81, 81),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Support Inbox',
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 30, 30),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (helpExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ReportPage()),
                );
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 245, 245),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 138, 137, 137),
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 15),
                    Icon(
                      Icons.warning_rounded,
                      color: Color.fromARGB(255, 81, 81, 81),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Report a Problem',
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 30, 30),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        const Divider(
          indent: 15,
          endIndent: 15,
          height: 3,
          thickness: 1,
          color: Color.fromARGB(255, 217, 213, 213),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              settingsExpanded = !settingsExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: const Icon(
                Icons.settings,
                color: Color.fromARGB(255, 24, 24, 24),
                size: 30,
              ),
              title: const Text(
                "Settings & Privacy",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 24, 24, 24),
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: AnimatedRotation(
                turns: settingsExpanded ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Color.fromARGB(255, 57, 56, 56),
                ),
              ),
            ),
          ),
        ),
        if (settingsExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 245, 245),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 138, 137, 137),
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 15),
                    Icon(
                      Icons.settings,
                      color: Color.fromARGB(255, 81, 81, 81),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'Settings',
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 30, 30),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (settingsExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrivacySettingsPage(),
                  ),
                );
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 245, 245),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 138, 137, 137),
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 15),
                    Icon(Icons.lock, color: Color.fromARGB(255, 81, 81, 81)),
                    SizedBox(width: 15),
                    Text(
                      'Privacy',
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 30, 30),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        const Divider(
          indent: 15,
          endIndent: 15,
          height: 3,
          thickness: 1,
          color: Color.fromARGB(255, 217, 213, 213),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              aboutExpanded = !aboutExpanded;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: const Icon(
                Icons.question_mark_outlined,
                color: Color.fromARGB(255, 24, 24, 24),
                size: 30,
              ),
              title: const Text(
                "About",
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 24, 24, 24),
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: AnimatedRotation(
                turns: aboutExpanded ? 0.5 : 0,
                duration: const Duration(milliseconds: 200),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Color.fromARGB(255, 57, 56, 56),
                ),
              ),
            ),
          ),
        ),
        if (aboutExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const aboutdamelife(),
                  ),
                );
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 245, 245),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 138, 137, 137),
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 15),
                    Icon(
                      Icons.bookmark,
                      color: Color.fromARGB(255, 81, 81, 81),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'About Damelife',
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 30, 30),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        if (aboutExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const aboutNdmu()),
                );
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 245, 245),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 138, 137, 137),
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 15),
                    Icon(
                      Icons.school_rounded,
                      color: Color.fromARGB(255, 81, 81, 81),
                    ),
                    SizedBox(width: 15),
                    Text(
                      'About NDMU',
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 30, 30),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        if (aboutExpanded)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const terms()),
                );
              },
              child: Container(
                height: 50,
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 246, 245, 245),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 138, 137, 137),
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 15),
                    Icon(Icons.book, color: Color.fromARGB(255, 81, 81, 81)),
                    SizedBox(width: 15),
                    Text(
                      'Terms & Policies',
                      style: TextStyle(
                        color: Color.fromARGB(255, 30, 30, 30),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        const Divider(
          indent: 15,
          endIndent: 15,
          height: 3,
          thickness: 1,
          color: Color.fromARGB(255, 217, 213, 213),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Welcomescreen()),
            );
          },
          child: Container(
            height: 40,
            width: 340,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 1, 135, 1),
                  Color.fromARGB(255, 0, 64, 1),
                  Color.fromARGB(255, 0, 34, 5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 138, 137, 137),
                  blurRadius: 2,
                  offset: const Offset(0, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SIGN OUT',
                  style: TextStyle(
                    color: Color.fromARGB(255, 254, 254, 254),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

Widget MenuItem(IconData icon, String title, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 246, 245, 245),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 138, 137, 137),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [
                Color.fromARGB(255, 1, 135, 1),
                Color.fromARGB(255, 0, 64, 1),
                Color.fromARGB(255, 0, 34, 5),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          child: Icon(icon, size: 30, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 32, 32, 32),
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onTap,
      ),
    ),
  );
}
