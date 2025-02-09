const std = @import("std");

pub fn build(b: *std.Build) void {
    const exe = b.addExecutable(.{ .name = "zigJSON", .root_source_file = b.path("src/main.zig"), .target = b.host });

    b.installArtifact(exe);

    const runExe = b.addRunArtifact(exe);
    const runStep = b.step("run", "Run The Application");
    runStep.dependOn(&runExe.step);
    return;
}
