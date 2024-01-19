import 'package:flutter/material.dart';
import 'package:whatsapp/screens/signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var myConterollor = TextEditingController();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 119, 169, 211),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.green,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                //currentAccountPictureSize: Size(60, 60),
                //otherAccountsPicturesSize: Size(60, 60),

                decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border(bottom: BorderSide.none)),
                accountName: Text("Name"),
                accountEmail: Text("email123@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/profile1.jpg"),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/images/profile1.jpg"),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text("Inbox"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting"),
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text("History"),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text("Inbox"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting"),
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text("History"),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text("Inbox"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting"),
              ),
              ListTile(
                leading: Icon(Icons.history),
                title: Text("History"),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Center(
          child: Container(
            height: 350,
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(
              //   width: 2,
              // ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "LOGIN",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (value) {
                      if (myConterollor.text.length > 10)
                        print("length should be less than 10");
                    },
                    controller: myConterollor,
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                    // textDirection: TextDirection.rtl,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: "Enter Your Name",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 174, 160, 160)),
                        label: Text("Name")),

                    // decoration: InputDecoration(
                    //     enabledBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(color: Colors.red),
                    //     ),
                    //     focusedBorder: UnderlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.green))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    // onChanged: (value) {
                    //   if (myConterollor.text.length > 10)
                    //     print("length should be less than 10");
                    // },
                    // controller: myConterollor,
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                    // textDirection: TextDirection.rtl,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: "Enter Your Password",
                        hintStyle: TextStyle(
                            color: Color.fromARGB(255, 174, 160, 160)),
                        label: Text("Password")),
                    obscureText: true,

                    // decoration: InputDecoration(
                    //     enabledBorder: UnderlineInputBorder(
                    //       borderSide: BorderSide(color: Colors.red),
                    //     ),
                    //     focusedBorder: UnderlineInputBorder(
                    //         borderSide: BorderSide(color: Colors.green))),
                  ),
                  // TextFormField(
                  //   // minLines: 5,
                  //   // maxLines: 6,
                  //   //showCursor: false,
                  //   cursorColor: Colors.amber,

                  //   keyboardType: TextInputType.datetime,
                  //   obscureText: true,
                  //   decoration: InputDecoration(
                  //     label: Padding(
                  //       padding: const EdgeInsets.all(10.0),
                  //       child: Text("Password"),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (myConterollor.text.length != 10) {
                        print("Invalid ");
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => signup(),
                        ));
                      },
                      child: Container(
                        height: 40,
                        // width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
