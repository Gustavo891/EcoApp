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
      child: Container(
        width: 272.0,
        height: 60.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primary,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).accent4,
            width: 2.0,
          ),
        ),
        child: Align(
          alignment: AlignmentDirectional(0.0, 0.0),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MouseRegion(
                  opaque: false,
                  cursor: MouseCursor.defer ?? MouseCursor.defer,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    width: 44.0,
                    height: 44.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (widget.selectedNav == 1) {
                            return;
                          }

                          context.pushNamed('main_Feed');

                          return;
                        },
                        child: Icon(
                          Icons.bookmarks_sharp,
                          color: widget.selectedNav == 1
                              ? FlutterFlowTheme.of(context).secondaryBackground
                              : FlutterFlowTheme.of(context).accent4,
                          size: 24.0,
                        ),
                      ),
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
                      context.pushNamed(
                        'main_Profile',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      width: 44.0,
                      height: 44.0,
                      decoration: BoxDecoration(
                        color: () {
                          if (widget.selectedNav == 3) {
                            return FlutterFlowTheme.of(context).accent1;
                          } else if (_model.mouseRegionHovered2!) {
                            return FlutterFlowTheme.of(context).accent1;
                          } else {
                            return FlutterFlowTheme.of(context).primary;
                          }
                        }(),
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: valueOrDefault<Color>(
                            () {
                              if (widget.selectedNav == 3) {
                                return FlutterFlowTheme.of(context).accent1;
                              } else if (_model.mouseRegionHovered2!) {
                                return FlutterFlowTheme.of(context).accent1;
                              } else {
                                return FlutterFlowTheme.of(context).primary;
                              }
                            }(),
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (widget.selectedNav == 2) {
                              return;
                            }

                            context.pushNamed('main_Profile');

                            return;
                          },
                          child: Icon(
                            Icons.account_circle_outlined,
                            color: widget.selectedNav == 2
                                ? FlutterFlowTheme.of(context)
                                    .secondaryBackground
                                : FlutterFlowTheme.of(context).accent4,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  onEnter: ((event) async {
                    setState(() => _model.mouseRegionHovered2 = true);
                  }),
                  onExit: ((event) async {
                    setState(() => _model.mouseRegionHovered2 = false);
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
