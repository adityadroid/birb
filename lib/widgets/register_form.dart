import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget{
  const RegisterForm({Key key}): super(key:key);
  @override
  State<StatefulWidget> createState() => RegisterFormState();
}
class RegisterFormState extends State<RegisterForm>{
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool agreedToTOS = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nickname'
            ),
            validator: (String value){
              if(value.trim().isEmpty){
                return 'Nickname is required';
              }
            },
          ),
          const SizedBox(height: 16,),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Full name'
            ),
            validator: (String value){
              if(value.trim().isEmpty){
                return 'Full name is required';
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: agreedToTOS,
                  onChanged: setAgreedToTOS,
                ),
                GestureDetector(
                  onTap:()=>setAgreedToTOS(!agreedToTOS),
                  child:  const Text(
                    'I agree to the Terms of Services'
                  ),
                )
              ],
            ),
          ),
          Row(
            children: <Widget>[
              const Spacer(),
              OutlineButton(
                highlightedBorderColor: Colors.black,
                onPressed:  submittable()? submit: null,
                child: const Text('Register'),
              )
            ],
          )
        ],
      ),
    );
  }

  void setAgreedToTOS(bool value) {
    setState(() {
      agreedToTOS = value;
    });
  }

  bool submittable() {
    return agreedToTOS;
  }
  void submit(){
formKey.currentState.validate();
print('Form submitted');
  }
}