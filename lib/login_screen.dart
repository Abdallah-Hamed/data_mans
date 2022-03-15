import 'package:flutter/material.dart';
import 'package:path/path.dart';

class LoginScreen extends StatelessWidget {
  var Emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('login',
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  controller: Emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: passcontroller,
                  keyboardType: TextInputType.visiblePassword,
                  onFieldSubmitted: (String value) {
                    print(value);
                  },
                  onChanged: (String value) {
                    print(value);
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.blue,
                  child: MaterialButton(
                    onPressed: () {
                      print(Emailcontroller);
                      print(passcontroller);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
             SizedBox(
               height: 10.0,
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(
                   'don \'t have an account ?   ',
          
                 ),
              TextButton(
                onPressed: (){},
                 child:
                 Text('Register now'),
                 
                 )
               ],
             ),
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}
