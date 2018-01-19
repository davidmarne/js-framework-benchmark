// import '../../wui_builder.dart';
// import 'pure.dart';

// typedef void Rebuild<
//     Props,
//     State extends Built<State, StateBuilder>,
//     StateBuilder extends Builder<State,
//         StateBuilder>>(Props props, State state, StateBuilder builder);

// abstract class BuiltComponent<Props, State extends Built<State, StateBuilder>,
//         StateBuilder extends Builder<State, StateBuilder>>
//     extends Component<Props, State> {
//   BuiltComponent(Props p) : super(p);

//   bool get isPure => true;

//   @override
//   bool shouldComponentUpdate(p, s) =>
//       isPure ? p != props || s != state : super.shouldComponentUpdate(p, s);

//   void rebuild(Rebuild<Props, State, StateBuilder> builder) {
//     setState((p, s) => builder(p, s, s.toBuilder()));
//   }

//   void rebuildOnIdle(Rebuild<Props, State, StateBuilder> builder) {
//     setStateOnIdle((p, s) => builder(p, s, s.toBuilder()));
//   }

//   void rebuildOnAnimationFrame(Rebuild<Props, State, StateBuilder> builder) {
//     setStateOnAnimationFrame((p, s) => builder(p, s, s.toBuilder()));
//   }

//   // void setY(int y) => setState((p, s) => s.rebuild((b) => b..x = y));

//   // void setY(int y) => rebuild((p, s, b) => b.x = y);
// }

// typedef void SRebuild<
//     State extends Built<State, StateBuilder>,
//     StateBuilder extends Builder<State,
//         StateBuilder>>(State state, StateBuilder builder);

// abstract class BuiltSComponent<State extends Built<State, StateBuilder>,
//         StateBuilder extends Builder<State, StateBuilder>>
//     extends PureSComponent<State> {
//   void rebuild(SRebuild<State, StateBuilder> builder) {
//     setState((p, s) => builder(p, s, s.toBuilder()));
//   }

//   void rebuildOnIdle(SRebuild<State, StateBuilder> builder) {
//     setStateOnIdle((p, s) => builder(p, s, s.toBuilder()));
//   }

//   void rebuildOnAnimationFrame(SRebuild<State, StateBuilder> builder) {
//     setStateOnAnimationFrame((p, s) => builder(p, s, s.toBuilder()));
//   }

//   // void setY(int y) => setState((p, s) => s.rebuild((b) => b..x = y));

//   // void setY(int y) => rebuild((p, s, b) => b.x = y);
// }
