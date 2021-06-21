// given value is numeric or not, it will return true if yes
bool isNumeric(String str) {
    if(str == null) {
      return false;
    }
    return double.tryParse(str) != null;
}