import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/constants/constants.dart';
import 'package:newsapp/services/provider.dart';
import 'package:newsapp/widgets/breaking_news_card.dart';
import 'package:newsapp/widgets/card_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  final int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News App',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ))
        ],
        backgroundColor: Colors.white,
      ),
      body: Consumer(
        builder: ((context, ref, child) {
          return ref.watch(newsProvider).when(
              data: ((data) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Breaking News',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CarouselSlider.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index, id) => BreakingNews(
                            img: data[index].urlToImage,
                            title: data[index].title,
                          ),
                          options: CarouselOptions(
                            aspectRatio: 16 / 9,
                            enableInfiniteScroll: true,
                            enlargeCenterPage: true,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          'All News',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        ListView.builder(
                          itemCount: data.length,
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: ((context, index) {
                            return CardView(
                              index: index,
                              img: data[index].urlToImage,
                              title: data[index].title,
                              content: data[index].content,
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              error: ((error, stackTrace) {
                return Text(
                  error.toString(),
                  style: readCounterTextStyle,
                );
              }),
              loading: (() =>
                  const Center(child: CircularProgressIndicator())));
        }),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: _index,
          selectedItemColor: Colors.orange.shade900,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Icon(Icons.list),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Bookmarks',
                backgroundColor: Colors.transparent),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: 'Profile'),
          ],
        ),
      ),
    );
  }
}
