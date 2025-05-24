import 'pp.dart';
import 'package:flutter/material.dart';
import 'menu_page.dart';

class PrivacySettingsPage extends StatefulWidget {
  const PrivacySettingsPage({super.key});

  @override
  _PrivacySettingsPageState createState() => _PrivacySettingsPageState();
}

class _PrivacySettingsPageState extends State<PrivacySettingsPage> {
  String profileVisibility = "Public";
  bool communityActivityVisible = true;
  String messagingPrivacy = "Mutuals";
  bool marketplacePrivacy = true;
  bool lostFoundAnonymity = false;
  bool allowPostSharing = true;
  String postPrivacyLevel = "Public";
  bool allowReposts = true;
  bool showAcademicInfo = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const menu()),
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 1, 135, 1),
                  Color.fromARGB(255, 0, 64, 1),
                  Color.fromARGB(255, 0, 34, 5),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
          ),
          centerTitle: true,
          title: const Text(
            'Privacy',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          actions: const [
            Icon(Icons.keyboard_control, color: Colors.white),
          ],
        ),
      ),
      body: SwitchTheme(
        data: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return const Color.fromARGB(255, 187, 187, 187);
            }
            return Colors.grey;
          }),
          trackColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.selected)) {
              return const Color.fromARGB(255, 0, 52, 10);
            }
            return Colors.grey.shade400;
          }),
        ),
        child: ListView(
          padding: const EdgeInsets.only(top: 100, left: 16, right: 16, bottom: 16),
          children: [
            const Text("Privacy Settings",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              "Manage how your personal information and activity are shared across DAMELIFE.",
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => pp()));
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color.fromARGB(255, 1, 135, 1), width: 2),
                foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
              child: const Text('View Privacy Policy'),
            ),
            const SizedBox(height: 16),
            const Divider(thickness: 1),
            const Text("Profile Visibility",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            DropdownButton<String>(
              dropdownColor: Colors.white,
              
              value: profileVisibility,
              isExpanded: true,
              items: ["Public", "Friends ", "Private"]
                  .map((value) => DropdownMenuItem(value: value, child: Text(value)))
                  .toList(),
              onChanged: (value) => setState(() => profileVisibility = value!),
            ),
            const SizedBox(height: 12),
            const Text("Community Activity", style: TextStyle(fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: const Text("Show posts, likes, and comments to others"),
              value: communityActivityVisible,
              onChanged: (val) => setState(() => communityActivityVisible = val),
            ),
            const Divider(thickness: 1),
            const Text("Messaging Privacy",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            DropdownButton<String>(
              dropdownColor: Colors.white,
              value: messagingPrivacy,
              isExpanded: true,
              items: ["Everyone", "Mutuals", "No One"]
                  .map((value) => DropdownMenuItem(value: value, child: Text(value)))
                  .toList(),
              onChanged: (value) => setState(() => messagingPrivacy = value!),
            ),
            const SizedBox(height: 12),
            const Text("Marketplace Privacy", style: TextStyle(fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: const Text("Show full name and contact info in listings"),
              value: marketplacePrivacy,
              onChanged: (val) => setState(() => marketplacePrivacy = val),
            ),
            const Text("Lost & Found Anonymity", style: TextStyle(fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: const Text("Post lost/found items anonymously"),
              value: lostFoundAnonymity,
              onChanged: (val) => setState(() => lostFoundAnonymity = val),
            ),
            const Text("Post Privacy", style: TextStyle(fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: const Text("Allow others to share my posts"),
              value: allowPostSharing,
              onChanged: (val) => setState(() => allowPostSharing = val),
            ),
            const Divider(thickness: 1),
            const SizedBox(height: 8),
            const Text("Default Visibility for New Posts",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            DropdownButton<String>(
              dropdownColor: Colors.white,
              value: postPrivacyLevel,
              isExpanded: true,
              items: ["Public", " Friends", "Private"]
                  .map((value) => DropdownMenuItem(value: value, child: Text(value)))
                  .toList(),
              onChanged: (value) => setState(() => postPrivacyLevel = value!),
            ),
            const SizedBox(height: 20),
            const Text("Repost", style: TextStyle(fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: const Text("Allow others to repost my content"),
              value: allowReposts,
              onChanged: (val) => setState(() => allowReposts = val),
            ),
            const Text("Information", style: TextStyle(fontWeight: FontWeight.bold)),
            SwitchListTile(
              title: const Text("Show my college, course, birthday on my profile"),
              value: showAcademicInfo,
              onChanged: (val) => setState(() => showAcademicInfo = val),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Privacy preferences saved")),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 1, 135, 1),
                      Color.fromARGB(255, 0, 64, 1),
                      Color.fromARGB(255, 0, 34, 5),
                    ],
                  ),
                ),
                child: const Text(
                  "Save Settings",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
