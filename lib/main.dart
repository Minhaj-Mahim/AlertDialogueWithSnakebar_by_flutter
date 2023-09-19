import 'package:flutter/material.dart';

void main(){
  runApp(ButtonApp());
}
class ButtonApp extends StatelessWidget{
  const ButtonApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeActivity(),
    );
  }

}
class HomeActivity extends StatelessWidget{
  HomeActivity({super.key});
  
  MySnackBar(message,context){
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  MyAlertDialogue(context){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return Expanded(
              child: AlertDialog(
                title: Text("Alert!"),
                content: Text("Do you really want to delete?"),
                actions: [
                  TextButton(onPressed: (){
                    MySnackBar("Canceled", context);
                    Navigator.of(context).pop();
                    },
                    child: Text("Cancel"),),
                  TextButton(onPressed: (){
                    MySnackBar("Deleted", context);
                    Navigator.of(context).pop();
                    } , child: Text("Delete",style: TextStyle(color: Colors.red),),),
                ],
              )
          );
    }
    );
  }
  
  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.all(20),
    backgroundColor: Colors.green,
    foregroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20))
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button App"),
        centerTitle: true,
        backgroundColor: Colors.green,
        toolbarHeight: 70,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Button"),
            onPressed: (){MyAlertDialogue(context);},
            style: buttonStyle,
        ),
      ),
    );
  }

}
