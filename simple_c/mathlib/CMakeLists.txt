# CMakeList.txt : CMake project for mathlib, include source and define
# project specific logic here.
#
cmake_minimum_required (VERSION 3.8)

project ("mathlib")

# Add source to this project's executable.
add_library (mathlib SHARED "mathlib.c" "mathlib.def")
