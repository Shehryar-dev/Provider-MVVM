import 'package:flutter/material.dart';
import 'package:mvvm/res/app_colors.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final bool loading;
  final VoidCallback onPress;
  final Color btnColor;
  final Color textColor;
  const RoundedButton({super.key, required this.text,this.loading = false,required this.onPress, this.btnColor = AppColors.btnColorBrown,this.textColor = AppColors.btnColorWhite});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        width: 200,
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: btnColor,
        ),
        child: loading ? const CircularProgressIndicator(color: Colors.white,) : Text(text.toString(),style: TextStyle(color: textColor,fontSize: 16),),
      ),
    );
  }
}
