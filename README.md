# photonTnP

This repository includes codes for photon Tag-and-Probe methods and was developed under `CMSSW_10_3_3_patch1/src/PhysicsTools/TagAndProbe`.

The basic workflow is as follows:

1. produce a tree which has tag and probe branches using the codes under `fillInputTree` directory (e.g. `fillInputTree/fillTreeTnP_pp_v36_knu.C`). One can change tag and probe conditions in the code and select data/mc options. The produced tree will be stored in `inputTnPFiles` directory.
2. perform Z mass fit using the codes like `yj_tp_photonRaa_pp_v5_test_passID_v36.py`. In the code one can change input/output file names, binning, fitting ranges, signal/backgroun PDFs, etc. Some variables used frequently are set as argument. The results will be stored in `outputTnPresult`.
```C++
  cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID BWResCBExp inputFile_v36_runningCode_v5_test v36 60 120  
  //cmsRun [code] [data or mc] [passing probe condition] [sig and bkg PDFs] [input file name] [input file version] [fit range min] [fit range max]
  ...
``` 
3. `plot.C` makes fitting results plots from the files in `outputTnPresults`.
4. draw an efficiency plot as a function of momentum (or centrality, etc) for data and mc in the same panel using `TnPEffDraw_pp_onlyPt.C` and `TnPEffDraw_pbpb.C` codes for pp and PbPb, respectively. 

- `run_totalTnPprocedure_pbpb_v10_2ptBins_inputFile_v26_passISO.sh` and `run_totalTnPprocedure_pp_v5_inputFile_v36_passID.sh` are example macros which run 2, 3, 4. 
