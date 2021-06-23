abstract class Item {

  String name; 
  double  price;

  Item({this.name,this.price});

  set item_name(String name){
    this.name = name;
  }

  set item_price(double price){
    this.price = price;
  }

  String get item_name{
    return this.name;
  }

  double get item_price{
    return this.price;
  }
  double totalCost(){
    // at run time children will bve called
    return 0;  
  }

}