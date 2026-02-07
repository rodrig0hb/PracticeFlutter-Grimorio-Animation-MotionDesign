// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grimorio/screens/components/carousel_item.dart';
import 'package:grimorio/screens/login.dart';
import 'package:grimorio/screens/components/primary_button.dart';
import 'package:grimorio/theme.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: AppBackgroundProperties.boxDecoration,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SvgPicture.asset("assets/images/background.svg"),
                //SvgPicture serve para renderizar arquivos SVG (Scalable Vector Graphics), que são imagens baseadas em vetores e fórmulas matemáticas em vez de pixels.
                Column(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceEvenly, //alinha uniformemente as children antes, entre e depois
                  children: <Widget>[
                    SvgPicture.asset("assets/images/logo.svg"),
                    CarouselSlider(
                        items: const [
                          CarouselItem(
                            imagePath: 'carousel-001',
                            text: 'Registre seus livros',
                          ),
                          CarouselItem(
                            imagePath: 'carousel-002',
                            text: 'Faça anotações',
                          ),
                          CarouselItem(
                            imagePath: 'carousel-003',
                            text: 'Visualize seu progresso',
                          ),
                        ],
                        options: CarouselOptions(
                          height: 500,
                          aspectRatio: 1, //proporção quadrada pois x/x =1
                          viewportFraction:
                              1, // mostra 1 item por vez, config a fração dos outros itens que quero mostrar
                          initialPage: 0, //primeiro elemento a ser mostrado
                          enableInfiniteScroll:
                              true, // rolagem infinita, do 1º ao último e vice-versa
                          autoPlay: true, // rolagem automática
                          autoPlayInterval: const Duration(
                              seconds:
                                  5), // intervalo entre as trocas automáticas(item parado)
                          autoPlayAnimationDuration: const Duration(
                              milliseconds:
                                  1000), // duração da animação de rolagem
                          autoPlayCurve: Curves
                              .easeInBack, // tipo de movimento da animação
                          scrollDirection: Axis
                              .vertical, // direção da rolagem, que pode ser até para cima e para baixo
                          reverse:
                              false, // se a rolagem automática dos itens é reversa
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        final isSelected = _currentIndex == index;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          width: isSelected ? 12 : 8,
                          height: isSelected ? 12 : 8,
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.pink : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 104.0),
                      child: PrimaryButton(
                        text: "Entrar",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ));
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
