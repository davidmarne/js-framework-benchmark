import 'package:angular/angular.dart';import 'main.template.dart' as ngStaticInit;

import 'app.dart';

void main() {ngStaticInit.initReflector();
  bootstrapStatic(AppComponent);
}
