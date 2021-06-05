import 'package:flutter/material.dart';
import '../nav_bar_wrapper.dart';

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/':
      return NavBarWrapper.createRoute();
  }
  return null;
}
