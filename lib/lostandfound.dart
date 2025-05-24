import 'package:flutter/material.dart';
import 'menu_page.dart';
import 'lost_page.dart';

class Item {
  final String name;
  final String date;
  final String imagePath;
  final String loc;
  final String datefound;
  final String timefound;
  final String time;
  final String status;
  final String posterName;

  Item({
    required this.name,
    required this.date,
    required this.imagePath,
    required this.loc,
    required this.datefound,
    required this.timefound,
    required this.time,
    required this.status,
    required this.posterName,
  });
}

class Lostandfound extends StatefulWidget {
  const Lostandfound({super.key});

  @override
  State<Lostandfound> createState() => _LostandfoundState();
}

class _LostandfoundState extends State<Lostandfound> {
  final List<Item> item = [
    Item(
      name: 'Scientific Calculator',
      date: 'May 12, 2025',
      imagePath: 'assets/sample1.jpg',
      loc: 'SMC Hall',
      datefound: 'May 12, 2025',
      timefound: '8:30 AM',
      time: '5 hours ago',
      status: 'Unclaimed',
      posterName: 'John Doe',
    ),
    Item(
      name: 'Physics Book',
      date: 'May 15, 2025',
      imagePath: 'assets/sample9.jpg',
      loc: 'SMC Hall',
      datefound: 'May 15, 2025',
      timefound: '10:30 AM',
      time: '7 hours ago',
      status: 'Unclaimed',
      posterName: 'Zedric Alipda',
    ),
    Item(
      name: 'Calculus Book',
      date: 'May 11, 2025',
      imagePath: 'assets/sample6.jpg',
      loc: 'SMC Hall',
      datefound: 'May 12, 2025',
      timefound: '8:30 AM',
      time: '5 hours ago',
      status: 'Unclaimed',
      posterName: 'Prelian Malana',
    ),
    Item(
      name: 'Umbrella',
      date: 'May 22, 2025',
      imagePath: 'assets/sample10.jpg',
      loc: 'Creegan Canteen',
      datefound: 'May 22, 2025',
      timefound: '9:30 AM',
      time: '2 hours ago',
      status: 'Unclaimed',
      posterName: 'Florence Escano',
    ),
    Item(
      name: 'Tumbler',
      date: 'May 12, 2025',
      imagePath: 'assets/sample11.jpg',
      loc: 'Gymnasium',
      datefound: 'May 12, 2025',
      timefound: '11:30 AM',
      time: '1 hour ago',
      status: 'Unclaimed',
      posterName: 'Andrei Fuentes',
    ),
  ];

  void _showProductDetail(Item itemt) {
    final TextEditingController controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          builder: (_, scrollController) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        height: 5,
                        width: 50,
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(itemt.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(itemt.name,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(itemt.date,
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                    Text(itemt.time,
                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                    Text(itemt.status,
                        style: const TextStyle(fontSize: 12, color: Colors.green)),
                    const SizedBox(height: 15),
                    const Text('Description', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text("Location: ${itemt.loc}"),
                    Text("Date found: ${itemt.datefound}"),
                    Text("Time found: ${itemt.timefound}"),
                    const SizedBox(height: 30),
                    const Text("Message the founder",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller,
                            decoration: InputDecoration(
                              hintText: 'Type your message here...',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () {
                            if (controller.text.trim().isNotEmpty) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Message sent to ${itemt.posterName}"),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 0, 81, 0),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Send', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50), 
        child: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> menu()),);
          }, icon: Icon(Icons.arrow_back_ios)),
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
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
            'Lost and Found',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 24, 24, 24),
            ),
          ),
          actions: [
            
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildActionButton(Icons.add, 'Post', () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const LostPage()));
                }),
                const SizedBox(width: 20),
                _buildActionButton(Icons.sort, 'Sort', () {
                  // Implement category filtering logic
                }),
              ],
            ),
            const Divider(thickness: 1),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  itemCount: item.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final product = item[index];
                    return GestureDetector(
                      onTap: () => _showProductDetail(product),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: AssetImage(product.imagePath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(product.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                            Text(product.date,
                                style: const TextStyle(fontSize: 14, color: Colors.black54)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 1, 135, 1),
              Color.fromARGB(255, 0, 64, 1),
              Color.fromARGB(255, 0, 34, 5),
            ],
          ),
          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 2)],
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 8),
              Text(label, style: const TextStyle(fontSize: 16, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
