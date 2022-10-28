import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';



import 'package:untitled6/bloc/flutter_bloc.dart';
import 'package:untitled6/next1.dart';
import 'package:untitled6/registration.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var username=TextEditingController();
  var password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/logo.png',height: 60,width: 40,),
                  Image.asset('assets/cname.png',height:120,width: 130,),
                ],
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 50,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                controller: username,
                style: TextStyle(color: Colors.white),
                decoration: (InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  label: Text('Username',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'kumbh',
                        color: Colors.white,
                      )),
                )),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: password,
                style: TextStyle(color: Colors.white),
                decoration: (InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  label: Text('Password',
                      style:  TextStyle(
                        fontSize: 15,
                        fontFamily: 'kumbh',
                        color: Colors.white,
                      )),
                )),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Forget Password ?',
                style: TextStyle(fontSize: 15,
                    fontFamily: 'kumbh',
                    color: Colors.white),),
              Center(
                child: MaterialButton(onPressed:(){
                  BlocProvider.of<LoginBloc>(context).add(VerifyPassword(name: username.text,password: password.text));
                },
                  color:Color(0xffFFB11F),
                  child:BlocConsumer<LoginBloc,LoginStates>(
                      listener: ((context,state){
                        if(state is LoginError){
                          Fluttertoast.showToast(msg: state.error.toString());
                        }
                        if(state is LoginSuccess){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Page1()));
                        }
                      }),builder: (context,state){
                    if(state is Loading){
                      return
                        CircularProgressIndicator();
                    }else{
                      return const Text("Login",style: TextStyle(fontSize: 17.5),);
                    }
                  }),


                ),





              ),
              MaterialButton(
                onPressed: ()
                {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => registration()));
                },
                child: Text("go to reg",style: TextStyle(fontSize: 20,color: Colors.black),),
                color: Color(0xffFFB11F),

              )

            ],
          ),
        ),
      ),
    );
  }
}