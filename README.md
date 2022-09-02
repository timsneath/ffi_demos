Some examples of using FFI, as presented at the Flutter Vikings conference in
August 2022.

## `simple_c`

A very basic example of using FFI. The `mathlib` subfolder contains
`mathlib.cpp`, which offers a function that adds two integers. `calc.dart` calls
the resultant DLL with Dart FFI.

## `rawmode`

An example of how to set 'raw mode', used for full-screen console applications.
Raw mode disables console echo, switches from line input to character input, and
disables processing of control codes like Ctrl+C, among other things. The
`rawmode_c` subfolder shows the C code to enable / disable raw mode in
macOS/Linux and Windows using system APIs.

The `stdin_raw.dart` file shows an example extension method that uses Dart FFI
to turn rawmode on or off. The sample is deliberately simple for tutorial
purposes (e.g. it does not provide a getter, nor does it test the existing flags
before setting them).

`rawtest.dart` shows an example of using this. Try running the Dart sample and
then press Ctrl+C after each prompt.

`getrawmode.dart` demonstrates allocating memory on the native heap, as is
necessary for working with pointers.

## `kilo`

Shows a full-screen text editor built in Dart, based on `kilo.c`. This uses
[`dart_console`](https://pub.dev/packages/dart_console), a multiplatform Dart
package for manipulating the console that is built on the techniques
demonstrated above.

## `msgbox`

Demonstrates a simple example of calling a Win32 API from Dart. This uses
[`win32`](https://pub.dev/packages/win32), a package that wraps many Windows
APIs for ease of calling from Dart code.

## `dialog`

An example of calling a COM-based Win32 API. This example instantiates the COM
runtime, and then opens the File / Open common dialog box. The results are
returned as a separate COM interface (`IShellItem`), which is interrogated for
the filename.

## `winmd`

An example of using the [`winmd`](https://pub.dev/packages/winmd) package to
catalog Win32 APIs. This uses the Microsoft
[win32metadata](https://github.com/microsoft/win32metadata) repository, which
provides a database of traditional (Win32/COM) API metadata.

## `win32_counter`

Demonstrates a Flutter app that uses a Dart embedder, rather than the supplied
C++ embedder. Run `compile.cmd` to build it on a machine with the Flutter SDK
installed (no Visual Studio is required, since no C++ compilation takes place).
