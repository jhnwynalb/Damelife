import 'package:damelife_sample2/searchbar.dart';
import 'package:damelife_sample2/settings.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_page.dart';
import 'market_page.dart';
import 'menu_page.dart';

class community extends StatefulWidget {
  const community({super.key});

  @override
  State<community> createState() => _communityState();
}

class _communityState extends State<community> {
  int selectedTab = 0;

  final List<Widget> routes = const [
    home(),
    community(),
    profile(),
    news(),
    menu(),
  ];
  int selectedIndex = 1;
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
      backgroundColor: Colors.white,
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
            'Groups',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 24, 24, 24),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Color.fromARGB(255, 24, 24, 24),
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
              icon: const Icon(
                Icons.search_sharp,
                color: Color.fromARGB(255, 24, 24, 24),
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
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
      body: Column(
        
        children: [
          const SizedBox(height: 90), 
          Container(
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedTab = 0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'Your Groups',
                            style: TextStyle(
                              color: selectedTab == 0
                                  ? Color.fromARGB(255, 0, 64, 1)
                                  : Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          height: 4,
                          color: selectedTab == 0
                              ? Color.fromARGB(255, 0, 64, 1)
                              : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => selectedTab = 1),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Text(
                            'University Groups',
                            style: TextStyle(
                              color: selectedTab == 1
                                  ? Color.fromARGB(255, 0, 64, 1)
                                  : Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          height: 4,
                          color: selectedTab == 1
                              ? Color.fromARGB(255, 0, 64, 1)
                              : Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: Text(
                  'No existing group at the moment',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
              ),
            ),
          ),
        ],
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
                        color: isSelected
                            ? const Color.fromARGB(255, 0, 64, 1)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    isSelected
                        ? ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
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
