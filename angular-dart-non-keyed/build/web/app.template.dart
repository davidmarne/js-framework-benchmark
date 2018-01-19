// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// Generator: TemplateGenerator
// **************************************************************************

// ignore_for_file: cancel_subscriptions,constant_identifier_names,duplicate_import,non_constant_identifier_names,library_prefixes,UNUSED_IMPORT,UNUSED_SHOWN_NAME
import 'app.dart';
export 'app.dart';
import 'dart:html';
import 'dart:async';
import 'dart:math';
import 'package:angular/angular.dart';
// Required for initReflector().
import 'package:angular/src/di/reflector.dart' as _ngRef;
import 'package:angular/angular.template.dart' as _ref0;

import 'package:angular/src/debug/debug_context.dart';
import 'package:angular/src/core/linker/template_ref.dart';
import 'package:angular/src/common/directives/ng_for.dart' as import2;
import 'package:angular/src/debug/debug_app_view.dart';
import 'app.dart' as import4;
import 'dart:html' as import5;
import 'package:angular/src/core/linker/view_container.dart';
import 'package:angular/src/core/render/api.dart';
import 'package:angular/src/core/linker/app_view.dart';
import 'package:angular/src/core/linker/view_type.dart' as import9;
import 'package:angular/src/core/change_detection/change_detection.dart';
import 'package:angular/src/core/linker/app_view_utils.dart' as import11;
import 'package:angular/angular.dart';

const List<dynamic> styles$AppComponent = const [];
List<StaticNodeDebugInfo> nodeDebugInfos_AppComponent0 = [
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  null,
  new StaticNodeDebugInfo([TemplateRef, import2.NgFor], null, <String, dynamic>{}),
  null,
  null,
  null,
  null,
  null
];

class ViewAppComponent0 extends DebugAppView<import4.AppComponent> {
  import5.DivElement _el_0;
  import5.DivElement _el_2;
  import5.DivElement _el_4;
  import5.DivElement _el_6;
  import5.Element _el_8;
  import5.DivElement _el_12;
  import5.DivElement _el_14;
  import5.ButtonElement _el_16;
  import5.DivElement _el_20;
  import5.ButtonElement _el_22;
  import5.DivElement _el_26;
  import5.ButtonElement _el_28;
  import5.DivElement _el_32;
  import5.ButtonElement _el_34;
  import5.DivElement _el_38;
  import5.ButtonElement _el_40;
  import5.DivElement _el_44;
  import5.ButtonElement _el_46;
  import5.TableElement _el_53;
  import5.Element _el_55;
  ViewContainer _appEl_57;
  import2.NgFor _NgFor_57_7;
  import5.Element _el_61;
  var _expr_1;
  static RenderComponentType _renderType;
  ViewAppComponent0(AppView<dynamic> parentView, num parentIndex) : super(import9.ViewType.COMPONENT, {}, parentView, parentIndex, ChangeDetectionStrategy.CheckAlways, nodeDebugInfos_AppComponent0) {
    rootEl = import5.document.createElement('my-app');
    _renderType ??= import11.appViewUtils.createRenderType('asset:angular_dart_non_keyed/web/app.html', ViewEncapsulation.None, styles$AppComponent);
    setupComponentType(_renderType);
  }
  @override
  ComponentRef build() {
    final import5.HtmlElement parentRenderNode = initViewRoot(rootEl);
    var doc = import5.document;
    _el_0 = createAndAppendDbg(this, doc, 'div', parentRenderNode, 0, 0, 0);
    _el_0.className = 'container';
    import5.Text _text_1 = new import5.Text('\n  ');
    _el_0.append(_text_1);
    dbgElm(this, _text_1, 1, 0, 23);
    _el_2 = createAndAppendDbg(this, doc, 'div', _el_0, 2, 1, 2);
    _el_2.className = 'jumbotron';
    import5.Text _text_3 = new import5.Text('\n    ');
    _el_2.append(_text_3);
    dbgElm(this, _text_3, 3, 1, 25);
    _el_4 = createAndAppendDbg(this, doc, 'div', _el_2, 4, 2, 4);
    _el_4.className = 'row';
    import5.Text _text_5 = new import5.Text('\n      ');
    _el_4.append(_text_5);
    dbgElm(this, _text_5, 5, 2, 21);
    _el_6 = createAndAppendDbg(this, doc, 'div', _el_4, 6, 3, 6);
    _el_6.className = 'col-md-6';
    import5.Text _text_7 = new import5.Text('\n        ');
    _el_6.append(_text_7);
    dbgElm(this, _text_7, 7, 3, 28);
    _el_8 = createAndAppendDbg(this, doc, 'h1', _el_6, 8, 4, 8);
    import5.Text _text_9 = new import5.Text('Angular v4.0.0 (dart)');
    _el_8.append(_text_9);
    dbgElm(this, _text_9, 9, 4, 12);
    import5.Text _text_10 = new import5.Text('\n      ');
    _el_6.append(_text_10);
    dbgElm(this, _text_10, 10, 4, 38);
    import5.Text _text_11 = new import5.Text('\n      ');
    _el_4.append(_text_11);
    dbgElm(this, _text_11, 11, 5, 12);
    _el_12 = createAndAppendDbg(this, doc, 'div', _el_4, 12, 6, 6);
    _el_12.className = 'col-md-6';
    import5.Text _text_13 = new import5.Text('\n        ');
    _el_12.append(_text_13);
    dbgElm(this, _text_13, 13, 6, 28);
    _el_14 = createAndAppendDbg(this, doc, 'div', _el_12, 14, 7, 8);
    _el_14.className = 'col-sm-6 smallpad';
    import5.Text _text_15 = new import5.Text('\n          ');
    _el_14.append(_text_15);
    dbgElm(this, _text_15, 15, 7, 39);
    _el_16 = createAndAppendDbg(this, doc, 'button', _el_14, 16, 8, 10);
    _el_16.className = 'btn btn-primary btn-block';
    createAttr(_el_16, 'id', 'run');
    createAttr(_el_16, 'ref', 'text');
    createAttr(_el_16, 'type', 'button');
    import5.Text _text_17 = new import5.Text('Create 1,000 rows');
    _el_16.append(_text_17);
    dbgElm(this, _text_17, 17, 8, 102);
    import5.Text _text_18 = new import5.Text('\n        ');
    _el_14.append(_text_18);
    dbgElm(this, _text_18, 18, 8, 128);
    import5.Text _text_19 = new import5.Text('\n        ');
    _el_12.append(_text_19);
    dbgElm(this, _text_19, 19, 9, 14);
    _el_20 = createAndAppendDbg(this, doc, 'div', _el_12, 20, 10, 8);
    _el_20.className = 'col-sm-6 smallpad';
    import5.Text _text_21 = new import5.Text('\n          ');
    _el_20.append(_text_21);
    dbgElm(this, _text_21, 21, 10, 39);
    _el_22 = createAndAppendDbg(this, doc, 'button', _el_20, 22, 11, 10);
    _el_22.className = 'btn btn-primary btn-block';
    createAttr(_el_22, 'id', 'runlots');
    createAttr(_el_22, 'type', 'button');
    import5.Text _text_23 = new import5.Text('Create 10,000 rows');
    _el_22.append(_text_23);
    dbgElm(this, _text_23, 23, 11, 99);
    import5.Text _text_24 = new import5.Text('\n        ');
    _el_20.append(_text_24);
    dbgElm(this, _text_24, 24, 11, 126);
    import5.Text _text_25 = new import5.Text('\n        ');
    _el_12.append(_text_25);
    dbgElm(this, _text_25, 25, 12, 14);
    _el_26 = createAndAppendDbg(this, doc, 'div', _el_12, 26, 13, 8);
    _el_26.className = 'col-sm-6 smallpad';
    import5.Text _text_27 = new import5.Text('\n          ');
    _el_26.append(_text_27);
    dbgElm(this, _text_27, 27, 13, 39);
    _el_28 = createAndAppendDbg(this, doc, 'button', _el_26, 28, 14, 10);
    _el_28.className = 'btn btn-primary btn-block';
    createAttr(_el_28, 'id', 'add');
    createAttr(_el_28, 'ref', 'text');
    createAttr(_el_28, 'type', 'button');
    import5.Text _text_29 = new import5.Text('Append 1,000 rows');
    _el_28.append(_text_29);
    dbgElm(this, _text_29, 29, 14, 102);
    import5.Text _text_30 = new import5.Text('\n        ');
    _el_26.append(_text_30);
    dbgElm(this, _text_30, 30, 14, 128);
    import5.Text _text_31 = new import5.Text('\n        ');
    _el_12.append(_text_31);
    dbgElm(this, _text_31, 31, 15, 14);
    _el_32 = createAndAppendDbg(this, doc, 'div', _el_12, 32, 16, 8);
    _el_32.className = 'col-sm-6 smallpad';
    import5.Text _text_33 = new import5.Text('\n          ');
    _el_32.append(_text_33);
    dbgElm(this, _text_33, 33, 16, 39);
    _el_34 = createAndAppendDbg(this, doc, 'button', _el_32, 34, 17, 10);
    _el_34.className = 'btn btn-primary btn-block';
    createAttr(_el_34, 'id', 'update');
    createAttr(_el_34, 'type', 'button');
    import5.Text _text_35 = new import5.Text('Update every 10th row');
    _el_34.append(_text_35);
    dbgElm(this, _text_35, 35, 17, 97);
    import5.Text _text_36 = new import5.Text('\n        ');
    _el_32.append(_text_36);
    dbgElm(this, _text_36, 36, 17, 127);
    import5.Text _text_37 = new import5.Text('\n        ');
    _el_12.append(_text_37);
    dbgElm(this, _text_37, 37, 18, 14);
    _el_38 = createAndAppendDbg(this, doc, 'div', _el_12, 38, 19, 8);
    _el_38.className = 'col-sm-6 smallpad';
    import5.Text _text_39 = new import5.Text('\n          ');
    _el_38.append(_text_39);
    dbgElm(this, _text_39, 39, 19, 39);
    _el_40 = createAndAppendDbg(this, doc, 'button', _el_38, 40, 20, 10);
    _el_40.className = 'btn btn-primary btn-block';
    createAttr(_el_40, 'id', 'clear');
    createAttr(_el_40, 'type', 'button');
    import5.Text _text_41 = new import5.Text('Clear');
    _el_40.append(_text_41);
    dbgElm(this, _text_41, 41, 20, 95);
    import5.Text _text_42 = new import5.Text('\n        ');
    _el_38.append(_text_42);
    dbgElm(this, _text_42, 42, 20, 109);
    import5.Text _text_43 = new import5.Text('\n        ');
    _el_12.append(_text_43);
    dbgElm(this, _text_43, 43, 21, 14);
    _el_44 = createAndAppendDbg(this, doc, 'div', _el_12, 44, 22, 8);
    _el_44.className = 'col-sm-6 smallpad';
    import5.Text _text_45 = new import5.Text('\n          ');
    _el_44.append(_text_45);
    dbgElm(this, _text_45, 45, 22, 39);
    _el_46 = createAndAppendDbg(this, doc, 'button', _el_44, 46, 23, 10);
    _el_46.className = 'btn btn-primary btn-block';
    createAttr(_el_46, 'id', 'swaprows');
    createAttr(_el_46, 'type', 'button');
    import5.Text _text_47 = new import5.Text('Swap Rows');
    _el_46.append(_text_47);
    dbgElm(this, _text_47, 47, 23, 101);
    import5.Text _text_48 = new import5.Text('\n        ');
    _el_44.append(_text_48);
    dbgElm(this, _text_48, 48, 23, 119);
    import5.Text _text_49 = new import5.Text('\n      ');
    _el_12.append(_text_49);
    dbgElm(this, _text_49, 49, 24, 14);
    import5.Text _text_50 = new import5.Text('\n    ');
    _el_4.append(_text_50);
    dbgElm(this, _text_50, 50, 25, 12);
    import5.Text _text_51 = new import5.Text('\n  ');
    _el_2.append(_text_51);
    dbgElm(this, _text_51, 51, 26, 10);
    import5.Text _text_52 = new import5.Text('\n  ');
    _el_0.append(_text_52);
    dbgElm(this, _text_52, 52, 27, 8);
    _el_53 = createAndAppendDbg(this, doc, 'table', _el_0, 53, 28, 2);
    _el_53.className = 'table table-hover table-striped test-data';
    import5.Text _text_54 = new import5.Text('\n    ');
    _el_53.append(_text_54);
    dbgElm(this, _text_54, 54, 28, 59);
    _el_55 = createAndAppendDbg(this, doc, 'tbody', _el_53, 55, 29, 4);
    import5.Text _text_56 = new import5.Text('\n      ');
    _el_55.append(_text_56);
    dbgElm(this, _text_56, 56, 29, 11);
    var _anchor_57 = ngAnchor.clone(false);
    _el_55.append(_anchor_57);
    dbgElm(this, _anchor_57, 57, 30, 6);
    _appEl_57 = new ViewContainer(57, 55, this, _anchor_57);
    TemplateRef _TemplateRef_57_6 = new TemplateRef(_appEl_57, viewFactory_AppComponent1);
    _NgFor_57_7 = new import2.NgFor(_appEl_57, _TemplateRef_57_6);
    import5.Text _text_58 = new import5.Text('\n    ');
    _el_55.append(_text_58);
    dbgElm(this, _text_58, 58, 41, 11);
    import5.Text _text_59 = new import5.Text('\n  ');
    _el_53.append(_text_59);
    dbgElm(this, _text_59, 59, 42, 12);
    import5.Text _text_60 = new import5.Text('\n  ');
    _el_0.append(_text_60);
    dbgElm(this, _text_60, 60, 43, 10);
    _el_61 = createAndAppendDbg(this, doc, 'span', _el_0, 61, 44, 2);
    createAttr(_el_61, 'aria-hidden', 'true');
    _el_61.className = 'preloadicon glyphicon glyphicon-remove';
    import5.Text _text_62 = new import5.Text('\n');
    _el_0.append(_text_62);
    dbgElm(this, _text_62, 62, 44, 81);
    _el_16.addEventListener('click', eventHandler0(ctx.run));
    _el_22.addEventListener('click', eventHandler0(ctx.runLots));
    _el_28.addEventListener('click', eventHandler0(ctx.add));
    _el_34.addEventListener('click', eventHandler0(ctx.update));
    _el_40.addEventListener('click', eventHandler0(ctx.clear));
    _el_46.addEventListener('click', eventHandler0(ctx.swapRows));
    init(const [], const [], [_el_0, _text_1, _el_2, _text_3, _el_4, _text_5, _el_6, _text_7, _el_8, _text_9, _text_10, _text_11, _el_12, _text_13, _el_14, _text_15, _el_16, _text_17, _text_18, _text_19, _el_20, _text_21, _el_22, _text_23, _text_24, _text_25, _el_26, _text_27, _el_28, _text_29, _text_30, _text_31, _el_32, _text_33, _el_34, _text_35, _text_36, _text_37, _el_38, _text_39, _el_40, _text_41, _text_42, _text_43, _el_44, _text_45, _el_46, _text_47, _text_48, _text_49, _text_50, _text_51, _text_52, _el_53, _text_54, _el_55, _text_56, _anchor_57, _text_58, _text_59, _text_60, _el_61, _text_62]);
    return null;
  }

  @override
  void detectChangesInternal() {
    final import4.AppComponent _ctx = ctx;
    bool firstCheck = (this.cdState == 0);
    if (firstCheck) {
      if (!identical(_ctx.itemByIndex, null)) {
        (_NgFor_57_7.ngForTrackBy = _ctx.itemByIndex);
      }
    }
    dbg(57, 30, 48);
    final currVal_1 = _ctx.data;
    if (import11.checkBinding(_expr_1, currVal_1)) {
      _NgFor_57_7.ngForOf = currVal_1;
      _expr_1 = currVal_1;
    }
    if (!import11.AppViewUtils.throwOnChanges) {
      _NgFor_57_7.ngDoCheck();
    }
    _appEl_57.detectChangesInNestedViews();
  }

  @override
  void destroyInternal() {
    _appEl_57.destroyNestedViews();
  }
}

AppView<import4.AppComponent> viewFactory_AppComponent0(AppView<dynamic> parentView, num parentIndex) {
  return new ViewAppComponent0(parentView, parentIndex);
}

List<StaticNodeDebugInfo> nodeDebugInfos_AppComponent1 = [null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null];

class _ViewAppComponent1 extends DebugAppView<import4.AppComponent> {
  import5.Element _el_0;
  import5.Element _el_2;
  import5.Text _text_3;
  import5.Element _el_5;
  import5.AnchorElement _el_7;
  import5.Text _text_8;
  import5.Element _el_11;
  import5.AnchorElement _el_13;
  import5.Element _el_15;
  import5.Element _el_19;
  bool _expr_0;
  var _expr_1;
  var _expr_2;
  _ViewAppComponent1(AppView<dynamic> parentView, num parentIndex) : super(import9.ViewType.EMBEDDED, {'\$implicit': null}, parentView, parentIndex, ChangeDetectionStrategy.CheckAlways, nodeDebugInfos_AppComponent1) {
    componentType = ViewAppComponent0._renderType;
  }
  @override
  ComponentRef build() {
    var doc = import5.document;
    _el_0 = doc.createElement('tr');
    dbgElm(this, _el_0, 0, 30, 6);
    import5.Text _text_1 = new import5.Text('\n        ');
    _el_0.append(_text_1);
    dbgElm(this, _text_1, 1, 30, 94);
    _el_2 = createAndAppendDbg(this, doc, 'td', _el_0, 2, 31, 8);
    _el_2.className = 'col-md-1';
    _text_3 = new import5.Text('');
    _el_2.append(_text_3);
    dbgElm(this, _text_3, 3, 31, 29);
    import5.Text _text_4 = new import5.Text('\n        ');
    _el_0.append(_text_4);
    dbgElm(this, _text_4, 4, 31, 45);
    _el_5 = createAndAppendDbg(this, doc, 'td', _el_0, 5, 32, 8);
    _el_5.className = 'col-md-4';
    import5.Text _text_6 = new import5.Text('\n          ');
    _el_5.append(_text_6);
    dbgElm(this, _text_6, 6, 32, 29);
    _el_7 = createAndAppendDbg(this, doc, 'a', _el_5, 7, 33, 10);
    createAttr(_el_7, 'href', '#');
    _text_8 = new import5.Text('');
    _el_7.append(_text_8);
    dbgElm(this, _text_8, 8, 33, 53);
    import5.Text _text_9 = new import5.Text('\n        ');
    _el_5.append(_text_9);
    dbgElm(this, _text_9, 9, 33, 71);
    import5.Text _text_10 = new import5.Text('\n        ');
    _el_0.append(_text_10);
    dbgElm(this, _text_10, 10, 34, 13);
    _el_11 = createAndAppendDbg(this, doc, 'td', _el_0, 11, 35, 8);
    _el_11.className = 'col-md-1';
    import5.Text _text_12 = new import5.Text('\n          ');
    _el_11.append(_text_12);
    dbgElm(this, _text_12, 12, 35, 29);
    _el_13 = createAndAppendDbg(this, doc, 'a', _el_11, 13, 36, 10);
    createAttr(_el_13, 'href', '#');
    import5.Text _text_14 = new import5.Text('\n            ');
    _el_13.append(_text_14);
    dbgElm(this, _text_14, 14, 36, 53);
    _el_15 = createAndAppendDbg(this, doc, 'span', _el_13, 15, 37, 12);
    createAttr(_el_15, 'aria-hidden', 'true');
    _el_15.className = 'glyphicon glyphicon-remove';
    import5.Text _text_16 = new import5.Text('\n          ');
    _el_13.append(_text_16);
    dbgElm(this, _text_16, 16, 37, 79);
    import5.Text _text_17 = new import5.Text('\n        ');
    _el_11.append(_text_17);
    dbgElm(this, _text_17, 17, 38, 14);
    import5.Text _text_18 = new import5.Text('\n        ');
    _el_0.append(_text_18);
    dbgElm(this, _text_18, 18, 39, 13);
    _el_19 = createAndAppendDbg(this, doc, 'td', _el_0, 19, 40, 8);
    _el_19.className = 'col-md-6';
    import5.Text _text_20 = new import5.Text('\n      ');
    _el_0.append(_text_20);
    dbgElm(this, _text_20, 20, 40, 34);
    _el_7.addEventListener('click', eventHandler1(_handle_click_7_0));
    _el_13.addEventListener('click', eventHandler1(_handle_click_13_0));
    init([_el_0], const [], [_el_0, _text_1, _el_2, _text_3, _text_4, _el_5, _text_6, _el_7, _text_8, _text_9, _text_10, _el_11, _text_12, _el_13, _text_14, _el_15, _text_16, _text_17, _text_18, _el_19, _text_20]);
    return null;
  }

  @override
  void detectChangesInternal() {
    final import4.AppComponent _ctx = ctx;
    final currVal_0 = identical(locals['\$implicit'].id, _ctx.selected);
    if (import11.checkBinding(_expr_0, currVal_0)) {
      updateClass(_el_0, 'danger', currVal_0);
      _expr_0 = currVal_0;
    }
    dbg(3, 31, 29);
    final currVal_1 = import11.interpolate0(locals['\$implicit'].id);
    if (import11.checkBinding(_expr_1, currVal_1)) {
      _text_3.text = currVal_1;
      _expr_1 = currVal_1;
    }
    dbg(8, 33, 53);
    final currVal_2 = import11.interpolate0(locals['\$implicit'].label);
    if (import11.checkBinding(_expr_2, currVal_2)) {
      _text_8.text = currVal_2;
      _expr_2 = currVal_2;
    }
  }

  void _handle_click_7_0($event) {
    dbg(7, 33, 22);
    ctx.select(locals['\$implicit'], $event);
  }

  void _handle_click_13_0($event) {
    dbg(13, 36, 22);
    ctx.delete(locals['\$implicit'], $event);
  }
}

AppView<import4.AppComponent> viewFactory_AppComponent1(AppView<dynamic> parentView, num parentIndex) {
  return new _ViewAppComponent1(parentView, parentIndex);
}

const List<dynamic> styles$AppComponentHost = const [];
List<StaticNodeDebugInfo> nodeDebugInfos_AppComponentHost0 = [
  new StaticNodeDebugInfo([import4.AppComponent], import4.AppComponent, <String, dynamic>{})
];

class _ViewAppComponentHost0 extends DebugAppView<dynamic> {
  ViewAppComponent0 _compView_0;
  import4.AppComponent _AppComponent_0_4;
  static RenderComponentType _renderType;
  _ViewAppComponentHost0(AppView<dynamic> parentView, num parentIndex) : super(import9.ViewType.HOST, {}, parentView, parentIndex, ChangeDetectionStrategy.CheckAlways, nodeDebugInfos_AppComponentHost0) {
    _renderType ??= import11.appViewUtils.createRenderType('', ViewEncapsulation.Emulated, styles$AppComponentHost);
    setupComponentType(_renderType);
  }
  @override
  ComponentRef build() {
    _compView_0 = new ViewAppComponent0(this, 0);
    rootEl = _compView_0.rootEl;
    dbgIdx(rootEl, 0);
    _AppComponent_0_4 = new import4.AppComponent();
    _compView_0.create(_AppComponent_0_4, projectableNodes);
    init([rootEl], const [], [rootEl]);
    return new ComponentRef(0, this, rootEl, _AppComponent_0_4);
  }

  @override
  dynamic injectorGetInternal(dynamic token, int nodeIndex, dynamic notFoundResult) {
    if ((identical(token, import4.AppComponent) && (0 == nodeIndex))) {
      return _AppComponent_0_4;
    }
    return notFoundResult;
  }

  @override
  void detectChangesInternal() {
    _compView_0.detectChanges();
    if (!import11.AppViewUtils.throwOnChanges) {
      dbg(0, 0, 0);
      _AppComponent_0_4.ngAfterViewChecked();
    }
  }

  @override
  void destroyInternal() {
    _compView_0.destroy();
  }
}

AppView viewFactory_AppComponentHost0(AppView<dynamic> parentView, num parentIndex) {
  return new _ViewAppComponentHost0(parentView, parentIndex);
}

const ComponentFactory _AppComponentNgFactory = const ComponentFactory('my-app', viewFactory_AppComponentHost0, import4.AppComponent, _AppComponentMetadata);
final ComponentFactory AppComponentNgFactory = _AppComponentNgFactory;
const _AppComponentMetadata = const [];
var _visited = false;
void initReflector() {
  if (_visited) {
    return;
  }
  _visited = true;
  _ref0.initReflector();
  _ngRef.registerComponent(
    AppComponent,
    AppComponentNgFactory,
  );
  _ngRef.registerFactory(
    AppComponent,
    () => new AppComponent(),
  );
}
