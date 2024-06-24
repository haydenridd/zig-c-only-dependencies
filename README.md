# C Only "Sub Projects" Using Zig's Build System

Might grow into a larger repo for examples eventually but currently just demonstrates:
- A method of including a local "sub-project" using Zig's package manager that contains only C sources/headers
- `addObject()` is used instead of a static library to try to emulate CMake's "Object Libraries"
- Sadly, it fails to compile if the headers from this "sub-project" are needed