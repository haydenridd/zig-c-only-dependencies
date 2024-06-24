# "Object Library"
Demonstrates creating a dependency on a static library consisting of C code/headers.

This example, once added as a dependency in a top level package's `build.zig.zon`, would be added as follows to `build.zig`:
```zig
const static_lib = b.dependency("staticlib", .{ .target = target, .optimize = optimize }).artifact("staticlib");
exe.linkLibrary(static_lib);
```

Note that due to an installation path of "staticlib" being specified in the call to `installHeadersDirectory()`, headers referenced in the consuming package are referenced via:
```c
#include "staticlib/[library header].h"
```