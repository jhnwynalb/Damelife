import 'package:flutter/material.dart';
import 'menu_page.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final TextEditingController _searchController = TextEditingController();

  void _onSearchChanged(String query) {
    // You can implement filtering logic here if needed
  }

  void _searchBuilding(String query) {
    // Handle search submit logic
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildSectionCard(List<Widget> tiles) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF6F5F5),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: tiles.map((tile) {
            return Column(
              children: [
                tile,
                if (tile != tiles.last)
                  const Divider(height: 0, indent: 16, endIndent: 16),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildTile({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.chevron_right, size: 20, color: Colors.grey),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
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
         
          title: const Text(
            'Settings ',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          actions: const [
           Padding(
  padding: EdgeInsets.only(right: 16),
  child: Icon(Icons.keyboard_control, color: Color.fromARGB(255, 255, 255, 255)),
),
            
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  border: Border.all(color: const Color.fromARGB(255, 255, 255, 255), width: 2),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  onSubmitted: _searchBuilding,
                  decoration: const InputDecoration(
                    hintText: 'Search settings',
                    border: InputBorder.none,
        
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            _buildSectionHeader('Account'),
            _buildSectionCard([
              _buildTile(title: 'Personal Information', icon: Icons.person, onTap: () {}),
              _buildTile(title: 'Notifications', icon: Icons.notifications_active, onTap: () {}),
              _buildTile(title: 'Sharing Options', icon: Icons.share, onTap: () {}),
            ]),
            _buildSectionHeader('General'),
            _buildSectionCard([
              _buildTile(title: 'Language', icon: Icons.language, onTap: () {}),
              _buildTile(title: 'Subtitles', icon: Icons.subtitles, onTap: () {}),
              _buildTile(title: 'Theme', icon: Icons.color_lens, onTap: () {}),
              _buildTile(title: 'Sync Settings', icon: Icons.sync, onTap: () {}),
              _buildTile(title: 'Location', icon: Icons.location_pin, onTap: () {}),
            ]),
            _buildSectionHeader('Security'),
            _buildSectionCard([
              _buildTile(title: 'Privacy & Security', icon: Icons.lock, onTap: () {}),
              _buildTile(title: 'Help', icon: Icons.help_outline, onTap: () {}),
            ]),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
