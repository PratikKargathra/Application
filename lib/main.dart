import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'sources.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool login = prefs.getBool('login') ?? false;

  runApp( MaterialApp(
    initialRoute: login?"/":"login",
    debugShowCheckedModeBanner: false,
    routes: {
      "/":(context) => const Homepage(),
      "addToDo":(context) => const AddTodo(),
      "signup":(context) => const LoginSignupPage(),
      "login":(context) => const Login(),
    },
  ),
  );
}






class LoginSignupPage extends StatefulWidget {
  const LoginSignupPage({Key? key}) : super(key: key);

  @override
  State<LoginSignupPage> createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {

  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  bool seePassword = false;
  bool rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe5e5e5),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          const SizedBox(height: 80,),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Sign Up",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 30),),
                const SizedBox(height: 10),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                    ),
                    label: const Text("Username"),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: "Enter Username",
                    prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.grey.shade700,),
                  ),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: seePassword,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                    ),
                    label: const Text("Password"),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: "Enter Password",
                    prefixIcon: Icon(Icons.security_rounded, color: Colors.grey.shade700,),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          seePassword = !seePassword;
                        });
                      },
                      icon: Icon(seePassword?Icons.remove_red_eye:Icons.remove_red_eye_outlined, color: Colors.grey.shade700,),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.8,
                  child: ElevatedButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      if(usernameController.text.isNotEmpty && passwordController.text.isNotEmpty){
                        await prefs.setString('username', usernameController.text);
                        await prefs.setString('password', passwordController.text);
                        Navigator.pushReplacementNamed(context, "/");
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Field is Empty'),));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff00008B),
                    ),
                    child: const  Text("Sign Up", style:  TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
                  ),
                ),
                const SizedBox(height: 10,),
                TextButton(
                    onPressed: (){
                      setState(() {
                        Navigator.pushReplacementNamed(context, "login");
                      });
                    },
                    child: const Text("Go to login page")),
              ],
            ),
            padding: const EdgeInsets.all(30),
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width,
            decoration:  BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(0, 0),
                  blurRadius: 3,
                  spreadRadius: 5,
                ),
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  bool seePassword = false;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe5e5e5),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Spacer(),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Sign In",style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 30),),
                const SizedBox(height: 10,),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                    ),
                    label: const Text("Username"),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: "Enter Username",
                    prefixIcon: Icon(Icons.account_circle_outlined, color: Colors.grey.shade700,),
                  ),
                ),
                TextField(
                  controller: passwordController,
                  obscureText: seePassword,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                    ),
                    label: const Text("Password"),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    hintText: "Enter Password",
                    prefixIcon: Icon(Icons.security_rounded, color: Colors.grey.shade700,),
                    suffixIcon: IconButton(
                      onPressed: (){
                        setState(() {
                          seePassword = !seePassword;
                        });
                      },
                      icon: Icon(seePassword?Icons.remove_red_eye:Icons.remove_red_eye_outlined, color: Colors.grey.shade700,),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: const Color(0xff00008B),
                      value: rememberMe,
                      onChanged: ( value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      },
                    ),
                    const Text("Remember me"),
                  ],
                ),
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.8,
                  child: ElevatedButton(
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      if(prefs.getString('username') == usernameController.text && prefs.getString('password') == passwordController.text){
                        await prefs.setBool('login', rememberMe);
                        Navigator.pushReplacementNamed(context, "/");
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Username or Password is wrong!!'),));
                      }
                    },


                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xff00008B),
                    ),
                    child: const Text("Sign In", style:  TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),),
                  ),
                ),
                const SizedBox(height: 10,),
                TextButton(
                    onPressed: (){
                      setState(() {
                        Navigator.pushReplacementNamed(context, "signup");
                      });
                    },
                    child: const Text("Don't Have an Account? Create Account")),
              ],
            ),
            padding: EdgeInsets.all(30),
            height: MediaQuery.of(context).size.height*0.5,
            width: MediaQuery.of(context).size.width,
            decoration:  BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(0, 0),
                  blurRadius: 3,
                  spreadRadius: 5,
                ),
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
