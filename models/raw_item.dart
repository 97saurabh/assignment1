 import 'Item.dart';
class RawItem extends Item{

   String itemType = 'Raw';
   int itemQuantity;
   double taxPercent = .125;

   RawItem({String name,double price,this.itemQuantity}) : super(name: name,price: price);

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
    return this.itemQuantity*(this.price + this.price*this.taxPercent);
  }
   
}