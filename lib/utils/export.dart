
import 'package:complete/utils/utils.dart';

class Export{
 exportWatcher(){
  
  const directoryPath = 'C:/project/complete/lib'; // Replace with your directory path
  final directory = Directory(directoryPath);
  if (!directory.existsSync()) {
    logDebug('Directory does not exist at $directoryPath');
    return;
  }

  final fileWatcher = FileWatcher(directoryPath);
  final directoryWatcher = DirectoryWatcher(directoryPath);

  fileWatcher.events.listen((event) {
    logDebug(event.path);
    logDebug(event.type.toString());
  });

  directoryWatcher.events.listen((event) {
    logDebug(event.path);
    logDebug(event.type.toString());
  });

  logDebug('Watching for file and directory changes in $directoryPath...');
 }
}