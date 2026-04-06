program totalsum2
    use iso_fortran_env, only: int64
    implicit none

    integer, parameter :: block = 1000000000
    integer, parameter :: times = 3
    integer(int64), parameter :: expected = 63244053298881_int64
    integer(int64) :: total
    integer :: i

    total = 0
    print *, "Fortran:"

    do i = 1, times
        total = total + suma(block)
    end do

    ! Format: times x suma(block) = total
    write(*, '(I0, "×suma(", I0, ") = ", I0)') times, block, total

    if (total /= expected) then
        ! Writing to stderr (unit 0 in most Fortran environments)
        write(0, '(A, I0, A)') "ERROR: wrong result! (", total, ")"
    end if

contains

    function suma(n) result(t)
        integer, intent(in) :: n
        integer(int64) :: t
        integer :: j
        t = 0
        do j = 1, n
            ! sqrt returns a real; int() truncates toward zero
            t = t + int(sqrt(real(j, 8)), int64)
        end do
    end function suma

end program totalsum2
