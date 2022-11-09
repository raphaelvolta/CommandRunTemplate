//
// import 'package:flutter/material.dart';
// import 'package:process_run/shell.dart';
//
// import 'FileConsumer.dart';
// import 'domain/component_loader.dart';
// import 'domain/default_component.dart';
//
// void main(){runApp(const Files());}
//
// class App extends StatelessWidget {
//   const App({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
//
//
// class Files extends StatefulWidget {
//   const App({Key? key}) : super(key: key);
//   @override _FilesState createState() => _FilesState();
// }
//
// class _FilesState extends State<Files> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//           body: Text("")
//       ),
//     );
//   }
// }
//
//
//
// //
// // class _AppState extends State<App> {
// //   FileConsumer fileConsumer = FileConsumer();
// //   ComponentLoader loader = ComponentLoader(components: List.empty());
// //   Shell commandExecutor = Shell();
// //
// //   bool toggleOn = false;
// //
// //   void setFileConsumer() async {
// //     loader = await fileConsumer.processFile();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     void process() {
// //       setState(() {
// //         setFileConsumer();
// //       });
// //     }
// //
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: Scaffold(
// //         body: Column(
// //           children: [
// //             ElevatedButton(
// //                 onPressed: () => process(),
// //                 child: const Text("Open file")
// //             ),
// //             Expanded(
// //               child: ListView.builder(
// //                   itemCount: loader.components.length,
// //                   itemBuilder: (context, index) {
// //                     return createCard(loader.components[index]);
// //                   }
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget createCard(DefaultComponent defaultComponent) {
// //     bool toggleOn = false;
// //
// //     void executeCommands(List<String> commands) {
// //       for(String command in commands){
// //         commandExecutor.run(command).then((value) {
// //           print("value.errText.isNotEmpty" + value.errText.isNotEmpty.toString());
// //           if(value.errText.isNotEmpty) {
// //             toggleOn = false;
// //             print(toggleOn);
// //           } else {
// //             toggleOn = true;
// //             print(toggleOn);
// //           }
// //         });
// //       }
// //     }
// //
// //
// //     return  ListTile(
// //       leading: const Icon(Icons.gradient),
// //       tileColor: Colors.cyan,
// //       title: Text(defaultComponent.name),
// //       subtitle: Row(
// //         children: [
// //           ElevatedButton(
// //               onPressed: () => {
// //                 for(String command in defaultComponent.doCommand){
// //                   commandExecutor.run(command)
// //                 }
// //               },
// //               child: Text("Do")
// //           ),
// //           ElevatedButton(
// //               onPressed: () => {
// //                 for(String command in defaultComponent.undoCommand){
// //                   commandExecutor.run(command)
// //                 }
// //               },
// //               child: Text("Undo")
// //           ),
// //           Icon(Icons.circle, color: Colors.red,)
// //         ],
// //       ),
// //     );
// //   }
// // }
// //
// // // Switch(
// // //             value: toggleOn,
// // //             activeColor: Colors.blueGrey,
// // //             onChanged: (bool turningOn) {
// // //               setState(() {
// // //                 if(turningOn){
// // //                   executeCommands(defaultComponent.doCommand);
// // //                   print("Toggle should be: " + toggleOn.toString());
// // //                 } else {
// // //                   for(String command in defaultComponent.undoCommand){
// // //                     commandExecutor.run(command);
// // //                   }
// // //                 }
// // //               });
// // //             },
// // //           ),
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:process_run/shell.dart';
//
// import 'FileConsumer.dart';
// import 'domain/component_loader.dart';
// import 'domain/default_component.dart';
//
// void main(){runApp(const App());}
//
// class App extends StatefulWidget {
//   const App({Key? key}) : super(key: key);
//   @override _AppState createState() => _AppState();
// }
//
// class _AppState extends State<App> {
//   FileConsumer fileConsumer = FileConsumer();
//   ComponentLoader loader = ComponentLoader(components: List.empty());
//   Shell commandExecutor = Shell();
//
//   bool toggleOn = false;
//
//   void setFileConsumer() async {
//     loader = await fileConsumer.processFile();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     void process() {
//       setState(() {
//         setFileConsumer();
//       });
//     }
//
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         body: Column(
//           children: [
//             ElevatedButton(
//                 onPressed: () => process(),
//                 child: const Text("Open file")
//             ),
//             Expanded(
//               child: ListView.builder(
//                   itemCount: loader.components.length,
//                   itemBuilder: (context, index) {
//                     return createCard(loader.components[index]);
//                   }
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//
// }
//
//
//
// // Switch(
// // value: toggleOn,
// // activeColor: Colors.blueGrey,
// // onChanged: (bool turningOn) {
// // setState(() {
// // if(turningOn){
// // executeCommands(defaultComponent.doCommand);
// // print("Toggle should be: " + toggleOn.toString());
// // } else {
// // for(String command in defaultComponent.undoCommand){
// // commandExecutor.run(command);
// // }
// // }
// // });
// // },
// // ),
//
// // void executeCommands(List<String> commands) {
// //   for(String command in commands){
// //     commandExecutor.run(command).then((value) {
// //       print("value.errText.isNotEmpty" + value.errText.isNotEmpty.toString());
// //       if(value.errText.isNotEmpty) {
// //         toggleOn = false;
// //         print(toggleOn);
// //       } else {
// //         toggleOn = true;
// //         print(toggleOn);
// //       }
// //     });
// //   }
// // }