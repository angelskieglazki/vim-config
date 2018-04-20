find src/ -name '*.cpp' -o -name '*.h' -o -name '*.hpp' -o -name '*.c' | xargs clang-format -i -style=file
