lightspeed
mission void @_greet () {
  through_holonet "Greetings!" ;
}

mission int @_getValue () {
  transmit 42 ;
}

mission void @_main () {
  @_greet () ;
  jedi_master int @_answer ;
  @_answer = @_getValue () ;
  through_holonet ( @_answer ) ;

  jedi_master int @_check ;
  @_check = 1 ;
  sense_force ( @_check == 1 ) {
    through_holonet "Check passed!" ;
  }

  jedi_master int @_counter ;
  @_counter = 0 ;

  while_the_force_sense_that ( @_counter < 5 ) {
    through_holonet "This is message number " ;
    through_holonet ( @_counter ) ;
    @_counter = @_counter + 1 ;
  }
}
landing
