import 'package:args/args.dart';
import 'package:test/test.dart';
import '../main/itemTax.dart';

void main() {

  var parser = ArgParser();
  parser.addOption('name',
          abbr:'n',
        );
  parser.addOption('price',
          abbr:'p',
        );
  parser.addOption('quantity',
          abbr:'q',
        );
  parser.addOption('type',
          abbr:'t',
          allowed:['raw','imported','manufactured'],
        );
  
  group('Valid Cases', () {
    test('All Good Case for raw', () {
      var args = ['--name','Books','--price','250.72','--type','raw','--quantity','13'];
      TaxCalculation object = TaxCalculation(args,parser);
      var result = object.itemTaxCalculation();
      expect(result['status'],'true');
      expect(result['code'], '201');
      expect(result['cost'],'3666.78');
    });

    test('All Good Case for manufactured', () {
      var args = ['--name','Books','--price','250.72','--type','manufactured','--quantity','13'];
      TaxCalculation object = TaxCalculation(args,parser);
      var result = object.itemTaxCalculation();
      expect(result['status'],'true');
      expect(result['code'], '201');
      expect(result['cost'],'7064.66');
    });

    test('All Good Case for imported', () {
      var args = ['--name','Books','--price','250.72','--type','imported','--quantity','13'];
      TaxCalculation object = TaxCalculation(args,parser);
      var result = object.itemTaxCalculation();
      expect(result['status'],'true');
      expect(result['code'], '201');
      expect(result['cost'],'3764.56');
    });    
  });

  group('Exception Cases', () {

    test('Missed Provided Data', () {
      var args = ['--name','Books','--price','250.7','--type','raw'];
      TaxCalculation object = TaxCalculation(args,parser);
      var result = object.itemTaxCalculation();
      expect(result['status'],'false');
      expect(result['code'], '205');
    });

    test('Data format not correct, Price ( not provided numeric )', () {
      var args = ['--name','Books','--price','25fs0.7','--type','imported','--quantity','25'];
      TaxCalculation object = TaxCalculation(args,parser);
      var result = object.itemTaxCalculation();
      expect(result['status'],'false');
      expect(result['code'], '207');
    });

    test('Data format not correct, Quantity ( not provided numeric )', () {
      var args = ['--name','Books','--price','250.7','--type','imported','--quantity','av25'];
      TaxCalculation object = TaxCalculation(args,parser);
      var result = object.itemTaxCalculation();
      expect(result['status'],'false');
      expect(result['code'], '207');
    });

    test('Negative Price of item', () {
      var args = ['--name','Books','--price','-250.7','--type','imported','--quantity','25'];
      TaxCalculation object = TaxCalculation(args,parser);
      var result = object.itemTaxCalculation();
      expect(result['status'],'false');
      expect(result['code'], '206');
    });

    test('Negative Quantity of item', () {
      var args = ['--name','Books','--price','250.7','--type','imported','--quantity','-25'];
      TaxCalculation object = TaxCalculation(args,parser);
      var result = object.itemTaxCalculation();
      expect(result['status'],'false');
      expect(result['code'], '206');
    });
  });
}