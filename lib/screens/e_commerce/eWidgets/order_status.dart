import 'package:flutter/material.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({Key? key}) : super(key: key);

  @override
  OrderStatusState createState() => OrderStatusState();
}

class OrderStatusState extends State<OrderStatus> {
  //
  int current_step = 0;
  List<Step> steps = [
    const Step(
      title: Text('Preparing order'),
      content: Text('packaging!'),
      isActive: true,
    ),
    const Step(
      title: Text('Ready to collect'),
      content: Text('almost out of store!'),
      isActive: true,
    ),
    const Step(
      title: Text('Delivery order'),
      content: Text('out for delivery!'),
      state: StepState.complete,
      isActive: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: current_step,
      steps: steps,
      type: StepperType.vertical,
      onStepTapped: (step) {
        setState(() {
          current_step = step;
        });
      },
      onStepContinue: () {
        setState(() {
          if (current_step < steps.length - 1) {
            current_step = current_step + 1;
          } else {
            current_step = 0;
          }
        });
      },
      onStepCancel: () {
        setState(() {
          if (current_step > 0) {
            current_step = current_step - 1;
          } else {
            current_step = 0;
          }
        });
      },
    );
  }
}
