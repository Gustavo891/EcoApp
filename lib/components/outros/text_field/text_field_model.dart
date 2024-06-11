import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'text_field_widget.dart' show TextFieldWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TextFieldModel extends FlutterFlowModel<TextFieldWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for comentario widget.
  FocusNode? comentarioFocusNode;
  TextEditingController? comentarioTextController;
  String? Function(BuildContext, String?)? comentarioTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    comentarioFocusNode?.dispose();
    comentarioTextController?.dispose();
  }
}
