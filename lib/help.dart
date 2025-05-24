import 'package:flutter/material.dart';
import 'menu_page.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();

  final List<Map<String, String>> faqs = [
    {
      'question': 'How do I reset my password?',
      'answer': 'To reset your password, go to Settings > Account > Reset Password.'
    },
    {
      'question': 'Where can I find the E-Materials Hub?',
      'answer': 'You can find the E-Materials Hub in the Dashboard under "Academics".'
    },
    {
      'question': 'How do I report a lost item?',
      'answer': 'You can report a lost item in the "Lost and Found Center" section of the app.'
    },
  ];

  List<Map<String, String>> remainingFaqs = [];

  @override
  void initState() {
    super.initState();
    remainingFaqs = List.from(faqs);
    messages.add({
      'sender': 'bot',
      'text': 'Welcome to Damelife Help Chat! How can we assist you today?'
    });
  }

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      messages.add({'sender': 'user', 'text': text});
    });

    _controller.clear();

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        messages.add({
          'sender': 'bot',
          'text': 'Thanks for reaching out. We’ll get back to you soon!'
        });
      });
    });
  }

  void sendFAQ(String question, String answer) {
    setState(() {
      messages.add({'sender': 'user', 'text': question});
      remainingFaqs.clear(); // Clear all questions once one is clicked
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        messages.add({'sender': 'bot', 'text': answer});
      });
    });
  }

  Widget buildMessage(String text, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        decoration: BoxDecoration(
          color: isUser ? const Color.fromARGB(255, 0, 100, 0) : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget buildFAQButtons() {
    return Opacity(
      opacity: 0.85,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Center(
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: remainingFaqs.map((faq) {
              return ElevatedButton(
                onPressed: () => sendFAQ(faq['question']!, faq['answer']!),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(200, 0, 59, 9),
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(
                  faq['question']!,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, MaterialPageRoute(builder: (context) => const menu()));
            },
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 59, 9),
          toolbarHeight: 50,
          title: const Text(
            'Damelife Help Chat',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          shadowColor: Color.fromARGB(255, 128, 128, 128), 
          elevation: 4,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final msg = messages[index];
                final isUser = msg['sender'] == 'user';
                return buildMessage(msg['text']!, isUser);
              },
            ),
          ),
          buildFAQButtons(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.headset, color: Color.fromARGB(255, 0, 100, 0)),
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      hintText: 'Write a message...',
                      hintStyle: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color.fromARGB(255, 0, 100, 0)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () => sendMessage(_controller.text),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 100, 0),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
