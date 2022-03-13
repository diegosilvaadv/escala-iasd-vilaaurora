import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Escala - IASD',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 30,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: StreamBuilder<List<EscalaSonoplastiaRecord>>(
                    stream: queryEscalaSonoplastiaRecord(),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: SpinKitDoubleBounce(
                              color: Color(0xFFFCA311),
                              size: 50,
                            ),
                          ),
                        );
                      }
                      List<EscalaSonoplastiaRecord>
                          listViewEscalaSonoplastiaRecordList = snapshot.data;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewEscalaSonoplastiaRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewEscalaSonoplastiaRecord =
                              listViewEscalaSonoplastiaRecordList[
                                  listViewIndex];
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Nome: ',
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                              Text(
                                valueOrDefault<String>(
                                  listViewEscalaSonoplastiaRecord.nome,
                                  '...',
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ],
                          );
                        },
                      );
                    },
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
