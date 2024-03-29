import 'package:flutter/material.dart';

void main() {
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: CalculatorApp(),
    );
  }
}

const colorDark = Color(0xFF374352);
const colorLight = Color(0xFFe6eeff);

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  bool darkMode = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? colorDark : colorLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Center(
                    child: Column(
                  children: [
                    Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                darkMode ? darkMode = false : darkMode = true;
                              });
                            },
                            child: _switchMode()),
                        const SizedBox(
                          height: 30,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '6.010',
                            style: TextStyle(
                                fontSize: 55,
                                fontWeight: FontWeight.bold,
                                color: darkMode ? Colors.white : Colors.black),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '=',
                              style: TextStyle(
                                  fontSize: 35,
                                  color: darkMode ? Colors.green : Colors.grey),
                            ),
                            Text(
                              '10+500*12',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: darkMode ? Colors.green : Colors.grey),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    )),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buttonOval(title: 'sin'),
                              _buttonOval(title: 'tan'),
                              _buttonOval(title: 'cos'),
                              _buttonOval(title: '%'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buttonRounded(
                                  title: 'C',
                                  textColor: darkMode
                                      ? Colors.green
                                      : Colors.redAccent),
                              _buttonRounded(title: '('),
                              _buttonRounded(title: ')'),
                              _buttonRounded(
                                  title: '/',
                                  textColor: darkMode
                                      ? Colors.green
                                      : Colors.redAccent)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buttonRounded(title: '7'),
                              _buttonRounded(title: '8'),
                              _buttonRounded(title: '9'),
                              _buttonRounded(
                                  title: 'x',
                                  textColor: darkMode
                                      ? Colors.green
                                      : Colors.redAccent)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buttonRounded(title: '4'),
                              _buttonRounded(title: '5'),
                              _buttonRounded(title: '5'),
                              _buttonRounded(
                                  title: '-',
                                  textColor: darkMode
                                      ? Colors.green
                                      : Colors.redAccent)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buttonRounded(title: '1'),
                              _buttonRounded(title: '2'),
                              _buttonRounded(title: '3'),
                              _buttonRounded(
                                  title: '+',
                                  textColor: darkMode
                                      ? Colors.green
                                      : Colors.redAccent)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buttonRounded(title: '0'),
                              _buttonRounded(title: ','),
                              _buttonRounded(
                                  icon: Icons.backspace_outlined,
                                  iconColor: darkMode
                                      ? Colors.green
                                      : Colors.redAccent),
                              _buttonRounded(
                                  title: '=',
                                  textColor: darkMode
                                      ? Colors.green
                                      : Colors.redAccent)
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonRounded({
    String? title,
    double padding = 17,
    IconData? icon,
    Color? iconColor,
    Color? textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: NeuContainer(
        padding: EdgeInsets.all(padding),
        darkMode: darkMode,
        borderRadius: BorderRadius.circular(40),
        child: Container(
          width: padding * 2,
          height: padding * 2,
          child: Center(
              child: title != null
                  ? Text(
                      title,
                      style: TextStyle(
                          color: textColor != null
                              ? textColor
                              : darkMode
                                  ? Colors.white
                                  : Colors.black,
                          fontSize: 30),
                    )
                  : Icon(
                      icon,
                      color: iconColor,
                    )),
        ),
      ),
    );
  }

  Widget _buttonOval({String? title, double padding = 17}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: NeuContainer(
        darkMode: darkMode,
        borderRadius: BorderRadius.circular(50),
        padding:
            EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
        child: Container(
          width: padding * 2,
          child: Center(
            child: Text(
              '$title',
              style: TextStyle(
                color: darkMode ? Colors.white : Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _switchMode() {
    return NeuContainer(
        darkMode: darkMode,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        borderRadius: BorderRadius.circular(40),
        child: Container(
          width: 70,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Icon(
              Icons.wb_sunny,
              color: darkMode ? Colors.grey : Colors.redAccent,
            ),
            Icon(
              Icons.nightlight_round,
              color: darkMode ? Colors.green : Colors.grey,
            ),
          ]),
        ));
  }
}

class NeuContainer extends StatefulWidget {
  final bool? darkMode;
  final Widget? child;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;

  NeuContainer(
      {this.darkMode = false, this.child, this.borderRadius, this.padding});
  @override
  _NeuContainerState createState() => _NeuContainerState();
}

class _NeuContainerState extends State<NeuContainer> {
  bool _isPressed = false;
  void _onPointerDown(PointerEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool? darkmode = widget.darkMode;
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: darkmode! ? colorDark : colorLight,
            borderRadius: widget.borderRadius,
            boxShadow: _isPressed
                ? null
                : [
                    BoxShadow(
                      color:
                          darkmode ? Colors.black45 : Colors.blueGrey.shade200,
                      offset: const Offset(4.0, 4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ),
                    BoxShadow(
                      color: darkmode ? Colors.blueGrey.shade700 : Colors.white,
                      offset: const Offset(-4.0, -4.0),
                      blurRadius: 15.0,
                      spreadRadius: 1.0,
                    ),
                  ],
          ),
          child: widget.child),
    );
  }
}
