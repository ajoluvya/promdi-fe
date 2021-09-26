import 'package:flutter/material.dart';
import 'package:promdi_fe/helpers/style.dart';
import 'package:promdi_fe/widgets/text_decoration.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({Key? key}) : super(key: key);

  @override
  _ContactInfoState createState() => _ContactInfoState();
}

late String date, name, gender, email, phone, address, province;

class _ContactInfoState extends State<ContactInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/carrot.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const Text('Name'),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextFormField(
                enabled: false,
                autofocus: false,
                validator: (value) => value!.isEmpty ? 'name' : null,
                onSaved: (value) => name = value!,
                decoration: buildInputDecoration(
                    'Jaime Dela Cruz', Icons.person, outLineBorder),
              ),
            ),
            const Text('Birth Date'),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextFormField(
                enabled: false,
                autofocus: false,
                validator: (value) => value!.isEmpty ? 'date' : null,
                onSaved: (value) => date = value!,
                decoration: buildInputDecoration(
                    '08 October 1990', Icons.calendar_today, outLineBorder),
              ),
            ),
            const Text('Gender'),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextFormField(
                enabled: false,
                autofocus: false,
                validator: (value) => value!.isEmpty ? 'gender' : null,
                onSaved: (value) => gender = value!,
                decoration:
                    buildInputDecoration('Male', Icons.male, outLineBorder),
              ),
            ),
            const Text('Email'),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextFormField(
                enabled: false,
                autofocus: false,
                validator: (value) => value!.isEmpty ? 'email' : null,
                onSaved: (value) => email = value!,
                decoration: buildInputDecoration(
                    'jamesdc@gmail.com', Icons.email, outLineBorder),
              ),
            ),
            const Text('Phone Number'),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: TextFormField(
                enabled: false,
                autofocus: false,
                validator: (value) => value!.isEmpty ? 'Phone No' : null,
                onSaved: (value) => name = value!,
                decoration: buildInputDecoration(
                    '0779609609', Icons.phone, outLineBorder),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
