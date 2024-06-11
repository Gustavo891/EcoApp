import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'quiz_question_widget.dart' show QuizQuestionWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class QuizQuestionModel extends FlutterFlowModel<QuizQuestionWidget> {
  ///  Local state fields for this page.

  int? index = 0;

  bool selecionado = false;

  int? status1 = 0;

  int? status2 = 0;

  int? status3 = 0;

  int? status4 = 0;

  int? corretas = 0;

  List<DocumentReference> correta = [];
  void addToCorreta(DocumentReference item) => correta.add(item);
  void removeFromCorreta(DocumentReference item) => correta.remove(item);
  void removeAtIndexFromCorreta(int index) => correta.removeAt(index);
  void insertAtIndexInCorreta(int index, DocumentReference item) =>
      correta.insert(index, item);
  void updateCorretaAtIndex(int index, Function(DocumentReference) updateFn) =>
      correta[index] = updateFn(correta[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
