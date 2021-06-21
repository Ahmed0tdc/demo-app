import 'package:flutter/material.dart';
import 'package:tiki_taka_app/src/utils/styles.dart';

class DraggableCarousel extends StatefulWidget {
  DraggableCarousel({Key? key}) : super(key: key);

  @override
  _DraggableCarouselState createState() => _DraggableCarouselState();
}

class _DraggableCarouselState extends State<DraggableCarousel> {
  final List<HomeCard> homeCards = [
    HomeCard(
      img: "model_1",
      caption: "je veux vendre mon maillot 100€",
      icon: "logo hall of fame",
    ),
    HomeCard(
      img: "model_2",
      caption: "Maillot jusqu'à 99€",
      icon: "icone retro soccer shirt",
    ),
    HomeCard(
      img: "model_3",
      caption: "Maillot préparé pour être porter en match",
      hasTitle: false,
      title: "match issue",
      icon: "award",
    ),
    HomeCard(
      img: "model_4",
      caption: "Maillot porté en match",
      hasTitle: false,
      title: "match worn",
      icon: "heart",
    ),
  ];

  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.8,
      keepPage: false,
    );
 
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      pageSnapping: true,
      itemCount: this.homeCards.length,
      itemBuilder: (BuildContext context, int index) {
        Widget caption = Text(
          this.homeCards[index].caption,
          style: homeCardCaptionTS,
          textAlign: TextAlign.center,
        );
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.5), BlendMode.dstATop),
                image: AssetImage(
                    "assets/images/${this.homeCards[index].img}.png"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/icons/${this.homeCards[index].icon}.png",
                  fit: BoxFit.fill,
                ),
                !this.homeCards[index].hasTitle
                    ? Text(
                        this.homeCards[index].title!.toUpperCase(),
                        style: latoBoldTS,
                      )
                    : SizedBox.shrink(),
                caption,
              ],
            ),
          ),
        );
      },
    );

    // SizedBox(
    //   height: 500,
    //   child: ListView.builder(
    //     padding: const EdgeInsets.all(10),
    //     scrollDirection: Axis.horizontal,
    //     itemCount: homeCards.length,
    //     itemBuilder: (context, index) {
    //       Widget caption = Text(
    //         this.homeCards[index].caption,
    //         style: homeCardCaptionTS,
    //         textAlign: TextAlign.center,
    //       );
    //       return Padding(
    //         padding:
    //             EdgeInsets.symmetric(horizontal: index % 2 == 0 ? 0 : 20.0),
    //         child: Container(
    //           // color: Colors.blue,
    //           width: 300,
    //           child: Stack(
    //             alignment: Alignment.center,
    //             children: [
    //               Opacity(
    //                 opacity: 0.5,
    //                 child: Image.asset(
    //                     "assets/images/${this.homeCards[index].img}.png"),
    //               ),
    //               Column(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: [
    //                   Image.asset(
    //                       "assets/icons/${this.homeCards[index].icon}.png"),
    //                   !this.homeCards[index].hasTitle
    //                       ? Text(this.homeCards[index].title!.toUpperCase(), style: latoBoldTS,)
    //                       : SizedBox.shrink(),
    //                   caption,
    //                 ],
    //               )
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}

class HomeCard {
  final String img;
  final String icon;
  final String? title;
  final bool hasTitle;
  final String caption;

  HomeCard({
    this.title,
    this.hasTitle = true,
    required this.img,
    required this.icon,
    required this.caption,
  });
}
