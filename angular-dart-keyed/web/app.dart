import 'dart:html';
import 'dart:async';
import 'dart:math';
import 'package:angular/angular.dart';

final random = new Random();

class Data {
  final int id;
  final String label;
  Data(this.id, this.label);
}

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

@Component(
  selector: 'my-app',
  templateUrl: 'app.html',
  directives: const [
    COMMON_DIRECTIVES,
  ],
)
class AppComponent implements AfterViewChecked {
  List<Data> data = <Data>[];
  int selected;
  int id = 1;

  List<Data> buildData({int count: 1000}) {
    final data = <Data>[];
    for (var i = 0; i < count; i++)
      data.add(
        new Data(
          id++,
          adjectives[random.nextInt(adjectives.length)] +
              " " +
              colours[random.nextInt(colours.length)] +
              " " +
              nouns[random.nextInt(nouns.length)],
        ),
      );
    return data;
  }

  int itemById(int index, Data item) {
    return item.id;
  }

  void select(Data item, Event event) {
    startMeasure("select");
    event.preventDefault();
    selected = item.id;
  }

  void delete(Data item, Event event) {
    event.preventDefault();
    startMeasure("delete");
    data.remove(item);
  }

  void run() {
    startMeasure("run");
    data = buildData();
    selected = null;
  }

  void add() {
    startMeasure("add");
    data.addAll(buildData());
  }

  void update() {
    startMeasure("update");
    for (var i = 0; i < data.length; i += 10)
      data[i] = new Data(data[i].id, data[i].label + ' !!!');
  }

  void runLots() {
    startMeasure("runLots");
    data = buildData(count: 10000);
    selected = null;
  }

  void clear() {
    startMeasure("clear");
    data = [];
    selected = null;
  }

  void swapRows() {
    startMeasure("swapRows");
    if (data.length > 998) {
      final a = data[1];
      data[1] = data[998];
      data[998] = a;
    }
  }

  ngAfterViewChecked() {
    stopMeasure();
  }
}

const adjectives = const <String>[
  "pretty",
  "large",
  "big",
  "small",
  "tall",
  "short",
  "long",
  "handsome",
  "plain",
  "quaint",
  "clean",
  "elegant",
  "easy",
  "angry",
  "crazy",
  "helpful",
  "mushy",
  "odd",
  "unsightly",
  "adorable",
  "important",
  "inexpensive",
  "cheap",
  "expensive",
  "fancy"
];
const colours = const <String>[
  "red",
  "yellow",
  "blue",
  "green",
  "pink",
  "brown",
  "purple",
  "brown",
  "white",
  "black",
  "orange"
];
const nouns = const <String>[
  "table",
  "chair",
  "house",
  "bbq",
  "desk",
  "car",
  "pony",
  "cookie",
  "sandwich",
  "burger",
  "pizza",
  "mouse",
  "keyboard"
];
