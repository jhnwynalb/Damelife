import 'package:flutter/material.dart';

class DeletedMessagesPage extends StatelessWidget {
  final List<Map<String, dynamic>> messages;

  const DeletedMessagesPage({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: const Text(
          "Deleted Support Messages",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 0, 61, 0),
      ),
      body: messages.isEmpty
          ? const Center(child: Text("No deleted messages"))
          : ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white, // Set background color here
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    leading: const Icon(
                      Icons.delete,
                      color: Color.fromARGB(255, 1, 50, 0),
                    ),
                    title: Text(
                      messages[index]['message'],
                      softWrap: true,
                      maxLines: null,
                    ),
                  ),
                );
              },
            ),
    );
  }
}
