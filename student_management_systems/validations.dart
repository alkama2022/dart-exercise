import 'dart:io';

class Validator {
  static bool isEmail(String email) {
    return email.contains('@');
  }

  static int validateNumType(String type) {
    while (true) {
      stdout.write("Enter the number of ${type.toUpperCase()}: ");

      String input = stdin.readLineSync() ?? "";

      int? number = int.tryParse(input);

      if (number != null) {
        return number;
      }

      print("Invalid input. Please enter a valid number.");
    }
  }

  static String validateText(String type) {
    while (true) {
      stdout.write("Enter a $type: ");

      String input = stdin.readLineSync()?.trim() ?? "";

      if (input.isEmpty) {
        print("Your input is empty. Please enter a value!");
        continue;
      }

      // Course Code validation
      if (type == "Course Code") {
        if (input.length < 4) {
          print("Course code must contain at least 4 characters.");
          continue;
        }

        return input;
      }

      // Normal text validation
      if (input.length < 4) {
        print("Input must contain at least 4 characters.");
        continue;
      }

      if (RegExp(r'\d').hasMatch(input)) {
        print("Invalid input. Numbers are not allowed.");
        continue;
      }

      return input;
    }
  }

  static int validateNumberOfCoursesAndUnit(
    String type,
    int startRange,
    int endRange,
  ) {
    while (true) {
      int courseNumber = Validator.validateNumType(type);

      if (courseNumber >= startRange && courseNumber <= endRange) {
        return courseNumber;
      }

      print(
        "Invalid range. Please enter a number between "
        "$startRange and $endRange.",
      );
    }
  }

  static String validateInput(String inputType) {
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

  static String validaUserName(String inputType) {
    while (true) {
      stdout.write('Enter $inputType: ');

      String input = stdin.readLineSync()?.trim() ?? "";

      if (input.isEmpty) {
        print("Your $input is empty. Please enter a value!");
        continue;
      }
      // Normal text validation
      if (input.length < 4) {
        print("$input must contain at least 4 characters.");
        continue;
      }

      if (!RegExp(r'\d').hasMatch(input)) {
        print(
          "Invalid $input. $input Must contain both Characters and number.",
        );
        continue;
      }

      return input;
    }
  }
}
// import 'dart:io';

// class Validator {
//   static final RegExp _rgNumberPattern = RegExp(
//     r'^CST/\d{2}/(IFT|COM|CBS|SWE)/\d{5}$',
//     caseSensitive: false,
//   );

//   static final RegExp _numberPattern = RegExp(r'\d');

//   static String _readInput(String label) {
//     while (true) {
//       stdout.write('Enter $label: ');

//       final input = stdin.readLineSync()?.trim() ?? '';

//       if (input.isNotEmpty) {
//         return input;
//       }

//       stdout.writeln('$label cannot be empty.');
//     }
//   }

//   static int validateNumber(String label) {
//     while (true) {
//       final input = _readInput(label);
//       final number = int.tryParse(input);

//       if (number != null) {
//         return number;
//       }

//       stdout.writeln('Please enter a valid number.');
//     }
//   }

//   static int validateNumberInRange(
//     String label,
//     int min,
//     int max,
//   ) {
//     while (true) {
//       final number = validateNumber(label);

//       if (number >= min && number <= max) {
//         return number;
//       }

//       stdout.writeln(
//         'Please enter a number between $min and $max.',
//       );
//     }
//   }

//   static String validateText(
//     String label, {
//     int minLength = 4,
//   }) {
//     while (true) {
//       final input = _readInput(label);

//       if (input.length < minLength) {
//         stdout.writeln(
//           '$label must be at least $minLength characters long.',
//         );
//         continue;
//       }

//       if (_numberPattern.hasMatch(input)) {
//         stdout.writeln(
//           '$label cannot contain numbers.',
//         );
//         continue;
//       }

//       return input;
//     }
//   }

//   static String validateCourseCode() {
//     while (true) {
//       final input = _readInput('Course Code').toUpperCase();

//       if (input.length < 4) {
//         stdout.writeln(
//           'Course code must be at least 4 characters long.',
//         );
//         continue;
//       }

//       return input;
//     }
//   }

//   static String validateRgNumber() {
//     while (true) {
//       final input = _readInput('RG Number').toUpperCase();

//       if (_rgNumberPattern.hasMatch(input)) {
//         return input;
//       }

//       stdout.writeln(
//         'Invalid RG number.\n'
//         'Expected format: CST/22/IFT/2024\n'
//         'Departments: IFT, COM, CBS, SWE',
//       );
//     }
//   }

//   static bool isEmail(String email) {
//     return RegExp(
//       r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
//     ).hasMatch(email);
//   }
// }
