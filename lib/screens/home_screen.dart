import 'dart:developer';

import 'package:demo_project/screens/google_map.dart';
import 'package:demo_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/homeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getInitials();
    super.initState();
  }

  void getInitials() async {
    final provider = Provider.of<MyProvider>(context, listen: false);
    await provider.getHomeScreenData();
    // provider.
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(
      context,
    );
    log(provider.loginData.authToken ?? '');
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: provider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : provider.homeData.status == null
                ? const Center(child: Text('No Data'))
                : homeUi(),
      ),
    );
  }

  Widget homeUi() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final provider = Provider.of<MyProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: height * 0.08,
                child: Row(
                  children: [
                    const Expanded(child: Icon(Icons.menu)),
                    Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/profile.jpg"),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Policy Holder"),
                                Text(
                                  "Swati Singh",
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ],
                        )),

                    // Spacer(),
                    const Expanded(
                      child: Text(
                        'SOS',
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          headingWidget("POLICY DETAILS"),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('MARUTI SUZUKI ZXI 2017',
                      style: Theme.of(context).textTheme.subtitle1),
                ),
                Row(
                  children: [
                    Expanded(
                        child: titleValueWidget(
                            title: 'Policy no', value: 'EOIP978763623')),
                    Container(
                      height: 30,
                      width: 1,
                      color: Colors.black,
                    ),
                    Expanded(
                        child: titleValueWidget(
                            title: 'Last Premium', value: 'INR2356')),
                    Container(
                      height: 30,
                      width: 1,
                      color: Colors.black,
                    ),
                    Expanded(
                        child: titleValueWidget(
                            title: 'Expiration Date', value: '12/8/2020')),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 1, color: primaryColor)),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.directions_car,
                                  size: 40,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            titleValueWidget(
                                title: "Registration number",
                                value: "HP01X9986"),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                          ),
                          child: Text(
                            'VIEW DETAILS',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const GooglMapScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                          // width: width * 0.40,
                          child: cardWidget(title: 'ACCIDENTS', value: '2')),
                      Expanded(
                          // width: width * 0.40,
                          child: cardWidget(title: 'ALERTS', value: '20')),
                    ],
                  ),
                ),
              ],
            ),
          ),
          headingWidget("TRIP DETAILS"),
          SizedBox(
            width: double.infinity,
            child: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.calendar_month,
                            ),
                            Text('DRIVER PERFORMANCE'),
                          ],
                        ),
                        const Text('1 Jan - & Jan 2020'),
                        SizedBox(
                          height: height * 0.04,
                        ),
                        Row(
                          children: [
                            CircularPercentIndicator(
                              radius: 50.0,
                              // lineWidth: 13.0,
                              animation: true,
                              percent:
                                  provider.homeData.avgLastSafetyScore! / 100,
                              center: Text.rich(TextSpan(children: [
                                TextSpan(
                                    text:
                                        "${provider.homeData.avgLastSafetyScore!.toDouble()}%",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0)),
                              ])),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.yellow,
                              footer: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('LAST WEEK'),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.08,
                            ),
                            CircularPercentIndicator(
                              radius: 80.0,
                              animation: true,
                              percent: provider.homeData.avgSafetyScore! / 100,
                              center: Text.rich(TextSpan(children: [
                                TextSpan(
                                    text:
                                        "${provider.homeData.avgSafetyScore!.toDouble()}%",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0)),
                              ])),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: Colors.green,
                              footer: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('EXCELLENT SCORE'),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: height * 0.11,
                        )
                      ],
                    ),
                  ),
                  Card(
                    elevation: 10,
                    // ignore: sort_child_properties_last
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            size: 30,
                            color: Colors.white,
                          ),
                          Text(
                            'WEEKLY',
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                    ),
                    color: Colors.blue,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  cardWidget({String? title, String? value}) {
    return Card(
      child: Row(
        children: [
          SizedBox(
            width: 5,
          ),
          titleValueWidget(title: title ?? '', value: value ?? ''),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.04,
          ),
          Expanded(
            child: Container(
              height: 60,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  color: primaryColor),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'VIEW \n DETAILS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 12),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  headingWidget(String? title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title ?? '',
            style: Theme.of(context).textTheme.bodyText1,
          )),
    );
  }

  titleValueWidget({String? title, String? value}) {
    return Column(
      children: [
        Text(
          title ?? '',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        const SizedBox(
          height: 2,
        ),
        Text(
          value ?? '',
          style: Theme.of(context).textTheme.bodyText2,
        )
      ],
    );
  }
}
