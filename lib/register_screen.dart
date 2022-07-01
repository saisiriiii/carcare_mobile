import 'package:carcare/home_screen.dart';
import 'package:carcare/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter flow/flutter_flow_util.dart';
import 'flutter flow/flutter_flow_widgets.dart';
import 'flutter flow/flutter_flow_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'assets.dart';

class RegisterScreenWidget extends StatefulWidget {
  const RegisterScreenWidget({Key? key}) : super(key: key);

  @override
  _RegisterScreenWidgetState createState() => _RegisterScreenWidgetState();
}

class _RegisterScreenWidgetState extends State<RegisterScreenWidget> {
  late TextEditingController emailAddressController1;
  late TextEditingController emailAddressController2;
  late TextEditingController passwordController1;
  late TextEditingController passwordController2;
  late TextEditingController emailAddressController3;
  late TextEditingController emailAddressController4;
  late bool emailAddressVisibility1;
  late TextEditingController emailAddressController5;
  late bool emailAddressVisibility2;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  submit() async {
    final res = await http.post(
      Uri.parse("$url/register"),
      headers: {
        "Accept": "application/json",
        'content-type': 'application/json',
        "Access-Control_Allow_Origin": "*"
      },
      body: convert.jsonEncode({
        "fname": emailAddressController1.text,
        "lname": emailAddressController2.text,
        "account": passwordController1.text,
        "tel": emailAddressController3.text,
        "email": passwordController2.text,
        "password": emailAddressController4.text,
      }),
    );
    print(res.statusCode);
    if (res.statusCode != 200) {
      showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          children: [
            Center(
              child: Text("Username already exist"),
            )
          ],
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreenWidget()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    emailAddressController1 = TextEditingController(text: "nammarin");
    emailAddressController2 = TextEditingController(text: "tepin");
    passwordController1 = TextEditingController(text: "ซ่อมรถจำกัด");
    passwordController2 =
        TextEditingController(text: "boatbot.seven@gmail.com");
    emailAddressController3 = TextEditingController(text: "0981311077");
    emailAddressController4 = TextEditingController(text: "1234567890");
    emailAddressVisibility1 = false;
    emailAddressController5 = TextEditingController(text: "1234567890");
    emailAddressVisibility2 = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF4B39EF),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: Color(0xFFFAFAFA),
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginScreenWidget()),
                          );
                        },
                        child: Image.asset(
                          'assets/images/Back.png',
                          width: 23,
                          height: 14,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
                  child: Text(
                    'Create account',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Work Sans',
                      color: Color(0xFF5E92FF),
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Text(
                  'มาเริ่มสร้างบัญชีของคุณกัน!',
                  style: FlutterFlowTheme.bodyText1.override(
                    fontFamily: 'Prompt',
                    color: Color(0xFFB0B4BD),
                    fontSize: 18,
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: TextFormField(
                            controller: emailAddressController1,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'ชื่อจริง',
                              labelStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Prompt',
                                color: Color(0xFF95A1AC),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              hintText: 'Enter Your Name',
                              hintStyle: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Prompt',
                                color: Color(0xFF95A1AC),
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                                  EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: Color(0xFF7CACFF),
                                size: 30,
                              ),
                            ),
                            style: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Prompt',
                              color: Color(0xFF2B343A),
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
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
                        child: TextFormField(
                          controller: emailAddressController2,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'นามสกุล',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Prompt',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            hintText: 'Enter Your Surenames ',
                            hintStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Prompt',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                            prefixIcon: Icon(
                              Icons.person_outlined,
                              color: Color(0xFF7CACFF),
                              size: 30,
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Prompt',
                            color: Color(0xFF2B343A),
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
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
                        child: TextFormField(
                          controller: passwordController1,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'ชื่อแอคเคาท์',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Prompt',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            hintText: 'Enter Your Accout',
                            hintStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Prompt',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(16, 24, 24, 24),
                            prefixIcon: Icon(
                              Icons.person_outlined,
                              color: Color(0xFF7CACFF),
                              size: 30,
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Prompt',
                            color: Color(0xFF2B343A),
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
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
                        child: TextFormField(
                          controller: passwordController2,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'อีเมล',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Prompt',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            hintText: 'Enter Your E-mail',
                            hintStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Prompt',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(16, 24, 24, 24),
                            prefixIcon: Icon(
                              Icons.mail_outlined,
                              color: Color(0xFF7CACFF),
                              size: 30,
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Prompt',
                            color: Color(0xFF2B343A),
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
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
                        child: TextFormField(
                          controller: emailAddressController3,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'เบอร์โทรศัพท์',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Prompt',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            hintText: 'Enter Your Phone',
                            hintStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Prompt',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                            prefixIcon: Icon(
                              Icons.phone_iphone,
                              color: Color(0xFF7CACFF),
                              size: 30,
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Prompt',
                            color: Color(0xFF2B343A),
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
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
                        child: TextFormField(
                          controller: emailAddressController4,
                          obscureText: !emailAddressVisibility1,
                          decoration: InputDecoration(
                            labelText: 'รหัสผ่าน',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Prompt',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            hintText: 'Enter Your Password',
                            hintStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Prompt',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                            prefixIcon: Icon(
                              Icons.lock_open,
                              color: Color(0xFF7CACFF),
                              size: 30,
                            ),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => emailAddressVisibility1 =
                                    !emailAddressVisibility1,
                              ),
                              child: Icon(
                                emailAddressVisibility1
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Color(0xFF757575),
                                size: 22,
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Prompt',
                            color: Color(0xFF2B343A),
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
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
                        child: TextFormField(
                          controller: emailAddressController5,
                          obscureText: !emailAddressVisibility2,
                          decoration: InputDecoration(
                            labelText: 'ยืนยันรหัสผ่าน',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Prompt',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            hintText: 'Enter Your Password',
                            hintStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Prompt',
                              color: Color(0xFF95A1AC),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(25),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                            prefixIcon: Icon(
                              Icons.lock_open,
                              color: Color(0xFF7CACFF),
                              size: 30,
                            ),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => emailAddressVisibility2 =
                                    !emailAddressVisibility2,
                              ),
                              child: Icon(
                                emailAddressVisibility2
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                color: Color(0xFF757575),
                                size: 22,
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Prompt',
                            color: Color(0xFF2B343A),
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
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
                      FFButtonWidget(
                        onPressed: submit,
                        text: '   ยืนยันการสมัครสมาชิก',
                        options: FFButtonOptions(
                          width: 178,
                          height: 39,
                          color: Color(0xFF5E92FF),
                          textStyle: FlutterFlowTheme.subtitle2.override(
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
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TextEditingController>(
        'passwordController2', passwordController2));
    properties.add(DiagnosticsProperty<TextEditingController>(
        'passwordController2', passwordController2));
  }
}
