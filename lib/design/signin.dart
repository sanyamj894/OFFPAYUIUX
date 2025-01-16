import 'package:flutter/material.dart';
import 'package:offpay/design/log_page.dart';
import 'package:ussd_advanced/ussd_advanced.dart';

class LogInState extends StatefulWidget {
  const LogInState({super.key});

  @override
  State<LogInState> createState() => _LogInStateState();
}

class _LogInStateState extends State<LogInState> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color(0xFFF3E5F5),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Get Started!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Choose an option below to proceed:",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async {
                  String? res="";
                  res=await UssdAdvanced.sendAdvancedUssd(code: "*99*4*3#");
                  if(res!=""&&res!="Welcome to *99#"){
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LogInPage(code: "*99*4*3#"),
                      ),
                    );
                  } else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("You are not registered$res"))
                    );
                  }
                },
                child: Text("Registered"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  textStyle: TextStyle(fontSize: 16),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  UssdAdvanced.sendUssd(code: "*99#");
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LogInPage(code: "*99#"),
                    ),
                  );
                },
                child: Text("Not Registered"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  textStyle: TextStyle(fontSize: 16),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
