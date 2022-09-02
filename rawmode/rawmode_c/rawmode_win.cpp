#define WIN32_LEAN_AND_MEAN

#include <stdio.h>
#include <Windows.h>

void enableRawMode()
{
    HANDLE hIn = GetStdHandle(STD_INPUT_HANDLE);
    DWORD dwMode;
    GetConsoleMode(hIn, &dwMode);
    dwMode = dwMode & (~ENABLE_PROCESSED_INPUT) &
             (~ENABLE_LINE_INPUT) &
             (~ENABLE_ECHO_INPUT) &
             (~ENABLE_WINDOW_INPUT);
    SetConsoleMode(hIn, dwMode);
}

void disableRawMode()
{
    HANDLE hIn = GetStdHandle(STD_INPUT_HANDLE);
    DWORD dwMode;
    GetConsoleMode(hIn, &dwMode);
    dwMode = dwMode | ENABLE_PROCESSED_INPUT |
             ENABLE_LINE_INPUT |
             ENABLE_ECHO_INPUT |
             ENABLE_WINDOW_INPUT;
    SetConsoleMode(hIn, dwMode);
}

void main()
{
    char buffer[8];
    printf("Enter some text: ");
    fgets(buffer, 8, stdin);
    printf("Received: %s\n", buffer);
    enableRawMode();
    printf("Enter some text: ");
    fgets(buffer, 8, stdin);
    printf("Received: %s\n", buffer);

    disableRawMode();
}