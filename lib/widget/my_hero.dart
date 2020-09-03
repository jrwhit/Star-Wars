import 'package:flutter/material.dart';

class MyHero extends StatelessWidget {
  const MyHero({ Key key, String photo, VoidCallback onTap,}) : _photo = photo, _onTap = onTap, super(key: key);

  final String _photo;
  final VoidCallback _onTap;

  Widget build(BuildContext context) {
    final sizeH = MediaQuery.of(context).size.width;

    return SizedBox(
      width: sizeH,
      child: Hero(
        tag: _photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(

            onTap: _onTap,
            child: Image.asset(
              _photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}