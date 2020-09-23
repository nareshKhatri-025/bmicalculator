import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/reuseable_card.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import 'result_page.dart';
import '../components/botom_button.dart';
import '../components/round_icon_button.dart';
import 'package:bmicalculator/calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int hieght = 180;
  int weight=60;
  int age=19;
  Gender selectedGender;

//  Color maleCardColor=inactiveCardColor;
//  Color femaleCardColor=inactiveCardColor;
//  int male=1;
//  int female=2;
  // male=1, female=2
//  void updateColor(Gender selectedGender)
//  {
//    if(selectedGender==Gender.male)
//      {
//        maleCardColor==inactiveCardColor?{
//
//            maleCardColor=activeCardColor,
//            femaleCardColor=inactiveCardColor}:maleCardColor=inactiveCardColor;
//      }
//    if(selectedGender==Gender.female)
//    {
//      if(femaleCardColor==inactiveCardColor)
//      {
//        femaleCardColor=activeCardColor;
//        maleCardColor=inactiveCardColor;
//      }
//      else
//        femaleCardColor=inactiveCardColor;
//    }
//  }
  // this is very defecult understand thats why we use dart ENUmS to replace it Understable;
  //Emums stand for Enumeration (the action of establishing the number of something)

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
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: ResuseableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                colour: selectedGender == Gender.male
                    ? kActiveCardColor
                    : kInactiveCardColor,
                cardChild:
                    new IconContent(icon: FontAwesomeIcons.male, label: "MALE"),
              )),
              Expanded(
                  child: ResuseableCard(
                onPress: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                colour: selectedGender == Gender.female
                    ? kActiveCardColor
                    : kInactiveCardColor,
                cardChild: IconContent(
                  icon: FontAwesomeIcons.female,
                  label: "FEMALE",
                ),
              )),
            ],
          )),
          Expanded(
              child: ResuseableCard(
            colour: kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "HIEGHT",
                  style: kLabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: <Widget>[
                    Text(hieght.toString(),
                        style: TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.w900)),
                    Text(
                      "  cm",
                      style: kLabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                    activeTrackColor: Colors.white,
                  ),
                  child: Slider(
                      value: hieght.toDouble(),
                      min: 120.0,
                      max: 220.0,
//                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          hieght = newValue.round();
                        });
//
//                    },
                      }),
                )
              ],
            ),
          )),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[
              Expanded(
                  child: ResuseableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    //Weight
                     Text(
                      "WEIGHT",style: kLabelTextStyle,
                    ),
                    Text(weight.toString(),
                          style: TextStyle(
                              fontSize: 50.0, fontWeight: FontWeight.w900)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(FontAwesomeIcons.minus,(){
                            setState(() {
                              weight--;
                            });
                          }),
                          SizedBox(width: 10,),
                          RoundIconButton(FontAwesomeIcons.plus,(){
                            setState(() {
                              weight++;
                            });
                          }),


                        ]),
                  ],
                ),
                colour: kActiveCardColor,
              )),
              Expanded(
                  child: ResuseableCard(cardChild:  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //Weight
                       Text(
                        "AGE",style: kLabelTextStyle,
                      ),
                      Text(age.toString(),
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.w900)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(FontAwesomeIcons.minus,(){
                              setState(() {
                                age--;
                              });

                            }),
                            SizedBox(width: 10.0,),
                            RoundIconButton(FontAwesomeIcons.plus,(){
                              setState(() {
                                age++;
                              });
                            })
                          ]),
                    ],
                  ),
                colour: kActiveCardColor,
              )),
            ],
          )),
          BottomButton(text: "CALCULATE",onTap:( ){
            CalculatorBrain cal= CalculatorBrain(hieght: hieght,weight: weight);
    Navigator.push(context,
    MaterialPageRoute(
    builder: (context)
    {return Result(bmi: cal.calculateBmi(),result: cal.getResult(),interpretation: cal.interpretation());
    },)
    );
    },),

        ],
      ),
    );
  }
}



