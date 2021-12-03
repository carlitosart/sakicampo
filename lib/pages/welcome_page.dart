import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakil/cubit/app_cubits.dart';
import 'package:sakil/misc/colors.dart';
import 'package:sakil/widgets/app_large_text.dart';
import 'package:sakil/widgets/app_text.dart';
import 'package:sakil/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "sakim4.png",
    "sakim4.png",
    "sakim4.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("img/" + images[index]),
                fit: BoxFit.cover,
              )),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(text: "Bienvenido a",color: Colors.white,),
                        AppText(text: "Sakila Rental", size: 30,color: Colors.white.withOpacity(0.8),),
                        SizedBox(height: 20,),
                        Container(
                          width: 250,
                          child: AppText(
                            text: "Una App que te permitira rentar peliculas, enjoy!",
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                        SizedBox(height: 20,),
                        GestureDetector(
                          onTap: (){
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                          child: Container(
                            width: 50,

                              child: Row(children:[ResponsiveButton(width: 120,)])),
                        ),
                      ],
                    ),
                    Column(
                      children: List.generate(3, (indexDots) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 2),
                          width: 8,
                          height: index==indexDots?25:8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index==indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
