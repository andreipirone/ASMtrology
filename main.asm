.model small
.stack 100h
.data          
    msg1 db 'Ce zodie esti?',0 
    msg2 db 'Previziunea ta pentru saptamana asta este:',0 
    z_ber db 'Vei fi calcat(a) de tren.',0
    z_tau db 'Hmmm.. Un moment sa ma uit in astre. Aoleu.. Mi-e rusine sa zic ce am vazut.',0
    z_gem db 'O sa ti se rupa o unghie si o sa doara foarte tare.',0   
    z_rac db 'O baba caruia i-ai cedat locul in autobuz iti va lasa mostenire toata averea ei.',0
    z_fec db 'Absolut toate problemele ti se vor rezolva in curand. Pentru totdeauna.',0 
    z_bal db 'Hmmm, astrele imi spun ca... Ar trebui sa te speli mai des pe dinti.',0   
    z_sco db 'Vei castiga 10.000 de lei.',0   
    z_sag db 'Un eveniment neasteptat va aparea in viata ta... O sa pici toate examenele.',0
    z_cap db 'Vei gasi un portofel cu 500 de lei (moldovenesti) pe jos.',0
    z_var db 'Nu vorbesc cu varsatorii, kys.',0
    z_pes db 'Nu se va schimba nimic in viata ta. Iti vei petrece zilele in singuratate si agonie ca intotdeauna.',0          
    ber db 'berbec',0
    berlen equ 6
    tau db 'taur',0  
    taulen equ 4
    gem db 'gemeni',0
    gemlen equ 6
    rac db 'rac',0  
    raclen equ 3
    fec db 'fecioara',0
    feclen equ 8
    bal db 'balanta',0  
    ballen equ 7
    sco db 'scorpion',0
    scolen equ 8
    sag db 'sagetator',0  
    saglen equ 9   
    cap db 'capricorn',0  
    caplen equ 9
    var db 'varsator',0  
    varlen equ 8
    pes db 'pesti',0  
    peslen equ 5
    invalzod db 'Umm.. Nu exista zodia asta.',0 
    
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
    get_input ber, z_ber, berlen
    get_input tau, z_tau, taulen
    get_input gem, z_gem, gemlen
    get_input rac, z_rac, raclen
    get_input fec, z_fec, feclen
    get_input bal, z_bal, ballen
    get_input sco, z_sco, scolen
    get_input sag, z_sag, saglen
    get_input cap, z_cap, caplen
    get_input var, z_var, varlen
    get_input pes, z_pes, peslen 
    
   
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




