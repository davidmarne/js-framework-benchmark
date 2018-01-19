import 'package:over_react/over_react.dart';

import 'utils.dart';

typedef void OnEvent(int id);

@Factory()
UiFactory<RowProps> Row;

@Props()
class RowProps extends UiProps {
  Data data;
  bool isSelected;
  OnEvent onSelect;
  OnEvent onDelete;
}

@Component()
class RowComponent extends UiComponent<RowProps> {
  @override
  bool shouldComponentUpdate(nextPropsMap, nextState) {
    final nextProps = typedPropsFactory(nextPropsMap);
    return nextProps.data.id != props.data.id ||
        nextProps.data.label != props.data.label ||
        nextProps.isSelected != props.isSelected;
  }

  void _onDelete(SyntheticMouseEvent e) {
    props.onDelete(props.data.id);
  }

  void _onClick(SyntheticMouseEvent e) {
    props.onSelect(props.data.id);
  }

  @override
  ReactElement render() {
    return (Dom.tr()..className = props.isSelected ? 'danger' : '')(
      (Dom.td()..className = "col-md-1")('${props.data.id}'),
      (Dom.td()..className = "col-md-4")(
        (Dom.a()..onClick = _onClick)(props.data.label),
      ),
      (Dom.td()..className = "col-md-1")(
        (Dom.a()..onClick = _onDelete)(
          (Dom.span()
            ..className = "glyphicon glyphicon-remove"
            ..aria.hidden = true)(),
        ),
      ),
      (Dom.td()..className = "col-md-6")(),
    );
  }
}
