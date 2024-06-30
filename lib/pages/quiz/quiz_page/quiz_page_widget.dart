import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/outros/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/quiz/quiz_card/quiz_card_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'quiz_page_model.dart';
export 'quiz_page_model.dart';

class QuizPageWidget extends StatefulWidget {
  const QuizPageWidget({super.key});

  @override
  State<QuizPageWidget> createState() => _QuizPageWidgetState();
}

class _QuizPageWidgetState extends State<QuizPageWidget> {
  late QuizPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<QuizSetRecord>>(
      stream: queryQuizSetRecord(
        queryBuilder: (quizSetRecord) => quizSetRecord
            .where(
              'especial',
              isEqualTo: true,
            )
            .where(
              'liberado',
              isEqualTo: true,
            ),
      ),
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
        List<QuizSetRecord> quizPageQuizSetRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: double.infinity,
                    height: 84.0,
                    constraints: BoxConstraints(
                      maxWidth: 800.0,
                    ),
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).appbar,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 0.0, 0.0),
                          child: Icon(
                            Icons.quiz_outlined,
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            size: 30.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Quizzes',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  fontSize: 30.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (quizPageQuizSetRecordList.isNotEmpty ? true : false)
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 183.0,
                        constraints: BoxConstraints(
                          maxWidth: 800.0,
                        ),
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: StreamBuilder<List<QuizSetRecord>>(
                            stream: queryQuizSetRecord(
                              queryBuilder: (quizSetRecord) => quizSetRecord
                                  .where(
                                    'especial',
                                    isEqualTo: true,
                                  )
                                  .where(
                                    'liberado',
                                    isEqualTo: true,
                                  ),
                            ),
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
                              List<QuizSetRecord> pageViewQuizSetRecordList =
                                  snapshot.data!;
                              return Container(
                                width: double.infinity,
                                height: 519.0,
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 40.0),
                                      child: PageView.builder(
                                        controller: _model
                                                .pageViewController ??=
                                            PageController(
                                                initialPage: max(
                                                    0,
                                                    min(
                                                        0,
                                                        pageViewQuizSetRecordList
                                                                .length -
                                                            1))),
                                        scrollDirection: Axis.horizontal,
                                        itemCount:
                                            pageViewQuizSetRecordList.length,
                                        itemBuilder: (context, pageViewIndex) {
                                          final pageViewQuizSetRecord =
                                              pageViewQuizSetRecordList[
                                                  pageViewIndex];
                                          return Container(
                                            width: 100.0,
                                            height: 143.0,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: Image.network(
                                                  '',
                                                ).image,
                                              ),
                                              gradient: LinearGradient(
                                                colors: [
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                  FlutterFlowTheme.of(context)
                                                      .secondary
                                                ],
                                                stops: [0.0, 1.0],
                                                begin: AlignmentDirectional(
                                                    -1.0, 0.0),
                                                end: AlignmentDirectional(
                                                    1.0, 0),
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0x56515151),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        10.0, 10.0, 10.0, 10.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      child: Image
                                                                          .network(
                                                                        pageViewQuizSetRecord
                                                                            .imagem,
                                                                        width:
                                                                            79.0,
                                                                        height:
                                                                            81.0,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Flexible(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                'EXCLUSIVO ATÉ ${dateTimeFormat(
                                                                                  'd/M/y',
                                                                                  pageViewQuizSetRecord.dataFinalEspecial,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                )}'
                                                                                    .maybeHandleOverflow(
                                                                                  maxChars: 24,
                                                                                  replacement: '…',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Figtree',
                                                                                      color: Color(0xFFB0F2A6),
                                                                                      fontSize: 10.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Text(
                                                                              pageViewQuizSetRecord.name.maybeHandleOverflow(
                                                                                maxChars: 24,
                                                                                replacement: '…',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Figtree',
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                AutoSizeText(
                                                                              pageViewQuizSetRecord.desc.maybeHandleOverflow(
                                                                                maxChars: 70,
                                                                                replacement: '…',
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              maxLines: 4,
                                                                              minFontSize: 10.0,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Figtree',
                                                                                    color: FlutterFlowTheme.of(context).alternate,
                                                                                    fontSize: valueOrDefault<double>(
                                                                                      MediaQuery.sizeOf(context).width < 800.0 ? 10.0 : 14.0,
                                                                                      10.0,
                                                                                    ),
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.normal,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                    child: FutureBuilder<
                                                                        List<
                                                                            QuizCompletedRecord>>(
                                                                      future:
                                                                          queryQuizCompletedRecordOnce(
                                                                        parent:
                                                                            currentUserReference,
                                                                        queryBuilder:
                                                                            (quizCompletedRecord) =>
                                                                                quizCompletedRecord.where(
                                                                          'quiz',
                                                                          isEqualTo:
                                                                              pageViewQuizSetRecord.reference,
                                                                        ),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
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
                                                                        List<QuizCompletedRecord>
                                                                            containerQuizCompletedRecordList =
                                                                            snapshot.data!;
                                                                        final containerQuizCompletedRecord = containerQuizCompletedRecordList.isNotEmpty
                                                                            ? containerQuizCompletedRecordList.first
                                                                            : null;
                                                                        return Container(
                                                                          width:
                                                                              82.0,
                                                                          height:
                                                                              82.0,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            child:
                                                                                Stack(
                                                                              children: [
                                                                                if (valueOrDefault<bool>(
                                                                                  !(containerQuizCompletedRecord != null) ? true : false,
                                                                                  true,
                                                                                ))
                                                                                  Container(
                                                                                    width: 110.0,
                                                                                    height: 111.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: FlutterFlowIconButton(
                                                                                        borderColor: Colors.transparent,
                                                                                        borderRadius: 30.0,
                                                                                        borderWidth: 1.0,
                                                                                        buttonSize: 60.0,
                                                                                        fillColor: Colors.white,
                                                                                        icon: Icon(
                                                                                          Icons.play_arrow_rounded,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          size: 45.0,
                                                                                        ),
                                                                                        onPressed: () async {
                                                                                          context.pushNamed(
                                                                                            'quiz_question',
                                                                                            queryParameters: {
                                                                                              'quizSet': serializeParam(
                                                                                                pageViewQuizSetRecord.reference,
                                                                                                ParamType.DocumentReference,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (valueOrDefault<bool>(
                                                                                  containerQuizCompletedRecord != null ? true : false,
                                                                                  false,
                                                                                ))
                                                                                  Container(
                                                                                    width: 100.0,
                                                                                    height: 100.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: CircularPercentIndicator(
                                                                                      percent: containerQuizCompletedRecord!.resultado / pageViewQuizSetRecord.totalQuestoes,
                                                                                      radius: 35.0,
                                                                                      lineWidth: 14.0,
                                                                                      animation: true,
                                                                                      animateFromLastPercent: true,
                                                                                      progressColor: FlutterFlowTheme.of(context).primary,
                                                                                      backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                                      center: Text(
                                                                                        valueOrDefault<String>(
                                                                                          '${formatNumber(
                                                                                            (containerQuizCompletedRecord!.resultado / pageViewQuizSetRecord.totalQuestoes) * 100,
                                                                                            formatType: FormatType.custom,
                                                                                            format: '##',
                                                                                            locale: '',
                                                                                          )}%',
                                                                                          '0%',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                                              fontSize: 16.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .question_answer,
                                                                          color:
                                                                              Color(0xFFA1E18A),
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '${pageViewQuizSetRecord.totalQuestoes.toString()} questões',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Figtree',
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .solidClock,
                                                                          color:
                                                                              Color(0xFFA1E18A),
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '${pageViewQuizSetRecord.duracao.toString()} minutos',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Figtree',
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              letterSpacing: 0.0,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        10.0)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 16.0),
                                        child: smooth_page_indicator
                                            .SmoothPageIndicator(
                                          controller: _model
                                                  .pageViewController ??=
                                              PageController(
                                                  initialPage: max(
                                                      0,
                                                      min(
                                                          0,
                                                          pageViewQuizSetRecordList
                                                                  .length -
                                                              1))),
                                          count:
                                              pageViewQuizSetRecordList.length,
                                          axisDirection: Axis.horizontal,
                                          onDotClicked: (i) async {
                                            await _model.pageViewController!
                                                .animateToPage(
                                              i,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              curve: Curves.ease,
                                            );
                                            setState(() {});
                                          },
                                          effect: smooth_page_indicator
                                              .ExpandingDotsEffect(
                                            expansionFactor: 3.0,
                                            spacing: 8.0,
                                            radius: 16.0,
                                            dotWidth: 16.0,
                                            dotHeight: 8.0,
                                            dotColor:
                                                FlutterFlowTheme.of(context)
                                                    .alternate,
                                            activeDotColor:
                                                FlutterFlowTheme.of(context)
                                                    .primary,
                                            paintStyle: PaintingStyle.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      constraints: BoxConstraints(
                        maxWidth: 800.0,
                      ),
                      decoration: BoxDecoration(),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 30.0, 0.0, 0.0),
                            child: StreamBuilder<List<QuizSetRecord>>(
                              stream: queryQuizSetRecord(
                                queryBuilder: (quizSetRecord) => quizSetRecord
                                    .where(
                                      'especial',
                                      isEqualTo: false,
                                    )
                                    .where(
                                      'liberado',
                                      isEqualTo: true,
                                    ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<QuizSetRecord> listViewQuizSetRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewQuizSetRecordList.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewQuizSetRecord =
                                        listViewQuizSetRecordList[
                                            listViewIndex];
                                    return QuizCardWidget(
                                      key: Key(
                                          'Keygpf_${listViewIndex}_of_${listViewQuizSetRecordList.length}'),
                                      quizSet: listViewQuizSetRecord.reference,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          if (valueOrDefault<bool>(
                            valueOrDefault(currentUserDocument?.userName, '') !=
                                    'gustavo'
                                ? false
                                : true,
                            false,
                          ))
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) => FlutterFlowIconButton(
                                  borderColor:
                                      FlutterFlowTheme.of(context).primary,
                                  borderRadius: 20.0,
                                  borderWidth: 1.0,
                                  buttonSize: 40.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).primary,
                                  icon: Icon(
                                    Icons.add,
                                    color:
                                        FlutterFlowTheme.of(context).alternate,
                                    size: 24.0,
                                  ),
                                  onPressed: () async {
                                    context.pushNamed('create_quiz');
                                  },
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.navbarModel,
                      updateCallback: () => setState(() {}),
                      child: NavbarWidget(
                        selectedNav: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
