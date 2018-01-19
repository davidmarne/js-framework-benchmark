// Copyright 2017 Workiva Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

library abstract_transition_props;

import 'dart:collection';

import 'package:over_react/over_react.dart';

/// Props that mirror the implementation of [AbstractTransitionProps], made available as a mixin for components
/// that cannot extend directly from [AbstractTransitionComponent].
@PropsMixin()
abstract class TransitionPropsMixin {    /* GENERATED CONSTANTS */ static const ConsumedProps $consumedProps = const ConsumedProps($props, $propKeys); static const PropDescriptor _$prop__transitionCount__TransitionPropsMixin = const PropDescriptor(_$key__transitionCount__TransitionPropsMixin), _$prop__transitionInCount__TransitionPropsMixin = const PropDescriptor(_$key__transitionInCount__TransitionPropsMixin), _$prop__transitionOutCount__TransitionPropsMixin = const PropDescriptor(_$key__transitionOutCount__TransitionPropsMixin), _$prop__onWillHide__TransitionPropsMixin = const PropDescriptor(_$key__onWillHide__TransitionPropsMixin), _$prop__onDidHide__TransitionPropsMixin = const PropDescriptor(_$key__onDidHide__TransitionPropsMixin), _$prop__onWillShow__TransitionPropsMixin = const PropDescriptor(_$key__onWillShow__TransitionPropsMixin), _$prop__onDidShow__TransitionPropsMixin = const PropDescriptor(_$key__onDidShow__TransitionPropsMixin); static const List<PropDescriptor> $props = const [_$prop__transitionCount__TransitionPropsMixin, _$prop__transitionInCount__TransitionPropsMixin, _$prop__transitionOutCount__TransitionPropsMixin, _$prop__onWillHide__TransitionPropsMixin, _$prop__onDidHide__TransitionPropsMixin, _$prop__onWillShow__TransitionPropsMixin, _$prop__onDidShow__TransitionPropsMixin]; static const String _$key__transitionCount__TransitionPropsMixin = 'TransitionPropsMixin.transitionCount', _$key__transitionInCount__TransitionPropsMixin = 'TransitionPropsMixin.transitionInCount', _$key__transitionOutCount__TransitionPropsMixin = 'TransitionPropsMixin.transitionOutCount', _$key__onWillHide__TransitionPropsMixin = 'TransitionPropsMixin.onWillHide', _$key__onDidHide__TransitionPropsMixin = 'TransitionPropsMixin.onDidHide', _$key__onWillShow__TransitionPropsMixin = 'TransitionPropsMixin.onWillShow', _$key__onDidShow__TransitionPropsMixin = 'TransitionPropsMixin.onDidShow'; static const List<String> $propKeys = const [_$key__transitionCount__TransitionPropsMixin, _$key__transitionInCount__TransitionPropsMixin, _$key__transitionOutCount__TransitionPropsMixin, _$key__onWillHide__TransitionPropsMixin, _$key__onDidHide__TransitionPropsMixin, _$key__onWillShow__TransitionPropsMixin, _$key__onDidShow__TransitionPropsMixin]; 
  static final TransitionPropsMapView defaultProps = new TransitionPropsMapView({})
    ..transitionCount = 1;

  Map get props;

  /// The number of `transitionend` event that occur when the transition node is shown/hidden.
  ///
  /// Serves as the default for [transitionInCount]/[transitionOutCount] when they are not specified.
  ///
  /// Default: `1`
  int get transitionCount => props[_$key__transitionCount__TransitionPropsMixin];  set transitionCount(int value) => props[_$key__transitionCount__TransitionPropsMixin] = value;

  /// The number of `transitionend` event that occur when the transition node is shown.
  ///
  /// Default: [transitionCount]
  int get transitionInCount => props[_$key__transitionInCount__TransitionPropsMixin];  set transitionInCount(int value) => props[_$key__transitionInCount__TransitionPropsMixin] = value;

  /// The number of `transitionend` event that occur when the transition node is hidden.
  ///
  /// Default: [transitionCount]
  int get transitionOutCount => props[_$key__transitionOutCount__TransitionPropsMixin];  set transitionOutCount(int value) => props[_$key__transitionOutCount__TransitionPropsMixin] = value;

  /// Optional callback that fires before the [AbstractTransitionComponent] is hidden.
  ///
  /// Returning `false` will cancel default behavior, and the [AbstractTransitionComponent] will remain visible.
  Callback get onWillHide => props[_$key__onWillHide__TransitionPropsMixin];  set onWillHide(Callback value) => props[_$key__onWillHide__TransitionPropsMixin] = value;

  /// Optional callback that fires after the [AbstractTransitionComponent] is hidden.
  Callback get onDidHide => props[_$key__onDidHide__TransitionPropsMixin];  set onDidHide(Callback value) => props[_$key__onDidHide__TransitionPropsMixin] = value;

  /// Optional callback that fires before the [AbstractTransitionComponent] appears.
  ///
  /// Returning `false` will cancel default behavior, and the [AbstractTransitionComponent] will not appear.
  Callback get onWillShow => props[_$key__onWillShow__TransitionPropsMixin];  set onWillShow(Callback value) => props[_$key__onWillShow__TransitionPropsMixin] = value;

  /// Optional callback that fires after the [AbstractTransitionComponent] appears.
  Callback get onDidShow => props[_$key__onDidShow__TransitionPropsMixin];  set onDidShow(Callback value) => props[_$key__onDidShow__TransitionPropsMixin] = value;
}

class TransitionPropsMapView extends MapView with
    TransitionPropsMixin {
  /// Create a new instance backed by the specified map.
  TransitionPropsMapView(Map map) : super(map);

  /// The props to be manipulated via the getters/setters.
  /// In this case, it's the current MapView object.
  @override
  Map get props => this;
}
