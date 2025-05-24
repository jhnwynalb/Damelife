import 'package:flutter/material.dart';
import 'menu_page.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  int rowCount = 0;
  final List<TextEditingController> gradeControllers = [];
  final List<TextEditingController> creditControllers = [];
  double totalCredits = 0.0;
  double totalPoints = 0.0;
  double gpa = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => _askSubjectCount());
  }

  void _askSubjectCount() async {
    int subjectCount = 0;
    final controller = TextEditingController();

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text("Number of Subjects", style: TextStyle(color: Color.fromARGB(255, 19, 19, 19))),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Color.fromARGB(255, 19, 19, 19)),
          decoration: const InputDecoration(
            hintText: "Enter number of subjects",
            hintStyle: TextStyle(color: Color.fromARGB(255, 17, 17, 17)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 19, 19, 19)),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(255, 17, 17, 17), width: 2),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              subjectCount = int.tryParse(controller.text) ?? 0;
              Navigator.of(context).pop();
            },
            child: const Text("OK", style: TextStyle(color: Color.fromARGB(255, 0, 50, 2))),
          ),
        ],
      ),
    );

    if (subjectCount > 0) {
      setState(() {
        rowCount = subjectCount;
        gradeControllers.clear();
        creditControllers.clear();
        totalCredits = 0.0;
        totalPoints = 0.0;
        gpa = 0.0;
        for (int i = 0; i < rowCount; i++) {
          gradeControllers.add(TextEditingController());
          creditControllers.add(TextEditingController());
        }
      });
    }
  }

  void calculateGPA() {
  bool hasInput = false;
  totalPoints = 0;
  totalCredits = 0;

  for (int i = 0; i < rowCount; i++) {
    String gradeText = gradeControllers[i].text.trim();
    String creditText = creditControllers[i].text.trim();

    if (gradeText.isNotEmpty && creditText.isNotEmpty) {
      double? grade = double.tryParse(gradeText);
      double? credit = double.tryParse(creditText);

      if (grade != null && credit != null) {
        hasInput = true;
        totalPoints += grade * credit;
        totalCredits += credit;
      }
    }
  }

  if (!hasInput) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Please input grades and credit hours."),
        backgroundColor: Color.fromARGB(255, 42, 42, 42),
        duration: Duration(seconds: 2),
      ),
    );
    return;
  }

  gpa = totalCredits > 0 ? totalPoints / totalCredits : 0.0;
  setState(() {});
}


  Widget gradientBorderTextField(TextEditingController controller, String hint) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 1, 135, 1),
            Color.fromARGB(255, 0, 64, 1),
          ],
        ),
      ),
      padding: const EdgeInsets.all(1),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7.0),
        ),
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: hint,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          ),
        ),
      ),
    );
  }

  Widget buildRow(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(child: gradientBorderTextField(gradeControllers[index], '')),
          const SizedBox(width: 8),
          Expanded(child: gradientBorderTextField(creditControllers[index], '')),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in gradeControllers) {
      controller.dispose();
    }
    for (var controller in creditControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            'GPA Calculator',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.info_outline_rounded, color: Colors.white, size: 25),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12, 100, 12, 30),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _askSubjectCount,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 61, 4),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: const Text('New Set of Subjects', style: TextStyle(color: Colors.white)),
            ),
            Divider(height: 40,thickness: 1,),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      'Grades',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green[900]),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Credit Hours',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green[900]),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: rowCount,
                itemBuilder: (context, index) => buildRow(index),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: calculateGPA,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 61, 4),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: const Text('Calculate GPA', style: TextStyle(color: Colors.white)),
            ),
           
            Divider(height: 40, thickness: 1, ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Total Credit Hours: ${totalCredits.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 17, 17, 17),),
                  textAlign: TextAlign.start,
                ),
                Text(
                  'Total Points: ${totalPoints.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16, color: const Color.fromARGB(255, 18, 18, 18)),
                ),
                const SizedBox(height: 8),
                Text(
                  'Total GPA: ${gpa.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[900]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
