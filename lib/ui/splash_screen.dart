import 'dart:async';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:star_wars/ui/home.dart';
import 'package:vector_math/vector_math_64.dart';


final crawlString1 = """
Há pouco tempo, na galáxia C4B4-N4G.3M , situada muito, mas muito distante...

Episódio I

Uma Nova Oportunidade


É um período de provação. Partindo de uma base central da BitX, e-mails são lançados com desafios, em um julgamento final com objetivo de conquistar um novo nome para ocupar seu núcleo.

Durante longas noites, programadores seguem os planos descritos de forma decisiva para alcançar seu objetivo, a VAGA, uma oportunidade especial com poder suficiente para mudar uma vida inteira.

Perseguido pelas sinistras noites sem dormir, este Programador, apressa-se em finalizar o projeto, para entregá-lo da forma almejada e sem bugs, protegendo os planos que podem salvar sua oportunidade e restaurar esperança na Vaga...
""";

class CrawlPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: Column(children: [
        Flexible(
          flex: 5,
          child: Perspective(child: Crawler()),
        ),
        Flexible(
          flex: 1,
          child: Column(),
        ),
      ]),
    );
  }
}

class Crawler extends StatefulWidget {
  final crawlDuration = const Duration(seconds: 50);

  @override
  createState() => _CrawlerState();
}

class _CrawlerState extends State<Crawler> with TickerProviderStateMixin {
  final _scrollController = ScrollController();
  AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(seconds: 7), vsync: this, value: 0.1);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInExpo);

    _controller.forward();
    _assetsAudioPlayer.open(
      Audio("assets/audios/music.mp3"),
      autoStart: true,
      showNotification: true,
    );
    Future.delayed(
        const Duration(seconds: 1),
        () => _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: widget.crawlDuration,
            curve: Curves.linear)).whenComplete(() {
      _assetsAudioPlayer.stop();
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => Home()),
          (Route<dynamic> route) => false);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _assetsAudioPlayer = null;
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SuperSize(
      height: 1279,
      child: ListView(
        controller: _scrollController,
        children: [
          SizedBox(height: height + height*.05),

          Padding(padding: EdgeInsets.only(top: height * .2),
          child: ScaleTransition(
            scale: _animation,
            child: Image.asset("assets/images/logo.png"),
          ),),
          Text(
            crawlString1,
            style: TextStyle(
              color: Color(0xffFFC800),
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: height),
        ],
      ),
    );
  }
}

class SuperSize extends StatelessWidget {
  SuperSize({this.child, this.height = 1000});
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return OverflowBox(
      minHeight: height,
      maxWidth: MediaQuery.of(context).size.width * 0.6,
      maxHeight: height,
      child: child,
    );
  }
}

class Perspective extends StatelessWidget {
  Perspective({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.002)
        ..rotateX(-3.14 / 3.5),
      alignment: FractionalOffset.center,
      child: child,
    );
  }
}
