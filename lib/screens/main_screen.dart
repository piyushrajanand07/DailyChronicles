import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:news_aggregator/bloc/bottom_navbar_bloc.dart';
import 'package:news_aggregator/style/theme.dart' as Style;
import 'package:google_fonts/google_fonts.dart';

import 'tabs/home_screen.dart';
import 'tabs/search_screen.dart';
import 'tabs/sources_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  BottomNavBarBloc _bottomNavBarBloc;
  @override
  void initState() {
    super.initState();
    _bottomNavBarBloc = BottomNavBarBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.Colors.background,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Style.Colors.mainColor,
          title: Center(
            child: Text("DAILY CHRONICLES",
                style: GoogleFonts.raleway(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3.5),
                )),
          ),
        ),
      ),
      body: SafeArea(
        child: StreamBuilder<NavBarItem>(
          stream: _bottomNavBarBloc.itemStream,
          initialData: _bottomNavBarBloc.defaultItem,
          // ignore: missing_return
          builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
            switch (snapshot.data) {
              case NavBarItem.HOME:
                return HomeScreen();
              case NavBarItem.SOURCES:
                return SourceScreen();
              case NavBarItem.SEARCH:
                return SearchScreen();
            }
          },
        ),
      ),
      bottomNavigationBar: StreamBuilder(
        stream: _bottomNavBarBloc.itemStream,
        initialData: _bottomNavBarBloc.defaultItem,
        builder: (BuildContext context, AsyncSnapshot<NavBarItem> snapshot) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Colors.blueGrey, spreadRadius: -10, blurRadius: 20),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                  bottomRight: Radius.circular(30.0),
                ),
                child: BottomNavigationBar(
                  backgroundColor: Style.Colors.mainColor,
                  iconSize: 20,
                  unselectedItemColor: Colors.white,
                  unselectedFontSize: 9.5,
                  selectedFontSize: 10,
                  type: BottomNavigationBarType.fixed,
                  fixedColor: Colors.yellow,
                  currentIndex: snapshot.data.index,
                  onTap: _bottomNavBarBloc.pickItem,
                  items: [
                    BottomNavigationBarItem(
                      label: "Home",
                      icon: Icon(EvaIcons.homeOutline),
                      activeIcon: Icon(EvaIcons.home),
                    ),
                    BottomNavigationBarItem(
                      label: "Sources",
                      icon: Icon(EvaIcons.gridOutline),
                      activeIcon: Icon(EvaIcons.grid),
                    ),
                    BottomNavigationBarItem(
                      label: "Search",
                      icon: Icon(EvaIcons.searchOutline),
                      activeIcon: Icon(EvaIcons.search),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget testScreen() {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[Text("Test Screen")],
      ),
    );
  }
}
