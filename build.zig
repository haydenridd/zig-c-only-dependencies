const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{ .name = "main", .target = target, .optimize = optimize, .link_libc = true });
    exe.addCSourceFiles(.{ .files = &.{
        "src/main.c",
    } });

    const object_lib = b.dependency("objlib", .{ .target = target, .optimize = optimize }).artifact("objlib");
    exe.addObject(object_lib);

    const static_lib = b.dependency("staticlib", .{ .target = target, .optimize = optimize }).artifact("staticlib");
    exe.linkLibrary(static_lib);

    b.installArtifact(exe);
    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);
}
