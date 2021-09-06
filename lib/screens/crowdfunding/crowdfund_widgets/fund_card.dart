import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:promdi_fe/widgets/custom_button.dart';

class CrowdFundCard extends StatefulWidget {
  final double padLeft;
  final double padRight;
  final String profileimage;
  final String investment;
  final String name;
  final String area;
  final String crop;
  final String location;
  final String harvest;
  final String roi;
  final String about;
  final VoidCallback onClick;
  const CrowdFundCard(
      {Key? key,
      required this.padLeft,
      required this.padRight,
      required this.profileimage,
      required this.name,
      required this.area,
      required this.crop,
      required this.location,
      required this.harvest,
      required this.roi,
      required this.investment,
      required this.about,
      required this.onClick})
      : super(key: key);

  @override
  _CrowdFundCardState createState() => _CrowdFundCardState();
}

class _CrowdFundCardState extends State<CrowdFundCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // color: lightGrey,
      child: Card(
        color: lightGrey,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: GestureDetector(
                onTap: widget.onClick,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(widget.profileimage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // title: Text(widget.name),
              title: Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Text(
                              widget.name,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Land Area',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              Text(
                                'Crop',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              Text(
                                'Location',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              Text(
                                'Harvest',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              Text(
                                'Estimated ROI',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              Text(
                                'Investment',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                widget.area,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              Text(
                                widget.crop,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              Text(
                                widget.location,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              Text(
                                widget.harvest,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              Text(
                                widget.roi,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              Text(
                                widget.investment,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.about,
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: new LinearPercentIndicator(
                      width: MediaQuery.of(context).size.width * 0.4,
                      animation: true,
                      lineHeight: 20.0,
                      animationDuration: 2500,
                      percent: 0.7,
                      center: Text(
                        "70.0% from investors",
                        style: TextStyle(fontSize: 10),
                      ),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      progressColor: greenCustom,
                    ),
                  ),
                  SizedBox(width: size.width * 0.16),
                  Expanded(
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'INVEST',
                          style: TextStyle(color: light),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(greenCustom),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
