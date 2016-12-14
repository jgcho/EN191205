!      SUBROUTINE RWQAGR(IWQTAGR) ! GEOSR DAY read jgcho 2016.10.06
      SUBROUTINE RWQAGR(TIMTMP)   ! GEOSR DAY read jgcho 2016.10.06
C  
C CHANGE RECORD  
C READ IN SPATIALLY AND/OR TEMPORALLY VARYING PARAMETERS FOR ALGAL  
C GROWTH, RESP. & PREDATION RATES, AND BASE LIGHT EXTINCT. COEFF.  
C (UNIT INWQAGR).  
C  
      USE GLOBAL  
      CHARACTER TITLE(3)*79, AGRCONT*3  
      OPEN(7890,FILE=AGRFN,STATUS='UNKNOWN')  
      open(7891,FILE='WQALGGX.INP',STATUS='UNKNOWN')
      OPEN(2,FILE='WQ3D.OUT',STATUS='UNKNOWN',POSITION='APPEND')  
!      IF(IWQTAGR.EQ.0)THEN  ! GEOSR DAY read jgcho 2016.10.06
      IF(AGRDAY.EQ.0)THEN    ! GEOSR DAY read jgcho 2016.10.06
        READ(7890,50) (TITLE(M),M=1,3)  
        WRITE(2,999)  
        WRITE(2,50) (TITLE(M),M=1,3)  
!{ GEOSR X-species : jgcho 2015.11.11
        if (NXSP.gt.0) then
          READ(7891,50) (TITLE(M),M=1,3)  
          write(2,*) '%%%% X-Species START %%%%'
          WRITE(2,50) (TITLE(M),M=1,3)  
          write(2,*) '%%%% X-Species END %%%%'
        endif
!} GEOSR X-species : jgcho 2015.11.11
      ENDIF
      
!      WRITE(2,60)'* ALGAL KINETIC VALUE AT', IWQTAGR, ! GEOSR DAY read jgcho 2016.10.06
      WRITE(2,60)'* ALGAL KINETIC VALUE AT', TIMTMP,   ! GEOSR DAY read jgcho 2016.10.06
     &    ' TH DAY FROM MODEL START'  
      READ(7890,999)  
      READ(7890,50) TITLE(1)  
      WRITE(2,50) TITLE(1)  
      DO I=1,IWQZ  
C  
C        READ(1,51) MM,WQPMC(I),WQPMD(I),WQPMG(I),WQBMRC(I),  
C  
        READ(7890,*) MM, WQPMC(I),WQPMD(I),WQPMG(I),WQPMM(I),WQBMRC(I),  
     &      WQBMRD(I),WQBMRG(I),WQBMRM(I),WQPRRC(I),WQPRRD(I),  
     &      WQPRRG(I),WQPRRM(I),WQKEB(I)  
        WRITE(2,51) MM, WQPMC(I),WQPMD(I),WQPMG(I),WQPMM(I),WQBMRC(I),  
     &      WQBMRD(I),WQBMRG(I),WQBMRM(I),WQPRRC(I),WQPRRD(I),  
     &      WQPRRG(I),WQPRRM(I),WQKEB(I)  
      ENDDO  
!{ GEOSR ORG-species : jgcho 2016.04.20
!      READ(7890,52) IWQTAGR, AGRCONT  
!      WRITE(2,52) IWQTAGR, AGRCONT  
  !{ GEOSR ORG-species : DAY read jgcho 2016.10.06
!      READ(7890,*) IWQTAGR, AGRCONT  
!      WRITE(2,*) IWQTAGR, AGRCONT  
      READ(7890,*) AGRDAY, AGRCONT  
      WRITE(2,*) AGRDAY, AGRCONT
  !} GEOSR ORG-species : DAY read jgcho 2016.04.20
!} GEOSR ORG-species : jgcho 2016.04.20

!{ GEOSR X-species : jgcho 2015.11.11
      if (NXSP.gt.0) then
        WRITE(2,*) '%%%% X-Species START %%%%'
        WRITE(2,60)'* ALGAL KINETIC VALUE AT', TIMTMP,  
     &    ' TH DAY FROM MODEL START'  
        READ(7891,999)  
        READ(7891,50) TITLE(1)  
        DO I=1,IWQZ  
         READ(7891,*) MM, (WQPMX(I,nsp),nsp=1,NXSP)
     &      ,(WQBMRX(I,nsp),nsp=1,NXSP),(WQPRRX(I,nsp),nsp=1,NXSP)
         WRITE(2,51) MM, (WQPMX(I,nsp),nsp=1,NXSP)
     &      ,(WQBMRX(I,nsp),nsp=1,NXSP),(WQPRRX(I,nsp),nsp=1,NXSP)
        ENDDO  
!{ GEOSR X-species : jgcho 2016.04.20
!        READ(7891,52) IWQTAGR, AGRCONT  
!        WRITE(2,52) IWQTAGR, AGRCONT  
  !{ GEOSR X-species : DAY read jgcho 2016.04.20
!      READ(7891,*) IWQTAGR, AGRCONT  
!      WRITE(2,*) IWQTAGR, AGRCONT  
      READ(7891,*) AGRDAY, AGRCONT  
      WRITE(2,*) AGRDAY, AGRCONT
  !} GEOSR X-species : DAY read jgcho 2016.04.20
!} GEOSR X-species : jgcho 2016.04.20
        write(2,*) '%%%% X-Species END %%%%'
      endif
!} GEOSR X-species : jgcho 2015.11.11

      IF(AGRCONT.EQ.'END')THEN  
        CLOSE(7890)  
        if (NXSP.gt.0) CLOSE(7891)
        IWQAGR = 0  
      ENDIF  
      CLOSE(2)  
  999 FORMAT(1X)  
   50 FORMAT(A79)  
   51 FORMAT(I8, 100F8.3)  
   52 FORMAT(I7, 1X, A3)  
!   60 FORMAT(/, A24, I5, A24)  ! GEOSR DAY read jgcho 2016.10.06
   60 FORMAT(/, A24, F5.1, A24) ! GEOSR DAY read jgcho 2016.10.06
      RETURN  
      END  

