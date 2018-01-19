import 'dart:html';

import 'package:over_react/over_react.dart';
import 'package:react/react_dom.dart';

import 'main_component.dart';

void main() {
  setClientConfiguration();
  render(Main()(), document.getElementById('main'));
}
