import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uzum_market/components/constants/image.dart';
import 'package:uzum_market/components/constants/mediaquater.dart';
import 'package:uzum_market/deta/respositories/App_repository.dart';
import 'package:uzum_market/pages/home/tab/tabs/widgets/page_view_widget.dart';
import 'package:uzum_market/pages/home/tab/tabs/widgets/product_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: m_w(context) * 0.5,
            child: PageView(
              children: [
                PageViewWidget(image: AppImages.pv_1),
                PageViewWidget(image: AppImages.pv_2),
                PageViewWidget(image: AppImages.pv_3),
                PageViewWidget(image: AppImages.pv_4),
              ],
            ),
          ), // Page view bu
          const SizedBox(
            height: 12.0,
          ),
          DefaultTabController(
            length: 3,
            child: Column(
              children: [
                const TabBar(
                  tabs: [
                    Tab(
                      child: Text("Barakali Juma"),
                    ),
                    Tab(
                      child: Text("Mashhur"),
                    ),
                    Tab(
                      child: Text("Yangi"),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: m_w(context).toDouble(),
                  height: m_w(context) * 1.1.toDouble(),
                  child: TabBarView(
                    children: [
                      FutureBuilder(
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Expanded(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          if (snapshot.hasData) {
                            List? product = snapshot.data;
                            return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.5,
                              ),
                              itemBuilder: (context, index) => ProductWidget(
                                product: product[index],
                              ),
                              itemCount: product!.length,
                            );
                          }
                          return Container();
                        },
                        future: AppRepository.getAllProductsByCategoryFromApi(
                            "men's clothing"),
                      ),
                      FutureBuilder(
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Expanded(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          if (snapshot.hasData) {
                            List? product = snapshot.data;
                            return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.5,
                              ),
                              itemBuilder: (context, index) => ProductWidget(
                                product: product[index],
                              ),
                              itemCount: product!.length,
                            );
                          }
                          return Container();
                        },
                        future: AppRepository.getAllProductsByCategoryFromApi(
                            "jewelery"),
                      ),
                      FutureBuilder(
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Expanded(
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          if (snapshot.hasData) {
                            List? product = snapshot.data;
                            return GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.5,
                              ),
                              itemBuilder: (context, index) => ProductWidget(
                                product: product[index],
                              ),
                              itemCount: product!.length,
                            );
                          }
                          return Container();
                        },
                        future: AppRepository.getAllProductsByCategoryFromApi(
                            "electronics"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
