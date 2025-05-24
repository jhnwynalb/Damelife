import 'package:damelife_sample2/searchmessage.dart';
import 'package:flutter/material.dart';
import 'AddNewScreen.dart';
import 'menu_page.dart';

void main() {
  runApp(MessengerApp());
}

class MessengerApp extends StatelessWidget {
  const MessengerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 76, 175, 79),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: HomeScreen(),
    );
  }
}

final Map<String, List<Map<String, String>>> chatHistories = {
  'Larry Machigo': [
    {'sender': 'Larry Machigo', 'text': 'Hey, did you check the report?'},
    {'sender': 'user', 'text': 'Yes, I just saw it.'},
    {'sender': 'Larry Machigo', 'text': 'Ok. Let me check'},
  ],
  'Flutter Devs': [
    {'sender': 'Flutter Devs', 'text': 'We are live! 🚀'},
    {'sender': 'user', 'text': 'Awesome! Let’s test the new build.'},
  ],
  'Jennifer Jones': [
    {'sender': 'Jennifer Jones', 'text': '🎤 Voice message'},
    {'sender': 'user', 'text': 'Can you text it instead?'},
  ],
};

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedTab = 'All Chats';

  final List<Map<String, dynamic>> allChats = [
    {
      'name': 'Larry Machigo',
      'message': 'Ok. Let me check',
      'time': '09:38 AM',
      'avatar': 'https://i.pravatar.cc/150?img=1',
      'type': 'contact',
    },
    {
      'name': 'Flutter Devs',
      'message': 'We are live!',
      'time': '07:10 AM',
      'avatar': 'https://i.pravatar.cc/150?img=11',
      'type': 'group',
    },
    {
      'name': 'Jennifer Jones',
      'message': '🎤 Voice message',
      'time': '02:07 AM',
      'avatar': 'https://i.pravatar.cc/150?img=3',
      'type': 'contact',
    },
  ];

  List<Map<String, dynamic>> get filteredChats {
    return allChats.where((chat) {
      if (selectedTab == 'All Chats') return true;
      if (selectedTab == 'Groups') return chat['type'] == 'group';
      return false;
    }).toList();
  }

 

  void _onFabPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddNewScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Color.fromARGB(255, 36, 36, 36)),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const menu()),
            ),
          ),
          
          centerTitle: true,
          title: const Text(
            'Messages ',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 28, 28, 28)),
          ),
         actions: [
  Padding(
    padding: const EdgeInsets.only(right: 16),
    child: IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Search()),
        );
      },
      icon: const Icon(
        Icons.search,
        color: Color.fromARGB(255, 41, 41, 41),
      ),
    ),
  ),
],

        ),
      ),
      body: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: selectedTab == 'Market'
                ? Center(child: Text('No message from the marketplace', style: TextStyle(fontSize: 18)))
                : ListView.builder(
                    itemCount: filteredChats.length,
                    itemBuilder: (context, index) {
                      final chat = filteredChats[index];
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundImage: NetworkImage(chat['avatar']),
                          backgroundColor: Colors.grey[200],
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(chat['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(chat['time'], style: TextStyle(fontSize: 12, color: Colors.grey)),
                          ],
                        ),
                        subtitle: Text(chat['message'], overflow: TextOverflow.ellipsis),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ChatScreen(contactName: chat['name']),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPressed,
        backgroundColor: const Color.fromARGB(255, 0, 59, 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          
        ),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildTabBar() {
    final tabs = ['All Chats', 'Groups', 'Market'];
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: tabs.map((tab) {
          bool isActive = selectedTab == tab;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedTab = tab;
                });
              },
              child: Container(
                decoration: BoxDecoration(
  gradient: isActive
      ? LinearGradient(
          colors: [
            Color.fromARGB(255, 1, 135, 1),
            Color.fromARGB(255, 0, 64, 1),
            Color.fromARGB(255, 0, 34, 5),
          ],
        )
      : null,
  color: isActive ? null : Colors.transparent,
  borderRadius: BorderRadius.circular(30),
),

                padding: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                child: Text(
                  tab,
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.black54,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}



class ChatSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> chats;
  final String selectedTab;

  ChatSearchDelegate(this.chats, this.selectedTab);

  List<Map<String, dynamic>> get filtered {
    return chats.where((chat) {
      bool matchTab = selectedTab == 'All Chats' ||
          (selectedTab == 'Groups' && chat['type'] == 'group');
      return matchTab &&
          chat['name'].toLowerCase().contains(query.toLowerCase());
    }).toList();
  }

  @override
  List<Widget>? buildActions(BuildContext context) =>
      [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => close(context, query),
      );

  @override
  Widget buildResults(BuildContext context) => _buildList(context);

  @override
  Widget buildSuggestions(BuildContext context) => _buildList(context);

  Widget _buildList(BuildContext context) {
    return ListView(
    
      children: filtered
          .map(
            (chat) => ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(chat['avatar']),
                backgroundColor: Colors.grey[200],
              ),
              title: Text(chat['name']),
              subtitle: Text(chat['message']),
              onTap: () {
                close(context, query);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ChatScreen(contactName: chat['name']),
                  ),
                );
              },
            ),
          )
          .toList(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final String contactName;

  const ChatScreen({super.key, required this.contactName});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  late List<Map<String, String>> messages;
  final List<AnimationController> _animControllers = [];
  final List<Animation<Offset>> _slideAnimations = [];

  @override
  void initState() {
    super.initState();
    messages = List<Map<String, String>>.from(
      chatHistories[widget.contactName] ?? [],
    );
    for (int i = 0; i < messages.length; i++) {
      final controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 400),
      );
      _animControllers.add(controller);
      _slideAnimations.add(
        Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: controller, curve: Curves.easeOut),
        ),
      );
      controller.forward();
    }
  }

  @override
  void dispose() {
    for (var c in _animControllers) {
      c.dispose();
    }
    _controller.dispose();
    super.dispose();
  }

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      messages.add({'sender': 'user', 'text': text});
      final controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 400),
      );
      _animControllers.add(controller);
      _slideAnimations.add(
        Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero).animate(
          CurvedAnimation(parent: controller, curve: Curves.easeOut),
        ),
      );
      controller.forward();
    });

    _controller.clear();

    Future.delayed(Duration(milliseconds: 600), () {
      setState(() {
        messages.add({
          'sender': widget.contactName,
          'text': 'Thanks for your message: "$text"'
        });
        final controller = AnimationController(
          vsync: this,
          duration: Duration(milliseconds: 400),
        );
        _animControllers.add(controller);
        _slideAnimations.add(
          Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero).animate(
            CurvedAnimation(parent: controller, curve: Curves.easeOut),
          ),
        );
        controller.forward();
      });
    });
  }

  Widget _buildMessage(Map<String, String> msg, int index) {
    final isUser = msg['sender'] == 'user';
    return SlideTransition(
      position: _slideAnimations[index],
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isUser ? const Color.fromARGB(255, 0, 70, 2) : Colors.grey[300],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            msg['text']!,
            style: TextStyle(color: isUser ? Colors.white : Colors.black87),
          ),
        ),
      ),
    );
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Color.fromARGB(206, 221, 221, 221),
      leading: IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MessengerApp()),
          );
        },
        icon: Icon(Icons.arrow_back_ios, color: const Color.fromARGB(255, 58, 58, 58),),
      ),
      title: Text(
        widget.contactName,
        style: TextStyle(
          color: Color.fromARGB(255, 55, 55, 55),
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    body: Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(7),
            itemCount: messages.length,
            itemBuilder: (context, index) => _buildMessage(messages[index], index),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 3, vertical: 6),
          color: Colors.grey[100],
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(206, 221, 221, 221),
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.white),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => sendMessage(_controller.text),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 0, 46, 2),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Transform.rotate(
                      angle: -1,
                      child: Icon(Icons.send, color: Colors.white, size: 22),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

  }
