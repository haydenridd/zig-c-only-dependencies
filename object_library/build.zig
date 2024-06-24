const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const objlib = b.addObject(.{
        .name = "objlib",
        .target = target,
        .optimize = optimize,
    });
    objlib.installHeadersDirectory(b.path("src"), "", .{});
    objlib.addCSourceFiles(.{
        .files = &.{"src/objlib.c"},
        .flags = &.{"-DENABLED_FLAG"},
    });
    objlib.addIncludePath(b.path("src"));
    b.getInstallStep().dependOn(&b.addInstallArtifact(objlib, .{ .dest_dir = .{ .override = .{ .custom = "" } } }).step);
}
