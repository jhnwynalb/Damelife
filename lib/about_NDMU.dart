import 'package:flutter/material.dart';
import 'menu_page.dart';

class aboutNdmu extends StatefulWidget {
  const aboutNdmu({super.key});

  @override
  State<aboutNdmu> createState() => _aboutNdmuState();
}

class _aboutNdmuState extends State<aboutNdmu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, MaterialPageRoute(builder: (context) => const menu()));
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
            'About NDMU',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search_sharp,
                color: Colors.white,
                size: 25,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(20, 85, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Center(
                child: Text(
                  'NOTRE DAME OF MARBEL UNIVERSITY',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 80, 0),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Where excellence meets compassion,\nand education is shaped by faith, service, and innovation.',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(height: 40, thickness: 1),
              Text(
                'Notre Dame of Marbel University (NDMU) is a premier Catholic Marist institution in South Cotabato, Philippines, dedicated to forming students with character, competence, and cultural sensitivity through quality Christian education and service.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                'Vision and Mission',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(height: 15, thickness: 1),
              SizedBox(height: 10),
              Text(
                'Vision:\n'
                'Inspired by the charism of St. Marcellin Champagnat, NDMU envisions being a Catholic Marist institution dedicated to spiritual, moral, and academic formation.\n\n'
                'Mission:\n'
                '• Build Character through Christian education.\n'
                '• Develop Competence through quality education.\n'
                '• Respect Culture by promoting cultural solidarity.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                'Motto',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(height: 15, thickness: 1),
              SizedBox(height: 10),
              Text(
                '"Character, Competence, and Culture in Harmony"',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 20),
              Text(
                'Core Values',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(height: 15, thickness: 1),
              SizedBox(height: 10),
              Text(
                'Family Spirit\nMarian\nLove of Work\nPreference for the Least Favored\n'
                'Quality Education\nIntegrity of Creation\nCulture Sensitivity',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                'History',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(height: 15, thickness: 1),
              SizedBox(height: 10),
              Text(
                'Founded in 1946, NDMU has evolved from a small school into a recognized university, achieving Autonomous Status, ISO certifications, and becoming a Center of Excellence in many programs.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                'Marist Brothers',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(height: 15, thickness: 1),
              SizedBox(height: 10),
              Text(
                'Founded by Saint Marcellin Champagnat in 1817, the Marist Brothers dedicate themselves to the Christian education of youth, especially those most in need.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                'University President',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(height: 15, thickness: 1),
              SizedBox(height: 10),
              Text(
                'Brother Paterno S. Corpus, FMS, EdD leads NDMU, bringing over four decades of Marist educational leadership to the university.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                'University Seal and Mace',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(height: 15, thickness: 1),
              SizedBox(height: 10),
              Text(
                'The seal features symbols of patriotism and Christian education; the mace symbolizes the Marist values of service, excellence, and faith.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                'University Commitments',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(height: 15, thickness: 1),
              SizedBox(height: 10),
              Text(
                'NDMU upholds its mission to deliver quality Christian education, foster leadership, protect the environment, and comply with international standards.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                'NDMU Colors',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(height: 15, thickness: 1),
              SizedBox(height: 10),
              Text(
                'Gold symbolizes excellence and divine glory; Green represents life, hope, and the harmony of faith and culture.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 30),
              Center(
                child: Text(
                  'Notre Dame of Marbel University — The First Marist University in the Philippines.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
