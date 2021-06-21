// Custom Exceptions

// Negative Price,quantity 
class NegatiePricQuantityException implements Exception{
  String errorMessaage(){
    return "Can not negative";
  }
}

// Format of input is wrong
class IncorrectFormatPriceQuantity implements Exception{
  String errorMessaage(){
    return "Value is not corret";
  }
}