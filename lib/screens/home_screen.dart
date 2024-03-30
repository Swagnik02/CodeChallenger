import 'package:code_challenger/common/color_pallete.dart';
import 'package:code_challenger/common/utils.dart';
import 'package:code_challenger/models/featured_lists_model.dart';
import 'package:code_challenger/screens/TestsScreen/all_tests_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: ColorPalette.primaryColor,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Explore',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0),
            child: Icon(
              Icons.notifications_active_outlined,
              color: Colors.white,
              size: 35,
            ),
          )
        ],
      ),
      backgroundColor: ColorPalette.primaryBgColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
            child: _greetings(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
            ),
            child: _featured(),
          ),
          _goToTests(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.help_outline_outlined,
          size: 40,
        ),
      ),
    );
  }

// Welcome section

  Widget _greetings() {
    return Column(
      children: [
        Text(
          'Hi ${LoggedInUser.userName}...\nIts Coding Time </>',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }

// featured section

  Widget _featured() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Featured',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.headline5!.fontSize,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: FeaturedListsModel.dummyFeaturedLists.length,
            itemBuilder: (context, index) {
              return _featuredTiles(
                  FeaturedListsModel.dummyFeaturedLists[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _featuredTiles(FeaturedListsModel featuredList) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        height: 150,
        width: 150 * 1.75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage(featuredList.bgImageUrl), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    featuredList.subTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    maxLines: 3,
                    featuredList.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize:
                          Theme.of(context).textTheme.headlineMedium!.fontSize,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            'chapters',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .fontSize),
                          ),
                          Text(
                            '${featuredList.chapters}',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text(
                            'items',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .fontSize),
                          ),
                          Text(
                            '${featuredList.questions}',
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_circle_outline_outlined,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// goToTestsButton

  Widget _goToTests() {
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: ElevatedButton(
          onPressed: () {
            Get.to(() => AllTestsScreen());
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Test Yourself',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Icon(Icons.play_arrow_sharp),
            ],
          )),
    );
  }
}
