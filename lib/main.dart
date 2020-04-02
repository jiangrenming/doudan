import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'splash_widget.dart';

void main() {
  runApp(MyApp());
  if(Platform.isAndroid){
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle style = SystemUiOverlayStyle(
         statusBarColor: Colors.transparent,
         statusBarIconBrightness: Brightness.light
    );
   SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
       RestartWidget(
           child:  MaterialApp(
             debugShowCheckedModeBanner: false,
             theme: ThemeData(primaryColor: Colors.white),
             home: Scaffold(
               resizeToAvoidBottomPadding: false,
               body: SplashWideget(),
             ),
           )
       );
  }
}
//这个组件用来重新加载整个child Widget的。当我们需要重启APP的时候，可以使用这个方案
class RestartWidget extends StatefulWidget{
  final Widget child ;

  RestartWidget({Key key,@required this.child})
  :assert(child != null)
  ,super(key:key);

  @override
  State<StatefulWidget> createState() {
    return _RestartWidgetState();
  }

  //重新启动app
  static restartApp(BuildContext context){
    final _RestartWidgetState state  = context.ancestorStateOfType(TypeMatcher<_RestartWidgetState>());
    state.restartApp();
  }
}

class _RestartWidgetState extends State<RestartWidget>{
  Key key  = UniqueKey();
  void restartApp(){
    setState(() {
       key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }

}