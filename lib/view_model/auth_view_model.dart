
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_provider_mvvm/repository/auth_repository.dart';
import 'package:flutter_provider_mvvm/utils/routes/routes_name.dart';
import 'package:flutter_provider_mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier {

  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;


  void setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async{
    setLoading(true);
    _myRepo.loginApi(data).then((value){
      setLoading(false);
      Utils.flushBarSuccessMessages(value.toString(), "Login Successful", context);
      Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessages(error.toString(), "Login Failed", context);
    });
  }


  Future<void> registerApi(dynamic data, BuildContext context) async{
    setSignUpLoading(true);
    _myRepo.registerApi(data).then((value){
      setSignUpLoading(false);
      Utils.flushBarSuccessMessages(value.toString(), "SignUp Successful", context);
      // Navigator.pushNamed(context, RoutesName.home);
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessages(error.toString(), "SignUp Failed", context);
    });
  }


}