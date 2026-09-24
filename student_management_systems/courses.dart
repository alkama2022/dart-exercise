import 'validations.dart';

class Course {
  Map<String, List<Map<String, dynamic>>> courses = {};

  int totalUnitToRegisterPerSemester = 42;

  void makeRegistrations() {
    String rgNumber = Validator.validateInput("RG Number");

    int courseNumber = Validator.validateNumberOfCoursesAndUnit(
      "Courses",
      5,
      10,
    );

    List<Map<String, dynamic>> courseRecords = [];

    for (int i = 0; i < courseNumber; i++) {
      print("\nEnter information for Course ${i + 1}");

      String courseTitle = Validator.validateText("Course Title");

      String courseCode = Validator.validateText("Course Code");

      int courseUnit = Validator.validateNumberOfCoursesAndUnit("Unit", 1, 4);

      Map<String, dynamic> courseRecord = {
        "courseTitle": courseTitle,
        "courseCode": courseCode,
        "courseUnit": courseUnit,
      };

      courseRecords.add(courseRecord);
    }

    courses[rgNumber] = courseRecords;
  }
}
