import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'quiz_question_model.dart';
export 'quiz_question_model.dart';

class QuizQuestionWidget extends StatefulWidget {
  const QuizQuestionWidget({
    super.key,
    required this.quizSet,
  });

  final DocumentReference? quizSet;

  @override
  State<QuizQuestionWidget> createState() => _QuizQuestionWidgetState();
}

class _QuizQuestionWidgetState extends State<QuizQuestionWidget>
    with TickerProviderStateMixin {
  late QuizQuestionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizQuestionModel());

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 50.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuizSetRecord>(
      stream: QuizSetRecord.getDocument(widget.quizSet!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        final quizQuestionQuizSetRecord = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              automaticallyImplyLeading: false,
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 30.0,
                    borderWidth: 1.0,
                    buttonSize: 50.0,
                    fillColor: FlutterFlowTheme.of(context).primaryBackground,
                    icon: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 30.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                    },
                  ),
                ),
              ],
              centerTitle: false,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: FutureBuilder<List<QuestoesRecord>>(
                  future: queryQuestoesRecordOnce(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<QuestoesRecord> containerQuestoesRecordList =
                        snapshot.data!;
                    return Container(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      constraints: BoxConstraints(
                        maxWidth: 600.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        quizQuestionQuizSetRecord.name,
                                        style: FlutterFlowTheme.of(context)
                                            .displaySmall
                                            .override(
                                              fontFamily: 'Outfit',
                                              fontSize: 25.0,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 16.0, 16.0, 0.0),
                                    child: LinearPercentIndicator(
                                      percent: ((_model.index!) + 1) /
                                          quizQuestionQuizSetRecord
                                              .totalQuestoes,
                                      width: 200.0,
                                      lineHeight: 12.0,
                                      animation: true,
                                      animateFromLastPercent: true,
                                      progressColor:
                                          FlutterFlowTheme.of(context).primary,
                                      backgroundColor: Color(0x9AA1A1A1),
                                      barRadius: Radius.circular(24.0),
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 12.0, 0.0, 0.0),
                                      child: Text(
                                        'Questão ${((_model.index!) + 1).toString()}/${quizQuestionQuizSetRecord.totalQuestoes.toString()}',
                                        style: FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              fontFamily: 'Figtree',
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 50.0, 0.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        containerQuestoesRecordList[
                                                _model.index!]
                                            .pergunta,
                                        'pergunta',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .displaySmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            fontSize: 25.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ).animateOnPageLoad(animationsMap[
                                        'textOnPageLoadAnimation']!),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 20.0, 0.0, 0.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.selecionado == false) {
                                                _model.selecionado = true;
                                                setState(() {});
                                                if (containerQuestoesRecordList[
                                                            _model.index!]
                                                        .resposta ==
                                                    1) {
                                                  _model.status1 = 1;
                                                  setState(() {});
                                                  _model.corretas =
                                                      _model.corretas! + 1;
                                                  setState(() {});
                                                } else {
                                                  _model.status1 = 2;
                                                  setState(() {});
                                                  if (containerQuestoesRecordList[
                                                              _model.index!]
                                                          .resposta ==
                                                      2) {
                                                    _model.status2 = 1;
                                                    setState(() {});
                                                  } else if (containerQuestoesRecordList[
                                                              _model.index!]
                                                          .resposta ==
                                                      3) {
                                                    _model.status3 = 1;
                                                    setState(() {});
                                                  } else {
                                                    _model.status4 = 1;
                                                    setState(() {});
                                                  }
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  () {
                                                    if (_model.status1 == 0) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .alternate;
                                                    } else if (_model.status1 ==
                                                        1) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primary;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .error;
                                                    }
                                                  }(),
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x6A000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      containerQuestoesRecordList[
                                                              _model.index!]
                                                          .opcao1,
                                                      'Opção 1',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: valueOrDefault<
                                                              Color>(
                                                            () {
                                                              if (_model
                                                                      .status1 ==
                                                                  0) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .texto;
                                                              } else if (_model
                                                                      .status1 ==
                                                                  1) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate;
                                                              }
                                                            }(),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                          ),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.selecionado == false) {
                                                _model.selecionado = true;
                                                setState(() {});
                                                if (containerQuestoesRecordList[
                                                            _model.index!]
                                                        .resposta ==
                                                    2) {
                                                  _model.status2 = 1;
                                                  setState(() {});
                                                  _model.corretas =
                                                      _model.corretas! + 1;
                                                  setState(() {});
                                                } else {
                                                  _model.status2 = 2;
                                                  setState(() {});
                                                  if (containerQuestoesRecordList[
                                                              _model.index!]
                                                          .resposta ==
                                                      1) {
                                                    _model.status1 = 1;
                                                    setState(() {});
                                                  } else if (containerQuestoesRecordList[
                                                              _model.index!]
                                                          .resposta ==
                                                      3) {
                                                    _model.status3 = 1;
                                                    setState(() {});
                                                  } else {
                                                    _model.status4 = 1;
                                                    setState(() {});
                                                  }
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  () {
                                                    if (_model.status2 == 0) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .alternate;
                                                    } else if (_model.status2 ==
                                                        1) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primary;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .error;
                                                    }
                                                  }(),
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x6A000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      containerQuestoesRecordList[
                                                              _model.index!]
                                                          .opcao2,
                                                      'Opção 2',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: valueOrDefault<
                                                              Color>(
                                                            () {
                                                              if (_model
                                                                      .status2 ==
                                                                  0) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .texto;
                                                              } else if (_model
                                                                      .status2 ==
                                                                  1) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate;
                                                              }
                                                            }(),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .texto,
                                                          ),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.selecionado == false) {
                                                _model.selecionado = true;
                                                setState(() {});
                                                if (containerQuestoesRecordList[
                                                            _model.index!]
                                                        .resposta ==
                                                    3) {
                                                  _model.status3 = 1;
                                                  setState(() {});
                                                  _model.corretas =
                                                      _model.corretas! + 1;
                                                  setState(() {});
                                                } else {
                                                  _model.status3 = 2;
                                                  setState(() {});
                                                  if (containerQuestoesRecordList[
                                                              _model.index!]
                                                          .resposta ==
                                                      1) {
                                                    _model.status1 = 1;
                                                    setState(() {});
                                                  } else if (containerQuestoesRecordList[
                                                              _model.index!]
                                                          .resposta ==
                                                      2) {
                                                    _model.status2 = 1;
                                                    setState(() {});
                                                  } else {
                                                    _model.status4 = 1;
                                                    setState(() {});
                                                  }
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  () {
                                                    if (_model.status3 == 0) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .alternate;
                                                    } else if (_model.status3 ==
                                                        1) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primary;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .error;
                                                    }
                                                  }(),
                                                  FlutterFlowTheme.of(context)
                                                      .error,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x6A000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      containerQuestoesRecordList[
                                                              _model.index!]
                                                          .opcao3,
                                                      'Opção 3',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: valueOrDefault<
                                                              Color>(
                                                            () {
                                                              if (_model
                                                                      .status3 ==
                                                                  0) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .texto;
                                                              } else if (_model
                                                                      .status3 ==
                                                                  1) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate;
                                                              }
                                                            }(),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                          ),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: InkWell(
                                            splashColor: Colors.transparent,
                                            focusColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            onTap: () async {
                                              if (_model.selecionado == false) {
                                                _model.selecionado = true;
                                                setState(() {});
                                                if (containerQuestoesRecordList[
                                                            _model.index!]
                                                        .resposta ==
                                                    4) {
                                                  _model.status4 = 1;
                                                  setState(() {});
                                                  _model.corretas =
                                                      _model.corretas! + 1;
                                                  setState(() {});
                                                } else {
                                                  _model.status4 = 2;
                                                  setState(() {});
                                                  if (containerQuestoesRecordList[
                                                              _model.index!]
                                                          .resposta ==
                                                      1) {
                                                    _model.status1 = 1;
                                                    setState(() {});
                                                  } else if (containerQuestoesRecordList[
                                                              _model.index!]
                                                          .resposta ==
                                                      3) {
                                                    _model.status3 = 1;
                                                    setState(() {});
                                                  } else {
                                                    _model.status2 = 1;
                                                    setState(() {});
                                                  }
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: double.infinity,
                                              height: 40.0,
                                              decoration: BoxDecoration(
                                                color: valueOrDefault<Color>(
                                                  () {
                                                    if (_model.status4 == 0) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .alternate;
                                                    } else if (_model.status4 ==
                                                        1) {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .primary;
                                                    } else {
                                                      return FlutterFlowTheme
                                                              .of(context)
                                                          .error;
                                                    }
                                                  }(),
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4.0,
                                                    color: Color(0x6A000000),
                                                    offset: Offset(
                                                      0.0,
                                                      2.0,
                                                    ),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(18.0),
                                              ),
                                              child: Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      containerQuestoesRecordList[
                                                              _model.index!]
                                                          .opcao4,
                                                      'Opção 4',
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: valueOrDefault<
                                                              Color>(
                                                            () {
                                                              if (_model
                                                                      .status4 ==
                                                                  0) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .texto;
                                                              } else if (_model
                                                                      .status4 ==
                                                                  1) {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate;
                                                              } else {
                                                                return FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate;
                                                              }
                                                            }(),
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                          ),
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ].divide(SizedBox(height: 25.0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 32.0, 0.0, 32.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    if (_model.index ==
                                            (quizQuestionQuizSetRecord
                                                    .totalQuestoes -
                                                1)
                                        ? true
                                        : false) {
                                      context.pushNamed(
                                        'quiz_finish',
                                        queryParameters: {
                                          'quizSet': serializeParam(
                                            widget.quizSet,
                                            ParamType.DocumentReference,
                                          ),
                                          'resultado': serializeParam(
                                            _model.corretas,
                                            ParamType.int,
                                          ),
                                        }.withoutNulls,
                                      );

                                      await QuizCompletedRecord.createDoc(
                                              currentUserReference!)
                                          .set({
                                        ...createQuizCompletedRecordData(
                                          quiz: widget.quizSet,
                                          resultado: _model.corretas,
                                        ),
                                        ...mapToFirestore(
                                          {
                                            'corretas': _model.correta,
                                          },
                                        ),
                                      });

                                      await currentUserReference!.update({
                                        ...mapToFirestore(
                                          {
                                            'folhas': FieldValue.increment(
                                                (_model.corretas!) *
                                                    quizQuestionQuizSetRecord
                                                        .recompensa),
                                          },
                                        ),
                                      });
                                    } else {
                                      _model.selecionado = false;
                                      _model.status1 = 0;
                                      _model.status2 = 0;
                                      _model.status3 = 0;
                                      _model.status4 = 0;
                                      _model.index = _model.index! + 1;
                                      setState(() {});
                                    }
                                  },
                                  text: valueOrDefault<String>(
                                    _model.index ==
                                            (quizQuestionQuizSetRecord
                                                    .totalQuestoes -
                                                1)
                                        ? 'Finalizar Quiz'
                                        : 'Próxima Questão',
                                    'Próxima Questão',
                                  ),
                                  options: FFButtonOptions(
                                    width: 200.0,
                                    height: 50.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Figtree',
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                        ),
                                    elevation: 3.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
