import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_page.dart';
import 'community_page.dart';
import 'menu_page.dart';
import 'vend_page.dart';
import 'searchbar.dart';
class Product {
  final String name;
  final String price;
  final String imagePath;
  final String sellerName;
  final String sellerContact;
  final String description;
  final String time;
  final String status;

  Product({
    required this.name,
    required this.price,
    required this.imagePath,
    required this.sellerName,
    required this.sellerContact,
    required this.description,
    required this.time,
    required this.status,
  });
}

class news extends StatefulWidget {
  const news({super.key});

  @override
  State<news> createState() => _newsState();
}

class _newsState extends State<news> {
  final List<Widget> routes = const [
    home(),
    community(),
    profile(),
    news(),
    menu(),
  ];

  int selectedIndex = 3;

  final List<IconData> icons = [
    Icons.home_max_rounded,
    Icons.group_rounded,
    Icons.person_rounded,
    Icons.store_rounded,
    Icons.menu,
    
  ];

  final List<Product> products = [
    Product(
      name: 'Calculator',
      price: '₱250',
      imagePath: 'assets/sample1.jpg',
      sellerName: 'Juan Dela Cruz',
      sellerContact: '09171234567',
      description: 'A reliable calculator for everyday math problems.',
      time: '5 hours ago',
      status: 'Still Available',
    ),
    Product(
      name: 'Notebook',
      price: '₱60',
      imagePath: 'assets/sample2.jpg',
      sellerName: 'Maria Santos',
      sellerContact: '09181234567',
      description: 'Compact notebook with 100 lined pages.',
      time: '7 hours ago',
      status: 'Still Available',
    ),
    Product(
      name: 'Bag',
      price: '₱1200',
      imagePath: 'assets/sample3.jpg',
      sellerName: 'Carlos Reyes',
      sellerContact: '09192234567',
      description: 'Durable and stylish bag for daily use.',
      time: '1 day ago',
      status: 'Still Available',
    ),
    Product(
      name: 'Shoes',
      price: '₱1800',
      imagePath: 'assets/sample4.jpg',
      sellerName: 'Anna Lopez',
      sellerContact: '09193334567',
      description: 'Comfortable running shoes for all terrains.',
      time: '2 days ago',
      status: 'Still Available',
    ),
    Product(
      name: 'Jacket',
      price: '₱950',
      imagePath: 'assets/sample5.jpg',
      sellerName: 'Leo Ramirez',
      sellerContact: '09204455667',
      description: 'Warm jacket perfect for cool weather.',
      time: '7 hours ago',
      status: 'Still Available',
    ),
    Product(
      name: 'Calculus Book',
      price: '₱2500',
      imagePath: 'assets/sample6.jpg',
      sellerName: 'Ella Cruz',
      sellerContact: '09175555667',
      description: 'Comprehensive guide to calculus topics.',
      time: '6 hours ago',
      status: 'Still Available',
    ),
    Product(
      name: 'TechPen',
      price: '₱15',
      imagePath: 'assets/sample7.jpg',
      sellerName: 'Mike Aquino',
      sellerContact: '09171112222',
      description: 'Affordable and smooth writing pen.',
      time: '10 hours ago',
      status: 'Still Available',
    ),
    Product(
      name: 'Water Bottle',
      price: '₱180',
      imagePath: 'assets/sample8.jpg',
      sellerName: 'Liza Gomez',
      sellerContact: '09172223333',
      description: 'Reusable water bottle, 500ml capacity.',
      time: '11 hours ago',
      status: 'Still Available',
    ),
    Product(
      name: 'Physics Book',
      price: '₱1500',
      imagePath: 'assets/sample9.jpg',
      sellerName: 'Ken Tan',
      sellerContact: '09173334444',
      description: 'A book for physics subject related to engineering.',
      time: '1 hour ago',
      status: 'Still Available',
    ),
    Product(
      name: 'Umbrella',
      price: '₱300',
      imagePath: 'assets/sample10.jpg',
      sellerName: 'Joy Navarro',
      sellerContact: '09174445555',
      description: 'Compact umbrella suitable for rainy days.',
      time: '9 hours ago',
      status: 'Still Available',
    ),
  ];

  void navigateToPage(int index) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => routes[index]));
  }

  void _showProductDetail(Product product) {
    final TextEditingController controller = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.5,
          minChildSize: 0.4,
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
                          image: AssetImage(product.imagePath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      product.price,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 33, 33, 33),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      product.time,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      product.status,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 0, 89, 21),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text('Description', style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(
                      product.description,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildGradientIconButton(Icons.favorite, 'Favorite'),
                        _buildGradientIconButton(Icons.share, 'Share'),
                        _buildGradientIconButton(
                          Icons.add_shopping_cart,
                          'Add to Cart',
                        ),
                      ],
                    ),
                    const Divider(height: 30),
                    const Text(
                      "Message the Seller",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                          onPressed: () {
                            if (controller.text.trim().isNotEmpty) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Message sent to ${product.sellerName}",
                                  ),
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                              255,
                              0,
                              81,
                              0,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 14,
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
                    const Divider(height: 30),
                    const Text('Sellers Information', style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: const Color.fromARGB(255, 0, 60, 3),
                          child: const Icon(Icons.person, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: ${product.sellerName}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Contact: ${product.sellerContact}',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildGradientIconButton(IconData icon, String label) {
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // No background gradient or color here, fully transparent
      ),
      child: Column(
        children: [
          ShaderMask(
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
            child: Icon(icon, size: 30, color: Colors.white),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          automaticallyImplyLeading: false,
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
            'University Market',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 24, 24, 24),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> profile()));},
              icon: const Icon(
                Icons.person,
                color: Color.fromARGB(255, 24, 24, 24),
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchPage()));},
              icon: const Icon(
                Icons.search_sharp,
                color: Color.fromARGB(255, 24, 24, 24),
                size: 25,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(height: 100),
            Center(
  child: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      _buildActionButton(
        Icons.add,
        'Vend',
        () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const VendPage()),
          );
        },
      ),
      const SizedBox(width: 20),
      _buildActionButton(
        Icons.sort_rounded,
        'Sort',
        () {
          // Add navigation or any action here for Categories button
        },
      ),
    ],
  ),
),

            const Divider(thickness: 1),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
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
                            Text(
                              product.price,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              product.name,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),
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
                setState(() => selectedIndex = index);
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

  Widget _buildActionButton(IconData icon, String label, VoidCallback? onTap) {
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
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(0, 2)),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}
}
