// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/analyzer.dart';
import 'package:analyzer/dart/ast/token.dart';
import 'package:analyzer/dart/ast/standard_ast_factory.dart';
import 'package:analyzer/src/dart/ast/token.dart';
import 'package:code_builder/code_builder.dart';
import 'package:code_builder/dart/core.dart';
import 'package:code_builder/src/builders/annotation.dart';
import 'package:code_builder/src/builders/class.dart';
import 'package:code_builder/src/builders/expression.dart';
import 'package:code_builder/src/builders/parameter.dart';
import 'package:code_builder/src/builders/shared.dart';
import 'package:code_builder/src/builders/statement.dart';
import 'package:code_builder/src/builders/type.dart';
import 'package:code_builder/src/tokens.dart';

/// Short-hand for `new ConstructorBuilder(...)`.
ConstructorBuilder constructor([
  Iterable<ValidConstructorMember> members = const [],
]) {
  return _constructorImpl(members: members);
}

/// Short-hand for `new ConstructorBuilder(name)`.
ConstructorBuilder constructorNamed(
  String name, [
  Iterable<ValidConstructorMember> members = const [],
]) {
  return _constructorImpl(name: name, members: members);
}

/// Various types of modifiers for methods.
class MethodModifier implements ValidMethodMember {
  static const MethodModifier asAsync = const MethodModifier._(
    Keyword.ASYNC,
    false,
  );
  static const MethodModifier asAsyncStar = const MethodModifier._(
    Keyword.ASYNC,
    true,
  );
  static const MethodModifier asSyncStar = const MethodModifier._(
    Keyword.SYNC,
    true,
  );

  final Keyword _keyword;

  const MethodModifier._(this._keyword, this.isStar);

  @override
  buildAst([_]) => throw new UnsupportedError('Not an AST');

  final bool isStar;

  Token keyword() => new KeywordToken(_keyword, 0);
}

/// Short-hand for `new MethodBuilder.getter(...)`.
MethodBuilder getter(
  String name, {
  MethodModifier modifier,
  Iterable<StatementBuilder> statements,
  ExpressionBuilder returns,
  TypeBuilder returnType,
}) {
  if (returns != null) {
    return new MethodBuilder.getter(
      name,
      modifier: modifier,
      returnType: returnType,
      returns: returns,
    );
  } else {
    return new MethodBuilder.getter(
      name,
      modifier: modifier,
      returnType: returnType,
    )..addStatements(statements);
  }
}

/// A more short-hand way of constructing a Lambda [MethodBuilder].
MethodBuilder lambda(
  String name,
  ExpressionBuilder value, {
  MethodModifier modifier,
  TypeBuilder returnType,
}) {
  return new MethodBuilder(
    name,
    modifier: modifier,
    returns: value,
    returnType: returnType,
  );
}

/// A more short-hand way of constructing a [MethodBuilder].
MethodBuilder method(
  String name, [
  Iterable<ValidMethodMember> members = const [],
]) {
  final List<ParameterBuilder> positional = <ParameterBuilder>[];
  final List<_NamedParameterWrapper> named = <_NamedParameterWrapper>[];
  final List<StatementBuilder> statements = <StatementBuilder>[];
  MethodModifier modifier;
  TypeBuilder returnType;
  for (final member in members) {
    if (member is TypeBuilder) {
      returnType = member;
    } else if (member is ParameterBuilder) {
      positional.add(member);
    } else if (member is _NamedParameterWrapper) {
      named.add(member);
    } else if (member is StatementBuilder) {
      statements.add(member);
    } else if (member is MethodModifier) {
      modifier = member;
    } else {
      throw new StateError('Invalid AST type: ${member.runtimeType}');
    }
  }
  final method = new _MethodBuilderImpl(
    name,
    modifier: modifier,
    returns: returnType,
  );
  positional.forEach(method.addPositional);
  named.forEach((p) => method.addNamed(p._parameter));
  statements.forEach(method.addStatement);
  return method;
}

/// Returns a wrapper around [parameter] for use with [method].
_NamedParameterWrapper named(ParameterBuilder parameter) {
  return new _NamedParameterWrapper(parameter);
}

/// Short-hand for `new MethodBuilder.setter(...)`.
MethodBuilder setter(
  String name,
  ParameterBuilder value,
  Iterable<StatementBuilder> statements,
) {
  return new MethodBuilder.setter(name)
    ..addPositional(value)
    ..addStatements(statements);
}

/// Returns a wrapper around [parameter] for use with [constructor].
_FieldParameterWrapper thisField(Object parameter) {
  assert(parameter is ParameterBuilder || parameter is _NamedParameterWrapper);
  return new _FieldParameterWrapper(parameter);
}

ConstructorBuilder _constructorImpl({
  Iterable<ValidConstructorMember> members,
  String name,
}) {
  final List<_AddParameter> _addFunctions = <_AddParameter>[];
  for (final member in members) {
    if (member is ParameterBuilder) {
      _addFunctions.add((c) => c.addPositional(member));
    } else if (member is _NamedParameterWrapper) {
      _addFunctions.add((c) => c.addNamed(member._parameter));
    } else if (member is _FieldParameterWrapper) {
      if (member._parameter is _NamedParameterWrapper) {
        _NamedParameterWrapper p = member._parameter;
        _addFunctions.add((c) => c.addNamed(p._parameter, asField: true));
      } else if (member._parameter is ParameterBuilder) {
        _addFunctions
            .add((c) => c.addPositional(member._parameter, asField: true));
      }
    } else if (member is StatementBuilder) {
      _addFunctions.add((c) => c.addStatement(member));
    } else {
      throw new StateError('Invalid AST type: ${member.runtimeType}');
    }
  }
  final constructor = new ConstructorBuilder(name: name);
  _addFunctions.forEach((a) => a(constructor));
  return constructor;
}

typedef void _AddParameter(ConstructorBuilder constructor);

/// Lazily builds an [ConstructorBuilder] AST when built.
abstract class ConstructorBuilder
    implements
        AstBuilder<ConstructorDeclaration>,
        HasAnnotations,
        HasParameters,
        HasStatements,
        ValidClassMember {
  /// Create a new [ConstructorBuilder], optionally with a [name].
  ///
  /// Can invoke `super` if [invokeSuper] is set, using super.[superName].
  factory ConstructorBuilder({
    String name,
    String superName,
    List<ExpressionBuilder> invokeSuper,
    bool asConst,
    bool asFactory,
  }) = _NormalConstructorBuilder;

  /// Create a new [ConstructorBuilder] that redirects to another constructor.
  factory ConstructorBuilder.redirectTo(
    String name,
    TypeBuilder redirectToClass, {
    String constructor,
    bool asConst,
  }) = _RedirectingConstructorBuilder;

  /// Adds a field initializer to this constructor.
  void addInitializer(
    String fieldName, {
    ExpressionBuilder toExpression,
    String toParameter,
  });

  @override
  void addNamed(ParameterBuilder parameter, {bool asField: false});

  @override
  void addPositional(ParameterBuilder parameter, {bool asField: false});

  /// Returns an [ConstructorDeclaration] AST representing the builder.
  ConstructorDeclaration buildConstructor(
    TypeBuilder returnType, [
    Scope scope,
  ]);
}

/// Lazily builds a method/function AST when the builder is invoked.
abstract class MethodBuilder
    implements
        ExpressionBuilder,
        HasAnnotations,
        HasParameters,
        HasStatements,
        ValidClassMember {
  /// Creates a new [MethodBuilder].
  factory MethodBuilder(
    String name, {
    bool asAbstract: false,
    MethodModifier modifier,
    ExpressionBuilder returns,
    TypeBuilder returnType,
  }) {
    if (returns != null) {
      return new _LambdaMethodBuilder(
        name,
        returns,
        returnType,
        null,
        modifier,
        asAbstract,
      );
    } else {
      return new _MethodBuilderImpl(
        name,
        modifier: modifier,
        returns: returnType,
        asAbstract: asAbstract,
      );
    }
  }

  /// Creates a new [MethodBuilder] that returns an anonymous closure.
  factory MethodBuilder.closure({
    MethodModifier modifier,
    ExpressionBuilder returns,
    TypeBuilder returnType,
    bool asAbstract: false,
  }) {
    if (returns != null) {
      return new _LambdaMethodBuilder(
        null,
        returns,
        returnType,
        null,
        modifier,
        asAbstract,
      );
    } else {
      return new _MethodBuilderImpl(
        null,
        modifier: modifier,
        returns: returnType,
        asAbstract: asAbstract,
      );
    }
  }

  /// Creates a getter.
  factory MethodBuilder.getter(
    String name, {
    MethodModifier modifier,
    TypeBuilder returnType,
    ExpressionBuilder returns,
    bool asAbstract: false,
  }) {
    if (returns == null) {
      return new _MethodBuilderImpl(
        name,
        modifier: modifier,
        returns: returnType,
        property: Keyword.GET,
        asAbstract: asAbstract,
      );
    } else {
      return new _LambdaMethodBuilder(
        name,
        returns,
        returnType,
        Keyword.GET,
        modifier,
        asAbstract,
      );
    }
  }

  /// Creates a new [MethodBuilder] that returns `void`.
  factory MethodBuilder.returnVoid(
    String name, {
    ExpressionBuilder returns,
    bool asAbstract: false,
  }) {
    if (returns == null) {
      return new _MethodBuilderImpl(
        name,
        returns: lib$core.$void,
        asAbstract: asAbstract,
      );
    }
    return new _LambdaMethodBuilder(
      name,
      returns,
      lib$core.$void,
      null,
      null,
      asAbstract,
    );
  }

  /// Creates a setter.
  factory MethodBuilder.setter(
    String name, {
    ExpressionBuilder returns,
    bool asAbstract: false,
  }) {
    if (returns == null) {
      return new _MethodBuilderImpl(
        name,
        property: Keyword.SET,
        asAbstract: asAbstract,
      );
    } else {
      return new _LambdaMethodBuilder(
        name,
        returns,
        null,
        Keyword.SET,
        null,
        asAbstract,
      );
    }
  }

  /// Returns a [FunctionDeclaration] AST representing the builder.
  FunctionDeclaration buildFunction([Scope scope]);

  /// Returns an [MethodDeclaration] AST representing the builder.
  MethodDeclaration buildMethod(bool static, [Scope scope]);
}

/// A marker interface for an AST that could be added to [ConstructorBuilder].
abstract class ValidConstructorMember implements ValidMethodMember {}

/// A marker interface for an AST that could be added to [MethodBuilder].
abstract class ValidMethodMember implements AstBuilder {}

class _FieldParameterWrapper
    implements ValidConstructorMember, ValidMethodMember {
  final Object /*ParameterBuilder|_NamedParameterWrapper*/ _parameter;

  _FieldParameterWrapper(this._parameter);

  @override
  AstNode buildAst([_]) => throw new UnsupportedError('Use within method');
}

class _LambdaMethodBuilder extends Object
    with
        AbstractExpressionMixin,
        HasAnnotationsMixin,
        HasParametersMixin,
        TopLevelMixin
    implements MethodBuilder {
  final ExpressionBuilder _expression;
  final MethodModifier _modifier;
  final String _name;
  final TypeBuilder _returnType;
  final Keyword _property;
  final bool _asAbstract;

  _LambdaMethodBuilder(
    this._name,
    this._expression,
    this._returnType,
    this._property,
    this._modifier,
    this._asAbstract,
  );

  @override
  void addStatement(StatementBuilder statement) {
    throw new UnsupportedError('Cannot add statement on a Lambda method');
  }

  @override
  void addStatements(Iterable<StatementBuilder> statements) {
    throw new UnsupportedError('Cannot add statement on a Lambda method');
  }

  @override
  AstNode buildAst([Scope scope]) {
    if (_name != null) {
      return buildFunction(scope);
    }
    return buildExpression(scope);
  }

  @override
  Expression buildExpression([Scope scope]) {
    return _buildExpression(scope, isStatement: false);
  }

  FunctionExpression _buildExpression(Scope scope, {bool isStatement}) {
    return astFactory.functionExpression(
      null,
      _property != Keyword.GET ? buildParameterList(scope) : null,
      astFactory.expressionFunctionBody(
        _modifier?.keyword(),
        null,
        _expression.buildExpression(scope),
        isStatement ? $semicolon : null,
      ),
    );
  }

  @override
  FunctionDeclaration buildFunction([Scope scope]) {
    return astFactory.functionDeclaration(
      null,
      buildAnnotations(scope),
      null,
      _returnType?.buildType(scope),
      _property != null ? new KeywordToken(_property, 0) : null,
      _name != null ? stringIdentifier(_name) : null,
      _asAbstract
          ? astFactory.emptyFunctionBody($semicolon)
          : _buildExpression(scope, isStatement: true),
    );
  }

  @override
  MethodDeclaration buildMethod(bool static, [Scope scope]) {
    return astFactory.methodDeclaration(
      null,
      buildAnnotations(scope),
      null,
      static ? $static : null,
      _returnType?.buildType(scope),
      _property != null ? new KeywordToken(_property, 0) : null,
      null,
      stringIdentifier(_name),
      null,
      _property != Keyword.GET ? buildParameterList(scope) : null,
      _asAbstract
          ? astFactory.emptyFunctionBody($semicolon)
          : astFactory.expressionFunctionBody(
              _modifier?.keyword(),
              null,
              _expression.buildExpression(scope),
              $semicolon,
            ),
    );
  }

  @override
  CompilationUnitMember buildTopLevelAst([Scope scope]) => buildFunction(scope);
}

class _MethodBuilderImpl extends Object
    with
        AbstractExpressionMixin,
        HasAnnotationsMixin,
        HasParametersMixin,
        HasStatementsMixin,
        TopLevelMixin
    implements MethodBuilder {
  final MethodModifier _modifier;
  final String _name;
  final TypeBuilder _returnType;
  final Keyword _property;
  final bool asAbstract;

  _MethodBuilderImpl(
    this._name, {
    MethodModifier modifier,
    TypeBuilder returns,
    Keyword property,
    this.asAbstract: false,
  })
      : _modifier = modifier,
        _returnType = returns,
        _property = property;

  @override
  AstNode buildAst([Scope scope]) {
    if (_name != null) {
      return buildFunction(scope);
    }
    return buildExpression(scope);
  }

  @override
  Expression buildExpression([Scope scope]) {
    return astFactory.functionExpression(
      null,
      _property != Keyword.GET ? buildParameterList(scope) : null,
      asAbstract
          ? astFactory.emptyFunctionBody($semicolon)
          : astFactory.blockFunctionBody(
              _modifier?.keyword(),
              _modifier?.isStar == true ? $star : null,
              buildBlock(scope),
            ),
    );
  }

  @override
  FunctionDeclaration buildFunction([Scope scope]) {
    return astFactory.functionDeclaration(
      null,
      buildAnnotations(scope),
      null,
      _returnType?.buildType(scope),
      _property != null ? new KeywordToken(_property, 0) : null,
      stringIdentifier(_name),
      buildExpression(scope),
    );
  }

  @override
  MethodDeclaration buildMethod(bool static, [Scope scope]) {
    return astFactory.methodDeclaration(
      null,
      buildAnnotations(scope),
      null,
      static ? $static : null,
      _returnType?.buildType(scope),
      _property != null ? new KeywordToken(_property, 0) : null,
      null,
      identifier(scope, _name),
      null,
      _property != Keyword.GET ? buildParameterList(scope) : null,
      asAbstract
          ? astFactory.emptyFunctionBody($semicolon)
          : astFactory.blockFunctionBody(
              _modifier?.keyword(),
              _modifier?.isStar == true ? $star : null,
              buildBlock(scope),
            ),
    );
  }

  @override
  CompilationUnitMember buildTopLevelAst([Scope scope]) => buildFunction(scope);
}

class _NamedParameterWrapper
    implements ValidConstructorMember, ValidMethodMember {
  final ParameterBuilder _parameter;

  _NamedParameterWrapper(this._parameter);

  @override
  AstNode buildAst([_]) => throw new UnsupportedError('Use within method');
}

class _RedirectingConstructorBuilder extends Object
    with HasAnnotationsMixin, HasParametersMixin
    implements ConstructorBuilder {
  final String name;
  final TypeBuilder redirectToClass;
  final bool asConst;
  final String constructor;

  _RedirectingConstructorBuilder(
    this.name,
    this.redirectToClass, {
    this.asConst: false,
    this.constructor,
  });

  @override
  void addInitializer(
    String fieldName, {
    ExpressionBuilder toExpression,
    String toParameter,
  }) {
    throw new UnsupportedError('Not valid for redirect constructors');
  }

  @override
  void addStatement(StatementBuilder statement) {
    throw new UnsupportedError('Not valid for redirect constructors');
  }

  @override
  void addStatements(Iterable<StatementBuilder> statements) {
    throw new UnsupportedError('Not valid for redirect constructors');
  }

  @override
  ConstructorDeclaration buildAst([_]) {
    throw new UnsupportedError('Can only be built as part of a class.');
  }

  @override
  ConstructorDeclaration buildConstructor(
    TypeBuilder returnType, [
    Scope scope,
  ]) {
    return astFactory.constructorDeclaration(
      null,
      buildAnnotations(scope),
      null,
      asConst ? $const : null,
      $factory,
      returnType.buildType(scope).name,
      name != null ? $period : null,
      name != null ? stringIdentifier(name) : null,
      buildParameterList(scope),
      null,
      null,
      astFactory.constructorName(
        redirectToClass.buildType(scope),
        constructor != null ? $period : null,
        constructor != null ? stringIdentifier(constructor) : null,
      ),
      astFactory.emptyFunctionBody($semicolon),
    );
  }
}

class _NormalConstructorBuilder extends Object
    with HasAnnotationsMixin, HasParametersMixin, HasStatementsMixin
    implements ConstructorBuilder {
  final _initializers = <String, ExpressionBuilder>{};
  final bool _asFactory;
  final bool _asConst;
  final String _name;
  final String _superName;
  final List<ExpressionBuilder> _superInvocation;

  _NormalConstructorBuilder({
    List<ExpressionBuilder> invokeSuper,
    String name,
    String superName,
    bool asConst: false,
    bool asFactory: false,
  })
      : _name = name,
        _superInvocation = invokeSuper,
        _superName = superName,
        _asConst = asConst,
        _asFactory = asFactory;

  @override
  void addInitializer(
    String fieldName, {
    ExpressionBuilder toExpression,
    String toParameter,
  }) {
    _initializers[fieldName] = toExpression ?? reference(toParameter);
  }

  @override
  ConstructorDeclaration buildAst([Scope scope]) {
    throw new UnsupportedError('Can only be built as part of a class.');
  }

  @override
  ConstructorDeclaration buildConstructor(
    TypeBuilder returnType, [
    Scope scope,
  ]) {
    List<ConstructorInitializer> initializers;
    if (_initializers.isNotEmpty) {
      initializers ??= [];
      initializers.addAll(
        _initializers.keys.map((fieldName) {
          return astFactory.constructorFieldInitializer(
            null,
            null,
            astFactory.simpleIdentifier(stringToken(fieldName)),
            $equals,
            _initializers[fieldName].buildExpression(scope),
          );
        }),
      );
    }
    if (_superInvocation != null) {
      initializers ??= [];
      initializers.add(astFactory.superConstructorInvocation(
        $super,
        _superName != null ? $period : null,
        _superName != null
            ? astFactory.simpleIdentifier(stringToken(_superName))
            : null,
        astFactory.argumentList(
          $openParen,
          _superInvocation.map((e) => e.buildExpression(scope)).toList(),
          $closeParen,
        ),
      ));
    }
    return astFactory.constructorDeclaration(
      null,
      buildAnnotations(scope),
      null,
      _asConst ? $const : null,
      _asFactory ? $factory : null,
      returnType.buildType(scope).name,
      _name != null ? $period : null,
      _name != null ? stringIdentifier(_name) : null,
      buildParameterList(scope),
      initializers != null && initializers.isNotEmpty ? $semicolon : null,
      initializers,
      null,
      !hasStatements
          ? astFactory.emptyFunctionBody($semicolon)
          : astFactory.blockFunctionBody(
              null,
              null,
              buildBlock(scope),
            ),
    );
  }
}
