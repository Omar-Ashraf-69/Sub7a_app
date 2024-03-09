import 'package:flutter/material.dart';
import 'package:iste9far/constents.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double precent = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kPrimaryColor[0]),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.color_lens,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(kPrimaryColor[0]),
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
                        onPressed: () {},
                        icon: const Icon(
                          Icons.remove_circle,
                        ),
                      ),
                      const Text(
                        "39",
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.add_circle,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomCounterTextButton(number: '1000+'),
                      CustomCounterTextButton(number: '100+'),
                      CustomCounterTextButton(number: '100'),
                      CustomCounterTextButton(number: '33'),
                      CustomCounterTextButton(number: '0'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'استغفار',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Text(
            '17',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CircularPercentIndicator(
              radius: 75,
              animation: true,
              animateFromLastPercent: true,
              percent: precent,
              center: IconButton(
                onPressed: () {
                  precent += 0.1;
                  setState(() {
                    if (precent >= 0.9) {
                      precent = 0;
                    }
                  });
                },
                icon: Icon(
                  Icons.ads_click_sharp,
                  size: 50,
                  color: Color(kPrimaryColor[0]),
                ),
              ),
              backgroundColor: Color(kPrimaryColor[0]).withOpacity(0.25),
              progressColor: Color(kPrimaryColor[0]),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const TrackingLineWidget(
            label: ' : مرات التكرار',
            repetationNum: 10,
          ),
          const TrackingLineWidget(
            repetationNum: 2,
            label: ' : المجموع',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButtonWidget(
        color: kPrimaryColor[0],
      ),
    );
  }
}

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    super.key,
    required this.color,
  });
  final int color;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(color),
      shape: const CircleBorder(),
      onPressed: () {},
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
            style: const TextStyle(
              fontSize: 22,
            ),
          ),
          Text(
            label,
            style: const TextStyle(
              fontSize: 22,
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
  });
  final String number;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            number,
            style: TextStyle(
              color: Color(kPrimaryColor[0]),
              fontWeight: FontWeight.w500,
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
