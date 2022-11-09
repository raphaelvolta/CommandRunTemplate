class DefaultComponent {
  final String name;
  final String type;
  final List<String> doCommand;
  final List<String> healthCheck;
  final List<String> undoCommand;
  final String expectedOutput;
  final String regEx;
  final String successMessage;
  final bool hasError;
  final bool isOn;

  const DefaultComponent({
    required this.name,
    required this.type,
    required this.doCommand,
    required this.healthCheck,
    required this.undoCommand,
    required this.expectedOutput,
    required this.regEx,
    required this.successMessage,
    required this.hasError,
    required this.isOn
  });

  factory DefaultComponent.fromJson(Map<String, dynamic> json){
    return DefaultComponent(
      name: json['name'] ?? "",
      type: json['type'] ?? "",
      doCommand: json['doCommand'].cast<String>() ?? [""],
      healthCheck: json['healthCheck'].cast<String>() ?? [""],
      undoCommand: json['undoCommand'].cast<String>() ?? [""],
      expectedOutput: json['expectedOutput'] ?? "",
      regEx: json['regEx'] ?? "",
      successMessage: json['successMessage'] ?? "",
      hasError: json['hasError'] ?? false,
      isOn: json['isOn'] ?? false,
    );
  }
}