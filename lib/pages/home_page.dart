import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/providers/home_page_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider test'),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: ChangeNotifierProvider<HomePageProvider>(
            create: (context) => HomePageProvider(),
            child: Consumer<HomePageProvider>(
              builder: (context, provider, child) {
                return Column(children:  <Widget>[
                  Text(provider.eligibiltyMessage.toString(),style: TextStyle(
                      color: (provider.isEligible == true)?Colors.green:Colors.red)),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(hintText: 'Enter your age'),
                    onChanged: (val){
                      if(val.isNotEmpty)
                        provider.checkEligibility(int.parse(val));
                    },
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(provider.isButtonPress?Colors.blue:Colors.red),
                    ),
                    onPressed: (){
                      provider.isButtonPress = !provider.isButtonPress;
                      provider.checkButtonPress( provider.isButtonPress);
                    },
                    child: Text('TextButton'),
                  )
                ]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
