const std = @import("std");

pub fn buildDay(b: *std.Build, target: *const std.zig.CrossTarget, optimize_options: *const std.builtin.Mode, comptime name: []const u8) void {
    const path = "src/" ++ name ++ "/main.zig";

    const common_module = b.createModule(.{
        .source_file = .{ .path = "src/common/common.zig" },
        .dependencies = &.{},
    });

    const exe = b.addExecutable(.{
        .name = name,
        .root_source_file = .{ .path = path },
        .target = target.*,
        .optimize = optimize_options.*,
    });
    exe.addModule("common", common_module);

    b.installArtifact(exe);

    const run_cmd = b.addRunArtifact(exe);
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }
    run_cmd.cwd = "src/" ++ name;

    const run_step = b.step("run_" ++ name, "Run " ++ name);
    run_step.dependOn(&run_cmd.step);

    const unit_tests = b.addTest(.{
        .root_source_file = .{ .path = path },
        .target = target.*,
        .optimize = optimize_options.*,
    });
    unit_tests.addModule("common", common_module);

    const run_unit_tests = b.addRunArtifact(unit_tests);
    run_unit_tests.cwd = "src/" ++ name;

    const test_step = b.step("test_" ++ name, "Run " ++ name ++ " unit tests");
    test_step.dependOn(&run_unit_tests.step);
}

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    buildDay(b, &target, &optimize, "day_test");
    buildDay(b, &target, &optimize, "day_1");
    buildDay(b, &target, &optimize, "day_2");
    buildDay(b, &target, &optimize, "day_3");
    buildDay(b, &target, &optimize, "day_4");
    buildDay(b, &target, &optimize, "day_5");
    buildDay(b, &target, &optimize, "day_6");
    buildDay(b, &target, &optimize, "day_7");
    buildDay(b, &target, &optimize, "day_8");
    buildDay(b, &target, &optimize, "day_9");
    buildDay(b, &target, &optimize, "day_10");
    buildDay(b, &target, &optimize, "day_11");
    buildDay(b, &target, &optimize, "day_12");
    buildDay(b, &target, &optimize, "day_13");
    buildDay(b, &target, &optimize, "day_14");
    buildDay(b, &target, &optimize, "day_15");
    buildDay(b, &target, &optimize, "day_16");
    buildDay(b, &target, &optimize, "day_17");
    buildDay(b, &target, &optimize, "day_18");
    buildDay(b, &target, &optimize, "day_19");
    buildDay(b, &target, &optimize, "day_20");
    buildDay(b, &target, &optimize, "day_21");
    buildDay(b, &target, &optimize, "day_22");
    buildDay(b, &target, &optimize, "day_23");
    buildDay(b, &target, &optimize, "day_24");
    buildDay(b, &target, &optimize, "day_25");
}
