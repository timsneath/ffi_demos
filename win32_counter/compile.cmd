call flutter assemble -dTargetPlatform=windows-x64 --output=build -dBuildMode=release release_bundle_windows_assets
call dart compile exe bin\counter.dart -o counter.exe