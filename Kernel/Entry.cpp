#include <cstdint>

extern "C" void entry(void)
{
    *(uint8_t *)0x10000000 = '\n';
    for (;;);
}
