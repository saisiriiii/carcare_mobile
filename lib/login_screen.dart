import 'package:carcare/register_screen.dart';
import 'package:carcare/resetpass_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter flow/flutter_flow_util.dart';
import 'flutter flow/flutter_flow_widgets.dart';
import 'flutter flow/flutter_flow_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'assets.dart';
import 'home_screen.dart';

class LoginScreenWidget extends StatefulWidget {
  final fname;
  final lname;
  final account;
  final tel;
  final email;
  final actor;
  const LoginScreenWidget({Key? key, this.fname, this.lname, this.account, this.tel, this.email, this.actor})
      : super(key: key);

  @override
  _LoginScreenWidgetState createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  late TextEditingController emailAddressController;
  late TextEditingController passwordController;
  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  submit() async {
    final res = await http.post(
      Uri.parse("$url/login"),
      headers: {
        "Accept": "application/json",
        'content-type': 'application/json',
        "Access-Control_Allow_Origin": "*"
      },
      body: convert.jsonEncode({
        "email": emailAddressController.text,
        "password": passwordController.text,
      }),
    );

    print(res.statusCode);
    if (res.statusCode != 200) {
      showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          children: [
            Center(
              child: Text("Incorrect username or password"),
            )
          ],
        ),
      );
    } else {
      final data = convert.jsonDecode(res.body);
      print("data = $data");

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = data["token"];
      print("token = $token");
      await prefs.setString("auth_token", token);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreenWidget()),
      );
    }

    // final data = convert.jsonDecode(res.body);
    // print('data = $data');
  }

  @override
  void initState() {
    super.initState();
    emailAddressController =
        TextEditingController(text: "boatbot.seven@gmail.com");
    passwordController = TextEditingController(text: "1234567890");
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFFAFAFA),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 110, 0, 0),
                  child: Image.asset(
                    'assets/images/Login_Screen/Logo_login.png',
                    width: 75,
                    height: 75,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Text(
                    'CARCARE',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Work Sans',
                      color: Color(0xFF5E92FF),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Text(
                          'อีเมลผู้ใช้',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Prompt',
                            color: Color(0xFF696F79),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: TextFormField(
                              controller: emailAddressController,
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                                labelStyle: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Work Sans',
                                  color: Color(0xFF95A1AC),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                hintText: 'Enter your email',
                                hintStyle: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Work Sans',
                                  color: Color(0xFF95A1AC),
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDBE2E7),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDBE2E7),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    16, 24, 0, 24),
                              ),
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Inter',
                                color: Color(0xFF2B343A),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Text(
                          'รหัสผ่าน',
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Prompt',
                            color: Color(0xFF696F79),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: !passwordVisibility,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Work Sans',
                                color: Color(0xFF95A1AC),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              hintText: 'Enter your password',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Work Sans',
                                color: Color(0xFF95A1AC),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  16, 24, 24, 24),
                              suffixIcon: InkWell(
                                onTap: () => setState(
                                  () =>
                                      passwordVisibility = !passwordVisibility,
                                ),
                                child: Icon(
                                  passwordVisibility
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: Color(0xFF95A1AC),
                                  size: 22,
                                ),
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Inter',
                              color: Color(0xFF2B343A),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(240, 0, 0, 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PassScreenWidget()),
                            );
                          },
                          child: Text(
                            'ลืมรหัสผ่าน',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Prompt',
                              color: Color(0xFF696F79),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: FFButtonWidget(
                    onPressed: submit,
                    text: 'เข้าสู่ระบบ',
                    options: FFButtonOptions(
                      width: 250,
                      height: 41,
                      color: Color(0xFF5E92FF),
                      textStyle: FlutterFlowTheme.subtitle1.override(
                        fontFamily: 'Prompt',
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      elevation: 3,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: 50,
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                      child: Image.asset(
                        'assets/images/Login_Screen/Line.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(35, 0, 0, 0),
                      child: Text(
                        'หรือ',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Prompt',
                          color: Color(0xFF696F79),
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(35, 0, 0, 0),
                      child: Image.asset(
                        'assets/images/Login_Screen/Line.png',
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  'assets/images/Login_Screen/Google.png',
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 24),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ไม่มีบัญชี ?',
                        style: FlutterFlowTheme.bodyText1.override(
                          fontFamily: 'Prompt',
                          color: Color(0xFFB0B4BD),
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreenWidget()),
                            );
                          },
                          child: Text(
                            'สมัคสมาชิก',
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Prompt',
                              color: Color(0xFF5E92FF),
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      try {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        final String? action = prefs.getString('auth_token');
                        print('$action');
                      } catch (e) {
                        print('error');
                      }
                    },
                    child: Text('token'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
