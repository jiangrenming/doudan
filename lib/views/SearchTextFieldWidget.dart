import 'package:flutter/material.dart';

class SearchTextFieldWidget extends StatelessWidget{


   final String hintText;
   final VoidCallback onTab;
   final ValueChanged<String> mSubmitted;
   final EdgeInsetsGeometry margin;


  SearchTextFieldWidget({Key key,@required this. hintText,this.onTab,this.mSubmitted,this.margin}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: this.margin == null ? EdgeInsets.all(0.0) : margin,
      alignment: AlignmentDirectional.center,
      height: 37.0,
      decoration:BoxDecoration(
        color:Color.fromARGB(255, 237, 236, 237),
        borderRadius: BorderRadius.circular(24.0)
      ) ,
      child: TextField(
        onSubmitted: mSubmitted,
        onTap: onTab,
        style: TextStyle(fontSize: 17.0),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top:8.0),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color:  Color.fromARGB(255, 192, 191, 191),fontSize: 17.0,),
          prefixIcon:Icon(   //位于输入框前面的图标
              Icons.search,
              size: 25,
              color: Color.fromARGB(255, 128, 128, 128),
          ),
          suffixIcon: Icon(
              Icons.close,
              size: 20,
              color: Color.fromARGB(255, 128, 128, 128)
          )
        ),
      ),
    );
  }

}