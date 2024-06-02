const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "opengl-headers",
        .root_source_file = b.addWriteFiles().add("empty.c", ""),
        .target = target,
        .optimize = optimize,
    });

    lib.installHeadersDirectory(b.path("GL"), "GL", .{});
    lib.installHeadersDirectory(b.path("GLES"), "GLES", .{});
    lib.installHeadersDirectory(b.path("GLES2"), "GLES2", .{});
    lib.installHeadersDirectory(b.path("GLES3"), "GLES3", .{});
    lib.installHeadersDirectory(b.path("GLSC2"), "GLSC2", .{});
    lib.installHeadersDirectory(b.path("EGL"), "EGL", .{});
    lib.installHeadersDirectory(b.path("KHR"), "KHR", .{});

    b.installArtifact(lib);
}
