import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController{
  var _isAuthenticated = false;
  UserModel?  _user;

  UserModel get user => _user!;
   
  void setUser(BuildContext context, UserModel user){
    if(user != null){
      _user = user;
      _isAuthenticated = true;
      Navigator.popAndPushNamed(context, "/home" );
    } else {
      _isAuthenticated = false;
      Navigator.popAndPushNamed(context, "/login");
    }
  }

  Future <void> saveUser ( UserModel user) async{
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }
  Future <void> currentUser (BuildContext context) async{
    final instance = await SharedPreferences.getInstance();
    final json = instance.get("user") as String;
    setUser(context, UserModel.fromJson(json));
    return;
  }
}