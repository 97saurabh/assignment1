import 'dart:io';

import 'exceptions.dart';
import 'utility_functions.dart';
import '../models/Item.dart';
import 'factroy_class.dart';
import 'messages.dart';
import 'basic_utility.dart';

// This is Utility function for Input and Output from CMD
class CommandPromptUtility {

static final CommandPromptUtility _CommandPromptUtility = CommandPromptUtility._internal();

  factory CommandPromptUtility() {
    return _CommandPromptUtility;
  }

  CommandPromptUtility._internal();



  String name,type;
  double price;
  int quantity;
  var data,parser = BasicUtility.getInstanceOfParcer();
  List<String> args;
  String help = "-n,--name Provide Name of item\n" +
                "-p,--price Provide price of item ( can not be negative and 0 )"+
                "-q,--quantity Provide price of item ( can not be negative and 0 )"+
                "-t,--type Provide type of item, it includes only ['raw','imported','manufactured']";
  
  void InputOutputUtility(args){
    while(true){
    
    this.args = args;
    if (_validation()){

      // todo code here
      data = parser.parse(args);
      name = data['name'];
      price = double.tryParse(data['price']);
      quantity = int.parse(data['quantity']);
      type = data['type'];

      Item item = FactoryItem.getInstance(name: name,itemQuantity: quantity,itemType: type,price: price);
      print(item.totalCost());
      

    }
    else{
      print(help);
    }

    stdout.write("Do you want to enter details of any other item (y/n): ");
    String inputText = stdin.readLineSync();
      if (inputText != "y")
        break;
    stdout.write("Fill details of Item: ");
    String arguments = stdin.readLineSync();
    args = arguments.split(" ");

  }  
  }

  
  
  
  
  // validating given inputs
  bool _validation(){

    try {
      data = parser.parse(args);
      if (data['name'] == null || data['price'] == null || data['quantity'] == null  || data['type'] == null ){
        throw FormatException();
      }

      if (! isNumeric(data['price']) || ! isNumeric(data['quantity'])){
        throw IncorrectFormatPriceQuantity();
      }
    
      name = data['name'];
      price = double.tryParse(data['price']);
      quantity = int.parse(data['quantity']);
      type = data['type'];
      
      // if user provide 0 or negative values for price and quantity
      if (price <=0 || quantity <= 0)
        throw NegatiePricQuantityException();
      return true;
      


    } on FormatException{
     
     print(message['FormatException']);
    } on NegatiePricQuantityException{
      print(message['NegativePriceQuantity']);
    
    } on IncorrectFormatPriceQuantity{
      print(message['IncorrectFormatPriceQuantity']);
    }
    catch(e){
      print(message['SomethingWentWrong']);
   }
   return false;
    

  }
}