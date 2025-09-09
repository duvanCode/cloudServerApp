import 'package:cloudserver/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cloudserver/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 41, 55, 1),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.cloud,
                      color: Color.fromRGBO(96, 165, 250, 1.0),
                      size: 55,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'Cloud Server',
                      style: TextStyle(
                        color: Color.fromRGBO(96, 165, 250, 1.0),
                        fontSize: 40,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Username',
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    filled: true,
                    fillColor: Color.fromRGBO(55, 65, 81, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(37, 99, 235, 1.0),
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                    contentPadding: EdgeInsets.all(10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Handle saving the username
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    filled: true,
                    fillColor: Color.fromRGBO(55, 65, 81, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(255, 255, 255, 1.0),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(37, 99, 235, 1.0),
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(color: Colors.red, width: 2.0),
                    ),
                    contentPadding: EdgeInsets.all(10),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // Handle saving the username
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (bool? value) {},visualDensity: VisualDensity.compact,materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,),
                        Text(
                          'Remember me',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Text(
                      'Forgot password?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Color.fromRGBO(37, 99, 235, 1.0)),
                    ),
                    child: Text('Submit',style: TextStyle(color: Colors.white),),
                    onPressed: () {},
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
