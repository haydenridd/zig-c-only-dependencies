const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const subproj_obj = b.addObject(.{
        .name = "subproj",
        .target = target,
        .optimize = optimize,
    });
    subproj_obj.addCSourceFiles(.{
        .files = &.{"src/subproj.c"},
        .flags = &.{"-DENABLED_FLAG"},
    });
    subproj_obj.addIncludePath(b.path("src"));
    b.getInstallStep().dependOn(&b.addInstallArtifact(subproj_obj, .{ .dest_dir = .{ .override = .{ .custom = "" } } }).step);
}
