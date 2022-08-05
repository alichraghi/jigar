# Jigar

case convertion library for ziguanas
supports: lower case, UPPER CASE, MACRO\_CASE, TRAIN-CASE, snake\_case, snake\_Camel, Snake\_Pascal, kebab-case, Kebab-Pascal, camelCase and PascalCase 

### Usage

```zig
const jigar = @import("jigar");

pub fn main() void {
	var my_hello = "Hello World".*;
	jigar.snakeCase(&my_hello); // results: hello-world
}
```
