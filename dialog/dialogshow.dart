// Opens the File Open dialog box and shows results

// Error handling removed for simplicity.

import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';

void main() {
  CoInitializeEx(nullptr, COINIT_APARTMENTTHREADED);
  IFileDialog fileDialog = FileOpenDialog.createInstance();

  using((Arena arena) {
    final hr = fileDialog.Show(NULL);
    if (hr == HRESULT_FROM_WIN32(ERROR_CANCELLED)) {
      print('Dialog cancelled.');
    } else {
      IShellItem shellItem = IShellItem(arena<COMObject>());
      fileDialog.GetResult(shellItem.ptr.cast());

      final pPath = arena<Pointer<Utf16>>();
      shellItem.GetDisplayName(SIGDN.SIGDN_FILESYSPATH, pPath);
      final path = pPath.value.toDartString();

      print('Result: $path');

      shellItem.Release();
    }
  });

  fileDialog.Release();
  CoUninitialize();
}
