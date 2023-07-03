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
    lib.installHeadersDirectory("GLES", "GLES");
    lib.installHeadersDirectory("GLES2", "GLES2");
    lib.installHeadersDirectory("GLES3", "GLES3");
    lib.installHeadersDirectory("GLSC", "GLSC");
    lib.installHeadersDirectory("GLSC2", "GLSC2");

    b.installArtifact(lib);
}
