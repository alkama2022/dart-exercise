import 'dart:io';

class General {
  void displayWelcomMenu() {
    print("""
   HELLO WELCOME TO OUR STUDENT MANAGEMENT SYSTEM
   *****************CHOOSE ONE ACTION TO DO*******************************
   1 . RIGISTER AS A STUDENT
   2 . REGISTER AS A STAFF
   3 EXIT
""");
  }

  void listenToChoice() {
    int availableRound = 3;
    while (true) {
      displayWelcomMenu();
      stdout.write("Enter Your Choise : ");
      String options = stdin.readLineSync()!;

      switch (options) {
        case "1":
          print("You Have Succesfully Registered As aStudent ");
          break;
        case "2":
          print("Congulatilations You Have Successifully Registed As staff");
        case "3":
          exit(0);
        default:
          print("Invalid Input Please enter a valid Input please");
      }

      availableRound = availableRound - 1;

      print("You Have $availableRound rounds : ");
      if (availableRound <= 0) {
        print("You have already exsusted Your avlable to to try");
        exit(0);
      }
    }
  }
}
