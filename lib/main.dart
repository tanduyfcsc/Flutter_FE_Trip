import 'package:fe_trip/FadeAnimation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Nunito'
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  late PageController _pageController;

  int totalPage = 3;


  void _onScroll(){
    // print('sss');
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 1,
    )..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //   title: Text(widget.title),
      // ),
      body: PageView(
        controller: _pageController,
        children: [
          makePage(
            page: 1,
            image: 'assets/images/one.jpg',
            title: 'Sạc Dự Phòng SamSung',
            description: 'Với thiết kế tinh tế nhỏ gọn thì sạc dự phòng của SamSung là một lựa chọn hoàn hảo'
                ' để gắn bó với bạn, hơn hết với sự kĩ lưỡng trong khâu sản suất và nghiên cứu thì sản phẩm của '
                'chúng tôi cực kì an toàn cho bạn.',
          ),
          makePage(
            page: 2,
            image: 'assets/images/three.jpg',
            title: 'Sạc Dự Phòng SamSung',
            description: 'Với thiết kế tinh tế nhỏ gọn thì sạc dự phòng của SamSung là một lựa chọn hoàn hảo'
                ' để gắn bó với bạn, hơn hết với sự kĩ lưỡng trong khâu sản suất và nghiên cứu thì sản phẩm của '
                'chúng tôi cực kì an toàn cho bạn.',
          ),
          makePage(
            page: 3,
            image: 'assets/images/two.jpg',
            title: 'Sạc Dự Phòng SamSung',
            description: 'Với thiết kế tinh tế nhỏ gọn thì sạc dự phòng của SamSung là một lựa chọn hoàn hảo'
                ' để gắn bó với bạn, hơn hết với sự kĩ lưỡng trong khâu sản suất và nghiên cứu thì sản phẩm của '
                'chúng tôi cực kì an toàn cho bạn.',
          ),
        ],
      ),
    );
  }

  Widget makePage({image, title, description, page}){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(image),
          fit: BoxFit.cover
        )
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            stops: [0.08,0.9],
            colors: [
              Colors.black.withOpacity(0.9),
              Colors.black.withOpacity(0.2),
            ]
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(page.toString(), style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                  Text('/'+ totalPage.toString(), style: TextStyle(color: Colors.white, fontSize: 15),)
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(2,
                    Text(title, style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),)
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow,size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow,size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow,size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.yellow,size: 15,),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          child: Icon(Icons.star, color: Colors.grey,size: 15,),
                        ),
                        Text('4.0', style: TextStyle(color: Colors.white70),),
                        Text('(2300)', style: TextStyle(color: Colors.white38, fontSize: 12),)
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 50),
                      child: Text(description, style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 15, height: 1.9),),
                    ),
                    SizedBox(height: 10,),
                    Text('READ MORE', style: TextStyle(color: Colors.white),),
                    SizedBox(height: 30,),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
