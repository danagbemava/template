import 'package:flutter/material.dart';
import 'package:template/shared/utils/logger_mixin.dart';

abstract class BaseChangeNotifier<T> with LoggerMixin<T> {
  void setState(VoidCallback? fn) {
    if (fn != null) {
      fn();
    }
  }
}
