Program entropy_text
Implicit none
     character (len=1000000) :: text
     integer :: ios, i, count_value(27),j, invalid_count
    real (kind = 8) :: prob(27), entropy
     character (len=1), parameter :: alphabet(27) = &
             ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',' ']
        logical :: valid_char

count_value = 0
entropy = 0

    open(unit=11, file='el_quijote.txt', status='old')
    do
        read(11, '(A)', iostat=ios)text  ! Leer una línea
        if (ios /= 0) exit  ! Salir si hay un error (fin del archivo)
    end do

   close(unit=11)


 do i = 1, 27
        count_value(i) = count( [ (text(j:j) == alphabet(i), j=1,len_trim(text)) ] )
        write(*,*) alphabet(i), ' : ', count_value(i)
       
    end do
    
    do i = 1,27
    prob(i) = real(count_value(i))/real(sum(count_value))
    end do

    do i = 1,27
    if (prob(i) > 0.0) then
    entropy = entropy + ( ( prob(i) * log(prob(i)) ) /log(2.0) )
    end if
    end do
    entropy = -entropy
    write(*,*)'Total Character : ',sum(count_value)
    write(*,*)'Entropy/character : ',entropy

   write(*,*)'Total Entropy [bits] : ',entropy*sum(count_value)
   write(*,*)'Total Information [bytes] : ',(entropy*real(sum(count_value)))/8.0

    ! Verificar y mostrar caracteres que no están en el alfabeto permitido
    do j = 1, len_trim(text)
        valid_char = .false.
        do i = 1, 27
            if (text(j:j) == alphabet(i)) then
                valid_char = .true.
                exit
            end if
        end do
        if (.not. valid_char) then
            invalid_count = invalid_count + 1
            write(*,*) 'Caracter inválido encontrado: "', text(j:j), '" en la posición ', j
        end if
    end do

    if (invalid_count == 0) then
        write(*,*) 'No se encontraron caracteres inválidos.'
    else
        write(*,*) 'Total de caracteres inválidos: ', invalid_count
    end if
   end program
