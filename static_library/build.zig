const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const static_lib = b.addStaticLibrary(.{ .name = "staticlib", .target = target, .optimize = optimize });
    static_lib.addCSourceFiles(.{
        .files = &.{"src/staticlib.c"},
    });
    static_lib.installHeadersDirectory(b.path("src"), "staticlib", .{});
    b.installArtifact(static_lib);
}
