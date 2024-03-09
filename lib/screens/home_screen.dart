import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iste9far/constents.dart';
import 'package:iste9far/widgets/circular_precent_indicator_widget.dart';
import 'package:iste9far/widgets/custom_counter_text_button_widget.dart';
import 'package:iste9far/widgets/floating_action_widget.dart';
import 'package:iste9far/widgets/radio_widget.dart';
import 'package:iste9far/widgets/tracking_line_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double precent = 0;
  int counter = 0;
  int goal = 33;
  bool isVisiable = false;
  int sets = 0;

  void setingFun({
    required int callerVariable,
    required String key,
    required int value,
  }) async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setInt(key, value);
    getingFun(callerVariable: callerVariable, key: key);
  }

  void getingFun({
    required int callerVariable,
    required String key,
  }) async {
    final SharedPreferences shared = await SharedPreferences.getInstance();
    setState(() {
      if (key == 'counter') {
        counter = shared.getInt(key) ?? 0;
      } else if (key == 'sets') {
        sets = shared.getInt(key) ?? 0;
      } else if (key == 'goal') {
        goal = shared.getInt(key) ?? 0;
      }
    });
  }

  @override
  void initState() {
    getingFun(
      callerVariable: counter,
      key: 'counter',
    );
    getingFun(
      callerVariable: sets,
      key: 'sets',
    );
    getingFun(
      callerVariable: goal,
      key: 'goal',
    );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(hueColor),
        leading: IconButton(
          onPressed: () {
            isVisiable = !isVisiable;
            setState(() {});
          },
          icon: const Icon(
            Icons.color_lens,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(hueColor),
            ),
            height: size.height * 0.22,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'الهدف',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          if (goal != 0) {
                            setingFun(
                                callerVariable: goal,
                                key: 'goal',
                                value: goal - 1);
                          }
                        },
                        icon: const Icon(
                          Icons.remove_circle,
                        ),
                      ),
                      Text(
                        goal.toString(),
                        style: const TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setingFun(
                            callerVariable: goal,
                            key: 'goal',
                            value: goal + 1,
                          );
                        },
                        icon: const Icon(
                          Icons.add_circle,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCounterTextButton(
                        number: '1000+',
                        onTap: () {
                          if(isLateGoalNotPossiable()){
                            setingFun(
                              callerVariable: counter, key: 'counter', value: 0,);
                          }
                          setingFun(
                              callerVariable: goal, key: 'goal', value: goal +1000,);
                          
                        },
                      ),
                      CustomCounterTextButton(
                        number: '100+',
                        onTap: () {
                          if(isLateGoalNotPossiable()){
                            setingFun(
                              callerVariable: counter, key: 'counter', value: 0,);
                          }
                          setingFun(
                              callerVariable: goal, key: 'goal', value: goal +100,);
                          
                        },
                      ),
                      CustomCounterTextButton(
                        number: '100',
                        onTap: (){
                          if(isLateGoalNotPossiable()){
                            setingFun(
                              callerVariable: counter, key: 'counter', value: 0,);
                          }
                          setingFun(
                              callerVariable: goal, key: 'goal', value: 100,);
                          
                        }
                      ),
                      CustomCounterTextButton(
                        number: '33',
                        onTap: () {
                          if(isLateGoalNotPossiable()){
                            setingFun(
                              callerVariable: counter, key: 'counter', value: 0,);
                          }
                          setingFun(
                              callerVariable: goal, key: 'goal', value: 33,);
                          
                        },
                      ),
                      CustomCounterTextButton(
                          number: '0',
                          onTap: () {
                            setingFun(
                              callerVariable: goal,
                              key: 'goal',
                              value: 0,
                            );
                            setingFun(
                              callerVariable: counter,
                              key: 'counter',
                              value: 0,
                            );
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'استغفار',
            style: TextStyle(
              fontSize: 28,
              color: Color(hueColor),
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            counter.toString(),
            style: TextStyle(
              fontSize: 32,
              color: Color(hueColor),
              fontWeight: FontWeight.w600,
            ),
          ),
          CircularPercentIndicatorWidget(
            precent: calculatePercentage(),
            counter: counter,
            onPressed: () {
              if (precent == 1) {
                precent = 0;
                setState(() {});
              }

              setingFun(
                callerVariable: counter,
                key: 'counter',
                value: counter + 1,
              );
              if (counter == goal) {
                setingFun(callerVariable: counter, key: 'counter', value: 1);
              }
              if (counter == goal - 1) {
                setingFun(callerVariable: sets, key: 'sets', value: sets + 1);

                Fluttertoast.showToast(
                  msg: "أحبَّ الاعملِ إلى اللَّهِ أدومُهُ وإن قلَّ",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Color(hueColor),
                  textColor: Colors.white,
                  fontSize: 14.0,
                );
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TrackingLineWidget(
            label: ' : المجموع',
            repetationNum: counter,
          ),
          TrackingLineWidget(
            label: ' : مرات التكرار',
            repetationNum: sets,
          ),
          const Spacer(),
          Visibility(
            visible: isVisiable,
            child: Row(
              children: [
                RaidoWidget(
                  radioValue: kPrimaryColor[0],
                  onChanged: (value) {
                    setState(() {
                      hueColor = value ?? kPrimaryColor[0];
                    });
                  },
                ),
                RaidoWidget(
                  radioValue: kPrimaryColor[1],
                  onChanged: (value) {
                    setState(() {
                      hueColor = value ?? kPrimaryColor[1];
                    });
                  },
                ),
                RaidoWidget(
                  radioValue: kPrimaryColor[2],
                  onChanged: (value) {
                    setState(() {
                      hueColor = value ?? kPrimaryColor[2];
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButtonWidget(
        color: hueColor,
        onPressed: () {
          precent = 0;
          setingFun(
            callerVariable: counter,
            key: 'counter',
            value: 0,
          );
          setingFun(
            callerVariable: sets,
            key: 'sets',
            value: 0,
          );
        },
      ),
    );
  }

  double calculatePercentage() {
    if (goal == 0 || counter > goal) {
      return 0.0; // or any other suitable handling
    } else {
      return counter / goal;
    }
  }

  bool isLateGoalNotPossiable() {
    if (goal < counter) {
      return true;
    } else {
      return false;
    }
  }
}
