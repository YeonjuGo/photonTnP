##void TnPEffDraw_pbpb(TString inputPrefix="passISO_VoigtErfExp_recoIDPho_v29_isoEff_diPhoMass_mass60to110_pt15to200_binsForFit30_isoEff",TString inputTag="recoIDPho_pt", TString st_dep = "ptDep", bool isCntEff=false) {
#################################################
###############################################
###### BWResCBErfExp6 ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO BWResCBErfExp6 inputFile_v26_runningCode_v10_2ptBins v26 70 110
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_BWResCBErfExp6_inputFile_v26_runningCode_v10_2ptBins_mass70to110.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO BWResCBErfExp6 inputFile_v26_runningCode_v10_2ptBins v26 70 110
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_BWResCBErfExp6_inputFile_v26_runningCode_v10_2ptBins_mass70to110.root")'
######recoIDPho_ptDep15_40_200_cent0_100
root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_BWResCBErfExp6_inputFile_v26_runningCode_v10_2ptBins_mass70to110","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
##################################################
################################################
####### VoigtErfExp6 ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO VoigtErfExp6 inputFile_v26_runningCode_v10_2ptBins v26 70 110
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_VoigtErfExp6_inputFile_v26_runningCode_v10_2ptBins_mass70to110.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO VoigtErfExp6 inputFile_v26_runningCode_v10_2ptBins v26 70 110
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_VoigtErfExp6_inputFile_v26_runningCode_v10_2ptBins_mass70to110.root")'
#######recoIDPho_ptDep15_40_200_cent0_100
#root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtErfExp6_inputFile_v26_runningCode_v10_2ptBins_mass70to110","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
##################################################
################################################
####### VoigtErfExp7 ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO VoigtErfExp7 inputFile_v26_runningCode_v10_2ptBins v26 70 110
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_VoigtErfExp7_inputFile_v26_runningCode_v10_2ptBins_mass70to110.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO VoigtErfExp7 inputFile_v26_runningCode_v10_2ptBins v26 70 110
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_VoigtErfExp7_inputFile_v26_runningCode_v10_2ptBins_mass70to110.root")'
#######recoIDPho_ptDep15_40_200_cent0_100
#root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtErfExp7_inputFile_v26_runningCode_v10_2ptBins_mass70to110","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
#
##################################################
################################################
####### BWResCBErfExp6 ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO BWResCBErfExp6 inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_BWResCBErfExp6_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO BWResCBErfExp6 inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_BWResCBErfExp6_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
#######recoIDPho_ptDep15_40_200_cent0_100
#root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_BWResCBErfExp6_inputFile_v26_runningCode_v10_2ptBins_mass60to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
##################################################
################################################
####### VoigtErfExp6 ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO VoigtErfExp6 inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_VoigtErfExp6_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO VoigtErfExp6 inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_VoigtErfExp6_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
#######recoIDPho_ptDep15_40_200_cent0_100
#root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtErfExp6_inputFile_v26_runningCode_v10_2ptBins_mass60to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
##################################################
################################################
####### VoigtErfExp7 ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO VoigtErfExp7 inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_VoigtErfExp7_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO VoigtErfExp7 inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_VoigtErfExp7_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
#######recoIDPho_ptDep15_40_200_cent0_100
#root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtErfExp7_inputFile_v26_runningCode_v10_2ptBins_mass60to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'

######## VoigtExp3 ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO VoigtExp3 inputFile_v26_runningCode_v10_2ptBins v26 80 100
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_VoigtExp3_inputFile_v26_runningCode_v10_2ptBins_mass80to100.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO VoigtExp3 inputFile_v26_runningCode_v10_2ptBins v26 80 100
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_VoigtExp3_inputFile_v26_runningCode_v10_2ptBins_mass80to100.root")'
######recoIDPho_ptDep15_40_200_cent0_100
#root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtExp3_inputFile_v26_runningCode_v10_2ptBins_mass80to100","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
##root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtExp3_inputFile_v26_runningCode_v10_2ptBins_mass80to100","recoIDPho_ptDep15_40_200_cent0_100","ptDep",1)'
#################################################
######## VoigtExp2 ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO VoigtExp2 inputFile_v26_runningCode_v10_2ptBins v26 80 100
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_VoigtExp2_inputFile_v26_runningCode_v10_2ptBins_mass80to100.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO VoigtExp2 inputFile_v26_runningCode_v10_2ptBins v26 80 100
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_VoigtExp2_inputFile_v26_runningCode_v10_2ptBins_mass80to100.root")'
######recoIDPho_ptDep15_40_200_cent0_100
#root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtExp2_inputFile_v26_runningCode_v10_2ptBins_mass80to100","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
##root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtExp2_inputFile_v26_runningCode_v10_2ptBins_mass80to100","recoIDPho_ptDep15_40_200_cent0_100","ptDep",1)'
#################################################
######## VoigtExp ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO VoigtExp inputFile_v26_runningCode_v10_2ptBins v26 80 100
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_VoigtExp_inputFile_v26_runningCode_v10_2ptBins_mass80to100.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO VoigtExp inputFile_v26_runningCode_v10_2ptBins v26 80 100
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_VoigtExp_inputFile_v26_runningCode_v10_2ptBins_mass80to100.root")'
######recoIDPho_ptDep15_40_200_cent0_100
#root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtExp_inputFile_v26_runningCode_v10_2ptBins_mass80to100","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
##root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtExp_inputFile_v26_runningCode_v10_2ptBins_mass80to100","recoIDPho_ptDep15_40_200_cent0_100","ptDep",1)'
################################################
####### VoigtExp ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO VoigtExp inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_VoigtExp_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO VoigtExp inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_VoigtExp_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
######recoIDPho_ptDep15_40_200_cent0_120
#root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtExp_inputFile_v26_runningCode_v10_2ptBins_mass60to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
##root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtExp_inputFile_v26_runningCode_v10_2ptBins_mass60to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",1)'
################################################
####### VoigtErfExp3 ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO VoigtErfExp3 inputFile_v26_runningCode_v10_2ptBins v26 80 100
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_VoigtErfExp3_inputFile_v26_runningCode_v10_2ptBins_mass80to100.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO VoigtErfExp3 inputFile_v26_runningCode_v10_2ptBins v26 80 100
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_VoigtErfExp3_inputFile_v26_runningCode_v10_2ptBins_mass80to100.root")'
######recoIDPho_ptDep15_40_200_cent0_100
#root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtErfExp3_inputFile_v26_runningCode_v10_2ptBins_mass80to100","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
##root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtErfExp3_inputFile_v26_runningCode_v10_2ptBins_mass80to100","recoIDPho_ptDep15_40_200_cent0_100","ptDep",1)'
################################################
####### VoigtErfExp3 ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO VoigtErfExp3 inputFile_v26_runningCode_v10_2ptBins v26 75 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_VoigtErfExp3_inputFile_v26_runningCode_v10_2ptBins_mass75to120.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO VoigtErfExp3 inputFile_v26_runningCode_v10_2ptBins v26 75 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_VoigtErfExp3_inputFile_v26_runningCode_v10_2ptBins_mass75to120.root")'
#######recoIDPho_ptDep15_40_200_cent0_100
#root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtErfExp3_inputFile_v26_runningCode_v10_2ptBins_mass75to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
##root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtErfExp3_inputFile_v26_runningCode_v10_2ptBins_mass75to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",1)'
################################################
####### VoigtErfExp3 ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO VoigtErfExp3 inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_VoigtErfExp3_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO VoigtErfExp3 inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_VoigtErfExp3_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
##recoIDPho_ptDep15_40_200_cent0_100
#root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtErfExp3_inputFile_v26_runningCode_v10_2ptBins_mass60to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
##root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtErfExp3_inputFile_v26_runningCode_v10_2ptBins_mass60to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",1)'
################################################
####### VoigtErfExp2 ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO VoigtErfExp2 inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_VoigtErfExp2_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO VoigtErfExp2 inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_VoigtErfExp2_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
##recoIDPho_ptDep15_40_200_cent0_100
#root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtErfExp2_inputFile_v26_runningCode_v10_2ptBins_mass60to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
##root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtErfExp2_inputFile_v26_runningCode_v10_2ptBins_mass60to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",1)'
################################################
####### VoigtErfExp ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO VoigtErfExp inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_VoigtErfExp_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO VoigtErfExp inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_VoigtErfExp_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
#####recoIDPho_ptDep15_40_200_cent0_100
#root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtErfExp_inputFile_v26_runningCode_v10_2ptBins_mass60to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
##root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_VoigtErfExp_inputFile_v26_runningCode_v10_2ptBins_mass60to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",1)'
##################################################
######### BWResCBErfExp3 ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO BWResCBErfExp3 inputFile_v26_runningCode_v10_2ptBins v26 70 110
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_BWResCBErfExp3_inputFile_v26_runningCode_v10_2ptBins_mass70to110.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO BWResCBErfExp3 inputFile_v26_runningCode_v10_2ptBins v26 70 110
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_BWResCBErfExp3_inputFile_v26_runningCode_v10_2ptBins_mass70to110.root")'
######recoIDPho_ptDep15_40_200_cent0_100
#root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_BWResCBErfExp3_inputFile_v26_runningCode_v10_2ptBins_mass70to110","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
##root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_BWResCBErfExp3_inputFile_v26_runningCode_v10_2ptBins_mass70to110","recoIDPho_ptDep15_40_200_cent0_100","ptDep",1)'
##################################################
######### BWResCBErfExp2 ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO BWResCBErfExp2 inputFile_v26_runningCode_v10_2ptBins v26 70 110
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_BWResCBErfExp2_inputFile_v26_runningCode_v10_2ptBins_mass70to110.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO BWResCBErfExp2 inputFile_v26_runningCode_v10_2ptBins v26 70 110
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_BWResCBErfExp2_inputFile_v26_runningCode_v10_2ptBins_mass70to110.root")'
######recoIDPho_ptDep15_40_200_cent0_100
#root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_BWResCBErfExp2_inputFile_v26_runningCode_v10_2ptBins_mass70to110","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
##root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_BWResCBErfExp2_inputFile_v26_runningCode_v10_2ptBins_mass70to110","recoIDPho_ptDep15_40_200_cent0_100","ptDep",1)'
##################################################
######### BWResCBErfExp2 ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO BWResCBErfExp2 inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_BWResCBErfExp2_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO BWResCBErfExp2 inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_BWResCBErfExp2_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
######recoIDPho_ptDep15_40_200_cent0_100
#root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_BWResCBErfExp2_inputFile_v26_runningCode_v10_2ptBins_mass60to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
##root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_BWResCBErfExp2_inputFile_v26_runningCode_v10_2ptBins_mass60to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",1)'
################################################
####### BWResCBErfExp : nominal ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO BWResCBErfExp inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_BWResCBErfExp_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO BWResCBErfExp inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_BWResCBErfExp_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
##recoIDPho_ptDep15_40_200_cent0_100
#root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_BWResCBErfExp_inputFile_v26_runningCode_v10_2ptBins_mass60to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
##root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_BWResCBErfExp_inputFile_v26_runningCode_v10_2ptBins_mass60to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",1)'
#################################################
######## BWResCBCheb3 : systematic for bkg function ##########################
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO BWResCBCheb3 inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_BWResCBCheb3_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO BWResCBCheb3 inputFile_v26_runningCode_v10_2ptBins v26 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_BWResCBCheb3_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
######recoIDPho_ptDep15_40_200_cent0_100
#root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_BWResCBCheb3_inputFile_v26_runningCode_v10_2ptBins_mass60to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
##root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_BWResCBCheb3_inputFile_v26_runningCode_v10_2ptBins_mass60to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",1)'
##################################################
######### BWResCBExp : systematic for bkg function ##########################
##cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py mc passISO BWResCBExp inputFile_v26_runningCode_v10_2ptBins v26 60 120
##root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pbpb_passISO_BWResCBExp_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
##cmsRun yj_tp_photonRaa_pbpb_v10_2ptBins.py data passISO BWResCBExp inputFile_v26_runningCode_v10_2ptBins v26 60 120
##root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pbpb_passISO_BWResCBExp_inputFile_v26_runningCode_v10_2ptBins_mass60to120.root")'
########recoIDPho_ptDep15_40_200_cent0_100
##root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_BWResCBExp_inputFile_v26_runningCode_v10_2ptBins_mass60to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",0)'
###root -l -b -q 'TnPEffDraw_pbpb.C++("passISO_BWResCBExp_inputFile_v26_runningCode_v10_2ptBins_mass60to120","recoIDPho_ptDep15_40_200_cent0_100","ptDep",1)'
