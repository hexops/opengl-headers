const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "opengl-headers",
        .root_source_file = .{ .path = "stub.c" },
        .target = target,
        .optimize = optimize,
    });

    lib.linkLibC();

    lib.installHeadersDirectory("GL", "GL");
    lib.installHeadersDirectory("X11", "X11");
    lib.installHeadersDirectory("xcb", "xcb");
    lib.installHeadersDirectory("xkbcommon", "xkbcommon");

    b.installArtifact(lib);
}
