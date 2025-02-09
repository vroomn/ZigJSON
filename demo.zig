const std = @import("std");
const expect = std.testing.expect;

extern fn experiment() u8;

test "e" {
    const result = experiment();
    try expect(result == 1);
}
