// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/analyzer.dart';
import 'package:analyzer/dart/ast/standard_ast_factory.dart';
import 'package:code_builder/src/scope.dart';
import 'package:code_builder/src/tokens.dart';

export 'package:code_builder/src/scope.dart';

/// Returns a string [Literal] from [value].
Identifier stringIdentifier(String value) =>
    astFactory.simpleIdentifier(stringToken(value));

/// Lazily builds an analyzer [AstNode] when [buildAst] is invoked.
///
/// Most builders should also have specific typed methods for returning their
/// type of AST node, such as `buildExpression` for returning an `Expression`
/// AST.
abstract class AstBuilder<T extends AstNode> {
  /// Returns an [AstNode] representing the state of the current builder.
  ///
  /// If [scope] is provided then identifiers are automatically prefixed and
  /// imports are collected in order to emit a final File AST that does not
  /// have conflicting or missing imports.
  T buildAst([Scope scope]);
}
