c CLASS = S
c  
c  
c  This file is generated automatically by the setparams utility.
c  It sets the number of processors and the class of the NPB
c  in this directory. Do not modify it by hand.
c  
        integer          lelt, lmor, refine_max, fre_default
        integer          niter_default, nmxh_default
        character        class_default
        double precision alpha_default
        parameter(  lelt=250,
     >             lmor=11600,
     >              refine_max=4,
     >              fre_default=5,
     >              niter_default=50,
     >              nmxh_default=10,
     >              class_default="S",
     >              alpha_default=0.040d0 )
        logical  convertdouble
        parameter (convertdouble = .false.)
        character compiletime*11
        parameter (compiletime='24 Apr 2017')
        character npbversion*5
        parameter (npbversion='3.3.1')
        character cs1*6
        parameter (cs1='(none)')
        character cs2*6
        parameter (cs2='(none)')
        character cs3*6
        parameter (cs3='(none)')
        character cs4*6
        parameter (cs4='(none)')
        character cs5*6
        parameter (cs5='(none)')
        character cs6*6
        parameter (cs6='(none)')
        character cs7*6
        parameter (cs7='randi8')
