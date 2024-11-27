import 'package:flutter/material.dart';
import 'package:uzum_market/components/constants/image.dart';
import 'package:uzum_market/components/constants/mediaquater.dart';
import 'package:uzum_market/pages/home/tab/tabs/account_page.dart';
import 'package:uzum_market/pages/home/tab/tabs/favr_page.dart';
import 'package:uzum_market/pages/home/tab/tabs/home_page.dart';
import 'package:uzum_market/pages/home/tab/tabs/search_page.dart';
import 'package:uzum_market/pages/home/tab/tabs/shopping_basked_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List pages = [
      HomePage(),
      SearchPage(),
      ShoppingBaskedPage(),
      FavouritesPage(),
      AccountPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            height: m_w(context) * 0.08,
            width: m_w(context) * 0.9,  // Container kengligini kichikroq qildim
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), // To'liq yumaloq burchaklar
              color: Colors.grey.withOpacity(0.1), // Yengil kulrang rang
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Qidiruv...', // Hint matnini qo'shdim
                hintStyle: TextStyle(
                  color: Colors.grey,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                border: InputBorder.none, // Chiziqsiz
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16), // Ichki margin
              ),
            ),
          ),
        ],

      ),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: "Bosh sahifa"),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Qidiruv",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: "Savat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: "Sevimlilar",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profil",
            ),
          ]),
    );
  }
}
