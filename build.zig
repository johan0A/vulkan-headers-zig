const std = @import("std");

pub fn build(b: *std.Build) void {
    const vulkan_headers_dep = b.dependency("vulkan_headers", .{});
    const include = vulkan_headers_dep.path("include");

    const headers = b.addWriteFiles();
    inline for (.{ "vk_video", "vulkan" }) |subdir| {
        _ = headers.addCopyDirectory(include.path(b, "include/" ++ subdir), subdir, .{});
    }

    b.addNamedLazyPath("vulkan-headers", headers.getDirectory());
}
