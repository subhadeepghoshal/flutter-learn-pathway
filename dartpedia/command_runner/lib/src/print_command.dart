import 'dart:async';
import 'arguments.dart';

// Prints program and argument usage.
//
// When given a command as an argument, it prints the usage of
// that command only, including its options and other details.
// When the flag 'verbose' is set, it prints options and details for all commands.
//
// This command isn't automatically added to CommandRunner instances.
// Packages users should add it themselves with [CommandRunner.addCommand],
// or create their own command that prints usage.

class PrintCommand extends Command {
  PrintCommand() {
    addFlag(
      'verbose',
      abbr: 'v',
      help: 'When true, this command will print hello world withgood day greeting',
    );
  }
  @override
  String get name => 'print';

  @override
  String get description => 'Prints Greetings to the command line.';

  @override
  String? get help => 'Prints this usage information';

  @override
  FutureOr<Object?> run(ArgResults args) async {
    var usage = 'Hello World!';
    if (args.flag('verbose')) {
      usage = 'Hello World! Have a good day';
    }
    return usage;
  }
}
