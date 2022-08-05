# Jigar
![logo](/media/logo.png)

case convertion library for ziguanas
supports: `lower case`, `UPPER CASE`, `MACRO_CASE`, `TRAIN-CASE`, `snake_case`, `snake_Camel`, `Snake_Pascal`, `kebab-case`, `Kebab-Pascal`, `camelCase` and `PascalCase`

### Usage

```zig
const jigar = @import("jigar");

pub fn main() void {
	var my_hello = "Hello World".*;
	jigar.snakeCase(&my_hello); // results: hello_world
}
```
