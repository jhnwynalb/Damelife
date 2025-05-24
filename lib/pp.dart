import 'package:damelife_sample2/privacy.dart';
import 'package:flutter/material.dart';
import 'terms_policies.dart';

class pp extends StatefulWidget {
  const pp({super.key});

  @override
  State<pp> createState() => _ppState();
}

class _ppState extends State<pp> {
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
            'Damelife | Privacy Policy',
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
            children: [
              const Text(
                'PRIVACY POLICY',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 80, 0),
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 10),
              const Text(
                  'Effective Date: April 27, 2025',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.start,
                ),
              const Divider(height: 40, thickness: 1),

              // Privacy Policy Content
              const Text(
                '1. Information We Collect',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'When you use DAMELIFE, we may collect the following types of information:\n\n'
                'Personal Information:\n'
                'Full name, email address, mobile number, student ID number, and other identifiers necessary for account registration and profile management.\n\n'
                'Usage Information:\n'
                'Log data such as IP address, app interactions, device information, and usage patterns to improve app performance.\n\n'
                'Content Information:\n'
                'Posts, comments, messages, listings, and other content submitted in community spaces and the Marketplace.\n\n'
                'Transaction Data:\n'
                'Information related to Marketplace activity, such as posted items, purchase history, and inquiries.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 20),
              const Text(
                '2. How We Use Your Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'We use the information collected to:\n\n'
                '• Provide, operate, and maintain the DAMELIFE app.\n'
                '• Personalize your experience and enhance user engagement.\n'
                '• Communicate important updates, announcements, and academic notifications.\n'
                '• Facilitate marketplace interactions between students.\n'
                '• Monitor and enforce app rules and community standards.\n'
                '• Protect the security, integrity, and lawful use of the app.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 10),
              const Text(
                '3. Sharing of Information',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'DAMELIFE does not sell, rent, or trade your personal information to third parties.\n\n'
                'We may share information with:\n\n'
                '• NDMU administrative offices for official university purposes.\n'
                '• Service providers that help us operate the app (under strict confidentiality agreements).\n'
                '• Authorities when legally required, such as to comply with a legal obligation or protect the rights and safety of users.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 10),
              const Text(
                '4. Data Storage and Security',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'Your information is stored securely using industry-standard security measures to protect against unauthorized access, alteration, disclosure, or destruction.\n\n'
                'Only authorized DAMELIFE administrators and designated NDMU staff have access to your data.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 10),
              const Text(
                '5. Your Privacy Rights',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'You have the right to:\n\n'
                '• Access, review, or request corrections to your personal data.\n'
                '• Request deletion of your account and personal information.\n'
                '• Withdraw consent for specific data processing activities.\n'
                '• Contact DAMELIFE Support for any privacy-related requests.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 10),
              const Text(
                '6. Retention of Data',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'We retain your personal data only as long as necessary for the purposes outlined in this policy or as required by law or university regulations.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 10),
              const Text(
                '7. Cookies and Tracking Technologies',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'DAMELIFE may use minimal cookies or similar technologies to:\n\n'
                '• Remember your login sessions.\n'
                '• Monitor app performance and improve user experience.\n\n'
                'You may disable cookies through your device settings, but some features of the app may not function properly without them.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 10),
              const Text(
                '8. Changes to This Privacy Policy',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Text(
                'We may update this Privacy Policy from time to time to reflect changes in our practices or for legal reasons. Users will be notified of any significant updates through the app or via email.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 20),
                  Center(
  child: OutlinedButton(
    
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PrivacySettingsPage()),
      );
    },
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: Color.fromARGB(255, 1, 135, 1), width: 2),
      foregroundColor: const Color.fromARGB(255, 0, 0, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
    child: const Text('View Privacy Settings'),
  ),
),

              const Divider(height: 40, thickness: 1),
        
              Center(
                child: Text(
                  'Contact Information\nFor concerns, inquiries, or feedback regarding this Privacy Policy, users may contact the DAMELIFE Support Center through the app’s Feedback & Support section.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
