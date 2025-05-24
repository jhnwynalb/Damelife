import 'package:damelife_sample2/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class signup_screen extends StatefulWidget {
  const signup_screen({super.key});

  @override
  _signup_screenState createState() => _signup_screenState();
}

class _signup_screenState extends State<signup_screen> {
  String? selectedCollege;
  String? selectedProgram;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  final Map<String, List<String>> collegePrograms = {
    'College of Engineering, Architecture, and Computing': [
      'BS in Computer Engineering',
      'BS in Architecture',
      'BS in Civil Engineering',
      'BS in Computer Science',
      'BS in Electrical Engineering',
      'BS in Electronics Engineering',
      'BS in Information Technology',
      'BS in Library and Information Science',
    ],
    'College of Education': [
      'BS in Elementary Education',
      'BS in Secondary Education',
      'BS in Secondary Education– Major in English',
      'BS in Secondary Education– Major in Filipino',
      'BS in Secondary Education– Major in Mathematics',
      'BS in Secondary Education– Major in Religious Education',
      'BS in Secondary Education– Major in Science',
      'BS in Secondary Education– Major in Social Studies',
      'BS Physical Education',
    ],
    'College of Arts and Science': [
      'BA in Philosophy',
      'BA in Psychology',
      'BA in Political Science',
      'BA in Communication',
      'BS in Biology',
      'BS in Chemistry',
      'BS in Environmental Science',
      'BS in Criminology',
      'BS in Medical Technology',
      'BS in Nursing',
      'BS in Social Work',
    ],
    'College of Business Administration': [
      'BS in Accountancy',
      'BS in Management Accounting',
      'BS in Business Administration- HDRM',
      'BS in Business Administration- FM',
      'BS in Business Administration- MM',
      'BS in Hospitality Management',
    ],
  };

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool _isConfirmPasswordValid() {
    return _passwordController.text == _confirmPasswordController.text && _confirmPasswordController.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 255, 255, 255),
                  blurRadius: 1,
                ),
              ],
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Welcomescreen()),
              );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 1, 135, 1),
                    Color.fromARGB(255, 0, 64, 1),
                    Color.fromARGB(255, 0, 34, 5),
                  ],
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 120.0, left: 25),
                child: Text(
                  'Create your\nAccount.',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                width: double.infinity,
                height: 650,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      TextField(
                        controller: _nameController,
                        onChanged: (_) => setState(() {}),
                        decoration: InputDecoration(
                          suffixIcon: _nameController.text.isNotEmpty
                              ? const Icon(Icons.check, color: Colors.grey, size: 18)
                              : null,
                          label: const Text(
                            'STUDENT NAME',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 55, 1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _idController,
                        onChanged: (_) => setState(() {}),
                        decoration: InputDecoration(
                          suffixIcon: _idController.text.isNotEmpty
                              ? const Icon(Icons.check, color: Colors.grey, size: 18)
                              : null,
                          label: const Text(
                            'ID NUMBER',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 55, 1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        value: selectedCollege,
                        items: collegePrograms.keys.map((college) {
                          return DropdownMenuItem(
                            value: college,
                            child: Text(college),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCollege = value;
                            selectedProgram = null;
                          });
                        },
                        decoration: const InputDecoration(
                          label: Text(
                            'COLLEGE',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 55, 1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        value: selectedProgram,
                        items: (selectedCollege != null)
                            ? collegePrograms[selectedCollege]!
                                .map((program) => DropdownMenuItem(
                                      value: program,
                                      child: Text(program),
                                    ))
                                .toList()
                            : [],
                        onChanged: (value) {
                          setState(() {
                            selectedProgram = value;
                          });
                        },
                        decoration: const InputDecoration(
                          label: Text(
                            'PROGRAM',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 55, 1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _passwordController,
                        obscureText: !_passwordVisible,
                        onChanged: (_) => setState(() {}),
                        decoration: InputDecoration(
                          suffixIcon: _passwordController.text.isNotEmpty
                              ? IconButton(
                                  icon: Icon(
                                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.grey,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                )
                              : null,
                          label: const Text(
                            'PASSWORD',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 55, 1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _confirmPasswordController,
                        obscureText: !_confirmPasswordVisible,
                        onChanged: (_) => setState(() {}),
                        decoration: InputDecoration(
                          suffixIcon: _confirmPasswordController.text.isNotEmpty
                              ? _isConfirmPasswordValid()
                                  ? const Icon(Icons.check, color: Colors.grey, size: 18)
                                  : IconButton(
                                      icon: Icon(
                                        _confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                        color: Colors.grey,
                                        size: 18,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _confirmPasswordVisible = !_confirmPasswordVisible;
                                        });
                                      },
                                    )
                              : null,
                          label: const Text(
                            'CONFIRM PASSWORD',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 55, 1),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 45),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => login_screen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 1, 135, 1),
                                Color.fromARGB(255, 0, 64, 1),
                                Color.fromARGB(255, 0, 34, 5),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.white),
                          ),
                          child: const Center(
                            child: Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Already have an account?',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const login_screen(),
                                  ),
                                );
                              },
                              child: Container(
                                width: 150,
                                height: 40,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 1, 135, 1),
                                      Color.fromARGB(255, 0, 64, 1),
                                      Color.fromARGB(255, 0, 34, 5),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    'SIGN IN',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
