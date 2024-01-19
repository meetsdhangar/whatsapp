import 'package:flutter/material.dart';
import 'package:whatsapp/main.dart';

class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    var myConterollor = TextEditingController();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 119, 169, 211),
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(
          "SIGN UP",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Center(
          child: Container(
            height: 470,
            decoration: BoxDecoration(
              color: Colors.white,
              // border: Border.all(
              //   width: 2,
              // ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "SIGN UP",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyHomePage(),
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
                          "SIGN UP",
                          style: TextStyle(
                              color: Colors.white,
                              // fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'OR',
                          style: TextStyle(
                            fontSize: 20.0, // Adjust text size as needed
                          ),
                        ),
                        Divider(
                          height: 5,
                          thickness: 2,
                          color: Colors.black,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/google.png",
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Image.asset(
                              "assets/images/facebook.png",
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Image.asset(
                              "assets/images/linkedin.png",
                              height: 30,
                              width: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already user?"),
                            Text(
                              "Login",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: Colors
                                    .black, // Optional: Set the underline color
                                decorationThickness: 1.0,
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
