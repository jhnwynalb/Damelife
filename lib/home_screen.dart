import 'dart:math';

import 'package:damelife_sample2/messages.dart';
import 'package:damelife_sample2/postform.dart';
import 'package:damelife_sample2/searchbar.dart';
import 'package:flutter/material.dart';
import 'community_page.dart';
import 'profile_page.dart';
import 'market_page.dart';
import 'menu_page.dart';
import 'notification.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}


class Post {
  final String author;
  final String content;
  final String imagePath;
  int likes;
  final int reposts;
  final String status;
  bool liked;
  final Post? repostedPost; // NEW field for reposted original post

  Post({
    required this.author,
    required this.content,
    required this.imagePath,
    required this.likes,
    required this.reposts,
    required this.status,
    required this.liked,
    this.repostedPost,
  });
}


class _homeState extends State<home> {
  List<Post> reposts = [];
  String _audience = 'Public';

  final List<Widget> routes = const [
    home(),
    community(),
    profile(),
    news(),
    menu(),
  ];

  int selectedIndex = 0;
  final List<IconData> icons = [
    Icons.home_max_rounded,
    Icons.group_rounded,
    Icons.person_rounded,
    Icons.store_rounded,
    Icons.menu,
  ];

 List<Post> posts = [
  Post(
    author: 'Florence Escano',
    imagePath: 'assets/flo.jpg',
    content: 'Just finished my final exam! Feeling great!',
    likes: 5,
    reposts: 2,
    status: '1 hour ago',
    liked: false,
  ),
  Post(
    author: 'Zed Alipda',
    imagePath: 'assets/zed.png',
    content: 'Can’t believe the semester is almost over. Let’s go!',
    likes: 8,
    reposts: 3,
    status: '1 day ago',
    liked: false,
  ),
  Post(
    author: 'Prelian Malana',
    imagePath: 'assets/prel.jpg',
    content: 'Ma summer ko or hindi? .',
    likes: 12,
    reposts: 6,
    status: '3 hours ago',
    liked: false,
  ),
  Post(
    author: 'Andrei Fuentes',
    imagePath: 'assets/drei.jpg',
    content: 'Tani Pasado electronics namon mga computer engineering ba.',
    likes: 12,
    reposts: 6,
    status: '30 mins ago',
    liked: false,
  ),
];


  void navigateToPage(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => routes[index]),
    );
  }

void _showCommentBottomSheet(Post post) {
  final TextEditingController _commentController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.3,
        minChildSize: 0.2,
        maxChildSize: 0.6,
        expand: false,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 5,
                    margin: const EdgeInsets.only(bottom: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const Text(
                  'Comments',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                const Center(
                  child: Text(
                    'No comments yet',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const Spacer(),
                // TextField with white background and green send icon
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,  // <-- white background here
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Write a comment',
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      border: InputBorder.none,
                      suffixIcon: IconButton(
  icon: ShaderMask(
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
    child: const Icon(Icons.send, size: 30, color: Colors.white),
  ),
  onPressed: () {
    final text = _commentController.text.trim();
    if (text.isNotEmpty) {
      // Handle send logic here
      print('Send comment: $text');
      _commentController.clear();
      Navigator.of(context).pop(); // close sheet
    }
  },
),

                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}




  void _showRepostBottomSheet(Post originalPost) {
  final captionController = TextEditingController();
  String _audience = 'Public'; // default audience

  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: Colors.white,
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              top: 20,
              left: 20,
              right: 20,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Profile avatar & audience dropdown
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/profile.jpg'),
                      radius: 22,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Juan Dela Cruz',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Container(
                            width: 140,
                            height: 35,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _audience,
                                isExpanded: true,
                                dropdownColor: Colors.white,
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                  size: 24,
                                  color: Colors.black,
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: 'Public',
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.public,
                                          size: 18,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          'Public',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Friends',
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.group,
                                          size: 18,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          'Friends',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Only Me',
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.lock,
                                          size: 18,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 6),
                                        Text(
                                          'Only Me',
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                onChanged: (val) {
                                  if (val != null) {
                                    setModalState(() => _audience = val);
                                  }
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Caption input — borderless
                TextFormField(
                  controller: captionController,
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Add a caption...',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 12,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Repost preview layout (original post preview)
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(originalPost.imagePath),
                            radius: 20,
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                originalPost.author,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                '${originalPost.status} • $_audience',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Icon(Icons.more_horiz),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Container(
                        height: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey[700],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          originalPost.content,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Repost button
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      reposts.add(
                        Post(
                          author: 'Juan Dela Cruz',
                          content: captionController.text.isEmpty
                              ? ''
                              : captionController.text,
                          imagePath: 'assets/profile.jpg',
                          likes: 0,
                          reposts: 0,
                          status: 'Just now',
                          liked: false,
                          repostedPost: originalPost, // add original post here
                        ),
                      );
                    });
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.repeat, color:const Color.fromARGB(255, 0, 50, 4) ,),
                  label: const Text('Repost'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    foregroundColor: const Color.fromARGB(255, 0, 50, 4),
                    minimumSize: const Size.fromHeight(45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          );
        },
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    final random = Random();

    Color randomColor() {
      final List<Color> allowedColors = [
        Colors.black,
        Colors.grey[900]!,
        Colors.grey[700]!,
        Colors.grey[500]!,
        const Color(0xFF004D00), // dark green
        const Color(0xFF007700), // medium green
        const Color(0xFF339933), // lighter green
        const Color(0xFF66BB66), // soft green
        const Color(0xFF99CC99), // pale green
      ];
      return allowedColors[random.nextInt(allowedColors.length)];
    }

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 1, 135, 1),
                  Color.fromARGB(255, 0, 64, 1),
                  Color.fromARGB(255, 0, 34, 5),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          toolbarHeight: 50,
          title: const Text(
            'Damelife',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage()),
                );
              },
              icon: const Icon(
                Icons.search_sharp,
                color: Colors.white,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationPage()),
                );},
              icon: const Icon(
                Icons.notifications,
                color: Colors.white,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MessengerApp()),
                );
              },
              icon: const Icon(Icons.mail, color: Colors.white, size: 25),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: GestureDetector(
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const PostForm()),
                          ),
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 239, 239, 239),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          'Write something to post...',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const PostForm()),
                        ),
                    child: const Icon(
                      Icons.post_add_rounded,
                      size: 30,
                      color: Color.fromARGB(255, 0, 81, 0),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 3,
              color: Color.fromARGB(255, 191, 191, 191),
              height: 0,
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: posts.length + reposts.length,
                itemBuilder: (context, index) {
                  Post post;
                  bool isRepost = false;
                  if (index < posts.length) {
                    post = posts[index];
                  } else {
                    post = reposts[index - posts.length];
                    isRepost = true;
                  }

                  final bgColor = randomColor();

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(post.imagePath),
                              radius: 18,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post.author,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${post.status} • ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      'Public',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(Icons.more_horiz),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Post or repost content
                        isRepost
                            ? Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (post.content.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 8.0,
                                      ),
                                      child: Text(
                                        post.content,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  Container(
                                    height: 150,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[700],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'Original post by ${post.author}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            : Container(
                              height: 150,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: bgColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                post.content,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),

                        const SizedBox(height: 10),

                        // Like, comment, repost buttons row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  post.liked = !post.liked;
                                  post.liked ? post.likes++ : post.likes--;
                                });
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    post.liked
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color:
                                        post.liked ? const Color.fromARGB(255, 0, 64, 15) : Colors.grey,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(post.likes.toString()),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () => _showCommentBottomSheet(post),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.comment_outlined,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(width: 5),
                                  Text('Comment'),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () => _showRepostBottomSheet(post),
                              child: Row(
                                children: [
                                  const Icon(Icons.repeat, color: Colors.grey),
                                  const SizedBox(width: 5),
                                  Text(post.reposts.toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
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
