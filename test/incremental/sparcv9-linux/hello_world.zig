const msg = "Hello, World!\n";

pub export fn _start() noreturn {
    asm volatile ("ta 0x6d"
        :
        : [number] "{g1}" (4),
          [arg1] "{o0}" (1),
          [arg2] "{o1}" (@ptrToInt(msg)),
          [arg3] "{o2}" (msg.len),
        : "o0", "o1", "o2", "o3", "o4", "o5", "o6", "o7", "memory"
    );

    asm volatile ("ta 0x6d"
        :
        : [number] "{g1}" (1),
          [arg1] "{o0}" (0),
        : "o0", "o1", "o2", "o3", "o4", "o5", "o6", "o7", "memory"
    );

    unreachable;
}

// run
// target=sparcv9-linux
//
// Hello, World!
//
