import 'package:flutter/material.dart';
import './fragment_page/fragment_home.dart';
import './fragment_page/fragment_group.dart';
import './fragment_page/fragment_jishi.dart';
import './fragment_page/fragment_mine.dart';
import './fragment_page/fragment_video.dart';



class HomePages extends StatefulWidget{

  HomePages({Key key}) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    return _ContainerPageState();
  }
}

class _ContainerPageState extends State<HomePages>{

  List<BottomNavigationBarItem> itemList;
  int _selectIndex = 0;
  List<Widget> _pageList;

  //底部tab数据和图标
  final itemsNames = [_Items("首页", "assets/images/ic_tab_home_active.png", "assets/images/ic_tab_home_normal.png"),
  _Items("书影音", "assets/images/ic_tab_profile_active.png", "assets/images/ic_tab_profile_normal.png"),
  _Items("小组", "assets/images/ic_tab_group_active.png", "assets/images/ic_tab_group_normal.png"),
  _Items("市集", "assets/images/ic_tab_shiji_active.png", "assets/images/ic_tab_shiji_normal.png"),
  _Items("我的", "assets/images/ic_tab_subject_active.png", "assets/images/ic_tab_subject_normal.png")];


  @override
  void initState() {
    super.initState();
    if(_pageList == null){
      _pageList = [
        HomeFragment(),
        BookAudioVideoPageFragment(),
        ShopPageCetreFragment(),
        GroupFragment(),
        PersonCenterPageFragment()
      ];
    }
    if(itemList == null){
      itemList = itemsNames.map((item) =>BottomNavigationBarItem
        (
          icon: Image.asset(item.normalIcon,width: 30.0,height: 30.0,),
          title: Text(item.name,style: TextStyle(fontSize: 10.0),),
          activeIcon: Image.asset(item.activeIcon,width: 30.0,height: 30.0,)
         )
      ).toList();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(   //不需要页面滑动切换的效果
        index: _selectIndex,
        children: _pageList,
      ),
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: BottomNavigationBar(
          items: itemList,
          iconSize: 24,
        //当前索引
        currentIndex: _selectIndex,
        //选中后，底部BottomNavigationBar内容的颜色(选中时，默认为主题色)（仅当type: BottomNavigationBarType.fixed,时生效）
        type: BottomNavigationBarType.fixed,
        fixedColor: Color.fromARGB(255, 0, 188, 96),
        onTap: (int index){
          setState(() {
            _selectIndex = index;
            });
        },
      ),
    );
  }
}


//底部按钮的实体类
class _Items{
  String name, activeIcon, normalIcon;
  _Items(this.name, this.activeIcon, this.normalIcon);
}