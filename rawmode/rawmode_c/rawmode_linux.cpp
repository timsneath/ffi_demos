#include <termios.h>

void enableRawMode()
{
    tcgetattr(STDIN_FILENO, &termios);
    termios.c_iflag &= ~(IXON);
    termios.c_lflag &= ~(ECHO | ICANON | ISIG);
    tcsetattr(STDIN_FILENO, TCSAFLUSH, &termios);
}

void main()
{
    enableRawMode();
}