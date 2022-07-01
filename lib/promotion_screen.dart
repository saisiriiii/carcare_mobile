import 'package:carcare/detel_promption_screen.dart';
import 'package:carcare/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter flow/flutter_flow_util.dart';
import 'flutter flow/flutter_flow_widgets.dart';
import 'flutter flow/flutter_flow_theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'assets.dart';
import 'models/promotion_model.dart';

class PromotionScreenWidget extends StatefulWidget {
  const PromotionScreenWidget({Key? key}) : super(key: key);

  @override
  _PromotionScreenWidgetState createState() => _PromotionScreenWidgetState();
}

class _PromotionScreenWidgetState extends State<PromotionScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late Promotion promotion = Promotion();
  final List<Promotion> promotions = [];
  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("auth_token");
    return token;
  }

  fetchPromotion() async {
    setState(() {
      promotions.clear();
    });

    final token = await getToken();
    // error เมื่อ logout บ่อยๆ
    final res = await http.get(
      Uri.parse("$url/promotion"),
      headers: {
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*",
        "Authorization": "Bearer $token"
      },
    );

    final data = convert.jsonDecode(res.body) as List<dynamic>;
    for (var book in data) {
      final _book = Promotion.fromJSON(book as Map<String, dynamic>);
      setState(() {
        promotions.add(_book);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPromotion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            decoration: BoxDecoration(
              color: Color(0x00FAFAFA),
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
                                    builder: (context) =>
                                        DetelProScreenWidget()),
                              );
                            },
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreenWidget()),
                                );
                              },
                              child: Image.asset(
                                'assets/images/Back.png',
                                width: 23,
                                height: 14,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 20, 0),
                              child: Text(
                                'โปรโมชัน',
                                style: FlutterFlowTheme.bodyText1.override(
                                  fontFamily: 'Prompt',
                                  color: Color(0xFF5E92FF),
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            Text(
                              'สุดคุ้ม กับโปรประจำเดือน',
                              style: FlutterFlowTheme.bodyText1.override(
                                fontFamily: 'Prompt',
                                color: Color(0xFFB0B4BD),
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                      child: Container(
                        width: 500,
                        height: 600,
                        decoration: BoxDecoration(
                          color: Color(0x00FFFFFF),
                        ),
                        child: Column(
                          children: [
                            for (var promotion1 in promotions)
                              Column(children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 20, 0, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetelProScreenWidget()),
                                      );
                                    },
                                    child: Container(
                                      width: 332,
                                      height: 139,
                                      decoration: BoxDecoration(
                                        color: Color(0xFF5E92FF),
                                        borderRadius: BorderRadius.circular(26),
                                      ),
                                      child: Column(
                                        children: [
                                          Text("${promotion1.title}"),
                                          
                                        ],
                                        
                                      ),
                                    ),
                                  ),
                                ),
                              ])
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(210, 640, 0, 0),
            child: Image.asset(
              'assets/images/Promotion_Screen/BG_Promotion.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
