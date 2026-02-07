import 'package:flutter/material.dart';

Route sliderRouteTransition(
  Widget
      nextScreen, //obrigatório receber uma tela. genérica, quem define é quem chama a função
  {
  Duration duration =
      const Duration(milliseconds: 1000), //Parâmetro opcional com valor padrão
  Curve curve = Curves
      .ease, //opcional tbm, como padrão para quem não passar anda, ou para configurar quem usar a transição
  Offset beginPosition = const Offset(-1, 1),//idem
}) {
  return PageRouteBuilder(
    //construtor de rotas customizadas
    pageBuilder: (context, animation, secondaryAnimation) =>
        nextScreen, //tela que vai ser exibida, o destino da rota
    transitionDuration:
        duration, //duração é a padrão ou a que foi passada por quem tá usando
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //construtor da animação
      Animatable<Offset> tween = Tween(
        //criamos uma como posição de nosso parâmetro animation. Offset é um par de coordenadas x,y. Tween é entre, então calcula os valores intermediários (ex: Se passou metade do tempo (0.5), o Tween calcula que a posição atual deve ser (-0.5, 0.5))
        begin:
            beginPosition, //começa nessa posição, fora da tela (100% à esquerda e 100% para baixo) (imagina eixos -1 0 +1)
        end: Offset.zero, //termina na posição normal 0,0
      ).chain(
        CurveTween(
            curve:
                curve), //acorrentando um mapa de valores(tween) a um mapa de velocidade(curvetween). Diz que o Tween deve respeitar a velocidade definida pela curve
      );
      return SlideTransition(
        //define a animação, aqui uma transição de deslizar
        position: animation.drive(
            tween), //o drive entrega o tween(mapa) pro animation do pagebuilder
        child: nextScreen,
      );
    },
  );
}
