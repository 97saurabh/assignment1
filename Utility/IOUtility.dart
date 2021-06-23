import 'cmd_IO.dart';

// Input Uput Utility
abstract class IOUtility{

  static void InputUtility(args){
    CommandPromptUtility instance = CommandPromptUtility();
    instance.InputOutputUtility(args);
  }


}