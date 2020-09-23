import 'package:bmicalculator/components/botom_button.dart';
import 'package:bmicalculator/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/components/reuseable_card.dart';
class Result extends StatelessWidget {
  final String interpretation;
  final result;
  final String bmi;
  Result({@required this.interpretation,@required this.result,@required this.bmi});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        titleSpacing: 1,
        primary: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(

            child: Container(
                alignment:Alignment.bottomLeft,
                padding: EdgeInsets.all(15.0),
                child: Text("Your Result",style: kTextTitleStyle,)),
          ),
          Expanded(
            flex: 5,
              child:ResuseableCard(colour: kActiveCardColor,cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(result,style: kresultTextStyle,),
                    Text(bmi,style: kBmiTextStyle,),
                    Text(interpretation,style: kBodyTextStyle,),




                  ],
                ),
              ),
          ),
          BottomButton(text: "RE-CALCULATE",onTap: (){
            Navigator.pop(context);
          },)
        ],
      )
    );
  }
}
