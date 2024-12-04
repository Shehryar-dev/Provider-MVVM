import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthViewModel with ChangeNotifier{
  final _authRepo = AuthRepository();
   bool _loading = false;
  bool get loading => _loading;
  setValue(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(BuildContext context ,dynamic data) async{
    setValue(true);
    _authRepo.loginApi(data).then((value){
      final userPreference = Provider.of<UserViewModel>(context,listen: false);
      userPreference.saveUser(UserModel(
        token: value['token'].toString(),
      ));

      Navigator.pushNamed(context,RoutesName.home);
      if(kDebugMode){
        Utils.toastMessage('Successfully Login');
        setValue(false);
        print(value.toString());
      }
    }).onError((error, stackTrace){
      if(kDebugMode){
        setValue(false);
        print(error.toString());
        Utils.toastMessage('Error: ${error.toString()}');
      }
    });

  }



  bool _signUploading = false;
  bool get signUpLoading => _signUploading;
  setValueSignUp(bool value){
    _signUploading = value;
    notifyListeners();
  }

  Future<void> signUpApi(BuildContext context ,dynamic data) async{
    setValueSignUp(true);
    _authRepo.registerApi(data).then((value){
      // Navigator.pushNamed(context,RoutesName.home);
      if(kDebugMode){
        Utils.toastMessage('Successfully Sign up');
        setValueSignUp(false);
        print(value.toString());
      }
    }).onError((error, stackTrace){
      if(kDebugMode){
        setValueSignUp(false);
        print(error.toString());
        Utils.toastMessage('Error: ${error.toString()}');
      }
    });
  }
}