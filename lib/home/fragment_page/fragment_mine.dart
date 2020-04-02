import 'package:flutter/material.dart';

//我的内容Body
class PersonCenterPageFragment extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    print("我的是否重新创建");
    return _PersonCenterState();
  }

}

class _PersonCenterState extends State<PersonCenterPageFragment>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold();
  }
}