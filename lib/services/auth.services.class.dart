import '../main.dart';

class AuthServices {
  Future<bool> login(String email, String pwd) async 
  {
    bool result = await datbase.loginUser(email, pwd);
    return result;
  }


  Future<bool> signup(user) async
  {
    bool result=false;
    Future<int> response = datbase.saveUser(user);
    if(response != null)
    {
      result =true;
      print(response);
    }
    return result;
  }
}
