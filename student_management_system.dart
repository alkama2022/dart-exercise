import 'dart:io';

void main() {
  List<Map<String, dynamic>> students = [];

  chooseFromMenu(students);
}

// ============================================================
// MENU
// ============================================================

void displayMenu() {
  print('''
========================================
       STUDENT MANAGEMENT SYSTEM
========================================

1. Add Student
2. View Students
3. Search Student
4. Update Student
5. Delete Student
6. Calculate Average
7. Show Best Student
8. Exit

========================================
''');
}

void chooseFromMenu(List<Map<String, dynamic>> students) {
  while (true) {
    displayMenu();

    stdout.write('Enter your choice (1-8): ');
    String choice = stdin.readLineSync()?.trim() ?? '';

    switch (choice) {
      case '1':
        addStudentToList(students);
        break;

      case '2':
        viewStudents(students);
        break;

      case '3':
        searchStudent(students);
        break;

      case '4':
        updateStudent(students);
        break;

      case '5':
        deleteStudent(students);
        break;

      case '6':
        calculateAverage(students);
        break;

      case '7':
        showBestStudent(students);
        break;

      case '8':
        print('\nExiting the program. Goodbye!');
        exit(0);

      default:
        print('\nInvalid choice. Please enter a number between 1 and 8.');
    }
  }
}

// ============================================================
// ADD STUDENT
// ============================================================

Map<String, dynamic> addStudent() {
  print('\n========== ADD STUDENT ==========');

  String name = validateInput('Student name');

  String rgNumber = validateInput('RG number');

  String course = validateInput('Course');

  String department = validateInput('Department');

  int age = validateNumber('age', min: 10, max: 100);

  int numberOfCourses = validateNumber('number of courses', min: 1, max: 20);

  return {
    'name': name,
    'rgNumber': rgNumber,
    'course': course,
    'department': department,
    'age': age,
    'numberOfCourses': numberOfCourses,
  };
}

void addStudentToList(List<Map<String, dynamic>> students) {
  Map<String, dynamic> student = addStudent();

  String rgNumber = student['rgNumber'];

  // Check if RG number already exists
  if (rgExists(students, rgNumber)) {
    print('\nA student with RG number $rgNumber already exists.');
    return;
  }

  students.add(student);

  print('\nStudent added successfully!');
}

// ============================================================
// VIEW STUDENTS
// ============================================================

void viewStudents(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print('\nNo students found.');
    return;
  }

  print('\n========== LIST OF STUDENTS ==========');

  for (int i = 0; i < students.length; i++) {
    Map<String, dynamic> student = students[i];

    print('''
----------------------------------------
Student ${i + 1}
----------------------------------------
Name             : ${student['name']}
RG Number        : ${student['rgNumber']}
Course           : ${student['course']}
Department       : ${student['department']}
Age              : ${student['age']}
Number of Courses: ${student['numberOfCourses']}
''');
  }
}

// ============================================================
// SEARCH STUDENT
// ============================================================

void searchStudent(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print('\nNo students found.');
    return;
  }

  print('''
========== SEARCH STUDENT ==========

1. Search by Name
2. Search by RG Number
3. Back
''');

  stdout.write('Enter your choice: ');
  String choice = stdin.readLineSync()?.trim() ?? '';

  switch (choice) {
    case '1':
      searchByName(students);
      break;

    case '2':
      searchByRgNumber(students);
      break;

    case '3':
      return;

    default:
      print('\nInvalid choice.');
  }
}

void searchByName(List<Map<String, dynamic>> students) {
  String search = validateInput('student name');

  List<Map<String, dynamic>> results = students.where((student) {
    String name = student['name'].toString().toLowerCase();

    return name.contains(search.toLowerCase());
  }).toList();

  if (results.isEmpty) {
    print('\nNo student found with the name "$search".');
    return;
  }

  print('\n========== SEARCH RESULTS ==========');

  for (var student in results) {
    displayStudent(student);
  }
}

void searchByRgNumber(List<Map<String, dynamic>> students) {
  String rgNumber = validateInput('RG number');

  Map<String, dynamic> student = students.firstWhere(
    (student) =>
        student['rgNumber'].toString().toLowerCase() == rgNumber.toLowerCase(),
    orElse: () => {},
  );

  if (student.isEmpty) {
    print('\nStudent not found.');
    return;
  }

  print('\n========== STUDENT FOUND ==========');

  displayStudent(student);
}

// ============================================================
// DISPLAY ONE STUDENT
// ============================================================

void displayStudent(Map<String, dynamic> student) {
  print('''
----------------------------------------
Name             : ${student['name']}
RG Number        : ${student['rgNumber']}
Course           : ${student['course']}
Department       : ${student['department']}
Age              : ${student['age']}
Number of Courses: ${student['numberOfCourses']}
----------------------------------------
''');
}

// ============================================================
// FIND STUDENT
// ============================================================

Map<String, dynamic> findingStudent(List<Map<String, dynamic>> students) {
  String rgNumber = validateInput('RG number');

  return students.firstWhere(
    (student) =>
        student['rgNumber'].toString().toLowerCase() == rgNumber.toLowerCase(),
    orElse: () => {},
  );
}

// ============================================================
// UPDATE STUDENT
// ============================================================

void updateStudent(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print('\nNo students found.');
    return;
  }

  print('\n========== UPDATE STUDENT ==========');

  Map<String, dynamic> student = findingStudent(students);

  if (student.isEmpty) {
    print('\nStudent not found.');
    return;
  }

  updateStudentRecord(student);
}

void updateStudentRecord(Map<String, dynamic> student) {
  while (true) {
    print('''
========== UPDATE MENU ==========

1. Update Name
2. Update RG Number
3. Update Course
4. Update Department
5. Update Age
6. Update Number of Courses
7. Update All
8. Back
''');

    stdout.write('Enter your choice: ');
    String choice = stdin.readLineSync()?.trim() ?? '';

    switch (choice) {
      case '1':
        student['name'] = validateInput('Student name');
        print('\nName updated successfully!');
        break;

      case '2':
        String newRgNumber = validateInput('RG number');
        student['rgNumber'] = newRgNumber;
        print('\nRG number updated successfully!');
        break;

      case '3':
        student['course'] = validateInput('Course');
        print('\nCourse updated successfully!');
        break;

      case '4':
        student['department'] = validateInput('Department');
        print('\nDepartment updated successfully!');
        break;

      case '5':
        student['age'] = validateNumber('age', min: 10, max: 100);
        print('\nAge updated successfully!');
        break;

      case '6':
        student['numberOfCourses'] = validateNumber(
          'number of courses',
          min: 1,
          max: 20,
        );
        print('\nNumber of courses updated successfully!');
        break;

      case '7':
        updateAllStudentFields(student);
        break;

      case '8':
        return;

      default:
        print('\nInvalid choice.');
    }
  }
}

void updateAllStudentFields(Map<String, dynamic> student) {
  print('\n========== UPDATE ALL FIELDS ==========');

  student['name'] = validateInput('Student name');

  student['rgNumber'] = validateInput('RG number');

  student['course'] = validateInput('Course');

  student['department'] = validateInput('Department');

  student['age'] = validateNumber('age', min: 10, max: 100);

  student['numberOfCourses'] = validateNumber(
    'number of courses',
    min: 1,
    max: 20,
  );

  print('\nStudent record updated successfully!');
}

// ============================================================
// DELETE STUDENT
// ============================================================

void deleteStudent(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print('\nNo students found.');
    return;
  }

  print('\n========== DELETE STUDENT ==========');

  Map<String, dynamic> student = findingStudent(students);

  if (student.isEmpty) {
    print('\nStudent not found.');
    return;
  }

  displayStudent(student);

  stdout.write('Are you sure you want to delete this student? (y/n): ');
  String confirmation = stdin.readLineSync()?.trim().toLowerCase() ?? '';

  if (confirmation == 'y' || confirmation == 'yes') {
    students.remove(student);

    print('\nStudent record deleted successfully!');
  } else {
    print('\nDelete operation cancelled.');
  }
}

// ============================================================
// CALCULATE AVERAGE
// ============================================================

void calculateAverage(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print('\nNo students found.');
    return;
  }

  double total = 0;

  for (var student in students) {
    total += student['numberOfCourses'];
  }

  double average = total / students.length;

  print('\n========== AVERAGE ==========');
  print('Average number of courses: ${average.toStringAsFixed(2)}');
}

// ============================================================
// SHOW BEST STUDENT
// ============================================================

void showBestStudent(List<Map<String, dynamic>> students) {
  if (students.isEmpty) {
    print('\nNo students found.');
    return;
  }

  /*
    Since our current student record does not contain grades,
    we cannot determine the academically best student.

    For now, we will demonstrate finding the student
    with the highest number of courses.
  */

  Map<String, dynamic> bestStudent = students.reduce((current, next) {
    if (current['numberOfCourses'] > next['numberOfCourses']) {
      return current;
    } else {
      return next;
    }
  });

  print('\n========== BEST STUDENT ==========');

  print('Student with the highest number of courses:');

  displayStudent(bestStudent);
}

// ============================================================
// CHECK DUPLICATE RG NUMBER
// ============================================================

bool rgExists(List<Map<String, dynamic>> students, String rgNumber) {
  return students.any(
    (student) =>
        student['rgNumber'].toString().toLowerCase() == rgNumber.toLowerCase(),
  );
}

// ============================================================
// STRING VALIDATION
// ============================================================

String validateInput(String inputType) {
  while (true) {
    stdout.write('Enter $inputType: ');

    String input = stdin.readLineSync()?.trim() ?? '';

    // Check empty input
    if (input.isEmpty) {
      stdout.writeln(
        '$inputType cannot be empty. '
        'Please enter a valid $inputType.',
      );
      continue;
    }

    // Check minimum length
    if (input.length < 3) {
      stdout.writeln(
        '$inputType must be at least 3 characters long. '
        'Please enter a valid $inputType.',
      );
      continue;
    }

    // Validate RG number
    if (inputType.toLowerCase() == 'rg number') {
      bool validRgNumber = RegExp(
        r'^CST/\d{2}/(IFT|COM|CBS|SWE)/\d{5}$',
        caseSensitive: false,
      ).hasMatch(input);

      if (!validRgNumber) {
        stdout.writeln(
          'Invalid RG number.\n'
          'Expected format: CST/22/IFT/2024\n'
          'Departments: IFT, COM, CBS, SWE',
        );
        continue;
      }
    }

    return input;
  }
}

// ============================================================
// NUMBER VALIDATION
// ============================================================

int validateNumber(String inputType, {int? min, int? max}) {
  while (true) {
    stdout.write('Enter $inputType: ');

    String input = stdin.readLineSync()?.trim() ?? '';

    if (input.isEmpty) {
      stdout.writeln(
        '$inputType cannot be empty. '
        'Please enter a valid $inputType.',
      );
      continue;
    }

    int? number = int.tryParse(input);

    if (number == null) {
      stdout.writeln('Invalid number. Please enter a valid number.');
      continue;
    }

    if (min != null && number < min) {
      stdout.writeln('$inputType must be at least $min.');
      continue;
    }

    if (max != null && number > max) {
      stdout.writeln('$inputType cannot be greater than $max.');
      continue;
    }

    return number;
  }
}
