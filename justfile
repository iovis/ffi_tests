cc_flags := "-std=c2x -Wall -Wextra -Wpedantic"
libs := ""
build_folder := "./build"
program_name := "fib"
bin := build_folder / program_name

default: (run "10")

run number="10": build
    {{ bin }} {{ number }}

build: init
    cc {{ cc_flags }} {{ libs }} -g -O0 src/*.c -o {{ bin }}

release: init
    cc {{ cc_flags }} {{ libs }} -O3 src/*.c -o {{ bin }}

@init:
    mkdir -p {{ build_folder }}

clean:
    rm -rf {{ build_folder }}

dev:
    watchexec -e c,h,rb just test

open:
    gh repo view --web

debug: build
    sudo lldb -- {{ bin }}

# run tests
test: release
    bundle exec rspec
