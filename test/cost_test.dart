import 'package:test/test.dart';      
// Import the test package 
import '../Utility/factroy_class.dart';
import '../models/Item.dart';
int Add(int x,int y)  {                
// Function to be tested { 
   return x+y; 
}  
void main() { 
   // Test for Raw items 
   test("Checking Item total Cost for Raw Item:-  quantity = 1",(){

      // Always Provide data in correct format
      // View Layer will take care of Data Format Correctness.
      String name = "Books";
      int  quantity = 1;
      String type = "Raw";
      double price = 100;
      

      Item item = FactoryItem.getInstance(name: name,itemQuantity: quantity,itemType: type,price: price);
      var actual = item.totalCost();
      var expected = 112.5; // excepted answer should be this
      expect(actual,expected);
   });
   test("Checking Item total Cost for Raw Item:-  quantity = 3",(){

      // Always Provide data in correct format
      // View Layer will take care of Data Format Correctness.
      String name = "Books";
      int  quantity = 3;
      String type = "Raw";
      double price = 100;
      

      Item item = FactoryItem.getInstance(name: name,itemQuantity: quantity,itemType: type,price: price);
      var actual = item.totalCost();
      var expected = 112.5 + 112.5 + 112.5; // excepted answer should be this
      expect(actual,expected);
   });

   test("Checking Item total Cost for Raw Item:-  quantity = 2",(){

      // Always Provide data in correct format
      // View Layer will take care of Data Format Correctness.
      String name = "Books";
      int  quantity = 2;
      String type = "Raw";
      double price = 100;
      

      Item item = FactoryItem.getInstance(name: name,itemQuantity: quantity,itemType: type,price: price);
      var actual = item.totalCost();
      var expected = 225.0; // excepted answer should be this
      expect(actual,expected);
   });




   // Test for Manufactured items 
   test("Checking Item total Cost for Manufactured Item:-  quantity = 1",(){

      // Always Provide data in correct format
      // View Layer will take care of Data Format Correctness.
      String name = "Books";
      int  quantity = 1;
      String type = "Manufactured";
      double price = 100;
      

      Item item = FactoryItem.getInstance(name: name,itemQuantity: quantity,itemType: type,price: price);
      var actual = item.totalCost();
      var expected = 116.75; // excepted answer should be this
      expect(actual,expected);
   });
   test("Checking Item total Cost for Manufactured Item:-  quantity = 3",(){

      // Always Provide data in correct format
      // View Layer will take care of Data Format Correctness.
      String name = "Books";
      int  quantity = 3;
      String type = "Manufactured";
      double price = 100;
      

      Item item = FactoryItem.getInstance(name: name,itemQuantity: quantity,itemType: type,price: price);
      var actual = item.totalCost();
      var expected = 116.75 + 116.75 + 116.75; // excepted answer should be this
      expect(actual,expected);
   });

   test("Checking Item total Cost for Manufactured Item:-  quantity = 2",(){

      // Always Provide data in correct format
      // View Layer will take care of Data Format Correctness.
      String name = "Books";
      int  quantity = 2;
      String type = "Manufactured";
      double price = 100;
      

      Item item = FactoryItem.getInstance(name: name,itemQuantity: quantity,itemType: type,price: price);
      var actual = item.totalCost();
      var expected = 116.75 + 116.75; // excepted answer should be this
      expect(actual,expected);
   });







   // Test for Imported items 
   test("Checking Item total Cost for Manufactured Item:-  quantity = 1",(){

      // Always Provide data in correct format
      // View Layer will take care of Data Format Correctness.
      String name = "Books";
      int  quantity = 1;
      String type = "Imported";
      double price = 100;
      

      Item item = FactoryItem.getInstance(name: name,itemQuantity: quantity,itemType: type,price: price);
      var actual = item.totalCost();
      var expected = 130; // excepted answer should be this
      expect(actual,expected);
   });
   test("Checking Item total Cost for Manufactured Item:-  quantity = 3",(){

      // Always Provide data in correct format
      // View Layer will take care of Data Format Correctness.
      String name = "Books";
      int  quantity = 3;
      String type = "Imported";
      double price = 100;
      

      Item item = FactoryItem.getInstance(name: name,itemQuantity: quantity,itemType: type,price: price);
      var actual = item.totalCost();
      var expected = 130+130+130; // excepted answer should be this
      expect(actual,expected);
   });

   test("Checking Item total Cost for Manufactured Item:-  quantity = 2",(){

      // Always Provide data in correct format
      // View Layer will take care of Data Format Correctness.
      String name = "Books";
      int  quantity = 2;
      String type = "Imported";
      double price = 100;
      

      Item item = FactoryItem.getInstance(name: name,itemQuantity: quantity,itemType: type,price: price);
      var actual = item.totalCost();
      var expected = 130+130; // excepted answer should be this
      expect(actual,expected);
   });
  




}