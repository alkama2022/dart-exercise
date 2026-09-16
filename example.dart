import 'dart:io';

void main() {
  stdout.write('Enter temperature value : ');
  int? temperature = int.parse(stdin.readLineSync()!);
  stdout.write('Enter the unit of temperature (C/F) : ');
  String? unit = stdin.readLineSync();

  if (unit == 'C' || unit == 'c') {
    double frenheit = (temperature * 9 / 5) + 32;
    print("the result of $temperature C is $frenheit F");
  } else if (unit == 'F' || unit == 'f') {
    double celsius = (temperature - 32) * 5 / 9;
    print("the result of $temperature F is $celsius C");
  } else {
    print(
      "Invalid unit of temperature. Please enter 'C' for Celsius or 'F' for Fahrenheit.",
    );
  }
}
