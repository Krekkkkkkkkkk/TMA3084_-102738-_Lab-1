import 'dart:io';

void main() {
  print('=============================');
  print('     PIZZA ORDER SYSTEM');
  print('=============================');
  print('Prices:');
  print('  Small  (S) = 5 USD');
  print('  Medium (M) = 7 USD');
  print('  Large  (L) = 10 USD');
  print('=============================');

  bool ordering = true;

  while (ordering) {
    // Input validation loop for pizza size
    int pricePerPizza = 0;
    String sizeName = '';

    while (pricePerPizza == 0) {
      stdout.write('\nEnter pizza size (S/M/L): ');
      String size = (stdin.readLineSync() ?? '').trim().toUpperCase();

      switch (size) {
        case 'S':
          pricePerPizza = 5;
          sizeName = 'Small';
          break;
        case 'M':
          pricePerPizza = 7;
          sizeName = 'Medium';
          break;
        case 'L':
          pricePerPizza = 10;
          sizeName = 'Large';
          break;
        default:
          print('Invalid size! Please enter S, M, or L.');
      }
    }

    int quantity = 0;
    while (quantity <= 0) {
      stdout.write('Enter quantity: ');
      String? input = stdin.readLineSync();
      int? parsed = int.tryParse((input ?? '').trim());

      if (parsed == null || parsed <= 0) {
        print('Invalid quantity! Please enter a whole number greater than 0.');
      } else {
        quantity = parsed;
      }
    }

    int total = pricePerPizza * quantity;
    print('\n----------- ORDER SUMMARY -----------');
    print('Size     : $sizeName ($pricePerPizza USD each)');
    print('Quantity : $quantity');
    print('Total    : $total USD');
    print('-------------------------------------');

    String answer = '';
    while (answer != 'Y' && answer != 'N') {
      stdout.write('\nDo you want to place another order? (Y/N): ');
      answer = (stdin.readLineSync() ?? '').trim().toUpperCase();
      if (answer != 'Y' && answer != 'N') {
        print('Please enter Y or N.');
      }
    }

    if (answer == 'N') {
      ordering = false;
    }
  }

  print('\nThank you for ordering! Goodbye.');
}
