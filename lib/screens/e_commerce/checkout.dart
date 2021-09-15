import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/screens/e_commerce/payment.dart';
import 'package:promdi_fe/widgets/custom_button.dart';
import 'package:promdi_fe/widgets/text_decoration.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

late String applepay, visa;

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Container(
        color: lightGrey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('Destination'),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text('Cecilia chapman 711-2280 Nulla St.'),
                        Text('Manakato Mississippi 96522.'),
                        Text('255 553-7652')
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.watch),
                                const Text('Fri, Jun 17,2020-12.30'),
                                SizedBox(
                                  width: size.width * 0.25,
                                ),
                                const Icon(Icons.skip_next)
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(Icons.watch_rounded),
                                const Text('Pick Up Time 30-40 Min'),
                                SizedBox(
                                  width: size.width * 0.25,
                                ),
                                const Icon(Icons.skip_next)
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Total'),
                    ),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text('Total'),
                            Text('0.78'),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Payment Method'),
                    ),
                    Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: TextFormField(
                              enabled: false,
                              autofocus: false,
                              validator: (value) =>
                                  value!.isEmpty ? 'ApplePay' : null,
                              onSaved: (value) => applepay = value!,
                              decoration: buildInputDecoration('Apple Pay',
                                  Icons.card_giftcard, outLineBorder),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: TextFormField(
                              enabled: false,
                              autofocus: false,
                              validator: (value) =>
                                  value!.isEmpty ? 'Visa' : null,
                              onSaved: (value) => visa = value!,
                              decoration: buildInputDecoration('Visa ***586',
                                  Icons.card_giftcard, outLineBorder),
                            ),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                width: 2.0,
                                color: greenCustom,
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Payment()),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                'Add payment method',
                                style: TextStyle(
                                  color: dark,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Promo Code'),
                    ),
                    Card(
                      child: Row(
                        children: [
                          const Icon(Icons.badge),
                          SizedBox(
                            width: size.width * 0.08,
                          ),
                          const Text('Add Promo Code'),
                          SizedBox(
                            width: size.width * 0.25,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20.0),
                            child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Payment()));
                              },
                              icon: const Icon(Icons.skip_next),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CustomButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Payment()));
                        },
                        title: 'Place Order',
                        customcolor: greenCustom,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
