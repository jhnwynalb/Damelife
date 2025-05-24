import 'package:flutter/material.dart';
import 'terms_policies.dart';
class cs extends StatefulWidget {
  const cs({super.key});

  @override
  State<cs> createState() => _csState();
}

class _csState extends State<cs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => terms()),
              );
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
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
            'Damelife | Community Standards',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 24, 24, 24),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(20, 85, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'COMMUNITY STANDARDS',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 80, 0),
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 10),
              Text(
                  'Creating a respectful, positive, and inclusive community for NDMU.',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.start,
                ),
              
              Divider(height: 40, thickness: 1),
              Text(
                'DAMELIFE is not just an app — it\'s an extension of the NDMU family. As such, we expect all users to follow these Community Standards to maintain a safe, positive, and respectful environment for everyone.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                '1. **Respect and Kindness**',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Treat all users with dignity, respect, and kindness.\n\nNo hate speech, discrimination, bullying, or harassment will be tolerated. NDMU embraces diversity across all faiths, cultures, genders, and backgrounds.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                '2. **No Harmful or Offensive Content**',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Do not post content that is violent, graphic, sexually explicit, or otherwise inappropriate for an educational community.\n\nPosts or comments that contain profanity, slurs, or offensive jokes will be removed.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                '3. **Academic Integrity**',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Do not share test answers, plagiarized content, or any other materials that would undermine academic integrity.\n\nCheating, shortcuts, or unfair academic practices have no place in our community.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                '4. **No Fake Profiles or Impersonation**',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Users must represent themselves honestly and accurately.\n\nDo not impersonate other students, faculty, or staff.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                '5. **Marketplace Rules**',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Only post legitimate items in the Marketplace. No counterfeit goods, dangerous products, or illegal items.\n\nBe fair and honest in all transactions — follow a "No scam" policy!',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                '6. **Safe & Positive Discussions**',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Healthy debate is encouraged, but respect other people’s opinions.\n\nAvoid heated arguments, personal attacks, or trolling.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                '7. **No Spam or Self-Promotion**',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Do not spam groups or users with promotions, advertisements, or unrelated content.\n\nClub promotions and campus events are welcome but should follow the guidelines for event postings.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                '8. **Privacy Matters**',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Do not share private information (such as phone numbers, addresses, or other personal details) without consent.\n\nRespect the privacy of fellow students, teachers, and staff.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                '9. **Report Violations**',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'If you see something that goes against these standards, report it using the in-app report feature.\n\nReports are reviewed confidentially and fairly.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Divider(height: 40, thickness: 1),
              Text(
                'Actions & Consequences',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Violations of these Community Standards may result in:\n\n•  Content removal\n•  Temporary or permanent suspension of app features\n•  Account suspension or deactivation\n•  University disciplinary action, if applicable',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Divider(height: 40, thickness: 1),
              Text(
                'DAMELIFE reserves the right to enforce these standards to ensure a vibrant, safe, and respectful digital community that reflects the values of NDMU.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Divider(height: 40, thickness: 1),
              Center(
                child: Text(
                  'Remember:\nWe are Notre Dameans — we lead with compassion, integrity, and excellence. Let’s keep DAMELIFE a space that inspires and uplifts each other. 🌟',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
