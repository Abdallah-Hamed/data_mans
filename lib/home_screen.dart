import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: Icon(
          Icons.menu,
        ),
        title: Text('leooooooooo'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notification_important,
            ),
            onPressed: () {
              print("abdalaaaaaaaaaaaaah");
            },
          ),
          IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () {
                print('leooooo');
              }),
        ],
      ),
      body:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image:NetworkImage(
'https://images.freecreatives.com/wp-content/uploads/2016/02/Cool-Pink-Flower-Background.jpeg' ,
                     
                    ),
              //       height: 200.0,
                     width: 200.0,
                  ),
               
                  Container(
                    padding: EdgeInsetsDirectional.only(
                      top: 3.0,
                      bottom: 3.0,
                    ),
                    color: Colors.black.withOpacity(0.5),
                    width: 200.0,
                    child: Text(
                      'flower',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  
               
               ],
         ),
            ),
          ),
        ],
      ),

   
    );
  }
}
