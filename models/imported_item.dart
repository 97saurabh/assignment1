 import 'Item.dart';
class ImportedItem extends Item{

   String itemType = 'Imported';
   int itemQuantity;
   double taxPercent = .1;

   ImportedItem({String name,double price,this.itemQuantity}) : super(name: name,price: price);

   String get item_type{
    return this.itemType;
  }

  double get item_percent{
    return this.taxPercent;
  }

  set item_percent(double taxPercent){
    this.taxPercent = taxPercent;
  }

  double totalCost(){
    double importduty = this.price + this.taxPercent*this.price;
      if (importduty <= 0){
        return importduty*this.itemQuantity;
      }
      if (importduty > 0 && importduty <= 100){
        return this.itemQuantity*(importduty + 5);
      }
      else if(importduty > 100 && importduty <= 200){
        return this.itemQuantity*(importduty + 10);
      }
      else {
        return  this.itemQuantity*(importduty + .05*importduty);
      }
  }



   
}