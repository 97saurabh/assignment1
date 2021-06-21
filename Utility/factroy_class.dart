import '../models/Item.dart';
import '../models/raw_item.dart';
import '../models/manufactured_item.dart';
import '../models/imported_item.dart';

// FActroy funtion for Item
abstract class FactoryItem {

  static Item getInstance({String name,double price,int itemQuantity,String itemType}){

    switch(itemType){
      case 'Raw': return RawItem(price: price,name: name,itemQuantity: itemQuantity);
      case 'Manufactured': return ManufacturedItem(price: price,name: name,itemQuantity: itemQuantity);
      case 'Imported' : return ImportedItem(price: price,name: name,itemQuantity: itemQuantity);
      default: return  null;
    }   

  }
}