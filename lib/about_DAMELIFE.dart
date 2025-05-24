import 'package:flutter/material.dart';
import 'menu_page.dart';

class aboutdamelife extends StatefulWidget {
  const aboutdamelife({super.key});

  @override
  State<aboutdamelife> createState() => _aboutdamelifeState();
}

class _aboutdamelifeState extends State<aboutdamelife> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, MaterialPageRoute(builder: (context)=> menu()),);
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
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
                  color: Colors.grey,
                  blurRadius: 2,
                  offset: Offset(0, 2),
                ),
              ],
            ),
          ),
          toolbarHeight: 50,
          title: const Text(
            'About Damelife',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: (){},
              icon: const Icon(
                Icons.search_sharp,
                color: Colors.white,
                size: 25,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(20,85, 20,0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Center(
                child: Text(
                  'DAMELIFE',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 80, 0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  '"Connects you Everything with NDMU"',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                  ),
                ),
              ),
              Divider(height: 40, thickness: 1),
              Text(
                'Welcome to Damelife — your ultimate student companion at Notre Dame of Marbel University (NDMU).',
                style: TextStyle(fontSize: 16, height: 1.5),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Damelife is built to bring together everything you need for your university journey. Whether it’s important announcements, academic resources, student communities, campus services, or everyday tools — Damelife connects it all in one easy-to-use app.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                'With Damelife, you can:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '• Stay updated with campus news and events\n'
                '• Access academic calendars, maps, and schedules\n'
                '• Connect with clubs, organizations, and fellow students\n'
                '• Explore campus facilities and services\n'
                '• Buy, sell, or exchange items in the marketplace\n'
                '• Get support through feedback and help centers\n'
                '• Customize your experience with personal settings and notifications',
                style: TextStyle(fontSize: 16, height: 1.7),
              ),
              SizedBox(height: 20),
              Text(
                'Our Mission:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'To empower NDMU students by creating a smarter, smoother, and more connected campus life through technology.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                'Why Damelife?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Because your university life should be organized, efficient, and vibrant. We built Damelife to help you spend less time searching and more time experiencing the best of NDMU.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  'Your life at NDMU — simplified, connected, and reimagined with Damelife.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
