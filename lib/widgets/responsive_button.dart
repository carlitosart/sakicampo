import 'package:flutter/material.dart';
import 'package:sakil/misc/colors.dart';
import 'package:sakil/widgets/app_text.dart';
class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({Key? key,this.width=120,this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: isResponsive==true?double.maxFinite:width,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
        child: Row(
          mainAxisAlignment: isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
          children: [
            isResponsive==true?Container(margin: const EdgeInsets.only(left: 20),child: AppText(text: "Rentar Ahora",color: Colors.white,)):Container(),
            Icon(Icons.play_arrow),


          ],
        ),
      ),
    );
  }
}
