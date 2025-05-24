import 'package:flutter/material.dart';
import 'menu_page.dart'; // Make sure this imports your menu page

enum AnnouncementSection { overall, college }

class Announcement extends StatefulWidget {
  const Announcement({super.key});

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  AnnouncementSection _selectedSection = AnnouncementSection.overall;

 Widget _buildSectionSelector(String title, AnnouncementSection section) {
  bool isSelected = _selectedSection == section;
  return Expanded(
    child: GestureDetector(
      onTap: () {
        setState(() {
          _selectedSection = section;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4), // Smaller padding
        decoration: BoxDecoration(
          color: isSelected ? const Color.fromARGB(255, 0, 46, 2) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // More visible shadow
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14, // Smaller text
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : const Color.fromARGB(255, 0, 43, 1),
          ),
        ),
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    String content = _selectedSection == AnnouncementSection.overall
        ? 'No announcement at the moment \n from the university'
        : 'No announcement at the moment \n from your college';

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const menu()),
              );
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
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
          toolbarHeight: 50,
          title: const Text(
            'Announcement',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                _buildSectionSelector('OVERALL', AnnouncementSection.overall),
                const SizedBox(width: 12),
                _buildSectionSelector('COLLEGE', AnnouncementSection.college),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                content,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
