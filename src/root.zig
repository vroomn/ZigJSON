const std = @import("std");

export fn experiment() u8 {
    std.debug.print("Experiment Test\n", .{});
    return 1;
}
