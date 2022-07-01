import 'package:carcare/login_screen.dart';
import 'package:carcare/resetpass_success_screen.dart';
import 'package:flutter/material.dart';
import '../flutter flow/flutter_flow_util.dart';
import '../flutter flow/flutter_flow_widgets.dart';
import '../flutter flow/flutter_flow_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class PassScreenWidget extends StatefulWidget {
  const PassScreenWidget({Key? key}) : super(key: key);

  @override
  _PassScreenWidgetState createState() => _PassScreenWidgetState();
}

class _PassScreenWidgetState extends State<PassScreenWidget> {
  late TextEditingController emailAddressController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailAddressController = TextEditingController();
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
                  padding: EdgeInsetsDirectional.fromSTEB(0, 170, 0, 0),
                  child: Text(
                    'ลืมรหัสผ่าน',
                    style: FlutterFlowTheme.subtitle1.override(
                      fontFamily: 'Prompt',
                      color: Color(0xBACD5E92FF),
                      fontSize: 48,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Text(
                    'กรุณากรอกอีเมลเพื่อส่งส่งข้อความสำหรับรีเซ็ตรหัสผ่าน',
                    style: FlutterFlowTheme.bodyText1.override(
                      fontFamily: 'Prompt',
                      color: Color(0xFFB0B4BD),
                      fontSize: 15,
                    ),
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
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: TextFormField(
                            controller: emailAddressController,
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Goodboy0012@gmail.com',
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
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFDBE2E7),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              focusedBorder: UnderlineInputBorder(
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
                                Icons.mail_outlined,
                                color: Color(0xFF7CACFF),
                                size: 30,
                              ),
                            ),
                            style: GoogleFonts.getFont(
                              'Prompt',
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
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FFButtonWidget(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PassSuccessScreenWidget()),
                          );
                        },
                        text: 'ส่งไปยัง email',
                        options: FFButtonOptions(
                          width: 178,
                          height: 39,
                          color: Color(0xFF5E92FF),
                          textStyle: FlutterFlowTheme.subtitle2.override(
                            fontFamily: 'Prompt',
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 20,
                        ),
                      ),
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
}
