import 'dart:io';

import 'courses.dart';
import 'validations.dart';

class ValidateCredentials {
  String? userName;
  String? Password;
  String? ConfirmedPassword;
  String? RegNumer;
  String? StaffCode;
  String email = 'Default@gmail.com';

  void singUp(String type) {
    if (type == "Student") {
      this.userName = Validator.validaUserName("User Name");
      this.Password = Validator.validaUserName("Password");
      while (this.userName == this.Password) {
        print("Invalid Password . Password Can never be equalt to user name");
        this.Password = Validator.validaUserName("Password");
      }

      this.RegNumer = Validator.validateInput("rg number");
      this.email = Validator.validaUserName("E mail");
      while (!Validator.isEmail(this.email) ||
          this.email == 'Default@gmail.com') {
        print("Invalid Email");
        this.email = Validator.validaUserName("E mail");
      }

      print("Congulatilations You Have Succesfully Created Your Account");
      studentSignIn();
    }

    if (type == "staff") {
      this.userName = Validator.validaUserName("User Name");
      this.StaffCode = Validator.validaUserName("Staff Code");

      this.email = Validator.validaUserName("E mail");
      while (!Validator.isEmail(this.email) ||
          this.email == 'Default@gmail.com') {
        print("Invalid Email");
        this.email = Validator.validaUserName("E mail");
      }

      print("Congulatilations You Have Succesfully Created Your Account");
      // signIn();
    }
  }

  void studentSignIn() {
    bool isRunning = true;
    while (isRunning) {
      String userName = Validator.validaUserName("User Name");
      String Password = Validator.validaUserName("Password");
      String RegNumer = Validator.validateInput("rg number");

      if (userName != this.userName) {
        print("Username did not match ");
        continue;
      }
      if (Password != this.Password) {
        print("Username did not match ");
        continue;
      }
      if (RegNumer != this.RegNumer) {
        print("Username did not match ");
        continue;
      }

      print("You Have Succesifully log in");
      isRunning = false;
    }

    studentMenu();
  }

  void studentMenu() {
    while (true) {
      print("You Are Higly welcome to our portals");
      print("""
           CHOSE THE ACTIVITES YOU WANT PERFORM
           1. COURSE REGISTRATIONS
           2. CHACKING RESULT
           3. STUDENT DASHBORD
           3. EXIT
            """);

      stdout.write("Enter your Prefered options");
      String input = stdin.readLineSync()!;
      switch (input) {
        case '1':
          Course course = new Course();
          course.makeRegistrations();
          break;
        case '2':
          print("result");
          break;
        case '3':
          print("Dashbord");
          break;
        default:
          print("Invalid Options");
      }
    }
  }
}
