import 'package:flutter/material.dart';
import 'package:iste9far/constents.dart';
import 'package:iste9far/main.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double precent = 0;
  int counter = 0;
  int goal = 0;
  bool isVisiable = false;
  int sets = 0;
  setCounter(int value) async {
    final SharedPreferences counter = await SharedPreferences.getInstance();
    counter.setInt('counter', value);
    getCounter();
  }

  getCounter() async {
    final SharedPreferences count = await SharedPreferences.getInstance();

    setState(() {
      counter = count.getInt('counter') ?? 0;
    });
  }

  setGoal(int value) async {
    final SharedPreferences goal = await SharedPreferences.getInstance();
    goal.setInt('goal', value);
    getGoal();
  }

  getGoal() async {
    final SharedPreferences goa = await SharedPreferences.getInstance();

    setState(() {
      goal = goa.getInt('goal') ?? 0;
    });
  }

  setSets(int value) async {
    final SharedPreferences sets = await SharedPreferences.getInstance();
    sets.setInt('sets', value);
    getSets();
  }

  getSets() async {
    final SharedPreferences set = await SharedPreferences.getInstance();
    setState(() {
      sets = set.getInt('sets') ?? 0;
    });
  }

  @override
  void initState() {
    getCounter();
    getGoal();
    getSets();
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
                            setGoal(goal - 1);
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
                          setGoal(goal + 1);
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
                        onTap: () => setGoal(goal + 1000),
                      ),
                      CustomCounterTextButton(
                        number: '100+',
                        onTap: () => setGoal(goal + 100),
                      ),
                      CustomCounterTextButton(
                        number: '100',
                        onTap: () => setGoal(100),
                      ),
                      CustomCounterTextButton(
                        number: '33',
                        onTap: () => setGoal(33),
                      ),
                      CustomCounterTextButton(
                        number: '0',
                        onTap: () => setGoal(0),
                      ),
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
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CircularPercentIndicator(
              radius: 75,
              animation: true,
              animateFromLastPercent: true,
              addAutomaticKeepAlive: true,
              percent: precent,
              center: IconButton(
                onPressed: () {
                  precent += 0.1;
                  setCounter(counter + 1);
                  setState(() {
                    if (precent >= 1) {
                      precent = 0.1;
                    }
                  });
                },
                icon: Icon(
                  Icons.touch_app,
                  size: 50,
                  color: Color(hueColor),
                ),
              ),
              backgroundColor: Color(hueColor).withOpacity(0.25),
              progressColor: Color(hueColor),
            ),
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
                Radio(
                  value: kPrimaryColor[0],
                  overlayColor: MaterialStatePropertyAll(
                    Color(kPrimaryColor[0]),
                  ),
                  fillColor: MaterialStatePropertyAll(
                    Color(kPrimaryColor[0]),
                  ),
                  groupValue: hueColor,
                  toggleable: true,
                  onChanged: (value) {
                    setState(() {
                      hueColor = value ?? kPrimaryColor[0];
                    });
                  },
                ),
                Radio(
                  activeColor: Color(kPrimaryColor[1]),
                  overlayColor: MaterialStatePropertyAll(
                    Color(kPrimaryColor[1]),
                  ),
                  fillColor: MaterialStatePropertyAll(
                    Color(kPrimaryColor[1]),
                  ),
                  value: kPrimaryColor[1],
                  groupValue: hueColor,
                  onChanged: (value) {
                    setState(() {
                      hueColor = value!;
                    });
                  },
                ),
                Radio(
                  overlayColor: MaterialStatePropertyAll(
                    Color(kPrimaryColor[2]),
                  ),
                  fillColor: MaterialStatePropertyAll(
                    Color(kPrimaryColor[2]),
                  ),
                  value: kPrimaryColor[2],
                  groupValue: hueColor,
                  onChanged: (value) {
                    setState(() {
                      hueColor = value!;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButtonWidget(
        color: hueColor,
        onPressed: () {
          precent = 0;
          setCounter(0);
          setSets(0);
        },
      ),
    );
  }
}

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    super.key,
    required this.color,
    this.onPressed,
  });
  final int color;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(color),
      shape: const CircleBorder(),
      onPressed: onPressed,
      child: const Icon(
        Icons.refresh,
        color: Colors.white,
      ),
    );
  }
}

class TrackingLineWidget extends StatelessWidget {
  const TrackingLineWidget({
    super.key,
    required this.repetationNum,
    required this.label,
  });
  final int repetationNum;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            repetationNum.toString(),
            style: TextStyle(
              fontSize: 22,
              color: Color(hueColor),
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 22,
              color: Color(hueColor),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomCounterTextButton extends StatelessWidget {
  const CustomCounterTextButton({
    super.key,
    required this.number,
    this.onTap,
  });
  final String number;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            number,
            style: TextStyle(
              color: Color(hueColor),
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
