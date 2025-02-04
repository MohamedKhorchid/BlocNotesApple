import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notation_page_model.dart';
export 'notation_page_model.dart';

/// generate the "please note the app on store" page with some text and a
/// button that will allow the user to go to the the app store page of the app
/// in the same minimalist style of the app with an animation of 5 stars empty
/// getting filled everything in french no image
class NotationPageWidget extends StatefulWidget {
  const NotationPageWidget({super.key});

  @override
  State<NotationPageWidget> createState() => _NotationPageWidgetState();
}

class _NotationPageWidgetState extends State<NotationPageWidget>
    with TickerProviderStateMixin {
  late NotationPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotationPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().lastTimeNoteBlocNote = getCurrentTimestamp;
      safeSetState(() {});
    });

    animationsMap.addAll({
      'iconOnPageLoadAnimation1': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          TintEffect(
            curve: Curves.elasticOut,
            delay: 0.0.ms,
            duration: 700.0.ms,
            color: Color(0xFFFFD700),
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation2': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          TintEffect(
            curve: Curves.elasticOut,
            delay: 100.0.ms,
            duration: 600.0.ms,
            color: Color(0xFFFFD700),
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation3': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          TintEffect(
            curve: Curves.elasticOut,
            delay: 200.0.ms,
            duration: 500.0.ms,
            color: Color(0xFFFFD700),
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation4': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          TintEffect(
            curve: Curves.elasticOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            color: Color(0xFFFFD700),
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'iconOnPageLoadAnimation5': AnimationInfo(
        loop: true,
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          TintEffect(
            curve: Curves.elasticOut,
            delay: 400.0.ms,
            duration: 300.0.ms,
            color: Color(0xFFFFD700),
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 40.0,
                  fillColor: FlutterFlowTheme.of(context).primary,
                  icon: Icon(
                    Icons.close,
                    color: FlutterFlowTheme.of(context).info,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    context.pushNamed('pageAccueil');
                  },
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Material(
                      color: Colors.transparent,
                      elevation: 2.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              24.0, 24.0, 24.0, 24.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                FFLocalizations.of(context).getText(
                                  'ws61hobr' /* Vous aimez Bloc-Notes+ ? */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .override(
                                      fontFamily: 'Inter Tight',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'qss6m5pi' /* Votre avis compte ! En notant ... */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 32.0,
                                  ).animateOnPageLoad(animationsMap[
                                      'iconOnPageLoadAnimation1']!),
                                  Icon(
                                    Icons.star,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 32.0,
                                  ).animateOnPageLoad(animationsMap[
                                      'iconOnPageLoadAnimation2']!),
                                  Icon(
                                    Icons.star,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 32.0,
                                  ).animateOnPageLoad(animationsMap[
                                      'iconOnPageLoadAnimation3']!),
                                  Icon(
                                    Icons.star,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 32.0,
                                  ).animateOnPageLoad(animationsMap[
                                      'iconOnPageLoadAnimation4']!),
                                  Icon(
                                    Icons.star,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 32.0,
                                  ).animateOnPageLoad(animationsMap[
                                      'iconOnPageLoadAnimation5']!),
                                ].divide(SizedBox(width: 8.0)),
                              ),
                              Text(
                                FFLocalizations.of(context).getText(
                                  'liw49jke' /* Prenez un instant pour noter l... */,
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  await launchURL(
                                      'https://apps.apple.com/fr/app/bloc-notes/id6739589960');
                                },
                                text: FFLocalizations.of(context).getText(
                                  'w2m67rz2' /* Noter sur l'App Store */,
                                ),
                                icon: Icon(
                                  Icons.rate_review,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 56.0,
                                  padding: EdgeInsets.all(8.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 3.0,
                                  borderRadius: BorderRadius.circular(28.0),
                                ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  await launchURL(
                                      'https://play.google.com/store/apps/details?id=com.mycompany.blocnote');
                                },
                                text: FFLocalizations.of(context).getText(
                                  'uyfs2jzd' /* Noter sur le PlayStore */,
                                ),
                                icon: Icon(
                                  Icons.rate_review,
                                  color: FlutterFlowTheme.of(context).info,
                                  size: 15.0,
                                ),
                                options: FFButtonOptions(
                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                  height: 56.0,
                                  padding: EdgeInsets.all(8.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                        fontFamily: 'Inter Tight',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                  elevation: 3.0,
                                  borderRadius: BorderRadius.circular(28.0),
                                ),
                              ),
                            ].divide(SizedBox(height: 24.0)),
                          ),
                        ),
                      ),
                    ),
                  ].divide(SizedBox(height: 24.0)),
                ),
              ),
            ].divide(SizedBox(height: 80.0)),
          ),
        ),
      ),
    );
  }
}
