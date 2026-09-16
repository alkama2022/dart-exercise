import 'dart:io';

void main() {
  double balance = 0.00;
  bool running = true;

  while (running) {
    print('\n===== ATM =====');
    print('1. Check Balance');
    print('2. Deposit');
    print('3. Withdraw');
    print('4. Exit');

    int option = getMenuOption();

    switch (option) {
      case 1:
        checkBalance(balance);
        break;

      case 2:
        double amount = getDepositAmount();

        balance += amount;

        print('\nDeposit successful!');
        print('Deposited: \$${amount.toStringAsFixed(2)}');
        print('New balance: \$${balance.toStringAsFixed(2)}');
        break;

      case 3:
        double amount = getWithdrawAmount(balance);

        balance -= amount;

        print('\nWithdrawal successful!');
        print('Withdrawn: \$${amount.toStringAsFixed(2)}');
        print('Remaining balance: \$${balance.toStringAsFixed(2)}');
        break;

      case 4:
        print('\nThank you for using the ATM!');
        running = false;
        break;
    }
  }
}

// Get a valid menu option
int getMenuOption() {
  while (true) {
    stdout.write('\nSelect an option (1-4): ');

    String? input = stdin.readLineSync();

    int? option = int.tryParse(input ?? '');

    if (option != null && option >= 1 && option <= 4) {
      return option;
    }

    print('Invalid option.');
    print('Please enter a number between 1 and 4.');
  }
}

// Check balance
void checkBalance(double balance) {
  print('\n===== BALANCE =====');
  print('Your current balance is: \$${balance.toStringAsFixed(2)}');
}

// Get deposit amount
double getDepositAmount() {
  while (true) {
    stdout.write('\nEnter amount to deposit: ');

    String? input = stdin.readLineSync();

    double? amount = double.tryParse(input ?? '');

    if (amount == null) {
      print('Invalid amount.');
      print('Please enter a valid number.');
      continue;
    }

    if (amount <= 0) {
      print('Amount must be greater than zero.');
      continue;
    }

    return amount;
  }
}

// Get withdrawal amount
double getWithdrawAmount(double balance) {
  while (true) {
    stdout.write('\nEnter amount to withdraw: ');

    String? input = stdin.readLineSync();

    double? amount = double.tryParse(input ?? '');

    if (amount == null) {
      print('Invalid amount.');
      print('Please enter a valid number.');
      continue;
    }

    if (amount <= 0) {
      print('Amount must be greater than zero.');
      continue;
    }

    if (amount > balance) {
      print('Insufficient funds.');
      print('Your current balance is: \$${balance.toStringAsFixed(2)}');
      continue;
    }

    return amount;
  }
}
