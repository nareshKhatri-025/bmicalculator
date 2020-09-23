import 'dart:math';

import 'main.dart';
class CalculatorBrain
{
  final hieght;
  final weight;
  CalculatorBrain({this.weight,this.hieght});
  double _bmi;
  String calculateBmi()
  {
    _bmi=weight/pow(hieght/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult()
  {
    if(_bmi >=25 )
      {
        return "Overweight";
      }
    else if(_bmi>18.5)
      {
        return "Normal";
      }
    else
      return "Underweight";
  }
  String interpretation()
  {
    if(_bmi>=25)
    {
      return "You have a higher than a normal body weight. Try to excercise more";
    }
    else if(_bmi>18.5)
    {
      return "You have normal body weight. Good Job";
    }
    else
      return "You have lower than noraml body weight . You can eat a bit more";
  }
  }


