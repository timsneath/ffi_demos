import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

void main() {
  final message =
      'This is not really an error, but we are pretending for the sake '
              'of this test.\n\nResource error.\nDo you want to try again?'
          .toNativeUtf16();
  final title = 'Dart MessageBox Test'.toNativeUtf16();

  final result = MessageBox(
      NULL,
      message,
      title,
      MB_ICONWARNING | // Warning
          MB_CANCELTRYCONTINUE | // Action button
          MB_DEFBUTTON2 // Second button is the default
      );

  free(message);
  free(title);

  switch (result) {
    case IDCANCEL:
      print('Cancel pressed');
      break;
    case IDTRYAGAIN:
      print('Try Again pressed');
      break;
    case IDCONTINUE:
      print('Continue pressed');
      break;
  }
}
