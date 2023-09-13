import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:toters_ui_clone/utils/colors.dart';
import 'package:toters_ui_clone/utils/dimensions.dart';
import 'package:toters_ui_clone/widgets/big_text.dart';
import 'package:toters_ui_clone/widgets/small_text.dart';
import 'package:toters_ui_clone/widgets/top_colliction.dart';
// import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Matrix4 matrix = Matrix4.identity();
  PageController _pageController = PageController();
  var _currPageValue = 0.0;
  int itemCount = 5;
  int nomOrder = 10;
  int tempint = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Dimensions.height56),
        child: SafeArea(
          child: AppBarContent(),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
            left: Dimensions.width15, right: Dimensions.width15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // info widgets and gift widgets
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Container(
                      // color: Colors.amber,
                      height: Dimensions.height56,
                      width: Dimensions.screenWidth - Dimensions.width15 * 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //? first part text and icon and
                          Row(
                            children: [
                              BigText(
                                text: "Green",
                                color: AppColors.mainColor,
                                size: Dimensions.height20,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                width: Dimensions.width5 / 2,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  Icons.error_outline,
                                  color: AppColors.mainColor,
                                  size: Dimensions.height25,
                                  opticalSize: 0.5,
                                  weight: 0.5,
                                ),
                              ),
                            ],
                          ),
                          //? second part
                          Container(
                            padding: EdgeInsets.symmetric(
                              // horizontal: Dimensions.height10 / 2,
                              vertical: Dimensions.width5 * 0.5,
                            ),
                            child: Row(
                              children: [
                                Wrap(
                                  children: List.generate(
                                    nomOrder,
                                    (index) => Container(
                                      margin:
                                          EdgeInsets.only(left: 1, right: 1),
                                      height: 1,
                                      width: Dimensions.width20 * 1.20,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SmallText(
                            text: "10 more order by August to reach Gold ",
                            color: AppColors.textSecondColor,
                          )
                        ],
                      ),
                    ),
                    //? third part
                    Container(
                      // color: Colors.red,
                      width: Dimensions.width15 * 8,
                      height: Dimensions.height56,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SmallText(text: "0", size: Dimensions.width20),
                          SizedBox(
                            width: Dimensions.width5 / 2,
                          ),
                          SmallText(text: "Pts", size: Dimensions.width20),
                          Icon(Icons.arrow_forward_ios,
                              size: Dimensions.width20)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Slider part image scroller carusel
              Container(
                height: Dimensions.height250.floorToDouble(),
                width: Dimensions.screenWidth - Dimensions.width15 * 2,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(
                      Dimensions.radius15.floorToDouble()),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    PageView.builder(
                        controller: _pageController,
                        itemCount: itemCount,
                        itemBuilder: (context, index) {
                          return sliderMethode(index);
                        }),
                    Positioned(
                      bottom: Dimensions.height20,
                      child: Wrap(
                        children: List.generate(
                          itemCount,
                          (indexDot) => dotIndicator(indexDot),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: Dimensions.height20,
                      child: Wrap(
                        children: List.generate(
                          itemCount,
                          (indexDot) => dotIndicatorSelected(indexDot),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: Dimensions.height20 * 2,
                        child: SmoothPageIndicator(
                            controller: _pageController, // PageController
                            count: itemCount,
                            effect: SlideEffect(), // your preferred effect
                            onDotClicked: (index) {})),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height15,
              ),
              Container(
                // color: Colors.red,
                width: Dimensions.screenWidth - Dimensions.width15 * 2,
                height: 200,
                child: GridView.count(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(8, (index) {
                    return TopCollictionWidget(
                        height: Dimensions.height20 * 4,
                        width: Dimensions.height20 * 4,
                        icon: Icons.fastfood_rounded,
                        iconSize: Dimensions.height30 * 2,
                        text: "topper");
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget dotIndicatorSelected(int itemindex) {
    if (itemindex == _currPageValue.floor()) {
      var currposition = 0.0;
      currposition = ((_currPageValue - itemindex) *
          Dimensions.width5.floorToDouble() *
          2);

      matrix = Matrix4.translationValues(currposition, 0, 0);
    } else if (itemindex == _currPageValue.floor() + 1) {
      matrix = Matrix4.translationValues(0, 0, 0);
    } else if (itemindex == _currPageValue.floor() - 1) {
      matrix = Matrix4.translationValues(0, 0, 0);
    } else {
      matrix = Matrix4.translationValues(0, 0, 0);
    }
    return Transform(
      transform: matrix,
      child: Container(
        margin: EdgeInsets.only(
          left: (Dimensions.width5 / 2).floorToDouble(),
          right: (Dimensions.width5 / 2).floorToDouble(),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
          color: itemindex == _currPageValue.floor()
              ? Colors.white
              : Colors.transparent,
        ),
        width: Dimensions.width5.floorToDouble(),
        height: Dimensions.width5.floorToDouble(),
      ),
    );
  }

  Container dotIndicator(int indexDot) {
// this container just for the current border at sliding becouse he is slide
    return Container(
      margin: EdgeInsets.only(
        left: (Dimensions.width5 / 2).floorToDouble(),
        right: (Dimensions.width5 / 2).floorToDouble(),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.radius15),
        border: Border.all(
          color: indexDot == _currPageValue.floor()
              ? Colors.white
              : Colors.transparent,
          width: indexDot == _currPageValue.floor() ? 1 : 0.0,
        ),
        color: Colors.transparent,
      ),
      width: Dimensions.width5.floorToDouble(),
      height: Dimensions.width5.floorToDouble(),
    );
  }

  Widget dotIndicatorPackage(int index) {
    return Container();
  }

  Widget sliderMethode(int index) {
    return Container(
      width: Dimensions.screenWidth - Dimensions.width15 * 2,
      decoration: BoxDecoration(
          color: index % 2 == 0 ? Colors.blue : Colors.green,
          image: DecorationImage(
            image: AssetImage("assets/images/offerfood.png"),
            fit: BoxFit.cover,
          )
          // color: Colors.transparent,
          ),
      height: 250,
    );
  }
}

// app bar
class AppBarContent extends StatelessWidget {
  const AppBarContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimensions.height56,
      width: Dimensions.screenWidth,
      decoration: BoxDecoration(
        border: Border(
            // bottom: Bor
            ),
        color: Colors.transparent,
      ),
      margin:
          EdgeInsets.only(left: Dimensions.width15, right: Dimensions.width15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // first part appbar
          SizedBox(
            width: Dimensions.screenWidth - Dimensions.radius15 * 4,
            height: Dimensions.height56,
            child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.only(left: 0, right: 0)),
                shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero)),
                shadowColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.white),
                overlayColor: MaterialStateProperty.all(
                  Colors.grey.withOpacity(0.2),
                ),
              ),
              onPressed: () {
                debugPrint(
                    "${Dimensions.screenHeight} + ${Dimensions.screenWidth}");
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BigText(text: "Delivering to"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BigText(
                        text: "Home",
                        size: Dimensions.height15,
                        fontWeight: FontWeight.bold,
                      ),
                      const Icon(
                        Icons.arrow_drop_down_rounded,
                        color: Colors.black,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // second part appbar
          Expanded(
            child: MaterialButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              child: SizedBox.expand(
                child: Center(
                    child: Icon(
                  Icons.notifications_none_outlined,
                  size: Dimensions.width25,
                  color: AppColors.textFirstColor,
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
