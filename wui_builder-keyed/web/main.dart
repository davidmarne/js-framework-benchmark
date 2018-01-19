import 'dart:html';
import 'dart:async';

import 'package:wui_builder/wui_builder.dart';
import 'package:wui_builder/components.dart';
import 'package:wui_builder/vhtml.dart';

import 'utils.dart';

double startTime;
var lastMeasure;

void startMeasure(String name) {
  startTime = window.performance.now();
  lastMeasure = name;
}

void stopMeasure() {
  final last = lastMeasure;
  if (lastMeasure == null) return;
  // runs the stop measure code on a future
  new Timer(new Duration(milliseconds: 0), () {
    lastMeasure = null;
    final stop = window.performance.now();
    print('$last took ${stop - startTime}');
  });
}

class MainState {
  List<Data> data;
  int selected;
  int id;
}

class Main extends SComponent<MainState> {
  @override
  MainState getInitialState() => new MainState()
    ..data = []
    ..selected = null
    ..id = 1;

  void printDuration() {
    stopMeasure();
  }

  @override
  void componentDidUpdate(prevProps, prevState) {
    printDuration();
  }

  @override
  void componentDidMount() {
    printDuration();
  }

  void _run(Event e) {
    startMeasure("run");
    final dataAndId = run(state.id);
    setState((_, prevState) => new MainState()
      ..data = dataAndId.data
      ..id = dataAndId.id
      ..selected = null);
  }

  void _add(Event e) {
    startMeasure("add");
    final dataAndId = add(state.id, state.data);
    setState((_, prevState) => new MainState()
      ..id = dataAndId.id
      ..data = dataAndId.data
      ..selected = prevState.selected);
  }

  void _update(Event e) {
    startMeasure("update");
    setState((_, prevState) => new MainState()
      ..data = update(state.data)
      ..id = prevState.id
      ..selected = prevState.selected);
  }

  void _select(int id) {
    startMeasure("select");
    setState((_, prevState) => new MainState()
      ..selected = id
      ..data = prevState.data
      ..id = prevState.id);
  }

  void _delete(id) {
    startMeasure("delete");
    setState((_, prevState) => new MainState()
      ..data = delete(state.data, id)
      ..id = prevState.id
      ..selected = prevState.selected);
  }

  void _runLots(Event e) {
    startMeasure("runLots");
    final dataAndId = runLots(state.id);
    setState((_, prevState) => new MainState()
      ..id = dataAndId.id
      ..data = dataAndId.data
      ..selected = null);
  }

  void _clear(Event e) {
    startMeasure("clear");
    setState((_, prevState) => new MainState()
      ..data = <Data>[]
      ..id = prevState.id
      ..selected = null);
  }

  void _swapRows(Event e) {
    startMeasure("swapRows");
    final data = swapRows(state.data);
    setState((_, prevState) => new MainState()
      ..data = data
      ..id = prevState.id
      ..selected = prevState.selected);
  }

  Iterable<VNode> rows() => state.data.map(
        (d) => new Row(new RowProps()
          ..data = d
          ..onSelect = _select
          ..onDelete = _delete
          ..isSelected = d.id == state.selected)
          ..key = d.id,
      );

  @override
  VNode render() {
    return new Vdiv()
      ..className = "container"
      ..children = [
        new Vdiv()
          ..className = "jumbotron"
          ..children = [
            new Vdiv()
              ..className = "row"
              ..children = [
                new Vdiv()
                  ..className = "col-md-6"
                  ..children = [
                    new Vh1()..text = 'wui_builder keyed',
                  ],
                new Vdiv()
                  ..className = "col-md-6"
                  ..children = [
                    new Vdiv()
                      ..className = "row"
                      ..children = [
                        new Vdiv()
                          ..className = "col-sm-6 smallpad"
                          ..children = [
                            new Vbutton()
                              ..className = "btn btn-primary btn-block"
                              ..id = "run"
                              ..onClick = _run
                              ..text = 'Create 1,000 rows',
                          ],
                        new Vdiv()
                          ..className = "col-sm-6 smallpad"
                          ..children = [
                            new Vbutton()
                              ..className = "btn btn-primary btn-block"
                              ..id = "runlots"
                              ..onClick = _runLots
                              ..text = 'Create 10,000 rows',
                          ],
                        new Vdiv()
                          ..className = "col-sm-6 smallpad"
                          ..children = [
                            new Vbutton()
                              ..className = "btn btn-primary btn-block"
                              ..id = "add"
                              ..onClick = _add
                              ..text = 'Append 1,000 rows',
                          ],
                        new Vdiv()
                          ..className = "col-sm-6 smallpad"
                          ..children = [
                            new Vbutton()
                              ..className = "btn btn-primary btn-block"
                              ..id = "update"
                              ..onClick = _update
                              ..text = 'Update every 10th row',
                          ],
                        new Vdiv()
                          ..className = "col-sm-6 smallpad"
                          ..children = [
                            new Vbutton()
                              ..className = "btn btn-primary btn-block"
                              ..id = "clear"
                              ..onClick = _clear
                              ..text = 'Clear',
                          ],
                        new Vdiv()
                          ..className = "col-sm-6 smallpad"
                          ..children = [
                            new Vbutton()
                              ..className = "btn btn-primary btn-block"
                              ..id = "swaprows"
                              ..onClick = _swapRows
                              ..text = 'Swap Rows',
                          ],
                      ],
                  ],
              ],
          ],
        new Vtable()
          ..className = 'table table-hover table-striped test-data'
          ..children = [new Vtbody()..children = rows()],
        new Vspan()
          ..className = 'preloadicon glyphicon glyphicon-remove'
          ..attributes = {'aria-hidden': 'true'},
      ];
  }
}

typedef void OnEvent(int id);

class RowProps {
  Data data;
  bool isSelected;
  OnEvent onSelect;
  OnEvent onDelete;
}

class Row extends PComponent<RowProps> {
  Row(RowProps props) : super(props);

  @override
  bool shouldComponentUpdate(nextProps, nextState) =>
      nextProps.data.id != props.data.id ||
      nextProps.data.label != props.data.label ||
      nextProps.isSelected != props.isSelected;

  _onDelete(Event e) {
    props.onDelete(props.data.id);
  }

  _onClick(Event e) {
    props.onSelect(props.data.id);
  }

  @override
  VNode render() {
    return new Vtr()
      ..className = props.isSelected ? 'danger' : ''
      ..children = [
        new Vtd()
          ..className = "col-md-1"
          ..text = '${props.data.id}',
        new Vtd()
          ..className = "col-md-4"
          ..children = [
            new Va()
              ..onClick = _onClick
              ..text = props.data.label,
          ],
        new Vtd()
          ..className = "col-md-1"
          ..children = [
            new Va()
              ..onClick = _onDelete
              ..children = [
                new Vspan()
                  ..attributes = {'aria-hidden': 'true'}
                  ..className = "glyphicon glyphicon-remove"
              ],
          ],
        new Vtd()..className = "col-md-6"
      ];
  }
}

void main() {
  render(new Main(), document.getElementById('main'));
}
