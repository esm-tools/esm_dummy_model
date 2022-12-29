program main
  use esm_dummy_model, only: say_hello, count_to_five, say_goodbye
  implicit none

  call say_hello()
  call count_to_five()
  call say_goodbye()
end program main
