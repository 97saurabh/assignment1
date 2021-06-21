import 'package:args/args.dart';

// Parser is requreid to take argument from cmd
abstract class BasicUtility {

  static ArgParser getInstanceOfParcer(){
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
            allowed: ['Raw','Manufactured','Imported'],
          );
    return parser;
  }



}