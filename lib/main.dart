import 'package:flutter/material.dart';
void main()
{
  runApp(
     MaterialApp(
      home: Page1(),
    ),
  );
}

class Page1 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(),
      body:Center(
        child: ElevatedButton(
          onPressed:()
              {
                Navigator.of(context).push(_createRoute());
              },
          child:const Text("Go"),
        ),
      ),

    );
  }
}
Route _createRoute(){
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
        transitionsBuilder: (context, animation, secondaryAnimation,child)
  {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween (begin: begin , end:end).chain(CurveTween(curve:curve));
    return SlideTransition(
    position: animation.drive(tween),
  child:child,
    );
  },
  );
}
class Page2 extends StatelessWidget{
  const Page2({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text('Page 2')
      ),
    );
  }
}
import'package:flutter/material.dart';
void main() => runApp( MyApp());
class MyApp extends StatelessWidget{
  MyApp({super.key});
  @override
  Widget build(BuildContext context){
    const appTitle= "Opacity Demo";
    return const MaterialApp(
      title:appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>{
  bool _visible=true;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text(widget.title),
      ),
      body:Center(
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration :const Duration(milliseconds:500),
          child: Container(
            width:200.0,
            height:200.0,
            color: Colors.green,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          setState(() {
            _visible= !_visible;
          });
        },
        tooltip: 'Toggle Opacity',
        child:const Icon(Icons.flip),
      ),
    );
  }
}