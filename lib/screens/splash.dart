
import 'package:flutter/material.dart';
import 'package:grimorio/route_transitions.dart';
import 'package:grimorio/screens/dashboard.dart';
import 'package:grimorio/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double imageOpacity =
      0.0; //setando a opacidade em 0 (invisível) p/ qnd mudar gerar animação
  int timeToAnimationInMilliseconds =
      2000; //duração da animação em variável p/ facilitar alterações na função de espera até navegar da splash p/ dashboard

  @override
  void initState() {
    waitAndShow(); //logo que inicia chamamos a função que espera e muda a opacidade p/ animar e depois chama a função de navegação p/ próxima página
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppColors.modalBackgroundGradient[2], //cor definida no tema
      body: Center(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Image.asset(
                'assets/images/grimorio_1152.png',
                width: 300,
              ),
            ),
            AnimatedOpacity(
              duration: Duration(milliseconds: timeToAnimationInMilliseconds),
              opacity: imageOpacity,
              curve: Curves.easeInCubic, // tipo de movimento da animação
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Image.asset(
                  //perceba que é uma imagem sobre outra abraçada pelo AnimatedOpacity
                  'assets/images/grimorio_1152.png',
                  width: 300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  waitAndShow() {
    Future.delayed(const Duration(milliseconds: 700)).then((value) {
      setState(() {
        imageOpacity = 1.0;
      });
      waitAndNavigate();
    });
  }

  waitAndNavigate() {
    Future.delayed(Duration(milliseconds: timeToAnimationInMilliseconds + 300))
        .then((value) {
      Navigator.of(context).pushReplacement(
        sliderRouteTransition(
          const Dashboard(),
          duration: const Duration(milliseconds: 2000),// bem lento pra ver a transição
          beginPosition: const Offset(1, 0), //a tela chega da direita
        ),
      );
    });
  }
}
