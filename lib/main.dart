import 'package:flutter/material.dart';
import 'package:news_app/listWidget.dart';
import 'package:news_app/shared/details.dart';
import 'package:news_app/shared/listItem.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  List<ListItem> listTiles = [
    ListItem("https://wmc.hu/wp-content/uploads/2020/07/pic-750x750-1-700x700.jpg",
        lipsum.createWord(numWords: 6), lipsum.createWord(numWords: 2), "2021.03.21"),

    ListItem("https://a.c-dn.net/b/4uot3B/headline_shutterstock_243762007.jpg",
        lipsum.createWord(numWords: 6), lipsum.createWord(numWords: 2), "2021.03.25"),

    ListItem("https://responsive.fxempire.com/v7/_fxempire_/2020/06/Gold-11.jpg?func=cover&q70&width=400",
        lipsum.createWord(numWords: 6), lipsum.createWord(numWords: 2), "2021.03.11"),

    ListItem("https://i.insider.com/5f1b201a5af6cc7e1b741330?width=1136&format=jpeg",
        lipsum.createWord(numWords: 6), lipsum.createWord(numWords: 2), "2021.03.05"),

    ListItem("https://i.insider.com/5f1b201a5af6cc7e1b741330?width=1136&format=jpeg",
        lipsum.createWord(numWords: 6), lipsum.createWord(numWords: 2), "2021.04.10"),

    ListItem("https://i.insider.com/5f1b201a5af6cc7e1b741330?width=1136&format=jpeg",
        lipsum.createWord(numWords: 6), lipsum.createWord(numWords: 2), "2021.04.01"),

    ListItem("https://i.insider.com/5f1b201a5af6cc7e1b741330?width=1136&format=jpeg",
        lipsum.createWord(numWords: 6), lipsum.createWord(numWords: 2), "2021.04.04"),

    ListItem("https://i.insider.com/5f1b201a5af6cc7e1b741330?width=1136&format=jpeg",
        lipsum.createWord(numWords: 6), lipsum.createWord(numWords: 2), "2021.04.15"),

    ListItem("https://i.insider.com/5f1b201a5af6cc7e1b741330?width=1136&format=jpeg",
        lipsum.createWord(numWords: 6), lipsum.createWord(numWords: 2), "2021.02.21"),


  ];



  List<Tab> _tabList = [
    Tab(child: Text("Top"),),
    Tab(child: Text("Popular"),),
    Tab(child: Text("Trending"),),
    Tab(child: Text("Editor Choice"),),
    Tab(child: Text("Category "),),

  ];

  //TABCONTROLLER
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: _tabList.length);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APPBAR
      appBar: AppBar(
        toolbarHeight: 110.0,
        leading: IconButton(
          onPressed: () {

          },
          icon: Icon(Icons.menu, color: Colors.black),
        ),
        backgroundColor: Color(0xFFFAFAFA),
        centerTitle: true,
        title: Text("Hermes News", style: TextStyle(
          color: Colors.black,
        ),),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(30.0),

          child: TabBar(
             indicatorColor: Colors.black,
            isScrollable: true,
            labelColor: Colors.black,
            controller: _tabController,
            tabs: _tabList,
          ),
        ),
      ),
        //TAB BAR
        body: TabBarView(
          controller: _tabController,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: ListView.builder(
                    itemCount: listTiles.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => DetailsScreen(item: listTiles[index],
                              tag: listTiles[index].newsTitle,)
                          ));
                        },
                        child: listWidget(listTiles[index]),
                      );
                    }
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
              ),
            ),
          ],
        ),
    );
  }
}
