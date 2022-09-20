
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