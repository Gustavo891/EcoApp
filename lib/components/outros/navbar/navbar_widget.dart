import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'navbar_model.dart';
export 'navbar_model.dart';

class NavbarWidget extends StatefulWidget {
  const NavbarWidget({
    super.key,
    int? selectedNav,
  }) : this.selectedNav = selectedNav ?? 1;

  final int selectedNav;

  @override
  State<NavbarWidget> createState() => _NavbarWidgetState();
}

class _NavbarWidgetState extends State<NavbarWidget> {
  late NavbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        // Make this side nav a component. You can then set the colors of the icons to be selected base on an integer.
        Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Material(
        color: Colors.transparent,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(0.0),
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
        ),
        child: Container(
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: 66.0,
          constraints: BoxConstraints(
            maxWidth: 800.0,
          ),
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).navbar,
            boxShadow: [
              BoxShadow(
                blurRadius: 0.0,
                color: FlutterFlowTheme.of(context).navbarBorder,
                offset: Offset(
                  0.0,
                  -1.0,
                ),
                spreadRadius: 0.0,
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(0.0),
              topRight: Radius.circular(0.0),
            ),
            border: Border.all(
              color: Colors.transparent,
              width: 0.2,
            ),
          ),
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(30.0, 4.0, 30.0, 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MouseRegion(
                    opaque: false,
                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.goNamed(
                          'main_Feed',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 2.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.goNamed(
                                  'main_Feed',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Icon(
                                Icons.home,
                                color: valueOrDefault<Color>(
                                  widget.selectedNav == 1
                                      ? FlutterFlowTheme.of(context)
                                          .navbarSelected
                                      : FlutterFlowTheme.of(context)
                                          .navbarUnselected,
                                  FlutterFlowTheme.of(context).navbarSelected,
                                ),
                                size: 22.0,
                              ),
                            ),
                          ),
                          Text(
                            'Feed',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  color: valueOrDefault<Color>(
                                    widget.selectedNav == 1
                                        ? FlutterFlowTheme.of(context)
                                            .navbarSelected
                                        : FlutterFlowTheme.of(context)
                                            .navbarUnselected,
                                    FlutterFlowTheme.of(context).navbarSelected,
                                  ),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    onEnter: ((event) async {
                      setState(() => _model.mouseRegionHovered1 = true);
                    }),
                    onExit: ((event) async {
                      setState(() => _model.mouseRegionHovered1 = false);
                    }),
                  ),
                  MouseRegion(
                    opaque: false,
                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed('quiz_page');
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 2.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed('quiz_page');
                              },
                              child: Icon(
                                Icons.quiz,
                                color: valueOrDefault<Color>(
                                  widget.selectedNav == 2
                                      ? FlutterFlowTheme.of(context)
                                          .navbarSelected
                                      : FlutterFlowTheme.of(context)
                                          .navbarUnselected,
                                  FlutterFlowTheme.of(context).navbarSelected,
                                ),
                                size: 20.0,
                              ),
                            ),
                          ),
                          Text(
                            'Quiz',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  color: valueOrDefault<Color>(
                                    widget.selectedNav == 2
                                        ? FlutterFlowTheme.of(context)
                                            .navbarSelected
                                        : FlutterFlowTheme.of(context)
                                            .navbarUnselected,
                                    FlutterFlowTheme.of(context).navbarSelected,
                                  ),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    onEnter: ((event) async {
                      setState(() => _model.mouseRegionHovered2 = true);
                    }),
                    onExit: ((event) async {
                      setState(() => _model.mouseRegionHovered2 = false);
                    }),
                  ),
                  MouseRegion(
                    opaque: false,
                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'medalhas',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 2.0),
                            child: Icon(
                              Icons.shopping_basket,
                              color: valueOrDefault<Color>(
                                widget.selectedNav == 3
                                    ? FlutterFlowTheme.of(context)
                                        .navbarSelected
                                    : FlutterFlowTheme.of(context)
                                        .navbarUnselected,
                                FlutterFlowTheme.of(context).navbarSelected,
                              ),
                              size: 20.0,
                            ),
                          ),
                          Text(
                            'Medalhas',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  color: valueOrDefault<Color>(
                                    widget.selectedNav == 3
                                        ? FlutterFlowTheme.of(context)
                                            .navbarSelected
                                        : FlutterFlowTheme.of(context)
                                            .navbarUnselected,
                                    FlutterFlowTheme.of(context).navbarSelected,
                                  ),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    onEnter: ((event) async {
                      setState(() => _model.mouseRegionHovered3 = true);
                    }),
                    onExit: ((event) async {
                      setState(() => _model.mouseRegionHovered3 = false);
                    }),
                  ),
                  MouseRegion(
                    opaque: false,
                    cursor: MouseCursor.defer ?? MouseCursor.defer,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        context.pushNamed(
                          'perfil',
                          extra: <String, dynamic>{
                            kTransitionInfoKey: TransitionInfo(
                              hasTransition: true,
                              transitionType: PageTransitionType.fade,
                              duration: Duration(milliseconds: 0),
                            ),
                          },
                        );
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                8.0, 0.0, 8.0, 2.0),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'perfil',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              child: Icon(
                                Icons.account_circle_outlined,
                                color: valueOrDefault<Color>(
                                  widget.selectedNav == 4
                                      ? FlutterFlowTheme.of(context)
                                          .navbarSelected
                                      : FlutterFlowTheme.of(context)
                                          .navbarUnselected,
                                  FlutterFlowTheme.of(context).navbarSelected,
                                ),
                                size: 22.0,
                              ),
                            ),
                          ),
                          Text(
                            'Perfil',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Figtree',
                                  color: valueOrDefault<Color>(
                                    widget.selectedNav == 4
                                        ? FlutterFlowTheme.of(context)
                                            .navbarSelected
                                        : FlutterFlowTheme.of(context)
                                            .navbarUnselected,
                                    FlutterFlowTheme.of(context).navbarSelected,
                                  ),
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    onEnter: ((event) async {
                      setState(() => _model.mouseRegionHovered4 = true);
                    }),
                    onExit: ((event) async {
                      setState(() => _model.mouseRegionHovered4 = false);
                    }),
                  ),
                ].divide(SizedBox(width: 40.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
