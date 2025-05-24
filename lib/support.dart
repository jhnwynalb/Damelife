import 'package:flutter/material.dart';
import 'menu_page.dart';
import 'delete.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _supportMessages = [];
  final List<Map<String, dynamic>> _deletedMessages = [];
  int? _selectedIndex;

  void _sendProblem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _supportMessages.add({'message': _controller.text, 'isPublic': true});
        _controller.clear();
        _selectedIndex = null;
      });
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter a message first')));
    }
  }

  void _navigateToDeletedMessages() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DeletedMessagesPage(messages: _deletedMessages),
      ),
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
          leading: IconButton(
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const menu()),
              );
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
            'Support Inbox',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.white),
              onPressed: _navigateToDeletedMessages,
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reach out for support?',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.message, size: 20),
                      SizedBox(width: 6),
                      Text(
                        "Send a message",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'Type your message here...',
                            filled: true,
                            fillColor: Colors.grey[200],
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: _sendProblem,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 81, 0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          'Send',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(height: 40, thickness: 1),
           
            const Text(
              'Your Latest Submissions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
         
            Expanded(
              child:
                  _supportMessages.isEmpty
                      ? const Center(child: Text('No submissions yet.'))
                      : ListView.builder(
                        itemCount: _supportMessages.length,
                        itemBuilder: (context, index) {
                          final item = _supportMessages[index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIndex = null;
                              });
                            },
                            onLongPress: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            child: Card(
                              color:
                                  _selectedIndex == index
                                      ? Colors.green[50]
                                      : Colors.white,
                              elevation: 1,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                leading: const Icon(Icons.feedback),
                                title: Text(
                                  item['message'],
                                  style: const TextStyle(fontSize: 16),
                                  softWrap: true,
                                  overflow:
                                      _selectedIndex == index
                                          ? TextOverflow.visible
                                          : TextOverflow.ellipsis,
                                  maxLines: _selectedIndex == index ? null : 1,
                                ),
                                trailing:
                                    _selectedIndex == index
                                        ? IconButton(
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Color.fromARGB(
                                              255,
                                              1,
                                              50,
                                              0,
                                            ),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              _deletedMessages.add(
                                                _supportMessages[index],
                                              );
                                              _supportMessages.removeAt(index);
                                              _selectedIndex = null;
                                            });
                                          },
                                        )
                                        : null,
                              ),
                            ),
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
