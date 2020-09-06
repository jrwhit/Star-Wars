import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  Loading(this._image, this.texto, this.widget, this.context2);
  String _image, texto;
  Widget widget;
  BuildContext context2;
  @override
  Widget build(BuildContext context) {
    return loading(context2, _image, texto, widget: widget);
  }
  loading(context, image, texto, {widget}){
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => Dialog(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover
                )
            ),
            alignment: FractionalOffset.center,
            height: MediaQuery.of(context).size.width * 0.5,
            width: MediaQuery.of(context).size.width * 0.2,
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(texto, style: TextStyle(color: Colors.white),),
                ),
                widget,
              ],
            ),
          ),
        ));
  }
}
