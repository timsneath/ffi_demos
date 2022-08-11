import 'package:winmd/winmd.dart';

void main() {
  final winmd = MetadataStore.getWin32Scope();
  const namespace = 'Windows.Win32.UI.WindowsAndMessaging.Apis';

  // Retrieve just the core windowing APIs and print the count
  final apis = winmd.findTypeDef(namespace)!;
  print('apis contains ${apis.methods.length} functions.');

  for (var function in apis.methods) {
    print(function);
  }
}
