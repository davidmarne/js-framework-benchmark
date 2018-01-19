// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// Contains references to the `dart:async` SDK for use in code generation.
///
/// This library is currently *experimental*, and is subject to change; it is
/// currently manually maintained but there might be a strong use case for this
/// to be automatically generated (at least partially) in the near future.
///
/// ## Usage
///
/// First import the library:
///     import 'package:code_builder/code_builder.dart';
///     import 'package:code_builder/dart/async.dart';
///
/// All references are _namespaced_ under [lib$async]. Try it:
///     // Outputs: new Future.value('Hello')
///     async.Future.newInstanceNamed('value', [literal('Hello')]);
///
/// If you are [missing a symbol from `dart:async`](https://goo.gl/XbSfmT)
/// please send us a [pull request](https://goo.gl/2LvV7f) or
/// [file an issue](https://goo.gl/IooPfl).
library code_builder.dart.async;

import 'dart:async' as dart_async;

import 'package:code_builder/code_builder.dart';

/// References to `dart:async`.
final DartAsync lib$async = new DartAsync._();

/// References to the `dart:async` library for code generation. See [lib$async].
class DartAsync {
  /// References [dart_async.Future].
  final ReferenceBuilder Future = _ref('Future');

  /// References [dart_async.Stream].
  final ReferenceBuilder Stream = _ref('Stream');

  /// References [dart_async.StreamSubscription].
  final ReferenceBuilder StreamSubscription = _ref('StreamSubscription');

  DartAsync._();

  static ReferenceBuilder _ref(String name) => reference(name, 'dart:async');
}
