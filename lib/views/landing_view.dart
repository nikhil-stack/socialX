import 'package:flutter/material.dart';
import 'package:socialx/views/login_view.dart';
import 'package:socialx/views/register_view.dart';

class LandingView extends StatefulWidget {
  int index; 
  LandingView({Key? key, required this.index}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {

  double diductHeight = AppBar().preferredSize.height+24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: const [
            Text('Social',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                letterSpacing: 1.5
              ),
            ),
            SizedBox(width: 2),
            Text('X',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30
              ),
            )
          ],
        )
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey,
          height: MediaQuery.of(context).size.height-diductHeight,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height/14,
                width: MediaQuery.of(context).size.width-4,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)
                  ),
                  boxShadow: [
                    BoxShadow(color: Colors.red, spreadRadius: 2.0)
                  ]
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height/14,
                        decoration: BoxDecoration(
                          color: widget.index == 0
                          ?Colors.red
                          :Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24)
                          ),
                        ),
                        child: InkWell(
                          onTap: (){
                            if(widget.index != 0){
                              setState(() {
                                widget.index = 0;
                              });
                            }
                          },
                          child: const Text('LOGIN',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey,
                              letterSpacing: 1.5
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height/14,
                        decoration: BoxDecoration(
                          color: widget.index == 1
                          ?Colors.red
                          :Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24)
                          ),
                        ),
                        child: InkWell(
                          onTap: (){
                            if(widget.index == 0){
                              setState(() {
                                widget.index = 1;
                              });
                            }
                          },
                          child: const Text('SIGN UP',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey,
                              letterSpacing: 1.5
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              Expanded(
                child: widget.index == 0
                ? const LoginView()
                : const RegisterView(),
              )
            ],
          )
        ),
      ),
    );
  }
}