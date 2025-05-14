Star Wars-Themed Compiler
=========================

A custom compiler built using **Lex and Bison** with an original Star Wars-inspired syntax. It supports a small subset of C-like features and generates intermediate three-address code (TAC). The goal is to make compiler design fun and thematic while retaining core compiler functionality.

📁 Repository Contents
----------------------
- `sw_flex.l`            : Lex source file for lexical analysis (tokenizer).
- `sw_bison.y`           : Bison grammar file for parsing and semantic actions.
- `sw_bison.tab.c/h`     : Auto-generated parser source and header from Bison.
- `lex.yy.c`             : Auto-generated scanner from Lex.
- `starwars_compiler.exe`: Compiled executable of the compiler (Windows).
- `program.sw`           : Sample source code written in the custom Star Wars language.
- `tac_output.txt`       : Output file containing generated three-address code (TAC).

🧑‍💻 Star Wars Language Features
-------------------------------
- `lightspeed`            → Entry point.
- `landing`               → Exit point.
- `mission`               → Function definition.
- `transmit`              → Return statement.
- `through_holonet`       → Print statement.
- `sense_force`           → "if" statement.
- `disturbance`           → "else" statement.
- `while_the_force_sense_that` → While loop.
- `jedi_master`           → Identifier declaration.
- `int`, `float`, `void`  → Variable types.
- Relational operators: `==`, `!=`, `>=`, `<=`, `<`, `>`
- Supports integer and float literals, identifiers, and string constants.

✨ Sample Program (`program.sw`)
------------------------------------------
A program that:
- Greets the user.
- Retrieves and prints a value.
- Performs a conditional check.
- Iterates using a loop to print numbered messages.

The compiler produces TAC for each part of the program (see `tac_output.txt`).

🚀 How to Build
---------------
If you want to build the compiler from source on Linux:

```bash
bison -d sw_bison.y
flex sw_flex.l
gcc lex.yy.c sw_bison.tab.c -o starwars_compiler
```
If on Windows:

* Use MinGW or WSL for compilation.
* Or use the provided executable: `starwars_compiler.exe`.

## 🧪 Running the Compiler

To compile and generate TAC from a Star Wars source file,
1. Write your program in you `program.sw` file, or any other file with a `.sw` extension.
2. Open Star Wars Compiler folder ( or any folder in which the `starwars_compiler.exe` is stored ) in your command prompt
3. Run the following command

```bash
./starwars_compiler < program.sw
```

This will generate output like the one in `tac_output.txt`.

This is the intermediate representation used for further optimization or code generation in a real compiler pipeline.


🌌 May the source be with you!
=========================


