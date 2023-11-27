import 'package:flutter/material.dart';

class Subject {
  String title;
  String code;
  String grades;
  double credits;
  double totalCredits = 0.0;
  double totalGradePoints = 0.0;

  Subject({
    required this.title,
    required this.code,
    required this.grades,
    required this.credits,
  });
}

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CGPA CALCULATOR',
      home: CGPACalculator(),
    );
  }
}

class CGPACalculator extends StatefulWidget {
  const CGPACalculator({Key? key}) : super(key: key);

  @override
  _CGPACalculatorState createState() => _CGPACalculatorState();
}

class _CGPACalculatorState extends State<CGPACalculator> {
  List<String> courseTitles = [
    'BIO',
    'BIOT',
    'BITS',
    'CE',
    'CHE',
    'CHEM',
    'CS',
    'DE',
    'ECE',
    'ECON',
    'EE',
    'EEE',
    'FIN',
    'GS',
    'HSS',
    'HUM',
    'INSTR',
    'ITEB',
    'MATH',
    'ME',
    'MEN',
    'MF',
    'MPBA',
    'MSE',
    'MUSIC',
    'PHA',
    'PHY',
    'POL',
    'SAN',
    'SS'
  ];

  Map<String, List<String>> courseCode = {
    'BIO': ['Select','F110', 'F111', 'F211', 'F212', 'F213', 'F214', 'F266', 'F311', 'F312', 'F313', 'F366', 'F367', 'F376', 'F377', 'F417', 'F418', 'F421', 'F491', 'G512', 'G514', 'G523', 'G524', 'G525', 'G526', 'G532', 'G542'],
    'BIOT': ['Select','F424'],
    'BITS': ['Select','C790T', 'C791T', 'C797T', 'C799T', 'E574', 'E584', 'E594', 'E793T', 'F110', 'F111', 'F112', 'F113', 'F218', 'F219', 'F225', 'F314', 'F324', 'F326', 'F343', 'F385', 'F415', 'F428', 'F429', 'F437', 'F446', 'F451', 'F452', 'F462', 'F464', 'F467', 'F468', 'F482', 'F494', 'G511', 'G513', 'G529', 'G539', 'G540', 'G553', 'G561T', 'G562T', 'G563T', 'G629T', 'G649', 'G661', 'N301T'],
    'CE': ['Select','F211', 'F212', 'F213', 'F214', 'F266', 'F311', 'F312', 'F313', 'F314', 'F366', 'F367', 'F376', 'F377', 'F411', 'F421', 'F422', 'F491', 'F497', 'F211', 'F213', 'F230', 'F231', 'F266', 'F312', 'F313', 'F320', 'F324', 'F325', 'F366', 'F367', 'F376', 'F377', 'F417', 'F419', 'F431', 'F434', 'F491', 'G515', 'G523', 'G525', 'G527', 'G534', 'G545', 'G547', 'G549', 'G551', 'G552', 'G565', 'G567', 'G568', 'G612', 'G614', 'G616', 'G617', 'G619', 'G620',],
    'CHE': ['Select','F211', 'F212', 'F213', 'F214', 'F266', 'F311', 'F312', 'F313', 'F314', 'F366', 'F367', 'F376', 'F377', 'F411', 'F421', 'F422', 'F491', 'F497', 'G513', 'G523', 'G558','G622'],
    'CHEM': ['Select','F110', 'F111', 'F211', 'F212', 'F213', 'F214', 'F311', 'F312', 'F313', 'F323', 'F327', 'F333', 'F335', 'F337', 'F422', 'G521', 'G551', 'G553'],
    'CS': ['Select','F111', 'F213', 'F214', 'F215', 'F222', 'F301', 'F320', 'F342', 'F351', 'F372', 'F407', 'F415', 'F425', 'F426', 'F429', 'F441', 'F451', 'G514', 'G518', 'G519', 'G525', 'G526', 'G527', 'G623'],
    'DE': ['Select','G513', 'G531', 'G611', 'G631'],
    'ECE': ['Select','F212', 'F214', 'F215', 'F266', 'F311', 'F312', 'F314', 'F366', 'F367', 'F376', 'F377', 'F434'],
    'ECON': ['Select','F211', 'F212', 'F213', 'F214', 'F241', 'F311', 'F312', 'F313', 'F315', 'F354', 'F355', 'F412', 'F414', 'F415'],
    'EE': ['Select','G501'],
    'EEE': ['Select','F111', 'F211', 'F212', 'F214', 'F215', 'F245', 'F266', 'F311', 'F313', 'F366', 'F367', 'F376', 'F377', 'F411', 'F422', 'F426', 'F434', 'F435', 'F472', 'F491', 'G512', 'G513', 'G581', 'G591', 'G595', 'G612', 'G613', 'G614', 'G626'],
    'FIN': ['Select','F212', 'F315', 'F414'],
    'GS': ['Select','F211', 'F212', 'F213', 'F221', 'F222', 'F223', 'F224', 'F232', 'F266', 'F311', 'F312', 'F313', 'F321', 'F322', 'F331', 'F366', 'F376', 'F377', 'F491'],
    'HSS': ['Select','F221', 'F222', 'F223', 'F224', 'F227', 'F235', 'F236', 'F266', 'F323', 'F325', 'F328', 'F329', 'F334', 'F343', 'F346'],
    'HUM': ['Select','F412'],
    'INSTR': ['Select','F211', 'F212', 'F214', 'F215', '266', 'F311', 'F312', 'F313', 'F366', 'F376', 'F377'],
    'ITEB': ['Select','G621'],
    'MATH': ['Select','F111', 'F211', 'F212', 'F213', 'F214', 'F215', 'F266', 'F311', 'F312', 'F313', 'F366', 'F376', 'F377', 'F421', 'F432', 'F441', 'F444', 'F491'],
    'ME': ['Select','F112', 'F211', 'F212', 'F216', 'F217', 'F314', 'F315', 'F316', 'F317', 'F340', 'F414', 'F415', 'F420', 'F443', 'F461'],
    'MEL': ['Select','G611', 'G621;', 'G623', 'G624', 'G626', 'G631', 'G611', 'G621', 'G623', 'G624', 'G626', 'G631', 'G611', 'G621', 'G623'],
    'MF': ['Select','F211', 'F216', 'F217', 'F218', 'F314', 'F315', 'F316', 'F319', 'F421', 'F422', 'F485', 'F211', 'F216', 'F217', 'F218'],
    'MPBA': ['Select','G501', 'G502', 'G503', 'G504', 'G505', 'G506', 'G507', 'G514', 'G515', 'G517', 'G518', 'G520', 'G523'],
    'MSE': ['Select','G512', 'G521'],
    'MUSIC': ['Select','N113T', 'N114T'],
    'PHA': ['Select','F211', 'F242', 'F266', 'F311', 'F312', 'F313', 'F315', 'F366', 'F367', 'F376', 'F377', 'F413', 'F415', 'F491', 'G532'],
    'PHY': ['Select','F110', 'F111', 'F112', 'F211', 'F212', 'F213', 'F214', 'F266', 'F311', 'F312', 'F313', 'F366', 'F367', 'F376', 'F377', 'F379', 'F413', 'F414', 'F421'],
    'POL': ['Select','F491'],
    'SAN': ['Select','G511'],
    'SS': ['Select','G514', 'G552', 'G562'],
  };

  List<String> grades = ['A', 'A-', 'B', 'B-', 'C', 'C-', 'D', 'D-', 'E', 'NC'];
  List<String> semester = [
    'Semester 1',
    'Semester 2',
    'Semester 3',
    'Semester 4',
    'Semester 5',
    'Semester 6',
    'Semester 7',
    'Semester 8',
    'Semester 9',
    'Semester 10'
  ];
  List<int> credits = [1, 2, 3, 4, 5, 6];
  List<Subject> subjects = [];
  String selectedSemester = 'Semester 1';
  String selectedCourseTitle = 'BIO';
  String selectedCourseCode = 'Select';
  String selectedGrade = 'A';
  String selectedCredits = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CGPA CALCULATOR'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            const SizedBox(),
            DropdownButton<String>(
              value: selectedSemester,
              onChanged: (String? newValue) {
                setState(() {
                  selectedSemester = newValue!;
                });
              },
              items: semester.map<DropdownMenuItem<String>>(
                    (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
            const SizedBox(),
            DropdownButton<String>(
              value: selectedCourseTitle,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCourseTitle = newValue!;
                });
              },
              items: courseTitles.map<DropdownMenuItem<String>>(
                    (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
            const SizedBox(),
            DropdownButton<String>(
              value: selectedCourseCode,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCourseCode = newValue!;
                });
              },
              items: courseCode[selectedCourseTitle]!.map<DropdownMenuItem<String>>(
                    (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
            const SizedBox(),
            DropdownButton<String>(
              value: selectedGrade,
              onChanged: (String? newValue) {
                setState(() {
                  selectedGrade = newValue!;
                });
              },
              items: grades.map<DropdownMenuItem<String>>(
                    (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                },
              ).toList(),
            ),
            const SizedBox(),
            DropdownButton<String>(
              value: selectedCredits,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCredits = newValue!;
                });
              },
              items: credits.map<DropdownMenuItem<String>>(
                    (int value) {
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(value.toString()),
                  );
                },
              ).toList(),
            ),
            Row(
              children: [
                Expanded(
                    child:
                    ElevatedButton(
                      onPressed: () {
                        Set<String> selectedSet = {
                          selectedSemester,
                          selectedCourseTitle,
                          selectedCourseCode,
                          selectedGrade,
                          selectedCredits,
                        };
                        print('Added Subject: $selectedSet');

                        // Add the subject to the list
                        addSubject();

                        // Clear the selected values after adding a subject
                        resetDropdownValues();
                      },
                      child: const Text('Add Subject'),
                    ),
                ),
                Expanded(
                    child:
                    ElevatedButton(
                      onPressed: () {
                        String cgpa =
                        calculateCGPA(selectedGrade).toStringAsFixed(2);
                        cgcalculate();
                      },
                      child: const Text('Calculate CGPA'),
                    )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  updateCourseCode() {
    selectedCourseCode = courseCode[selectedCourseTitle]!.first;
  }

  resetDropdownValues() {
    setState(() {
      selectedSemester = 'Semester 1';
      selectedCourseTitle = 'BIO';
      updateCourseCode(); // Update the course code when resetting
      selectedGrade = 'A';
      selectedCredits = '1';
    });
  }

  void addSubject() {
    if (selectedCourseTitle.isNotEmpty &&
        selectedCourseCode.isNotEmpty &&
        selectedGrade.isNotEmpty &&
        selectedCredits.isNotEmpty) {
      subjects.add(
        Subject(
          title: selectedCourseTitle,
          code: selectedCourseCode,
          credits: double.parse(selectedCredits),
          grades: selectedGrade,
        ),
      );

      // To clear the selected values after adding a subject
    }
  }

  void cgcalculate() {
    setState(() {
      selectedCourseTitle = courseTitles.first;
      selectedCourseCode = courseCode[selectedCourseTitle]!.first;
      selectedGrade = grades.first;
      selectedCredits = credits.first.toString();
      double totalCredits = 0.0;
      double totalGradePoints = 0.0;

      for (var subject in subjects) {
        totalCredits += subject.credits;
        totalGradePoints += calculateCGPA(subject.grades) * subject.credits;
      }

      if (totalCredits == 0.0) {
        print('Add at least one subject before calculating CGPA');
        return;
      }

      double cgpa = totalGradePoints / totalCredits;
      print('Your total CGPA is: $cgpa');
      _showMessage('Your CGPA is: ${cgpa.toStringAsFixed(2)}');
    });
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 60),
    ));
  }
}


double calculateCGPA(String grade) {
  switch (grade) {
    case 'A':
      return 10.0;
    case 'A-':
      return 9.5;
    case 'B':
      return 9.0;
    case 'B-':
      return 8.5;
    case 'C':
      return 8.0;
    case 'C-':
      return 7.5;
    case 'D':
      return 7.0;
    case 'E':
      return 6.5;
    default:
      return 0.0;
  }
}

