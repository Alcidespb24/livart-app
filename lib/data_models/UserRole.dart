import 'package:flutter/cupertino.dart';
import 'package:flutter_app/data_models/DataModelBase.dart';
enum Role{
  CREATOR,
  USER
}
class UserRole  extends ChangeNotifier{
  Role _role;

  Role getRole (){
    return _role;
  }

  void setRole (Role r){
    _role = r;
    notifyListeners();
  }
}