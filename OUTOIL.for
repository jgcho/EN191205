!{ GEOSR, OIL, CWCHO, 101112

      SUBROUTINE OUTOIL

      USE GLOBAL  

      IMPLICIT NONE

      INTEGER NP1, L, K
      INTEGER COUNTCELL(LA)

!      REAL OILCONC

      IF(JSPD==1) THEN

	 OPEN(7773,FILE='MASS-TOTAL.DAT',STATUS='UNKNOWN')  
       CLOSE(7773,STATUS='DELETE')
       OPEN(7773,FILE='MASS-TOTAL.DAT',ACTION='WRITE')

	 OPEN(7774,FILE='MASS-EVAPO.DAT',STATUS='UNKNOWN')  
       CLOSE(7774,STATUS='DELETE')
       OPEN(7774,FILE='MASS-EVAPO.DAT',ACTION='WRITE')

	 OPEN(7775,FILE='MASS-DISS.DAT',STATUS='UNKNOWN')  
       CLOSE(7775,STATUS='DELETE')
       OPEN(7775,FILE='MASS-DISS.DAT',ACTION='WRITE')

       OPEN(7776,FILE='OILCONC.DAT',STATUS='UNKNOWN')  
       CLOSE(7776,STATUS='DELETE')
       OPEN(7776,FILE='OILCONC.DAT',ACTION='WRITE')

	 OPEN(7777,FILE='DIRFTER.INP',STATUS='UNKNOWN')  
       CLOSE(7777,STATUS='DELETE')
       OPEN(7777,FILE='DRIFTER.INP',ACTION='WRITE')

!--------------- MONITORING OPTION -------------------------
!
C	 OPEN(7771,FILE='EE_DRIFTER.DAT',STATUS='UNKNOWN')  
C      CLOSE(7771,STATUS='DELETE')
C      OPEN(7771,FILE='EE_DRIFTER.DAT',ACTION='WRITE')
C
C      OPEN(7772,FILE='OILTHICK.DAT',STATUS='UNKNOWN')  
C      CLOSE(7772,STATUS='DELETE')
C      OPEN(7772,FILE='OILTHICK.DAT',ACTION='WRITE')
!
!-----------------------------------------------------------
       
	 WRITE(7773,*)'  TIME            MASS          DECAYRATE'
       WRITE(7774,*)'  TIME            MASS          DECAYRATE'
       WRITE(7775,*)'  TIME            MASS          DECAYRATE'
       WRITE(7773,*) TIMEDAY, OILMASSINI, 0.
       WRITE(7774,*) TIMEDAY, OILMASSINI, 0.
       WRITE(7775,*) TIMEDAY, OILMASSINI, 0.

	 WRITE(7777,'(A)') '* USE ONLY OIL MODULE (OUTPUT)'
	 WRITE(7777,'(A)') '* ZOPT PRAN DIFOP HORDIF    VERDIF   DEPOP'
	 WRITE(7777,'(3I5,2F10.5,I5)')
     &             LA_ZCAL,LA_PRAN,LA_DIFOP,LA_HORDIF,LA_VERDIF,DEPOP 
	 WRITE(7777,'(A)') '* BEGIN[day] END[day] FREQ[min]'
	 WRITE(7777,'(4X,3F9.4)') 
     &	         NPTXLDS/86400., NPTXLDE/86400., LA_FREQ*1440
       WRITE(7777,'(A)')'* Number Of Drifters: NPD'
	 WRITE(7777,*)NPD
	 WRITE(7777,'(A)')'********************************************'
	 WRITE(7777,'(A)')'* Initial Coordinates Of Drifters'
	 WRITE(7777,'(A)')'*      XLA         YLA         ZLA/DLA'
	 DO NP1=1,NPD
	 WRITE(7777,*) XLA(NP1), YLA(NP1), ZLA(NP1)
	 ENDDO
	 


!--------------- MONITORING OPTION -------------------------
!
C       WRITE(7771,*) 'T=', TIMEDAY
C	 WRITE(7772,*)
C    & '   TIME            OILVOL        OILAREA       OILTHICK'
C	 WRITE(7771,*) (XLA(NP),YLA(NP),LLA(NP),REAL(ZLA(NP),4),NP=1,NPD)
C	 WRITE(7772,'(F11.7,2F15.2,F20.11,2F15.2)') TIMEDAY, OILVOL,
C    & OILAREA, OILTHICK, SQRT(OILAREA/PI),SQRT(BETA1/PI*SQRT(N*DT))  
!
!------------------------------------------------------------

	ELSE
       WRITE(7773,*)TIMEDAY,OILMASS,(OILMASSINI-OILMASS)/OILMASSINI*100.
       WRITE(7774,*)TIMEDAY,OILMASSINI-MEVAPORATED,FMEVAPORATED*100.
       WRITE(7775,*)TIMEDAY,OILMASSINI-MDISSOLVED,FMDISSOLVED*100.

!--------------- MONITORING OPTION -------------------------
!
C	 WRITE(7771,*) 'T=', TIMEDAY
C	 WRITE(7771,*) (XLA(NP),YLA(NP),LLA(NP),REAL(ZLA(NP),4),NP=1,NPD)
C	 WRITE(7772,'(F11.7,2F15.2,F20.11,2F15.2)') TIMEDAY, OILVOL,
C    & OILAREA, OILTHICK, SQRT(OILAREA/PI),SQRT(BETA1/PI*SQRT(N*DT))	
!
!-----------------------------------------------------------


	 WRITE(7776,*)  TIMEDAY
	
	 DO L=2,LA

       DO K=1,KC
	  COUNTCELL(L)=0
	  OILCONC=0.0

	  DO NP1=1,NPD
	   IF(L==LLA(NP1)) THEN
	    COUNTCELL(L)=COUNTCELL(L)+1
	   ENDIF
	  ENDDO

	  OILCONC(L,K,1)=OILMASS/REAL(NPD)*REAL(COUNTCELL(L))
	  OILCONC(L,K,1)=OILCONC(L,K,1)/(DXP(L)*DYP(L)*HP(L))*1000. ! [mg/L]
       ENDDO

!{GEOSR, 2014.12.31 JSHAN, WRITING OILCONC FORMAT
       !WRITE(7776,'(2I5,2F15.1,2X,F10.3)') 
       WRITE(7776,'(2I5,2F15.1,2X,<KC>F10.3)') 
!}GEOSR, 2014.12.31 JSHAN, WRITING OILCONC FORMAT
     & IL(L),JL(L), DLON(L), DLAT(L), (OILCONC(L,K,1),K=1,KC)

	 ENDDO

      ENDIF

      END SUBROUTINE
!}