const std = @import("std");

pub fn build(b: *std.Build) void {
    const vulkan_headers_dep = b.dependency("vulkan_headers", .{});
    const include = vulkan_headers_dep.path("include");

    const headers = b.addWriteFiles();
    for ([_][]const u8{ "vk_video", "vulkan" }) |subdir| {
        _ = headers.addCopyDirectory(include.path(b, subdir), subdir, .{});
    }

    b.addNamedLazyPath("vulkan-headers", headers.getDirectory());
}
