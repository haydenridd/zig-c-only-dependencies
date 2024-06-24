# "Object Library"

Demonstrates creating a dependency in the style of CMake's [object library](https://cmake.org/cmake/help/latest/command/add_library.html#object-libraries). This is useful if you would like to depend on a collection of C sources/headers, but would *not* like to compile these into a static/shared library. This is a relatively niche use-case, but is useful for specific cases where compiling sources into library may produced undesired behavior. For instance, an embedded vendor's HAL code that defines both weak *and* strong symbols in source code, creating un-intuitive behavior for symbol resolution:
https://community.st.com/t5/stm32cubemx-mcus/solved-build-hal-as-static-library-systick-handler-removed-from/td-p/594624

This example, once added as a dependency in a top level package's `build.zig.zon`, would be added as follows to `build.zig`:
```zig
const object_lib = b.dependency("objlib", .{ .target = target, .optimize = optimize }).artifact("objlib");
exe.addObject(object_lib);
```

This produces the behavior of adding sources/headers to the compilation of `exe`, rather than first compiling sources contained within `object_library` to a static library + linking into `exe`.