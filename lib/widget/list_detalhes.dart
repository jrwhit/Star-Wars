import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListResult extends StatelessWidget {
  ListResult(this._list, this._title);
  List<String> _list;
  String _title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(_title, style: TextStyle(color: Colors.yellowAccent, fontWeight: FontWeight.w600),),
        ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: _list.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
//                  Navigator.of(context).push(
//                      MaterialPageRoute(builder: (context)=> WebViewPage(_list[index])));
                },
                child: Text(_list[index], overflow: TextOverflow.clip,
                  textAlign: TextAlign.center, style: TextStyle(color: Colors.yellowAccent),),
              );
            })
      ],
    );
  }
}
