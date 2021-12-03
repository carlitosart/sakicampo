import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakil/cubit/app_cubit_states.dart';
import 'package:sakil/cubit/app_cubits.dart';
import 'package:sakil/misc/colors.dart';
import 'package:sakil/pages/detail_page.dart';
import 'package:sakil/widgets/app_large_text.dart';
import 'package:sakil/widgets/app_text.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is LoadedState) {
            var info = state.movies;
            print(info.isEmpty);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // menu text
                Container(
                  padding: const EdgeInsets.only(top: 70, left: 20),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goInit();
                        },
                        icon: Icon(Icons.menu),
                        color: Colors.red,
                      ),
                      Expanded(child: Container()),
                      Container(
                        child: Column(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.shopping_cart),
                              color: Colors.red,
                              onPressed: () {},
                            )
                          ],
                        ),
                        /*margin: const EdgeInsets.only(right: 20),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue,
                        ),*/
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                //discover text
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: AppLargeText(
                    text: "Sakila Rental",
                  ),
                ),
                SizedBox(height: 20),
                // tabbar
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      controller: _tabController,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: CircleTabIndicator(
                          color: AppColors.mainColor, radius: 4),
                      tabs: [
                        Tab(
                          text: "Estrenos",
                        ),
                        Tab(
                          text: "Ultima Semana",
                        ),
                        Tab(
                          text: "Todos los Tiempos",
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(left: 20),
                  height: 300,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      //LISTAR LOS ESTRENOS EL LIST BUILDER
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(movie: info[index])));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15, top: 10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://picsum.photos/" +
                                            info[index].length.toString()),
                                    fit: BoxFit.cover),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AppText(
                                    text: info[index].title,
                                    color: Colors.white,
                                  ),
                                  AppText(
                                    text: info[index].releaseYear.toString(),
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      //LISTAR LOS MAS RENTADOS DE LA ULTIMA SEMANA
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailPage(movie: info[index])));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15, top: 10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://picsum.photos/" +
                                            info[index].length.toString()),
                                    fit: BoxFit.cover),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AppText(
                                    text: info[index].title,
                                    color: Colors.white,
                                  ),
                                  AppText(
                                    text: info[index].releaseYear.toString(),
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                      //RENTAR LOS MAS RENTADOS DE TODOS LOS TIEMPOS
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DetailPage(movie: info[index])));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15, top: 10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://picsum.photos/" +
                                            info[index].length.toString()),
                                    fit: BoxFit.cover),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  AppText(
                                    text: info[index].title,
                                    color: Colors.white,
                                  ),
                                  AppText(
                                    text: info[index].releaseYear.toString(),
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
