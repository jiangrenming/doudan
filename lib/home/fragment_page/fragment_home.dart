import 'package:doudan/http/dio_net.dart';
import 'package:flutter/material.dart';
import 'package:doudan/views/SearchTextFieldWidget.dart';
import 'package:doudan/home/fragment_page/fragment_home_app_bar.dart' as myapp;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:doudan/utils/md5_util.dart';
import 'package:doudan/base/response_entity.dart';
import 'package:doudan/bean/login_entity.dart';

//首页内容Body 带有tab显示
class HomeFragment extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    print("首页切换是否重新创建");
    return getWedigets();
  }


}


var _tabs = ['动态', '推荐'];


//DefaultTabController 是用在无状态StatelessWidget组件下的，有状态组件StatefulWidget下使用TabController
DefaultTabController getWedigets() {
  return DefaultTabController(
      length: _tabs.length,
      initialIndex: 1,
      child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
              return <Widget>[
                SliverOverlapAbsorber(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                    child: myapp.SliverAppBar(
                      pinned: true,
                      primary: true, //false占领状态栏高度
                      backgroundColor: Colors.white,
                      expandedHeight: 120.0,
                      titleSpacing: 0.0,
                      bottomTextString: _tabs,
                      bottom: TabBar(
                          tabs: _tabs.map((String name) => Container(
                            child: Text( name),
                            padding: const EdgeInsets.only(bottom: 5.0),
                          )).toList(),
                //        indicatorSize: TabBarIndicatorSize.label,
             //           indicatorWeight: 2.0,
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.pin,
                        background: Container(
                          color: Colors.green,
                          child: SearchTextFieldWidget(
                            hintText: "请输入搜索内容",
                            margin: const EdgeInsets.only(left: 15.0, right: 15.0),
                            onTab: (){
                              //TodO()跳转
                            },
                            mSubmitted: (String value){
                              //TodO()提交的数据
                            },
                          ),
                          alignment: Alignment(0.0, 0.0),
                        ),
                      ),
                    ),
                )
              ];
          },
          body: TabBarView(
            children: _tabs.map((String name) => SliverContainer(name: name)).toList(),
          )
      )
  );

}


class SliverContainer extends StatefulWidget{

  String name;
  SliverContainer({Key key,@required this.name}):super(key :key);

  @override
  State<StatefulWidget> createState() {
    return _SliverContainerState();
  }

}

class _SliverContainerState extends State<SliverContainer> {


  @override
  void initState() {
    super.initState();
    print('init state${widget.name}');
    if (_tabs[0] == widget.name) {
      requestApi();
    } else {
      ///请求推荐数据
      requestApi();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
      child: Text(
        widget.name, style: TextStyle(color: Colors.red, fontSize: 18.0),),
    );
  }


  LoginEntity _loginEntity;

  void requestApi() async {
    final Map<String, dynamic> params = new Map();
    params["phone"] = "17621216837";
    params["pwd"] =  Md5Utils.generateMd5("123456");
    DioApi.getInstance().post<HttpResponseEntity,LoginEntity>("/userInfo/login", params: params, sucessCallback: (response) {
      _loginEntity = response;
      print("返回的数据"+_loginEntity.name);

    }, reLoginCallBack: (special) {
      switch (special['resultCode']) {
        case "401":
        //TodO()重新登陆
          break;
        default:
          Fluttertoast.showToast(
            msg: special['message'],
            fontSize: 14,
            toastLength: Toast.LENGTH_SHORT,
          );
      }
    }, errorCallback: (error) {
      Fluttertoast.showToast(
        msg: error['message'],
        fontSize: 14,
        toastLength: Toast.LENGTH_SHORT,
      );
    });
  }

}
