(* in bash use: nice MathKernel -noprompt -run "<<run_BatchMultiFit_20180812.m" >> run_BatchMultiFit_20180812.log & *)

(*

Needs ErrorBarLogPlots.m in the same directory as BatchMultiFit.m
Download it from http://library.wolfram.com/infocenter/MathSource/6747/

For the export of the pictures the frontend will be always invoked for rendering -> needs X !

Just in case if you are running the script remotely in a terminal on a server you can e.g. use a VNC-server as X:

-start on the server a VNC-server via tyoing in the terminal: 
 vncserver :1 [-alwaysshared] [-localhost]

-in the terminal: 
 export DISPLAY=<server-IP>:1  [or export DISPLAY=localhost:1]
 nice MathKernel -noprompt -run "<<run_BatchMultiFit.m" >> run_BatchMultiFit.log &

-Note that some VNC-servers (TightVNC) may crash if there are more than 6 parallel jobs.
-Using NX can be an alternative.

*)


(* Get["/home/martins/projects/BatchMultiFit_SF/BatchMultiFit.m"]; *)
Get["/home/martins/projects/BatchMultiFit_SF/BatchMultiFit.m"];



(* define number of threads, using more than >6 threads causes the vncserver crashing (?!) *)
CloseKernels[]
LaunchKernels[16]
$KernelCount


SetDirectory["/home/martins/projects/BatchMultiFit_SF"];



(* dilute SSS suspension *)

(* YFileDir="/home/martins/projects/XNDiff/out/"; *)
YFileDir="out/";
YFileList=FileNames[YFileDir<>"SSS_180x360_P*_ST_360_400_N100.log"];
YFileList=StringTrim[StringTrim[#,YFileDir],".log"]&/@YFileList;


(* with ycohscf, with LicoConstr *)
(*
OutDir="MathematicaOut/SSS_4to1dil_001/";
Xnmode="X";
expfileconc={"export/im_0047273_caz_s-scale.chi",0.01}; (* use scaling factor since conc is not really known *)
Nmaxsp=6;
Nmaxst=0;
FitFunc=NMinimize;
FitMethod="DifferentialEvolution";
Fitsmin=0.01;
Fitsmax=0.37;
FitMaxIt=1000;
FitTarF=T;
ParStart={{"c1",True,0.1},{"c2",True,0.1},{"c3",True,0.6},{"c4",True,0.1},{"c5",True,0.1},{"c6",True,0.0},{"rhoisl",True,0,"270<#<360"},{"rhoosl",True,0,"270<#<360"},{"rhodm",True,0,"333<#<345"},{"Xa",True,0.005,"0.003<#<0.009"}};
PlRange={{0.002,0.5},{10^-3,10^2}};
plsc=1; (* Default *)
AddConstraints={}; (* Default *)
Smear={0,0.0}; (* Default *)
ycohscf={True,7.0,"3<#<10"};
LicoConstr={"","==1"}; (* Default *)
(* Ymode 1, Tscf 1.0 *)
Print[AbsoluteTiming[BatchMultiFit[OutDir,Xnmode,expfileconc,YFileDir,YFileList,Nmaxsp,Nmaxst,FitFunc,FitMethod,Fitsmin,Fitsmax,FitMaxIt,FitTarF,ParStart,PlRange,plsc,1,AddConstraints,Smear,1.0,ycohscf,LicoConstr,True]][[1]]];
*)

(* with ycohscf *)
OutDir="MathematicaOut/SSS_4to1dil_001/";
Xnmode="X";
expfileconc={"export/im_0047273_caz_s-scale.chi",0.01}; (* use scaling factor since conc is not really known *)
Nmaxsp=6;
Nmaxst=0;
FitFunc=NMinimize;
FitMethod="DifferentialEvolution";
Fitsmin=0.01;
Fitsmax=0.37;
FitMaxIt=1000;
FitTarF=T;
ParStart={{"c1",True},{"c2",True},{"c3",True},{"c4",True},{"c5",True},{"c6",True},{"rhoisl",True,0,"270<#<360"},{"rhoosl",True,0,"270<#<360"},{"rhodm",True,0,"333<#<345"},{"Xa",True,0.005,"0.003<#<0.009"}};
PlRange={{0.002,0.5},{10^-3,10^2}};
plsc=1; (* Default *)
AddConstraints={}; (* Default *)
Smear={0,0.0}; (* Default *)
ycohscf={True,7.0,"3<#<10"};
(* Ymode 1, Tscf 1.0 *)
Print[AbsoluteTiming[BatchMultiFit[OutDir,Xnmode,expfileconc,YFileDir,YFileList,Nmaxsp,Nmaxst,FitFunc,FitMethod,Fitsmin,Fitsmax,FitMaxIt,FitTarF,ParStart,PlRange,plsc,1,AddConstraints,Smear,1.0,ycohscf]][[1]]];




(* use always Exit[] *)
Exit[]
