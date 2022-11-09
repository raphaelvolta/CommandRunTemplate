import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:process_run/shell.dart';

import '../FileConsumer.dart';
import '../dracula_theme.dart';
import 'component_loader.dart';
import 'default_component.dart';

class FileView extends StatefulWidget {
  const FileView({Key? key}) : super(key: key);

  @override
  _FileViewState createState() => _FileViewState();
}

class _FileViewState extends State<FileView> {
  FileConsumer fileConsumer = FileConsumer();
  ComponentLoader loader = ComponentLoader(components: List.empty());
  Shell commandExecutor = Shell();

  List<String> outputLog = List.empty(growable: true);

  void setFileConsumer() async {
    loader = await fileConsumer.openFile();
  }
  void process() {
    setState((){
      setFileConsumer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: ElevatedButton(
              onPressed: () => process(),
              child: const Text("Open file", textScaleFactor: 1.2)

          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: loader.components.length,
                itemBuilder: (context, index) {
                  return createCard(loader.components[index], commandExecutor);
                }
            ),
          ),
          SingleChildScrollView(
            child: Container(
              color: Colors.blue,
              child: Text(
                  outputLog.toString()
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getRandomColor(List colors){
    return colors[Random().nextInt(colors.length)];
  }

  Widget createCard(DefaultComponent defaultComponent, Shell shell) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Container(
        decoration: const BoxDecoration(
          color: DraculaTheme.selection,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: ListTile(
          leading: Icon(Icons.call_to_action_outlined, color: getRandomColor(DraculaTheme.secondaries)),
          title: Text(
            defaultComponent.name,
            textScaleFactor: 1.2,
          ),
          subtitle: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                  child: ElevatedButton(
                      onPressed: () => {
                        for(String command in defaultComponent.doCommand){
                          interceptShellExecution(shell, command)
                        }
                      },
                      child: Icon(Icons.play_arrow_outlined, color: getRandomColor(DraculaTheme.secondaries))
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                    onPressed: () => {
                      for(String command in defaultComponent.undoCommand){
                        shell.run(command)
                      }
                    },
                    child: Icon(Icons.settings_backup_restore, color: getRandomColor(DraculaTheme.secondaries))
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void interceptShellExecution(Shell shell, String command){
    Future<List<ProcessResult>> shellResult = shell.run(command);
    shellResult.then((value){
      print("Shell result");
      print(value.outLines);
      print(value.errText);
      print(value.outText);
      outputLog.addAll(value.outLines);
    });
  }
}

