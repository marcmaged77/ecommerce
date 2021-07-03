import 'package:flutter/material.dart';



class textFieldTest extends StatefulWidget {
  const textFieldTest({Key key}) : super(key: key);

  @override
  _textFieldTestState createState() => _textFieldTestState();
}

class _textFieldTestState extends State<textFieldTest> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  // This function is triggered when the "Save" button is pressed
  void _saveForm() {
    final bool isValid = _formKey.currentState.validate();
    if(isValid){
      print('Got a valid input');
      // And do something here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kindacode.com'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value.trim().length < 8) {
                    return 'This field requires a minimum of 3 characters';
                  }

                  return null;
                },
                decoration: InputDecoration(
                    labelText: 'Enter Your Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)

                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red, width: 5))),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton.icon(
                  onPressed: _saveForm,
                  icon: Icon(Icons.save),
                  label: Text('Save'))
            ],
          ),
        ),
      ),
    );
  }
}
