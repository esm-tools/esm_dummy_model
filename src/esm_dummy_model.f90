module esm_dummy_model
  implicit none
  private

  public :: say_hello, count_to_five, say_goodbye
contains

  subroutine say_hello
    print *, "Hello, esm_dummy_model!"
  end subroutine say_hello

  subroutine count_to_five
    integer :: n
    do n = 1, 5, 1
      call sleep(1)
      print *, "Sleeping...", n
    end do
  end subroutine

  subroutine say_goodbye
    print *, "Goodbye, esm_dummy_model!"
  end subroutine say_goodbye

end module esm_dummy_model
