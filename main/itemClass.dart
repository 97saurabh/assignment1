class Item {

  final double costTax = .125;
  final double manufactureTax = .02;
  final double importedTax = .1;
  
  String _itemName;
  double _itemPrice;
  String _itemType;
  int _itemQuantity;
  double _finalCost;

  Item(String _itemName,double _itemPrice,String itemType,int itemQuantity){
    this._itemName = _itemName;
    this._itemPrice = _itemPrice;
    this._itemType = itemType;
    this._itemQuantity = itemQuantity;

    this._finalCost = _calculateFinalCost();
  }
  
  // Setters
  void setName(String _itemName){
    this._itemName = _itemName;
  }
  void setPrice(double _itemPrice){
    this._itemPrice = _itemPrice;
  }
  void setType(String itemType){
    this._itemType = itemType;
  }
  void setQuantity(int itemQuantity){
    this._itemQuantity = itemQuantity;
  }
  //Getters
  String getName(){
    return this._itemName;
  }
  double getPrice(){
    return this._itemPrice;
  }
  String getType(){
    return this._itemType;
  }
  int getQuantity(){
    return this._itemQuantity;
  }
  double getFinalCost(){
    return this._finalCost;
  }
  // Private Functions
  // Calculation of Taxes
  double _rawTax(){
    return this._itemQuantity*(this._itemPrice + this._itemPrice*this.costTax);
  }

  double _manufactoreTax(){
    double costTax = this._itemPrice + this._itemPrice*this.costTax;
    return (this._itemPrice + costTax + .02*(this._itemPrice+costTax))*this._itemQuantity;
  }
  
  double _importTax(){
    double importduty = this._itemPrice + this.importedTax*this._itemPrice;
      if (importduty <= 0){
        return importduty*this._itemQuantity;
      }
      if (importduty > 0 && importduty <= 100){
        return this._itemQuantity*(importduty + 5);
      }
      else if(importduty > 100 && importduty <= 200){
        return this._itemQuantity*(importduty + 10);
      }
      else {
        return  this._itemQuantity*(importduty + .05*importduty);
      }
  }
  // this function will be called by constructor
  double _calculateFinalCost() {
    if (this._itemType == "raw"){
        return double.parse((this._rawTax()).toStringAsFixed(2));
    }
    else if (this._itemType == "manufactured"){
        return double.parse((this._manufactoreTax()).toStringAsFixed(2));      
    }
    else if (this._itemType == "imported"){
      return double.parse((this._importTax()).toStringAsFixed(2));
    }
  return 0;
  }
}