import 'package:ecop/API/User/AllCasesUserIdAPI.dart';
import 'package:ecop/API/User/FIRFromUserAPI.dart';
import 'package:ecop/Utils/RoutesCode.dart';
import 'package:ecop/Utils/Variables.dart';
import 'package:flutter/material.dart';

class UserHome extends StatefulWidget {
  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.person),
        title: Center(child: Text("User")),
        actions: [
          IconButton(onPressed: (){
            Navigator.popAndPushNamed(context, LoginRouteCode);
          }, icon: Icon(Icons.logout)),
        ],
      ),
      body: Container(
        width: Width,
        height: Height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Line("Name", User.Name),
            Line("Adhar", User.Adhar),
            Line("Mobile", User.Mobile),
            SizedBox(height: 20,),
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context, NewFIRRouteCode);
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add,color: Colors.white,),
                      SizedBox(width: 5,),
                      Text("New FIR",style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),),
                    ],
                  )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: (){
                    FIRFromUserAPI().then((value){
                      Navigator.pushNamed(context, AllFIRUserRouteCode);
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: Text("All FIR",style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),)
                  ),
                ),
                TextButton(
                  onPressed: (){
                    AllCasesFromUserAPI().then((value) {
                      Navigator.pushNamed(context, AllCasesUserRouteCode);
                    });
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue,
                      ),
                      child: Text("All Cases",style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                      ),)
                  ),
                ),
              ],
            ),
          ],
        )
      ),
    );
  }

  Widget Line(String a, String b){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(a + ": ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
        Text(b,style: TextStyle(fontSize: 20),)
      ],
    );
  }

}
