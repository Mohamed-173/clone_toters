import 'package:flutter/material.dart';
import 'package:toters_ui_clone/utils/colors.dart';
import 'package:toters_ui_clone/utils/dimensions.dart';
// import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            children: [
              Container(
                color: Colors.amber,
                height: Dimensions.height56,
              ),
              // Slider part image scroller carusel
              Container(
                height: 250,
                width: Dimensions.screenWidth - Dimensions.width15 * 2,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return sliderMethode(index);
                        }),
                    Positioned(
                      bottom: Dimensions.height20,
                      child: Wrap(
                        children: List.generate(
                          3,
                          (indexDot) => dotIndicator(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container dotIndicator() {
    return Container(
      margin: EdgeInsets.only(
          left: Dimensions.width5 / 2, right: Dimensions.width5 / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white, width: 1),
        // color: Colors.white,
      ),
      width: 10,
      height: 10,
    );
  }

  Widget sliderMethode(int index) {
    return Container(
      // margin: EdgeInsets.only(left: 0, right: 0),
      // clipBehavior: Clip.hardEdge,
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
            width: Dimensions.screenWidth * 0.85,
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
                  Text(
                    "Delivering To",
                    style: TextStyle(color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        "Home ",
                        style: TextStyle(color: Colors.black),
                      ),
                      Icon(
                        Icons.arrow_drop_down_rounded,
                        color: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          // second part appbar

          Expanded(
            child: SizedBox(
              height: Dimensions.height56,
              child: IconButton(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(0),
                onPressed: () {
                  debugPrint("fffffff");
                },
                icon: const Icon(Icons.notifications_none),
                iconSize: 25,
              ),
            ),
          )
        ],
      ),
    );
  }
}
