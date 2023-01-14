import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:esclub/main.dart';


class Login extends ConsumerWidget {
  const Login({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Center(
        child: Column(
          children: <Widget> [
            Container(
              margin: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Login'), // <-- Text
                    SizedBox(
                      width: 5,
                    ),
                    Icon( // <-- Icon
                      Icons.arrow_forward,
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            //   child: Row(
            //       children: const <Widget>[
            //         Divider(
            //           color: Colors.black54,
            //         ),
            //
            //         Text("OR"),
            //
            //         Divider(
            //           color: Colors.black54,
            //           ),
            //       ]
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white70,
                    foregroundColor: Colors.blueGrey,
                    shadowColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: const BorderSide(
                          width: 2.0,
                          color: Colors.black54,
                        )
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  }, // null
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('Continue without login',
                        style: TextStyle(
                            color: Colors.blueGrey
                        ),
                      ), // <-- Text
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


}

