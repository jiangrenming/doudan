import 'dart:async';

import 'package:flutter/material.dart';
import 'home/home_page.dart';
import 'utils/android_utils.dart';
import 'constants/constant.dart';
import 'package:quiver/time.dart';

//引导页,需要倒计时
class SplashWideget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SplashCounter();
  }
}


class _SplashCounter extends State<SplashWideget>{

   bool isShAd = true; //展示是否显示首页界面 根据倒计时来决定
   var  constair = HomePages();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Offstage(   //--->true 代表隐藏首页界面
          offstage: isShAd,
          child: constair,
        ),
        Offstage(   //-->界面操作倒计时
          child: Container(
            color: Colors.white,
            width:  AndroidUtils.screenW(context),
            height: AndroidUtils.screenH(context),
            child: Stack(
              children: <Widget>[
                Align(
                alignment: Alignment(0.0, 0.0),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      CircleAvatar(
                        radius: AndroidUtils.screenW(context) / 3,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage(Constant.ASSETS_IMG + 'home.png'),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        '落花有意随流水,流水无心恋落花',
                        style: TextStyle(fontSize: 15.0, color: Colors.black),
                      ),
                    )
                  ],
                  ),
                ),
                SafeArea(
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Align(
                          alignment: Alignment(1.0, 0.0),
                          child: Container(
                            margin: const EdgeInsets.only(right: 30.0, top: 20.0),
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                            child:CountDownWidget(onCountDownFinishCallBack: (bool value){
                              if (value) {
                                setState(() {
                                  isShAd = false;
                                });
                              }
                            }),
                            decoration:BoxDecoration(
                                  color: Color(0xffEDEDED),
                                  borderRadius: const BorderRadius.all(Radius.circular(10.0))
                              ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(Constant.ASSETS_IMG+"/ic_launcher.png",width: 50.0,height: 50.0,),
                              Padding(
                                  padding: const EdgeInsets.only(left:10.0),
                                  child: Text(
                                    "Hi,小豆牙",style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                )
              ],
            ),
          ),
          offstage: !isShAd,
        )
      ],
    );
  }
}

//倒计时的实现
class CountDownWidget extends StatefulWidget{

  final  onCountDownFinishCallBack;
  CountDownWidget({Key key,@required this.onCountDownFinishCallBack}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CountDownWidget();
  }
}

class _CountDownWidget extends State<CountDownWidget>{

  var _seconds = 6;
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }


  @override
  Widget build(BuildContext context) {
    return Text(
      '$_seconds',
      style: TextStyle(fontSize: 17.0),
    );;
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer){
      setState(() {});
      if (_seconds <= 1) {
        widget.onCountDownFinishCallBack(true);
        _cancelTimer();
        return;
      }
      _seconds--;
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    _timer?.cancel();
  }
}
