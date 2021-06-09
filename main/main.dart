/*
Status Code :-
200 :- No error, EveryThing is ok
205 :- provided data is not appropiate
206 :- Negative Price or Quantity provided
207 :- price and quantity should be numeric
208 :- Something else happens
*/
import 'dart:io';
import 'package:args/args.dart';
import 'itemTax.dart';
main(List<String> args) {
  var parser;
  parser = ArgParser();
  parser.addOption('name',
          abbr:'n',
        );
  parser.addOption('price',
          abbr:'p',
        );
  parser.addOption('quantity',
          abbr:'q',
        );
  parser.addOption('type',
          abbr:'t',
          allowed: ['raw','imported','manufactured'],
        );
  while(true){
    
    Map<String,String> result;
    TaxCalculation object = TaxCalculation(args,parser);
    result = object.itemTaxCalculation();
    print(result);

    stdout.write("Do you want to enter details of any other item (y/n): ");
    String inputText = stdin.readLineSync();
      if (inputText != "y")
        break;
    stdout.write("Fill details of Item: ");
    String arguments = stdin.readLineSync();
    args = arguments.split(" ");

  }  
}


