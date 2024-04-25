import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: "Carousel Slider Lozano0373"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> imgList = [
    "https://raw.githubusercontent.com/DylanLozanoAvelar/Img_IOS/main/FlutterFlowA12/aceite-lubricante.png",
    "https://raw.githubusercontent.com/DylanLozanoAvelar/Img_IOS/main/FlutterFlowA12/diesel-monogrado.png",
    "https://raw.githubusercontent.com/DylanLozanoAvelar/Img_IOS/main/FlutterFlowA12/aditivo-ecologico.png",
    "https://raw.githubusercontent.com/DylanLozanoAvelar/Img_IOS/main/FlutterFlowA12/fluido-para-tractor.jpg",
    "https://raw.githubusercontent.com/DylanLozanoAvelar/Img_IOS/main/FlutterFlowA12/gasolina-monogrado.png"
  ];

  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            CarouselSlider(
              items: imgList
                  .map((e) => Center(
                        child: Image.network(e),
                      ))
                  .toList(),
              options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 2),
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (value, _) {
                    setState(() {
                      _currentPage = value;
                    });
                  }),
            ),
            buildCarouselIndicator()
          ],
        ),
      ),
    );
  }

  buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < imgList.length; i++)
          Container(
            margin: EdgeInsets.all(5),
            height: i == _currentPage ? 7 : 5,
            width: i == _currentPage ? 7 : 5,
            decoration: BoxDecoration(
                color: i == _currentPage ? Colors.black : Colors.grey,
                shape: BoxShape.circle),
          )
      ],
    );
  }
}
