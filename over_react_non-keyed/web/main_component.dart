import 'dart:html';
import 'dart:async';

import 'package:over_react/over_react.dart';

import 'row.dart';
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

@Factory()
UiFactory<MainProps> Main;

@Props()
class MainProps extends UiProps {}

@State()
class MainState extends UiState {
  List<Data> data;
  int selected;
  int id;
}

@Component()
class MainComponent extends UiStatefulComponent<MainProps, MainState> {
  void printDuration() {
    stopMeasure();
  }

  @override
  MainState getInitialState() => newState()
    ..data = []
    ..selected = null
    ..id = 1;

  @override
  void componentDidUpdate(prevProps, prevState) {
    printDuration();
  }

  @override
  void componentDidMount() {
    printDuration();
  }

  void _run(SyntheticMouseEvent e) {
    startMeasure("run");
    final dataAndId = run(state.id);
    setState(newState()
      ..data = dataAndId.data
      ..id = dataAndId.id
      ..selected = null);
  }

  void _add(SyntheticMouseEvent e) {
    startMeasure("add");
    final dataAndId = add(state.id, state.data);
    setState(newState()
      ..id = dataAndId.id
      ..data = dataAndId.data);
  }

  void _update(SyntheticMouseEvent e) {
    startMeasure("update");
    setState(newState()..data = update(state.data));
  }

  void _select(int id) {
    startMeasure("select");
    setState(newState()..selected = id);
  }

  void _delete(id) {
    startMeasure("delete");
    setState(newState()..data = delete(state.data, id));
  }

  void _runLots(SyntheticMouseEvent e) {
    startMeasure("runLots");
    final dataAndId = runLots(state.id);
    setState(newState()
      ..id = dataAndId.id
      ..data = dataAndId.data
      ..selected = null);
  }

  void _clear(SyntheticMouseEvent e) {
    startMeasure("clear");
    setState(newState()
      ..data = <Data>[]
      ..selected = null);
  }

  void _swapRows(SyntheticMouseEvent e) {
    startMeasure("swapRows");
    final data = swapRows(state.data);
    setState(newState()..data = data);
  }

  Iterable<ReactElement> rows() => state.data.map(
        (d) => (Row()
          ..data = d
          ..onSelect = _select
          ..onDelete = _delete
          ..isSelected = d.id == state.selected)(),
      );

  @override
  ReactElement render() {
    return (Dom.div()..className = "container")(
      (Dom.div()..className = "jumbotron")(
        (Dom.div()..className = "row")(
          (Dom.div()..className = "col-md-6")(
            Dom.h1()('over_react non-keyed'),
          ),
          (Dom.div()..className = "col-md-6")(
            (Dom.div()..className = "row")(
              (Dom.div()..className = "col-sm-6 smallpad")(
                (Dom.button()
                  ..className = "btn btn-primary btn-block"
                  ..id = "run"
                  ..onClick = _run)('Create 1,000 rows'),
              ),
              (Dom.div()..className = "col-sm-6 smallpad")(
                (Dom.button()
                  ..className = "btn btn-primary btn-block"
                  ..id = "runlots"
                  ..onClick = _runLots)('Create 10,000 rows'),
              ),
              (Dom.div()..className = "col-sm-6 smallpad")(
                (Dom.button()
                  ..className = "btn btn-primary btn-block"
                  ..id = "add"
                  ..onClick = _add)('Append 1,000 rows'),
              ),
              (Dom.div()..className = "col-sm-6 smallpad")(
                (Dom.button()
                  ..className = "btn btn-primary btn-block"
                  ..id = "update"
                  ..onClick = _update)('Update every 10th row'),
              ),
              (Dom.div()..className = "col-sm-6 smallpad")(
                (Dom.button()
                  ..className = "btn btn-primary btn-block"
                  ..id = "clear"
                  ..onClick = _clear)('Clear'),
              ),
              (Dom.div()..className = "col-sm-6 smallpad")(
                (Dom.button()
                  ..className = "btn btn-primary btn-block"
                  ..id = "swaprows"
                  ..onClick = _swapRows)('Swap Rows'),
              ),
            ),
          ),
        ),
      ),
      (Dom.table()
        ..className =
            'table table-hover table-striped test-data')(Dom.tbody()(rows())),
      (Dom.span()
        ..className = 'preloadicon glyphicon glyphicon-remove'
        ..aria.hidden = true)(),
    );
  }
}
