import 'dart:ffi';
import 'dart:io';

typedef GetStdHandleC = IntPtr Function(Int32);
typedef GetStdHandleDart = int Function(int);

typedef SetConsoleModeC = Int32 Function(IntPtr, Int32);
typedef SetConsoleModeDart = int Function(int, int);

final kernel32 = DynamicLibrary.open('kernel32.dll');
final getStdHandle =
    kernel32.lookupFunction<GetStdHandleC, GetStdHandleDart>('GetStdHandle');
final setConsoleMode = kernel32
    .lookupFunction<SetConsoleModeC, SetConsoleModeDart>('SetConsoleMode');

extension SetRawMode on Stdin {
  set rawMode(bool isRaw) {
    final stdin = getStdHandle(-10 /* STD_INPUT_HANDLE */);
    if (isRaw) {
      setConsoleMode(stdin, 0x70 /* 'raw' mode */);
    } else {
      setConsoleMode(stdin, 0x77 /* 'normal' mode */);
    }
  }
}
