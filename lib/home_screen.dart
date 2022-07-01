import 'package:carcare/login_screen.dart';
import 'package:carcare/promotion_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter flow/flutter_flow_util.dart';
import 'flutter flow/flutter_flow_widgets.dart';
import 'flutter flow/flutter_flow_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'assets.dart';
import 'models/user_model.dart';
import 'profile_screen.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({Key? key}) : super(key: key);

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late User user = User();
  fetchProfile() async {
    final token = await getToken();
    final res = await http.get(
      Uri.parse("$url/profile"),
      headers: {
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*",
        "Authorization": "Bearer $token"
      },
    );
    final data = convert.jsonDecode(res.body) as Map<String, dynamic>;
    setState(() {
      user = User.fromJSON(data);
    });
    print('${user.email}');
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString("fname", "${user.fname}");
    await prefs.setString("lname", "${user.lname}");
    await prefs.setString("account", "${user.account}");
    await prefs.setString("tel", "${user.tel}");
    await prefs.setString("email", "${user.email}");
    await prefs.setString("actor", "${user.actor}");
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("auth_token");
    return token;
  }

  logout() async {
    final token = await getToken();
    await http.delete(
      Uri.parse("$url/logout"),
      headers: {
        'content-type': 'application/json',
        "Authorization": "Bearer $token"
      },
    );

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("auth_token");

    print("token end = $token");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreenWidget()),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchProfile();
    // ไม่ออก
    print("user frist name${user.fname}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 515, 0, 0),
              child: Image.asset(
                'assets/images/Home_Screen/BG_Home.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Color(0x00FAFAFA),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(270, 0, 0, 0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Image.asset(
                            'assets/images/Home_Screen/Profile.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 45, 0),
                                    child: Text(
                                      'CARCARE',
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Work Sans',
                                        color: Color(0xFF5E92FF),
                                        fontSize: 34,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      'เรามาดูแลรถยนต์ของคุณกันเถอะ',
                                      style:
                                          FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Prompt',
                                        color: Color(0xFFB0B4BD),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Image.asset(
                                'assets/images/Home_Screen/Logo.png',
                                width: 100,
                                height: 100,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                          child: Container(
                            width: 322,
                            height: 322,
                            decoration: BoxDecoration(
                              color: Color(0x00EEEEEE),
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: Align(
                              alignment: AlignmentDirectional(0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 28, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  32, 0, 0, 0),
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              width: 113,
                                              height: 113,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFBFDFF),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                  color: Color(0x6E959393),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 10, 10, 10),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/Home_Screen/Car.png',
                                                      width: 47,
                                                      height: 47,
                                                      fit: BoxFit.contain,
                                                    ),
                                                    Text(
                                                      'ข้อมูลรถ',
                                                      style: FlutterFlowTheme
                                                          .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  30, 0, 0, 0),
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              width: 113,
                                              height: 113,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFBFDFF),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                  color: Color(0x6E959393),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 10, 10, 10),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/Home_Screen/Home.png',
                                                      width: 47,
                                                      height: 47,
                                                      fit: BoxFit.contain,
                                                    ),
                                                    Text(
                                                      'ศูนย์บริการ',
                                                      style: FlutterFlowTheme
                                                          .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 28, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  32, 0, 0, 0),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        PromotionScreenWidget()),
                                              );
                                            },
                                            child: Container(
                                              width: 113,
                                              height: 113,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFBFDFF),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                  color: Color(0x6E959393),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 10, 10, 10),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/Home_Screen/Ticket.png',
                                                      width: 47,
                                                      height: 47,
                                                      fit: BoxFit.contain,
                                                    ),
                                                    Text(
                                                      'โปรโมชั่น',
                                                      style: FlutterFlowTheme
                                                          .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  32, 0, 0, 0),
                                          child: GestureDetector(
                                            onTap: () async {
                                              SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();

                                              final String? fname =
                                                  prefs.getString('fname');
                                              final String? lname =
                                                  prefs.getString('lname');
                                              final String? account =
                                                  prefs.getString('account');
                                              final String? tel =
                                                  prefs.getString('tel');
                                              final String? email =
                                                  prefs.getString('email');
                                              final String? actor =
                                                  prefs.getString('actor');
                                              await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfileScreenWidget(
                                                          fname: fname,
                                                          lname: lname,
                                                          account: account,
                                                          tel: tel,
                                                          email: email,
                                                          actor: actor),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              width: 113,
                                              height: 113,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFFBFDFF),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                  color: Color(0x6E959393),
                                                ),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    'assets/images/bg_profile.png',
                                                    width: 47,
                                                    height: 47,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  Text(
                                                    'โปรไฟล์',
                                                    style: FlutterFlowTheme
                                                        .bodyText1,
                                                  ),
                                                ],
                                              ),
                                            ),
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
