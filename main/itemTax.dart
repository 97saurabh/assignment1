import 'itemClass.dart';
import 'customException.dart';
import 'utilityFunction.dart' as utility;
import 'message.dart';


class TaxCalculation {

  String name,type;
  double price;
  int quantity;
  var data,parser;
  List<String> args;
  String help = "-n,--name Provide Name of item\n" +
                "-p,--price Provide price of item ( can not be negative and 0 )"+
                "-q,--quantity Provide price of item ( can not be negative and 0 )"+
                "-t,--type Provide type of item, it includes only ['raw','imported','manufactured']";
  Map<String,String> result = {
      'status' : "false"
  };
  
  TaxCalculation(List<String> args,var parser){
    this.args = args;
    this.parser = parser;
  }

  Map<String,String> itemTaxCalculation(){

    try {

      data = parser.parse(args);

      if (data['name'] == null || data['price'] == null || data['quantity'] == null  || data['type'] == null ){
        throw FormatException();
      }

      if (! utility.isNumeric(data['price']) || ! utility.isNumeric(data['quantity'])){
        throw IncorrectFormatPriceQuantity();
      }
      
      name = data['name'];
      price = double.tryParse(data['price']);
      quantity = int.parse(data['quantity']);
      type = data['type'];
      
      // if user provide 0 or negative values for price and quantity
      if (price <=0 || quantity <= 0)
        throw NegatiePricQuantityException();
      Item item = new Item(name, price, type, quantity);
      result['status'] = "true";
      result['code'] = 201.toString();
      result['name'] = item.getName();
      result['price'] = item.getPrice().toString();
      result['quantity'] = item.getQuantity().toString();
      result['cost'] = item.getFinalCost().toString();


    } on FormatException{
      result['code'] = 205.toString();
      result['message'] = message['FormatException'];
      result['help'] = this.help;
    } on NegatiePricQuantityException{
      result['code'] = 206.toString();
      result['message'] = message['NegativePriceQuantity'];
      result['help'] = parser.usage;
    
    } on IncorrectFormatPriceQuantity{
      result['code'] = 207.toString();
      result['message'] = message['IncorrectFormatPriceQuantity'];
      result['help'] = parser.usage;
    }
    catch(e){
      result['code'] = 501.toString();
      result['message'] = message['SomethingWentWrong'];
      result['help'] = parser.usage;
    
    }
    finally{
      return result;
    }

  }
}