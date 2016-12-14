.SUFFIXES: .for .f90 .o
FC = ifort
LD = $(FC)

SRC0 = DRIFTER.f90 RWQC1.for Var_Global_Mod.f90 WINDWAVE.f90

SRC1 = ACON.for BAL2T1.for BAL2T2.for BAL2T3A.for BAL2T3B.for BAL2T4.for BAL2T5.for BEDINIT.for \
      BEDLOAD.for BEDPLTH.for BUDGET1.for BUDGET2.for BUDGET3.for BUDGET5.for CALAVB2.for \
      CALAVB.for CALBAL1.for CALBAL2.for CALBAL3.for CALBAL4.for CALBAL5.for CALBED9.for \
      CALBED.for CALBLAY.for CALBUOY.for CALCONC.for CALCSER.for CALDIFF.for CALDISP2.for \
      CALDISP3.for CALEBI.for CALEXP2T.for CALFQC.for CALHDMF.for CALHEAT.for CALHTA.for \
      CALIMP2T.for CALMMT.for CALPNHS.for CALPSER.for CALPUV2C.for CALPUV2T.for CALPUV9C.for\
      CALPUV9.for CALQQ1.for CALQQ1OLD.for CALQQ2.for CALQQ2T.for CALSED.for CALSFT.for \
      CALSND.for CALSTEPD.for CALSTEP.for CALTBXY.for CALTOXB.for CALTOX.for CALTRAN.for \
      CALTRANQ.for CALTSXY.for CALUVW.for CALVEGSER.for CALWQC.for CBALEV1.for CBALEV2.for \
      CBALEV3.for CBALEV4.for CBALEV5.for CBALOD1.for CBALOD2.for CBALOD3.for CBALOD4.for \
      CBALOD5.for CELLMAP.for CELLMASK.for CEQICM.for CONGRADC.for COSTRAN.for COSTRANW.for \
      CSEDRESB.for CSEDRESS.for CSEDSET.for CSEDTAUB.for CSEDTAUS.for CSEDVIS.for CSNDEQC.for \
      CSNDSET.for CSNDZEQ.for DEPPLT.for DUMP.for EEXPOUT.for FDSTRSE.for FHYDCN.for \
      foodchain.for FSBDLD.for FSEDMODE.for FSTRSE.for FUNDEN.for HDMT2T.for HDMT.for \
      initbin0.for initbin2.for INITBIN3.for INITBIN4.for INITBIN5.for initbin.for INPUT.for JPEFDC.for \
      LSQHARM.for LUBKSB.for LUDCMP.for NEGDEP.for OUT3D.for OUTPUT1.for OUTPUT2.for PPLOT.for \
      QUIT.for RCAHQ.for RELAX2T.for RESTIN10.for RESTIN1.for RESTIN2.for RESTMOD.for \
      RESTOUT.for RESTRAN.for ROUT3D.for RSALPLTH.for RSALPLTV.for RSMICI.for RSMRST.for \
      RSURFPLT.for RVELPLTH.for RVELPLTV.for RWQAGR.for RWQATM.for RWQBEN2.for \
      RWQCSR.for RWQICI.for RWQPSL.for RWQRST.for RWQSTL.for RWQSUN.for SALPLTH.for SALPLTV.for \
      SALTSMTH.for SCANASER.for SCANDSER.for SCANEFDC.for SCANGWSR.for SCANMODC.for \
      SCANPSER.for SCANQCTL.for SCANQSER.for SCANSFSR.for SCANSSER.for SCANTSER.for SCANGSER.for \
      SCANWSER.for SCNTXSED.for SEDFLUX.for SEEK.for SETFPOCB.for SETOBC2T.for SETSHLD.for \
      SETSTVEL.for SKIPCOMM.for SMINIT.for SMMBE.for SMRIN1.for SOLVSMBE.for SSEDTOX.for \
      SUBCHAN.for SURFPLT.for SVBKSB.for SVDCMP.for TIMELOG.for TMSR.for TOXCHEM.for VALKH.for \
      VARINIT.for VELPLTH.for VELPLTV.for VSFP.for WASP4.for WASP5.for WASP6.for WASP7EPA.for \
      WASP7.for WAVEBL.for WAVESXY.for WQ3D.for WQ3DINP.for WQSKE0.for WQSKE1.for WQSKE2.for \
      WQSKE3.for WQSKE4.for WQZERO2.for WQZERO3.for WQZERO4.for WQZERO.for WSMRST.for \
      WSMTSBIN.for WSMTS.for WWQNC.for WWQRST.for WWQTSBIN.for WWQTS.for ZBRENT.for AINIT.for \
      CALEXP.for CALPUVTT.for CALQVS.for EFDC.for SETBCS.for SETOPENBC.for CALAVBOLD.for \
      CALPGCORR.for CALQQ2TOLD.for CONGRAD.for SCANWQ.for SETOPENBC2.for VARALLOC.for \
      SCANMASK.for GATECTLREAD.for SCANGATECTL.for CGATEFLX.for READOIL.for OILCHEM.for \
      OUTOIL.for READTOX.for READWIMS1.for READWIMS2.for SCANGTAB.for WQSTOKES01.for \
      Sub_spore.for

SRC2 = s_bedload.f90 SCANSEDZLJ.f90 SHOWVAL.f90 s_main.f90 s_morph.f90 s_sedic.f90 s_sedzlj.f90 \
       s_shear.f90 tecplot.f90 VARZEROInt.f90 VARZEROReal.f90 WELCOME.f90

OBJ0 = DRIFTER.o RWQC1.o Var_Global_Mod.o WINDWAVE.o
OBJ1 = $(SRC1:for=o)
OBJ2 = $(SRC2:f90=o)

EXE = NH014_20151113_benthic.x

FCFLAGS = -O3 -xT
#FCFLAGS = -O3 -xT -r8
#FCFLAGS = -O3 -xW
#FCFLAGS = -r8 -fp-model strict -fpe0 -g -traceback
LDFLAGS = $(FCFLAGS)

$(EXE): $(OBJ0) $(OBJ1) $(OBJ2)
	$(LD) $(LDFLAGS) $(OBJ0) $(OBJ1) $(OBJ2) -o $@
.for.o:
	$(FC) $(FCFLAGS) -c $<
.f90.o:
	$(FC) $(FCFLAGS) -c $<
clean:
	rm -f $(OBJ0) $(OBJ1) $(OBJ2) $(EXE) *.mod

ACON.o : Var_Global_Mod.o
AINIT.o : Var_Global_Mod.o
BAL2T1.o : Var_Global_Mod.o
BAL2T2.o : Var_Global_Mod.o
BAL2T3A.o : Var_Global_Mod.o
BAL2T3B.o : Var_Global_Mod.o
BAL2T4.o : Var_Global_Mod.o
BAL2T5.o : Var_Global_Mod.o
BEDINIT.o : Var_Global_Mod.o
BEDLOAD.o : Var_Global_Mod.o
BEDPLTH.o : Var_Global_Mod.o
BUDGET1.o : Var_Global_Mod.o
BUDGET2.o : Var_Global_Mod.o
BUDGET3.o : Var_Global_Mod.o
BUDGET5.o : Var_Global_Mod.o
CALAVB2.o : Var_Global_Mod.o
CALAVB.o : Var_Global_Mod.o
CALAVBOLD.o : Var_Global_Mod.o
CALBAL1.o : Var_Global_Mod.o
CALBAL2.o : Var_Global_Mod.o
CALBAL3.o : Var_Global_Mod.o
CALBAL4.o : Var_Global_Mod.o
CALBAL5.o : Var_Global_Mod.o
CALBED9.o : Var_Global_Mod.o
CALBED.o : Var_Global_Mod.o
CALBLAY.o : Var_Global_Mod.o
CALBUOY.o : Var_Global_Mod.o
CALCONC.o : Var_Global_Mod.o
CALCSER.o : Var_Global_Mod.o
CALDIFF.o : Var_Global_Mod.o
CALDISP2.o : Var_Global_Mod.o
CALDISP3.o : Var_Global_Mod.o
CALEBI.o : Var_Global_Mod.o
CALEXP2T.o : Var_Global_Mod.o
CALEXP.o : Var_Global_Mod.o
CALFQC.o : Var_Global_Mod.o
CALHDMF.o : Var_Global_Mod.o
CALHEAT.o : Var_Global_Mod.o
CALHTA.o : Var_Global_Mod.o
CALIMP2T.o : Var_Global_Mod.o
CALMMT.o : Var_Global_Mod.o
CALPGCORR.o : Var_Global_Mod.o
CALPNHS.o : Var_Global_Mod.o
CALPSER.o : Var_Global_Mod.o
CALPUV2C.o : Var_Global_Mod.o
CALPUV2T.o : Var_Global_Mod.o
CALPUV9C.o : Var_Global_Mod.o
CALPUV9.o : Var_Global_Mod.o
CALPUVTT.o : Var_Global_Mod.o
CALQQ1.o : Var_Global_Mod.o
CALQQ1OLD.o : Var_Global_Mod.o
CALQQ2.o : Var_Global_Mod.o
CALQQ2T.o : Var_Global_Mod.o
CALQQ2TOLD.o : Var_Global_Mod.o
CALQVS.o : Var_Global_Mod.o
CALSED.o : Var_Global_Mod.o
CALSFT.o : Var_Global_Mod.o
CALSND.o : Var_Global_Mod.o
CALSTEPD.o : Var_Global_Mod.o
CALSTEP.o : Var_Global_Mod.o
CALTBXY.o : Var_Global_Mod.o
CALTOXB.o : Var_Global_Mod.o
CALTOX.o : Var_Global_Mod.o
CALTRAN.o : Var_Global_Mod.o
CALTRANQ.o : Var_Global_Mod.o
CALTSXY.o : Var_Global_Mod.o
CALUVW.o : Var_Global_Mod.o
CALVEGSER.o : Var_Global_Mod.o
CALWQC.o : Var_Global_Mod.o
CBALEV1.o : Var_Global_Mod.o
CBALEV2.o : Var_Global_Mod.o
CBALEV3.o : Var_Global_Mod.o
CBALEV4.o : Var_Global_Mod.o
CBALEV5.o : Var_Global_Mod.o
CBALOD1.o : Var_Global_Mod.o
CBALOD2.o : Var_Global_Mod.o
CBALOD3.o : Var_Global_Mod.o
CBALOD4.o : Var_Global_Mod.o
CBALOD5.o : Var_Global_Mod.o
CELLMAP.o : Var_Global_Mod.o
CELLMASK.o : Var_Global_Mod.o
CEQICM.o : Var_Global_Mod.o
CONGRADC.o : Var_Global_Mod.o
CONGRAD.o : Var_Global_Mod.o
COSTRAN.o : Var_Global_Mod.o
COSTRANW.o : Var_Global_Mod.o
DEPPLT.o : Var_Global_Mod.o
DRIFTER.o : Var_Global_Mod.o
DUMP.o : Var_Global_Mod.o
EEXPOUT.o : Var_Global_Mod.o
EFDC.o : Var_Global_Mod.o
foodchain.o : Var_Global_Mod.o
HDMT2T.o : Var_Global_Mod.o DRIFTER.o WINDWAVE.o
HDMT.o : Var_Global_Mod.o DRIFTER.o WINDWAVE.o
initbin0.o : Var_Global_Mod.o
initbin2.o : Var_Global_Mod.o
INITBIN3.o : Var_Global_Mod.o
INITBIN4.o : Var_Global_Mod.o
INITBIN5.o : Var_Global_Mod.o
initbin.o : Var_Global_Mod.o
INPUT.o : Var_Global_Mod.o DRIFTER.o
JPEFDC.o : Var_Global_Mod.o
LSQHARM.o : Var_Global_Mod.o
NEGDEP.o : Var_Global_Mod.o
OUT3D.o : Var_Global_Mod.o
OUTPUT1.o : Var_Global_Mod.o
OUTPUT2.o : Var_Global_Mod.o
PPLOT.o : Var_Global_Mod.o
RCAHQ.o : Var_Global_Mod.o
RELAX2T.o : Var_Global_Mod.o
RESTIN10.o : Var_Global_Mod.o
RESTIN1.o : Var_Global_Mod.o
RESTIN2.o : Var_Global_Mod.o
RESTMOD.o : Var_Global_Mod.o
RESTOUT.o : Var_Global_Mod.o
RESTRAN.o : Var_Global_Mod.o
ROUT3D.o : Var_Global_Mod.o
RSALPLTH.o : Var_Global_Mod.o
RSALPLTV.o : Var_Global_Mod.o
RSMICI.o : Var_Global_Mod.o
RSMRST.o : Var_Global_Mod.o
RSURFPLT.o : Var_Global_Mod.o
RVELPLTH.o : Var_Global_Mod.o
RVELPLTV.o : Var_Global_Mod.o
RWQAGR.o : Var_Global_Mod.o
RWQATM.o : Var_Global_Mod.o
RWQBEN2.o : Var_Global_Mod.o
RWQC1.o : Var_Global_Mod.o
RWQCSR.o : Var_Global_Mod.o
RWQICI.o : Var_Global_Mod.o
RWQPSL.o : Var_Global_Mod.o
RWQRST.o : Var_Global_Mod.o
RWQSTL.o : Var_Global_Mod.o
RWQSUN.o : Var_Global_Mod.o
SALPLTH.o : Var_Global_Mod.o
SALPLTV.o : Var_Global_Mod.o
SALTSMTH.o : Var_Global_Mod.o
s_bedload.o : Var_Global_Mod.o
SCANASER.o : Var_Global_Mod.o
SCANDSER.o : Var_Global_Mod.o
SCANEFDC.o : Var_Global_Mod.o
SCANGWSR.o : Var_Global_Mod.o
SCANMODC.o : Var_Global_Mod.o
SCANPSER.o : Var_Global_Mod.o
SCANQCTL.o : Var_Global_Mod.o
SCANQSER.o : Var_Global_Mod.o
SCANSEDZLJ.o : Var_Global_Mod.o
SCANSFSR.o : Var_Global_Mod.o
SCANSSER.o : Var_Global_Mod.o
SCANTSER.o : Var_Global_Mod.o
SCANGSER.o : Var_Global_Mod.o
SCANWQ.o : Var_Global_Mod.o
SCANWSER.o : Var_Global_Mod.o
SCNTXSED.o : Var_Global_Mod.o
SEDFLUX.o : Var_Global_Mod.o
SETBCS.o : Var_Global_Mod.o
SETFPOCB.o : Var_Global_Mod.o
SETOBC2T.o : Var_Global_Mod.o
SETOPENBC2.o : Var_Global_Mod.o
SETOPENBC.o : Var_Global_Mod.o
SHOWVAL.o : Var_Global_Mod.o
s_main.o : Var_Global_Mod.o
SMINIT.o : Var_Global_Mod.o
SMMBE.o : Var_Global_Mod.o
s_morph.o : Var_Global_Mod.o
SMRIN1.o : Var_Global_Mod.o
s_sedic.o : Var_Global_Mod.o
SSEDTOX.o : Var_Global_Mod.o
s_sedzlj.o : Var_Global_Mod.o
s_shear.o : Var_Global_Mod.o
SUBCHAN.o : Var_Global_Mod.o
SURFPLT.o : Var_Global_Mod.o
tecplot.o : Var_Global_Mod.o
TMSR.o : Var_Global_Mod.o
TOXCHEM.o : Var_Global_Mod.o
VALKH.o : Var_Global_Mod.o
VARALLOC.o : Var_Global_Mod.o
Var_Global_Mod.o : Var_Global_Mod.o
VARINIT.o : Var_Global_Mod.o
VARZEROInt.o : Var_Global_Mod.o
VARZEROReal.o : Var_Global_Mod.o
VELPLTV.o : Var_Global_Mod.o
VSFP.o : Var_Global_Mod.o
WASP4.o : Var_Global_Mod.o
WASP5.o : Var_Global_Mod.o
WASP6.o : Var_Global_Mod.o
WASP7EPA.o : Var_Global_Mod.o
WASP7.o : Var_Global_Mod.o
WAVEBL.o : Var_Global_Mod.o
WAVESXY.o : Var_Global_Mod.o
WINDWAVE.o : Var_Global_Mod.o DRIFTER.o
WQ3D.o : Var_Global_Mod.o
WQ3DINP.o : Var_Global_Mod.o
WQSKE0.o : Var_Global_Mod.o
WQSKE1.o : Var_Global_Mod.o
WQSKE2.o : Var_Global_Mod.o
WQSKE3.o : Var_Global_Mod.o
WQSKE4.o : Var_Global_Mod.o
WQZERO2.o : Var_Global_Mod.o
WQZERO3.o : Var_Global_Mod.o
WQZERO4.o : Var_Global_Mod.o
WQZERO.o : Var_Global_Mod.o
WSMRST.o : Var_Global_Mod.o
WSMTSBIN.o : Var_Global_Mod.o
WSMTS.o : Var_Global_Mod.o
WWQNC.o : Var_Global_Mod.o
WWQRST.o : Var_Global_Mod.o
WWQTSBIN.o : Var_Global_Mod.o
WWQTS.o : Var_Global_Mod.o
SCANMASK.o : Var_Global_Mod.o
GATECTLREAD.o : Var_Global_Mod.o
SCANGATECTL.o : Var_Global_Mod.o
CGATEFLX.o : Var_Global_Mod.o
READOIL.o : Var_Global_Mod.o
OILCHEM.o : Var_Global_Mod.o
OUTOIL.o : Var_Global_Mod.o
READTOX.o : Var_Global_Mod.o
READWIMS1.o : Var_Global_Mod.o
READWIMS2.o : Var_Global_Mod.o
SCANGTAB.o : Var_Global_Mod.o
WQSTOKES01.o : Var_Global_Mod.o
Sub_spore.o : Var_Global_Mod.o
