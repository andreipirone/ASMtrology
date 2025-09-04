.model small
.stack 100h
.data          
    msg1 db 'What is your zodiac sign?', 0 
    msg2 db 'Your horoscope for this week is:', 0 
    z_ari db 'You will face unexpected challenges but overcome them with determination.', 0
    z_tau db 'Financial opportunities are coming your way; stay alert.', 0
    z_gem db 'Communication will play a key role in your success this week.', 0   
    z_can db 'A long-awaited opportunity will finally present itself.', 0
    z_vir db 'Your hard work will soon be recognized by those around you.', 0 
    z_lib db 'Balance is key, focus on harmony in both work and relationships.', 0   
    z_sco db 'Mysteries will unravel, bringing clarity to confusing situations.', 0   
    z_sag db 'Adventure calls you to embrace new experiences with an open heart.', 0
    z_cap db 'Persistence will lead to significant progress in your goals.', 0
    z_aqu db 'Innovation and creativity will set you apart from the crowd.', 0
    z_pis db 'Emotional healing begins, and you allow yourself to move forward.', 0          
    ari db 'aries', 0
    arilen equ 5
    tau db 'taurus', 0  
    taulen equ 6
    gem db 'gemini', 0
    gemlen equ 6
    can db 'cancer', 0  
    canlen equ 6
    vir db 'virgo', 0
    virlen equ 5
    lib db 'libra', 0  
    liblen equ 5
    sco db 'scorpio', 0
    scolen equ 7
    sag db 'sagittarius', 0  
    saglen equ 11   
    cap db 'capricorn', 0  
    caplen equ 9
    aqu db 'aquarius', 0  
    aqulen equ 8
    pis db 'pisces', 0  
    pislen equ 6
    invalzod db 'Hmm... That zodiac sign does not exist.', 0 
    
    newline db 0Dh, 0Ah, '$'
    
    input_buffer db 255 dup(' ')
    
    
get_input macro com, msg, comlen
    local compare_loop, equal, not_equal 
        cmp ax,ax
        lea si, input_buffer + 2
        mov cx, comlen
        lea di, com
        compare_loop:
            lodsb           
            cmp al, [di]    
            jne not_equal  
            inc di          
            loop compare_loop
            jmp equal
        equal:
            lea si, msg
            call print_newline
        not_equal:
            
            
           
endm
    
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, msg1
    push ax      
    push si  

    urm_char:      
       mov al, [si]
       cmp al, 0
       jz  printat
       inc si
       mov ah, 0eh ; teletype function.
       int 10h
       jmp urm_char
    printat:
       pop si     
       pop ax
    
    
    mov dl, 10
    mov ah, 02h
    int 21h
    mov dl, 13
    mov ah, 02h
    int 21h     
    
    lea dx, input_buffer
    mov ah, 0Ah
    int 21h       
    
    
 
    push ds
    pop es
    cld 
    get_input ari, z_ari, arilen
    get_input tau, z_tau, taulen
    get_input gem, z_gem, gemlen
    get_input can, z_can, canlen
    get_input vir, z_vir, virlen
    get_input lib, z_lib, liblen
    get_input sco, z_sco, scolen
    get_input sag, z_sag, saglen
    get_input cap, z_cap, caplen
    get_input aqu, z_aqu, aqulen
    get_input pis, z_pis, pislen 
    
   
    lea si, invalzod
    call print_newline
    
        
    print_newline:
        mov dl, 10
        mov ah, 02h
        int 21h
        mov dl, 13
        mov ah, 02h
        int 21h
        call print_string
        
        
    print_string proc near
        push ax      
        push si  

        next_char:      
            mov al, [si]
            cmp al, 0
            jz  printed
            inc si
            mov ah, 0eh ; teletype function.
            int 10h
            jmp next_char
        printed:

            pop si     
            pop ax     
     print_string endp  
    
    

        
        
       
end main



