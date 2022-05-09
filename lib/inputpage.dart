import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//CONSTANTES
const labelStyle = TextStyle(
  fontSize: 18.0,
  color: Color.fromARGB(255, 255, 255, 255),
);
const kBottomContainerHeight = 80.0;
const kBottomContainerColor = Color(0xFFEB1555);
const kActiveCardColor = Color(0xFF1D1E33);
const kInActiveCardColor = Color(0xFF111328);

const kLabelStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
);
////-----------------------------------------------------------
int height = 180;
int weight = 30;

enum Gender { male, female, cake }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleColor = Color.fromARGB(255, 56, 58, 98);
  Color fmaleColor = Color.fromARGB(255, 56, 58, 98);

  Color cakeColor = Color.fromARGB(255, 97, 56, 98);
  Color dev = Color.fromARGB(255, 97, 56, 98);

  Color inactColor = Color.fromARGB(255, 56, 58, 98);
  Color activeColor = Color.fromARGB(255, 235, 21, 85);

  void update(Gender selected) {
    if (selected == Gender.male) {
      if (maleColor == inactColor) {
        maleColor = activeColor;
        fmaleColor = inactColor;
      } else {
        maleColor = inactColor;
      }
    }

    if (selected == Gender.female) {
      if (fmaleColor == inactColor) {
        fmaleColor = activeColor;
        maleColor = inactColor;
      } else {
        fmaleColor = inactColor;
      }
    }
  }
/*
  void leche(int selc) {
    if (selc == 1) {
      cakeColor = Color.fromARGB(255, 98, 56, 67);
    } else {
      dev = Color.fromARGB(255, 98, 56, 67);
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
/////////////////////
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        update(Gender.male);
                      });
                    },
                    child: Reusable(
                      colour: maleColor,
                      content: ReusableIcon(
                          icon: FontAwesomeIcons.mars, label: 'MALE'),
                    ),
                  ),
                ),
                //________________________________________________________

                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        update(Gender.female);
                      });
                    },
                    child: Reusable(
                      colour: fmaleColor,
                      content: ReusableIcon(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                    ),
                  ),
                ),
                //________________________________________________________
              ],
            ),
          ),
          //__________________________________________________________________________________________________________________________ PRIMERA DIVISION

          //________________________________________________________

          Expanded(
            child: new ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color.fromRGBO(235, 21, 85, 1),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderThumbShape(enabledThumbRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
              onPress: () {
                //onPressed();
              },
            ),
          ),

          //________________________________________________________
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        //leche(1);
                      });
                    },
                    child: Reusable(
                      colour: cakeColor,
                      content: ReusableIcon(
                          icon: FontAwesomeIcons.cakeCandles, label: ''),
                    ),
                  ),
                ),
                //________________________________________________________
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // leche(2);
                      });
                    },
                    child: Reusable(
                      colour: dev,
                      content: ReusableIcon(
                          icon: FontAwesomeIcons.deviantart, label: ''),
                    ),
                  ),
                ),

                //________________________________________________________
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//clase reusable
class Reusable extends StatelessWidget {
  Reusable({required this.colour, required this.content});
  final Color colour;
  final Widget content;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: content,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

class ReusableIcon extends StatelessWidget {
  ReusableIcon({required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 100.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          '$label',
          style: labelStyle,
        )
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.colour, required this.cardChild, required this.onPress});
  final Color colour;
  final Widget cardChild;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: () {
        onPressed();
      },
      shape: CircleBorder(),
      fillColor: Color.fromARGB(255, 255, 255, 255),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 6.0,
    );
  }
}




/*
//------------------------------------------------------------------------------ AGREGADO

class IconContent extends StatelessWidget {
  const IconContent({required this.icon, required this.label});

  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          '$label',
          style: labelStyle,
        )
      ],
    );
  }
}
*/