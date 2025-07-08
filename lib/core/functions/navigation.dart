import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void customReplacementNavigate(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}

void customDataNavigate(BuildContext context, String route, {Object? data}) {
  context.push(route, extra: data);
}

void customNavigate(context, String path, {Object? extra}) {
  GoRouter.of(context).push(path, extra: extra);
}
