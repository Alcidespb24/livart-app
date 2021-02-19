import 'package:flutter/material.dart';
import 'package:flutter_app/data_models/AppUser.dart';
import 'package:flutter_app/screens/authenticate/SignIn.dart';
import 'package:flutter_app/screens/home/Home.dart';
import 'package:flutter_app/widgets/CircleImage.dart';
import 'package:provider/provider.dart';

class Authenticate extends StatefulWidget{
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate>{
  Size circleImageSize = new Size(100,100);
  double topPadding = 100;
  double buttonPadding = 50;
  double inBetweenButtonsPadding = 20;

  @override
  Widget build(BuildContext context){
    final user = Provider.of<AppUser>(context);
    print('USER:'+ user.toString());
    return user == null ?
      Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: topPadding)),
            CircleImage(
              child: Image.asset('lib/assets/icons/app_icon.png'),
              size: circleImageSize,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: buttonPadding)),
            ElevatedButton(onPressed: (){
              Navigator.push(
                  context,
                MaterialPageRoute(builder: (context) => SignIn()));}, child: Text('Client Login')),
            Padding(padding: EdgeInsets.symmetric(vertical: inBetweenButtonsPadding)),
            ElevatedButton(onPressed: (){}, child: Text('Creator Login')),
          ],
    ),
        ),
      ) : Home();
  }
}



class ButtonCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    throw UnimplementedError();
  }

}