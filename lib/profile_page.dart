import 'package:damelife_sample2/postform.dart';
import 'package:damelife_sample2/searchbar.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'community_page.dart';
import 'market_page.dart';
import 'menu_page.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  final List<Widget> routes = const [
    home(),
    community(),
    profile(),
    news(),
    menu(),
  ];
  int selectedIndex = 2;
  bool showPosts = true; // For toggling Posts and Reposts
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
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
          title: const Text(
            'Profile',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 24, 24, 24),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchPage()));},
              icon: const Icon(
                Icons.search_sharp,
                color: Color.fromARGB(255, 24, 24, 24),
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person,
                color: Color.fromARGB(255, 24, 24, 24),
                size: 25,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  // Cover photo with tap to view
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder:
                            (_) => Dialog(
                              child: Image.asset(
                                'assets/cover.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                      );
                    },
                    child: Container(
                      height: 160,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/cover.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  // Camera icon on the cover photo (top-right)
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  // Profile photo with tap to view
                  Positioned(
                    bottom: -60,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder:
                              (_) => Dialog(
                                child: Image.asset(
                                  'assets/profile.jpg',
                                  fit: BoxFit.contain,
                                ),
                              ),
                        );
                      },
                      child: CircleAvatar(
                        radius: 85,
                        backgroundColor: Colors.white,
                        child: const CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage('assets/profile.jpg'),
                        ),
                      ),
                    ),
                  ),

                  // Camera icon on the profile photo (bottom-right)
                  Positioned(
                    bottom: -45,
                    right: MediaQuery.of(context).size.width / 2 - 65 + 100,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 60),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Juan Dela Cruz',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '20230001',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Tatak Marista',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Text(
                      'Computer Engr.',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PostForm()),
                        );
                      },
                      icon: const Icon(Icons.add, color: Colors.white),
                      label: const Text(
                        'Add Post',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 81, 0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                        color: Color.fromARGB(255, 31, 31, 31),
                      ),
                      label: const Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Color.fromARGB(255, 31, 31, 31),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          233,
                          233,
                          233,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 30, thickness: 3),

              // Information section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.school,
                          color: Color.fromARGB(255, 29, 29, 29),
                        ),
                        SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            'College of Engineering, Architecture, and Computing',
                            style: TextStyle(fontSize: 15),
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.laptop_chromebook,
                          color: Color.fromARGB(255, 29, 29, 29),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'BS Computer Engineering',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.date_range,
                          color: Color.fromARGB(255, 29, 29, 29),
                        ),
                        SizedBox(width: 8),
                        Text('May 123, 1009', style: TextStyle(fontSize: 15)),
                      ],
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),

              // Edit Info and Friends
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        label: const Text(
                          'Edit public info',
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 81, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(
                            MediaQuery.of(context).size.width * 0.9,
                            10,
                          ),
                          backgroundColor: const Color.fromARGB(
                            255,
                            243,
                            243,
                            243,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Friends',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('No friends to show', textAlign: TextAlign.center),
                  ],
                ),
              ),

              const Divider(thickness: 1),

              // Posts & Reposts Toggle Buttons (Moved Here)
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() => showPosts = true);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          243,
                          243,
                          243,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        elevation:
                            showPosts
                                ? 5
                                : 0, // Elevate when selected (showPosts == true)
                      ),
                      child: const Text(
                        'Posts',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 81, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        setState(() => showPosts = false);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(
                          255,
                          243,
                          243,
                          243,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                        elevation:
                            !showPosts
                                ? 5
                                : 0, // Elevate when selected (showPosts == false)
                      ),
                      child: const Text(
                        'Reposts',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 81, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(thickness: 1),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          showPosts ? 'Posts' : 'Reposts',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (showPosts) ...[
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PostForm(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                const CircleAvatar(
                                  backgroundImage: AssetImage(
                                    'assets/profile.jpg',
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Expanded(
                                  child: Text(
                                    'Write something to post...',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Icon(
                                  Icons.post_add_rounded,
                                  size: 30,
                                  color: Color.fromARGB(255, 0, 81, 0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (showPosts) const Divider(thickness: 3, height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[100],
                      ),
                      child: Center(
                        child: Text(
                          showPosts ? 'No Posts Yet' : 'No Reposts Yet',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
