import 'package:flutter/material.dart';

void main()  => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Product layout demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
void _showDialog(BuildContext context){
  showDialog(context: context,builder: (BuildContext context){
    // return object of type Dialog
    return AlertDialog(
      title: new Text("Mensage"),
      content: new Text("Hola Hola Hola"),
      actions: <Widget>[
        new FlatButton(
          child: new Text("Cerrar"),
          onPressed: () {
            Navigator.of(context).pop();
            },
        )
      ],
    );
  });
} // End of _showDialog
    return Scaffold(
      appBar: AppBar(title: Text(this.title),),
     body: Center(
       child: GestureDetector(
         onTap: (){
           _showDialog(context);
         },
         child: Text("Hola Mundo",),
       ),
     )

      /* ListView(shrinkWrap: true,
         padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
         children: <Widget>[
           ProductBox(
             name: "Hi",
             description: "Here we are",
             image: "smiley.png",
           ),
           ProductBox(
             name: "Iphone",
             description: "Most stylish phone ever",
             price: 1000,
             image: "iphone.png",
           ),
           ProductBox(
             name: "Pixel",
             description: "Most featureful phone ever",
             price: 800,
             image: "pixel.png",
           ),
           ProductBox(
             name: "Laptop",
             description: "Most productive tool ever",
             price: 2000,
             image: "laptop.png",
           ),
           ProductBox(
             name: "Tablet",
             description: "Most useful device ever",
             price: 1500,
             image: "tablet.png",
           ),
           ProductBox(
             name: "Pendrive",
             description: "Useful storage medium",
             price: 100,
             image: "pendrive.png",
           ),
           ProductBox(
             name: "Floppy Drive",
             description: "Old Tech",
             price: 20,
             image: "floppy.jpeg",
           ),
         ],
     ),*/
    );
    /*
    return Container(
      decoration: BoxDecoration(color: Colors.white,),
      padding: EdgeInsets.all(25),child: Center(
      child:Text("Hola Mundo",style: TextStyle(
        color: Colors.black, letterSpacing: 0.5,fontSize: 20,
      ),textDirection: TextDirection.ltr,
      )
    ),
    );
 return Scaffold(
      appBar: AppBar(

        title: Text(this.title),
      ),
      body: Center(
        child: Image.asset("images/smiley.png"),
/*
        child: Text.rich(TextSpan(
    children: <TextSpan>[
      TextSpan(text: " Hola ", style:
    TextStyle(fontStyle: FontStyle.italic)),
    TextSpan(text: "Mundo", style:
    TextStyle(fontWeight: FontWeight.bold)),
    ],),
      ),
       */
      ),
    );
    */
  } // End of Widget
} // End class MyHomePage

class ProductBox extends StatelessWidget {
  ProductBox({Key key, this.name, this.description, this.price, this.image})
      : super(key: key);
  final String name;
  final String description;
  final int price;
  final String image;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2), height: 120,  child: Card(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
          Image.asset("images/" +image), Expanded(
              child: Container(
                  padding: EdgeInsets.all(5), child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  Text(this.name, style: TextStyle(fontWeight:
                  FontWeight.bold)), Text(this.description),
                   Text("Price: " + this.price.toString()),
                ],
              )
              )
          )
        ]
        )
    )
    );
  }
} // end of ProductBox
