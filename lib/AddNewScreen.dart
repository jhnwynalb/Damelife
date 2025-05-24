import 'package:flutter/material.dart';
import 'messages.dart';

class AddNewScreen extends StatelessWidget {
  final List<String> users = [
    "Alice",
    "Bob",
    "Charlie",
    "Diana",
    "Ethan",
  ];

  AddNewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Color.fromARGB(255, 36, 36, 36)),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => MessengerApp()),
            ),
          ),
          title: const Text(
            'New Message',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 28, 28, 28),
            ),
          ),
          actions: const [
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text("To:", style: TextStyle(fontSize: 16)),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Type a name or group",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewGroupScreen()),
                );
              },
              borderRadius: BorderRadius.circular(32),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey[200],
                    child: const Icon(Icons.group, color: Color.fromARGB(255, 0, 50, 2)),
                  ),
                  const SizedBox(width: 12),
                  const Text("Group chat", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text("People", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 0, 65, 0),
                      child: Text(
                        users[index][0],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(users[index]),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Start chat with ${users[index]}")),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class NewGroupScreen extends StatefulWidget {
  const NewGroupScreen({super.key});

  @override
  _NewGroupScreenState createState() => _NewGroupScreenState();
}

class _NewGroupScreenState extends State<NewGroupScreen> {
  final List<String> users = ["Alice", "Bob", "Charlie", "Diana", "Ethan"];
  final Set<String> selectedUsers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Color.fromARGB(255, 36, 36, 36)),
            onPressed: () => Navigator.pop(context),
          ),
          
          title: const Text(
            'New Group Chat',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 28, 28, 28),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: selectedUsers.isNotEmpty
                        ? const Color.fromARGB(255, 0, 53, 0)
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Create",
                    style: TextStyle(
                      color: selectedUsers.isNotEmpty ? Colors.white : Colors.grey[600],
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Group name (optional)",
                  style: TextStyle(color: Colors.grey[700], fontSize: 14),
                ),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Group name",
                    border: InputBorder.none,
                  ),
                ),
                if (selectedUsers.isNotEmpty)
                  Container(
                    height: 48,
                    margin: const EdgeInsets.only(top: 12),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      itemCount: selectedUsers.length,
                      separatorBuilder: (context, index) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final user = selectedUsers.elementAt(index);
                        return Chip(
                          label: Text(user),
                          backgroundColor: Colors.white,
                          shape: StadiumBorder(
                            side: BorderSide(
                              color: const Color.fromARGB(255, 0, 68, 1),
                              width: 1.5,
                            ),
                          ),
                          deleteIcon: const Icon(Icons.close, size: 18, color: Color.fromARGB(255, 38, 38, 38)),
                          onDeleted: () {
                            setState(() {
                              selectedUsers.remove(user);
                            });
                          },
                        );
                      },
                    ),
                  ),
                const SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      const Icon(Icons.search, color: Colors.grey),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: users.length,
              itemBuilder: (context, index) {
                final user = users[index];
                final isSelected = selectedUsers.contains(user);
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 0, 63, 0),
                    child: Text(
                      user[0],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(user),
                  trailing: isSelected
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null,
                  onTap: () {
                    setState(() {
                      isSelected
                          ? selectedUsers.remove(user)
                          : selectedUsers.add(user);
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}