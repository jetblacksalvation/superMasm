

ExitProcess  PROTO :DWORD
printf proto

includelib kernel32.lib
includelib msvcrt.lib
includelib legacy_stdio_definitions.lib
.data
    ;dont have a terminating zero if you are tring to print more than one thing 
    messenge db "hello world",10 ;
    message db "this is assembly", 10, 0; second zero here is the turminating zero, tells program that this is the end of the string 

.code
main proc

    ; im thinking that rsp is instead stack creation??
    ;stores stuff on stack? why does the program go sub than add? 

    ;reserves some stack memory for your function call
	sub rsp, 40h ;  
    mov rcx, offset messenge;offset turns messange into something that can fit this register 
    
    mov rbx  , offset message 
    call printf; uses cdecl so it looks at rcx for arguemetnts 
    ;https://learn.microsoft.com/en-us/cpp/build/x64-calling-convention?view=msvc-170&viewFallbackFrom=vs-2017
    ;how to call them
    ;cleans up your function call 
    add rsp, 40h ; why is this here 

    ret  0
main endp
end