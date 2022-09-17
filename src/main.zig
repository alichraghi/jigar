const std = @import("std");
const ascii = std.ascii;
const testing = std.testing;

pub fn lowerCase(text: []u8) void {
    for (text) |*c| {
        c.* = ascii.toLower(c.*);
    }
}

pub fn upperCase(text: []u8) void {
    for (text) |*c| {
        c.* = ascii.toUpper(c.*);
    }
}

pub fn macroCase(text: []u8) void {
    for (text) |*c| {
        if (c.* == ' ') {
            c.* = '_';
        } else {
            c.* = ascii.toUpper(c.*);
        }
    }
}

pub fn trainCase(text: []u8) void {
    for (text) |*c| {
        if (c.* == ' ') {
            c.* = '-';
        } else {
            c.* = ascii.toUpper(c.*);
        }
    }
}

pub fn snakeCase(text: []u8) void {
    for (text) |*c| {
        if (c.* == ' ') {
            c.* = '_';
        } else {
            c.* = ascii.toLower(c.*);
        }
    }
}

pub fn snakePascalCase(text: []u8) void {
    var is_word_start = true;
    for (text) |*c| {
        if (c.* == ' ') {
            c.* = '_';
            is_word_start = true;
        } else {
            if (is_word_start) {
                c.* = ascii.toUpper(c.*);
                is_word_start = false;
            } else {
                c.* = ascii.toLower(c.*);
            }
        }
    }
}

pub fn kebabCase(text: []u8) void {
    for (text) |*c| {
        if (c.* == ' ') {
            c.* = '-';
        } else {
            c.* = ascii.toLower(c.*);
        }
    }
}

pub fn kebabPascalCase(text: []u8) void {
    var is_word_start = true;
    for (text) |*c| {
        if (c.* == ' ') {
            c.* = '-';
            is_word_start = true;
        } else {
            if (is_word_start) {
                c.* = ascii.toUpper(c.*);
                is_word_start = false;
            } else {
                c.* = ascii.toLower(c.*);
            }
        }
    }
}

/// returns the final size of `text`
pub fn camelCase(text: []u8) usize {
    var first_letter_found = false;
    var is_word_start = false;

    var i: usize = 0;
    var spaces_found: usize = 0;
    while (i < text.len - spaces_found) {
        var c = &text[i];
        if (!first_letter_found and std.ascii.isAlpha(c.*)) {
            c.* = ascii.toLower(c.*);
            first_letter_found = true;
            is_word_start = false;
            i += 1;
            continue;
        }

        if (c.* == ' ') {
            std.mem.copy(u8, text[i..], text[i + 1 ..]);
            is_word_start = true;
            spaces_found += 1;
            continue;
        } else {
            if (is_word_start) {
                c.* = ascii.toUpper(c.*);
                is_word_start = false;
            } else {
                c.* = ascii.toLower(c.*);
            }
        }
        i += 1;
    }
    return text.len - spaces_found;
}

/// returns the final size of `text`
pub fn pascalCase(text: []u8) usize {
    var is_word_start = true;

    var i: usize = 0;
    var spaces_found: usize = 0;
    while (i < text.len - spaces_found) {
        var c = &text[i];
        if (c.* == ' ') {
            std.mem.copy(u8, text[i..], text[i + 1 ..]);
            is_word_start = true;
            spaces_found += 1;
            continue;
        } else {
            if (is_word_start) {
                c.* = ascii.toUpper(c.*);
                is_word_start = false;
            } else {
                c.* = ascii.toLower(c.*);
            }
        }
        i += 1;
    }
    return text.len - spaces_found;
}

test "lower case" {
    var test_text = "HelLo Bye ".*;
    lowerCase(&test_text);
    try testing.expectEqualStrings("hello bye ", &test_text);
}

test "upper case" {
    var test_text = "HelLo Bye ".*;
    upperCase(&test_text);
    try testing.expectEqualStrings("HELLO BYE ", &test_text);
}

test "macro case" {
    var test_text = "HelLo Bye ".*;
    macroCase(&test_text);
    try testing.expectEqualStrings("HELLO_BYE_", &test_text);
}

test "train case" {
    var test_text = "HelLo Bye ".*;
    trainCase(&test_text);
    try testing.expectEqualStrings("HELLO-BYE-", &test_text);
}

test "snake case" {
    var test_text = "HelLo Bye ".*;
    snakeCase(&test_text);
    try testing.expectEqualStrings("hello_bye_", &test_text);
}

test "snake pascal case" {
    var test_text = " HelLo Bye ".*;
    snakePascalCase(&test_text);
    try testing.expectEqualStrings("_Hello_Bye_", &test_text);
}

test "kebab case" {
    var test_text = "HelLo Bye ".*;
    kebabCase(&test_text);
    try testing.expectEqualStrings("hello-bye-", &test_text);
}

test "kebab pascal case" {
    var test_text = "HelLo Bye ".*;
    kebabPascalCase(&test_text);
    try testing.expectEqualStrings("Hello-Bye-", &test_text);
}

test "camel case" {
    var test_text = "HelLo Bye ".*;
    const acutal_size = camelCase(&test_text);
    try testing.expectEqualStrings("helloBye", test_text[0..acutal_size]);
}

test "pascal case" {
    var test_text = "HelLo Bye ".*;
    const acutal_size = pascalCase(&test_text);
    try testing.expectEqualStrings("HelloBye", test_text[0..acutal_size]);
}
