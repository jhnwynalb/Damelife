import 'package:damelife_sample2/terms_policies.dart';
import 'package:flutter/material.dart';

class tos extends StatefulWidget {
  const tos({super.key});

  @override
  State<tos> createState() => _tosState();
}

class _tosState extends State<tos> {
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
            'Damelife | Terms of Service',
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
                'TERMS OF SERVICE',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 80, 0),
                ),
                textAlign: TextAlign.start,
              ),

              SizedBox(height: 10),
              Text(
                  'By using the app, you agree to the terms and conditions below.',
                  style: TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                  ),
                  textAlign: TextAlign.start,
                ),
              
              Divider(height: 40, thickness: 1),
              Text(
                'Overview:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'The Terms of Service outlined here govern the use of the DAMELIFE app. By accessing or using the app, users agree to comply with all terms and conditions, privacy policies, and university guidelines. Please read these terms carefully before using the app.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Text(
                '1. **Acceptance of Terms**',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'By registering, accessing, or using DAMELIFE, you agree to abide by all University policies, app guidelines, and community standards. If you do not agree, please refrain from using the application.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                '2. **User Responsibilities**',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Users must provide accurate, updated, and truthful information during account registration and login.\n\nUsers are responsible for maintaining the confidentiality of their account credentials and for all activities that occur under their account.\n\nAll posts, messages, and marketplace listings must comply with NDMU’s policies and should respect community values, decency, and intellectual property rights.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                '3. **Content Ownership and Conduct**',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'DAMELIFE respects user-generated content; however, users grant DAMELIFE a non-exclusive, royalty-free license to use, display, and share content within the platform.\n\nUsers may not post content that is offensive, harmful, threatening, abusive, defamatory, obscene, fraudulent, misleading, or in violation of any law.\n\nAny content that undermines university integrity, promotes illegal activities, or endangers the safety of others is strictly prohibited.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                '4. **Marketplace Transactions**',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'DAMELIFE facilitates the Marketplace for student-to-student transactions; however, it does not guarantee, endorse, or assume responsibility for any items bought, sold, or exchanged.\n\nUsers are expected to conduct safe, honest, and respectful transactions.\n\nDAMELIFE and NDMU are not liable for disputes, damages, or issues arising from marketplace dealings.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                '5. **Privacy and Data Protection**',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'DAMELIFE collects and processes limited personal information to provide essential services, always in compliance with data privacy laws.\n\nYour data will not be shared with third parties without your consent unless required by law.\n\nUsers are encouraged to review the DAMELIFE Privacy Policy for full details on data use and protection.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                '6. **Suspension and Termination**',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'DAMELIFE reserves the right to suspend or terminate user accounts that violate the Terms of Service, university regulations, or exhibit abusive, harmful, or unlawful behavior.\n\nSuspensions may be temporary or permanent depending on the severity of the violation.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                '7. **App Updates and Feature Changes**',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'DAMELIFE continuously improves its services and may modify, enhance, add, or remove features at any time without prior notice.\n\nBy continuing to use the app after updates, users agree to the modified terms.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                '8. **Limitation of Liability**',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'DAMELIFE and NDMU shall not be held liable for any indirect, incidental, or consequential damages arising out of the use or inability to use the app.\n\nUse of DAMELIFE is at the user\'s sole risk.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 10),
              Text(
                '9. **Governing Law**',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'These Terms of Service shall be governed by and interpreted in accordance with the laws of the Republic of the Philippines and the regulations set forth by Notre Dame of Marbel University.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              SizedBox(height: 20),
              Divider(height: 40, thickness: 1),

              Center(
                child: Text(
                  'Contact Information\nFor concerns, inquiries, or feedback regarding these Terms of Service, users may contact the DAMELIFE Support Center through the app’s Feedback & Support section.',
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
