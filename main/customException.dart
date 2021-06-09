class NegatiePricQuantityException implements Exception{
  String errorMessaage(){
    return "Can not negative";
  }
}


class IncorrectFormatPriceQuantity implements Exception{
  String errorMessaage(){
    return "Value is not corret";
  }
}