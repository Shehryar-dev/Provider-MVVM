import 'package:flutter/material.dart';
import 'package:mvvm/res/app_colors.dart';
import 'package:mvvm/res/components/rounded_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {


  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _obscureText = ValueNotifier<bool>(true);
  final FocusNode emailFocus = FocusNode();
  final FocusNode passFocus = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocus.dispose();
    passFocus.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign up',style: TextStyle(color: AppColors.btnColorWhite,fontSize: 16),),
        centerTitle: true,
        backgroundColor: AppColors.AppColorBlue,
        elevation: 1,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocus,
              decoration:const InputDecoration(
                hintText: 'Email',
                labelText: "Email",
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: AppColors.AppColorBlue)),
                prefixIcon: Icon(Icons.message),
              ),
              onFieldSubmitted: (value){
                Utils.fieldFocusChange(context, emailFocus, passFocus);
              },
            ),
            SizedBox(height: height * 0.023,),
            ValueListenableBuilder(valueListenable: _obscureText, builder:(context, value, child){
              return TextFormField(
                focusNode: passFocus,
                obscureText: _obscureText.value,
                controller: _passwordController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Password',
                  focusedBorder:const OutlineInputBorder(borderSide: BorderSide(color: AppColors.AppColorBlue)),
                  labelText: "Password",
                  prefixIcon:const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: (){
                        _obscureText.value = !_obscureText.value;
                      },
                      icon: Icon(_obscureText.value ? Icons.visibility : Icons.visibility_off)),
                ),
              );
            }
            ),
            SizedBox(height: height * 0.013,),
            RoundedButton(text: 'Sign up',
              loading: authViewModel.signUpLoading,
              onPress: (){
                if(_emailController.text.isEmpty){
                  Utils.showSnackBar(context, 'Plz Enter Email');
                }else if(_passwordController.text.isEmpty){
                  Utils.showSnackBar(context, 'Plz Enter Password');
                }else if(_passwordController.text.length < 6){
                  Utils.showSnackBar(context, 'Plz Enter 6 digits Password');
                }else{
                  Map data = {
                    'email' : _emailController.text.toString(),
                    'password' : _passwordController.text.toString()
                  };
                  authViewModel.signUpApi(context,data);
                  Utils.showSnackBar(context, 'Sign up Api Hit');
                }
              },btnColor: AppColors.AppColorBlue,),
            SizedBox(height: height * 0.012,),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, RoutesName.login);
              },
              child:const Text("Already have an account? Sign in"),
            )

          ],
        ),
      ),
    );
  }
}
