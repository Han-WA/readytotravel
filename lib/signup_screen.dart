import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:switcher_button/switcher_button.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup-screen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late String _firstname;
  late String _lastname;
  late String _email;
  late String _nationality;
  late String _country;
  late String _phone;
  DateTime? _dateTime;

  FocusNode? node = null;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildFirstName() {
    return TextFormField(
      focusNode: node,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Theme.of(context).primaryColor),
      decoration: const InputDecoration(
        labelText: "First Name",
        labelStyle: TextStyle(color: Colors.grey),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return "Name is required!";
        }
      },
      onSaved: (String? value) {
        _firstname = value!;
      },
    );
  }

  Widget _buildLastName() {
    return TextFormField(
      focusNode: node,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Theme.of(context).primaryColor),
      decoration: const InputDecoration(
        labelText: "Last Name",
        labelStyle: TextStyle(color: Colors.grey),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return "Name is required!";
        }
      },
      onSaved: (String? value) {
        _lastname = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      focusNode: node,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Theme.of(context).primaryColor),
      decoration: const InputDecoration(
        labelText: "Email Address",
        labelStyle: TextStyle(color: Colors.grey),
      ),
      validator: (String? value) {
        String pattern =
            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
            r"{0,253}[a-zA-Z0-9])?)*$";
        RegExp regex = RegExp(pattern);
        if (value!.isEmpty || !regex.hasMatch(value)) {
          return "Enter a valid email address";
        }
      },
      onSaved: (String? value) {
        _email = value!;
      },
    );
  }

  Widget _buildNationality() {
    return TextFormField(
      focusNode: node,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Theme.of(context).primaryColor),
      decoration: const InputDecoration(
        labelText: "Nationality",
        labelStyle: TextStyle(color: Colors.grey),
      ),
      validator: (String? value) {
        if (value!.isEmpty || RegExp(r"[0-9]").hasMatch(value)) {
          return "Invalid Nationality";
        }
      },
      onSaved: (String? value) {
        _nationality = value!;
      },
    );
  }

  Widget _buildCountry() {
    return TextFormField(
      focusNode: node,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Theme.of(context).primaryColor),
      decoration: const InputDecoration(
        labelText: "Country",
        labelStyle: TextStyle(color: Colors.grey),
      ),
      validator: (String? value) {
        if (value!.isEmpty || RegExp(r"[0-9]").hasMatch(value)) {
          return "Please Enter a valid country name";
        }
      },
      onSaved: (String? value) {
        _country = value!;
      },
    );
  }

  Widget _buildPhone() {
    return TextFormField(
      focusNode: node,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.text,
      style: TextStyle(color: Theme.of(context).primaryColor),
      decoration: const InputDecoration(
        labelText: "Phone Number(Optional)",
        labelStyle: TextStyle(color: Colors.grey),
        hintText: "+65",
        hintStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      validator: (String? value) {
        if (value!.isNotEmpty &&
            !RegExp(r'^(?:[+0][1-9])?[0-9]{10,12}$').hasMatch(value)) {
          return "Please Enter Valid Phone ";
        }
      },
      onSaved: (String? value) {
        _phone = value!;
      },
    );
  }

  Widget _buildDatePicker() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Date of Birth"),
          TextButton(
            onPressed: () async {
              var datePicked = await DatePicker.showSimpleDatePicker(
                context,
                initialDate: DateTime(2000),
                firstDate: DateTime(1960),
                lastDate: DateTime(2022),
                dateFormat: "dd-MM-yyyy",
                locale: DateTimePickerLocale.en_us,
                looping: true,
              ).then((date) {
                setState(() {
                  _dateTime = date;
                });
              });
            },
            child: Text(_dateTime == null
                ? "DD/MM/YYYY"
                : "${_dateTime!.day} / ${_dateTime!.month} / ${_dateTime!.year}"),
          ),
        ],
      ),
    );
  }

  Widget _buildGender() {
    return Column(
      children: [
        const Text("Male | Female"),
        SizedBox(height: 10),
        SwitcherButton(
          onColor: Colors.orange,
          offColor: Colors.black,
          size: 80,
          value: true,
          onChange: (value) {
            if (value == true) {
              print("Male");
            } else {
              print("Female");
            }
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          //Form
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.15),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildFirstName(),
                        _buildLastName(),
                        _buildEmail(),
                        const SizedBox(
                          height: 14,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildDatePicker(),
                            Container(
                              width: 45,
                              child: Image.asset(
                                "assets/images/bdcake.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                            _buildGender(),
                          ],
                        ),
                        _buildNationality(),
                        _buildCountry(),
                        _buildPhone(),
                        const SizedBox(height: 30),
                        //Create acc Button
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: const LinearGradient(
                              begin: Alignment(-0.95, 0.0),
                              end: Alignment(1.0, 0.0),
                              colors: [Color(0xff45F4FF), Color(0xff64b6ff)],
                              stops: [0.0, 1.0],
                            ),
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (!_formKey.currentState!.validate()) {
                                return showDialog(
                                  context: context,
                                  builder: (context) {
                                    return const AlertDialog(
                                      actions: [
                                        Text(
                                            "Sorry, Your account has not been created"),
                                      ],
                                    );
                                  },
                                );
                              }
                              _formKey.currentState!.save();
                              print(_firstname);
                              print(_lastname);
                              print(_email);
                              print(_nationality);
                              print(_country);
                              print(_phone);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              onSurface: Colors.transparent,
                              minimumSize: const Size(320, 50),
                            ),
                            child: const Center(
                              child: Text(
                                "Create my account now",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //Message
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            height: 110,
            width: double.infinity,
            color: Theme.of(context).primaryColorLight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Almost there!",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Complete the form below to create\nyour Ready To Travel account",
                  style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "*Mandatory",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          //Guiterist
          Positioned(
            height: 100,
            width: 100,
            top: 50,
            right: 20,
            child: Image.asset("assets/images/guitar.png"),
          ),
        ],
      ),
    );
  }
}
