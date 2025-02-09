const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const libZigJSON = b.addStaticLibrary(.{
        .name = "ZigJSON",
        .root_source_file = b.path("src/root.zig"),
        .target = target,
        .optimize = optimize,
    });

    //const testExe = b.addExecutable(.{ .name = "zigJSONTest", .root_source_file = b.path("demo.zig"), .target = target, .optimize = optimize });
    //testExe.linkLibrary(libZigJSON);
    //b.installArtifact(testExe);

    //const runTestExe = b.addRunArtifact(testExe);
    const testExe = b.addTest(.{ .name = "e", .root_source_file = b.path("demo.zig"), .target = target });
    testExe.linkLibrary(libZigJSON);
    b.installArtifact(testExe);
    const testArtifact = b.addRunArtifact(testExe);

    const runStep = b.step("tests", "Run unit tests");
    runStep.dependOn(&testArtifact.step);
    return;
}
