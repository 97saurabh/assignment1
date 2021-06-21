 import 'Item.dart';
class ManufacturedItem extends Item{

   String itemType = 'Manufactured';
   int itemQuantity;
   double taxPercent = .02;

   ManufacturedItem({String name,double price,this.itemQuantity}) : super(name: name,price: price);

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
    double costTax = this.price + this.price*this.taxPercent;
    return (this.price + costTax + .02*(this.price+costTax))*this.itemQuantity;
  }
   
}