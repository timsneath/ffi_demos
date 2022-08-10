import 'dart:ffi';

typedef AddNative = Int32 Function(Int32, Int32);
typedef AddDart = int Function(int, int);

void main() {
  final lib = DynamicLibrary.open('mathlib.dll');
  final add = lib.lookupFunction<AddNative, AddDart>('add');
  final result = add(2, 3);
  print('2 + 3 = $result');
}
