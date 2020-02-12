import 'package:flutter/material.dart';

class LocaleManager{
  static Locale getLocale([String id])=> id == null ? null : Locale(id);
}