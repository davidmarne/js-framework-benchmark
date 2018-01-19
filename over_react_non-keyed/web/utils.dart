import 'dart:math';

final random = new Random();

DataAndID buildData(int id, {int count: 1000}) {
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
  return new DataAndID(id, data);
}

List<Data> updateData(List<Data> data, {int mod: 10}) {
  for (var i = 0; i < data.length; i += 10)
    data[i] = new Data(data[i].id, data[i].label + ' !!!');
  return data;
}

List<Data> delete(List<Data> data, int id) {
  return data..removeWhere((d) => d.id == id);
}

DataAndID run(int id) {
  return buildData(id);
}

DataAndID add(int id, List<Data> data) {
  final newData = buildData(id);
  return new DataAndID(newData.id, data..addAll(newData.data));
}

List<Data> update(List<Data> data) {
  return updateData(data);
}

DataAndID runLots(int id) {
  return buildData(id, count: 10000);
}

List<Data> swapRows(List<Data> data) {
  if (data.length > 998) {
    final a = data[1];
    data[1] = data[998];
    data[998] = a;
  }
  return data;
}

class DataAndID {
  final int id;
  final List<Data> data;
  DataAndID(this.id, this.data);
}

class Data {
  final int id;
  final String label;
  Data(this.id, this.label);
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
