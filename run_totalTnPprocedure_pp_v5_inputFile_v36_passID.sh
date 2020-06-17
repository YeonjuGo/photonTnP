#void TnPEffDraw_pp_onlyPt(TString inputPrefix="passID_VoigtErfExp_recoIDPho_v29_isoEff_diPhoMass_mass60to120_pt15to200_binsForFit30_isoEff",TString inputTag="recoIDPho_pt", TString st_dep = "ptDep", bool isCntEff=false) {
##########################################
######### BWResCBExp : systematic for mass range
cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID BWResCBExp inputFile_v36_runningCode_v5_test v36 60 120
root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_BWResCBExp_inputFile_v36_runningCode_v5_test_mass60to120.root")'
cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID BWResCBExp inputFile_v36_runningCode_v5_test v36 60 120
root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_BWResCBExp_inputFile_v36_runningCode_v5_test_mass60to120.root")'
#recoIDPho_pt15_30_40_200
root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBExp_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",0)'
root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBExp_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",1)'

############################################
########### VoigtExp : systematic for signal function
cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID VoigtExp inputFile_v36_runningCode_v5_test v36 60 120
root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_VoigtExp_inputFile_v36_runningCode_v5_test_mass60to120.root")'
cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID VoigtExp inputFile_v36_runningCode_v5_test v36 60 120
root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_VoigtExp_inputFile_v36_runningCode_v5_test_mass60to120.root")'
#recoIDPho_pt15_30_40_200
root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtExp_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",0)'
root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtExp_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",1)'

############################################
########### VoigtCheb : systematic for signal function
cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID VoigtCheb inputFile_v36_runningCode_v5_test v36 60 120
root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_VoigtCheb_inputFile_v36_runningCode_v5_test_mass60to120.root")'
cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID VoigtCheb inputFile_v36_runningCode_v5_test v36 60 120
root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_VoigtCheb_inputFile_v36_runningCode_v5_test_mass60to120.root")'
#recoIDPho_pt15_30_40_200
root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtCheb_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",0)'
root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtCheb_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",1)'

###########################################
########## BWResCBExp : systematic for mass range
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID BWResCBExp inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_BWResCBExp_inputFile_v36_runningCode_v5_test_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID BWResCBExp inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_BWResCBExp_inputFile_v36_runningCode_v5_test_mass60to120.root")'
##recoIDPho_pt15_30_40_200
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBExp_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",0)'
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBExp_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",1)'
###recoIDPho_pt30_40
##root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBExp_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt30_40","ptDep",0)'
##root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBExp_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt30_40","ptDep",1)'

#############################################
############ VoigtExp : systematic for signal function
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID VoigtExp inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_VoigtExp_inputFile_v36_runningCode_v5_test_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID VoigtExp inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_VoigtExp_inputFile_v36_runningCode_v5_test_mass60to120.root")'
##recoIDPho_pt15_30_40_200
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtExp_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",0)'
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtExp_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",1)'

#############################################
############ VoigtCheb : systematic for signal function
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID VoigtCheb inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_VoigtCheb_inputFile_v36_runningCode_v5_test_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID VoigtCheb inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_VoigtCheb_inputFile_v36_runningCode_v5_test_mass60to120.root")'
##recoIDPho_pt15_30_40_200
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtCheb_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",0)'
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtCheb_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",1)'

##########################################
######### BWResCBErfExp4 : systematic for mass range
cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID BWResCBErfExp4 inputFile_v36_runningCode_v5_test v36 60 120
root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_BWResCBErfExp4_inputFile_v36_runningCode_v5_test_mass60to120.root")'
cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID BWResCBErfExp4 inputFile_v36_runningCode_v5_test v36 60 120
root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_BWResCBErfExp4_inputFile_v36_runningCode_v5_test_mass60to120.root")'
#recoIDPho_pt15_30_40_200
root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp4_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",0)'
root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp4_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",1)'
###recoIDPho_pt30_40
##root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp4_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt30_40","ptDep",0)'
##root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp4_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt30_40","ptDep",1)'

############################################
########### VoigtErfExp4 : systematic for signal function
cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID VoigtErfExp4 inputFile_v36_runningCode_v5_test v36 60 120
root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_VoigtErfExp4_inputFile_v36_runningCode_v5_test_mass60to120.root")'
cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID VoigtErfExp4 inputFile_v36_runningCode_v5_test v36 60 120
root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_VoigtErfExp4_inputFile_v36_runningCode_v5_test_mass60to120.root")'
#recoIDPho_pt15_30_40_200
root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp4_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",0)'
root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp4_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",1)'

############################################
########### VoigtErfExp4 : systematic for signal function
cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID VoigtErfExp4 inputFile_v36_runningCode_v5_test v36 70 110
root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_VoigtErfExp4_inputFile_v36_runningCode_v5_test_mass70to110.root")'
cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID VoigtErfExp4 inputFile_v36_runningCode_v5_test v36 70 110
root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_VoigtErfExp4_inputFile_v36_runningCode_v5_test_mass70to110.root")'
#recoIDPho_pt15_30_40_200
root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp4_inputFile_v36_runningCode_v5_test_mass70to110","recoIDPho_pt15_30_40_200","ptDep",0)'
root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp4_inputFile_v36_runningCode_v5_test_mass70to110","recoIDPho_pt15_30_40_200","ptDep",1)'
###
#############################################
############ VoigtErfExp3 : systematic for signal function
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID VoigtErfExp3 inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_VoigtErfExp3_inputFile_v36_runningCode_v5_test_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID VoigtErfExp3 inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_VoigtErfExp3_inputFile_v36_runningCode_v5_test_mass60to120.root")'
##recoIDPho_pt15_30_40_200
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp3_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",0)'
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp3_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",1)'
#
#############################################
############ VoigtErfExp4 : systematic for signal function
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID VoigtErfExp4 inputFile_v36_runningCode_v5_test v36 80 100
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_VoigtErfExp4_inputFile_v36_runningCode_v5_test_mass80to100.root")'
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID VoigtErfExp4 inputFile_v36_runningCode_v5_test v36 80 100
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_VoigtErfExp4_inputFile_v36_runningCode_v5_test_mass80to100.root")'
##recoIDPho_pt15_30_40_200
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp4_inputFile_v36_runningCode_v5_test_mass80to100","recoIDPho_pt15_30_40_200","ptDep",0)'
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp4_inputFile_v36_runningCode_v5_test_mass80to100","recoIDPho_pt15_30_40_200","ptDep",1)'
###
#############################################
############ VoigtErfExp3 : systematic for signal function
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID VoigtErfExp3 inputFile_v36_runningCode_v5_test v36 80 100
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_VoigtErfExp3_inputFile_v36_runningCode_v5_test_mass80to100.root")'
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID VoigtErfExp3 inputFile_v36_runningCode_v5_test v36 80 100
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_VoigtErfExp3_inputFile_v36_runningCode_v5_test_mass80to100.root")'
##recoIDPho_pt15_30_40_200
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp3_inputFile_v36_runningCode_v5_test_mass80to100","recoIDPho_pt15_30_40_200","ptDep",0)'
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp3_inputFile_v36_runningCode_v5_test_mass80to100","recoIDPho_pt15_30_40_200","ptDep",1)'
##
#
#############################################
############ VoigtErfExp4 : systematic for signal function
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID VoigtErfExp4 inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_VoigtErfExp4_inputFile_v36_runningCode_v5_test_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID VoigtErfExp4 inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_VoigtErfExp4_inputFile_v36_runningCode_v5_test_mass60to120.root")'
##recoIDPho_pt15_30_40_200
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp4_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",0)'
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp4_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",1)'
###
############################################
########### VoigtErfExp3 : systematic for signal function
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID VoigtErfExp3 inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_VoigtErfExp3_inputFile_v36_runningCode_v5_test_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID VoigtErfExp3 inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_VoigtErfExp3_inputFile_v36_runningCode_v5_test_mass60to120.root")'
##recoIDPho_pt15_30_40_200
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp3_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",0)'
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp3_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",1)'
##
#
############################################
########### VoigtErfExp2 : systematic for signal function
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID VoigtErfExp2 inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_VoigtErfExp2_inputFile_v36_runningCode_v5_test_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID VoigtErfExp2 inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_VoigtErfExp2_inputFile_v36_runningCode_v5_test_mass60to120.root")'
##recoIDPho_pt15_30_40_200
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp2_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",0)'
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp2_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",1)'
##
#
############################################
########### VoigtErfExp : systematic for signal function
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID VoigtErfExp inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_VoigtErfExp_inputFile_v36_runningCode_v5_test_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID VoigtErfExp inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_VoigtErfExp_inputFile_v36_runningCode_v5_test_mass60to120.root")'
##recoIDPho_pt15_30_40_200
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",0)'
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",1)'
#
############################################
########### VoigtErfExp : systematic for signal function
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID VoigtErfExp inputFile_v36_runningCode_v5_test v36 80 100
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_VoigtErfExp_inputFile_v36_runningCode_v5_test_mass80to100.root")'
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID VoigtErfExp inputFile_v36_runningCode_v5_test v36 80 100
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_VoigtErfExp_inputFile_v36_runningCode_v5_test_mass80to100.root")'
##recoIDPho_pt15_30_40_200
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp_inputFile_v36_runningCode_v5_test_mass80to100","recoIDPho_pt15_30_40_200","ptDep",0)'
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp_inputFile_v36_runningCode_v5_test_mass80to100","recoIDPho_pt15_30_40_200","ptDep",1)'
#
############################################
########### VoigtErfExp : systematic for signal function
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID VoigtErfExp inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_VoigtErfExp_inputFile_v36_runningCode_v5_test_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID VoigtErfExp inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_VoigtErfExp_inputFile_v36_runningCode_v5_test_mass60to120.root")'
##recoIDPho_pt15_30_40_200
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",0)'
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_VoigtErfExp_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",1)'

##########################################
######### BWResCBErfExp5 : nominal
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID BWResCBErfExp5 inputFile_v36_runningCode_v5_test v36 80 100
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_BWResCBErfExp5_inputFile_v36_runningCode_v5_test_mass80to100.root")'
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID BWResCBErfExp5 inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_BWResCBErfExp5_inputFile_v36_runningCode_v5_test_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID BWResCBErfExp5 inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_BWResCBErfExp5_inputFile_v36_runningCode_v5_test_mass60to120.root")'
###recoIDPho_pt15_30_40_200
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp5_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",0)'
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp5_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",1)'
##recoIDPho_pt30_40
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp5_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt30_40","ptDep",0)'
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp5_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt30_40","ptDep",1)'

##########################################
########## BWResCBErfExp4 : nominal
##cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID BWResCBErfExp4 inputFile_v36_runningCode_v5_test v36 60 120
##root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_BWResCBErfExp4_inputFile_v36_runningCode_v5_test_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID BWResCBErfExp4 inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_BWResCBErfExp4_inputFile_v36_runningCode_v5_test_mass60to120.root")'
#recoIDPho_pt15_30_40_200
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp4_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",0)'
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp4_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",1)'
###recoIDPho_pt30_40
##root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp4_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt30_40","ptDep",0)'
##root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp4_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt30_40","ptDep",1)'


###########################################
########## BWResCBErfExp2 : nominal
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID BWResCBErfExp2 inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_BWResCBErfExp2_inputFile_v36_runningCode_v5_test_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID BWResCBErfExp2 inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_BWResCBErfExp2_inputFile_v36_runningCode_v5_test_mass60to120.root")'
##recoIDPho_pt15_30_40_200
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp2_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",0)'
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp2_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",1)'
###recoIDPho_pt30_40
##root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp2_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt30_40","ptDep",0)'
##root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp2_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt30_40","ptDep",1)'
#
###########################################
########## BWResCBErfExp : nominal
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py mc passID BWResCBErfExp inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_mc_pp_passID_BWResCBErfExp_inputFile_v36_runningCode_v5_test_mass60to120.root")'
#cmsRun yj_tp_photonRaa_pp_v5_test_passID_v36.py data passID BWResCBErfExp inputFile_v36_runningCode_v5_test v36 60 120
#root -l -b -q 'plot.C("outputTnPresult/New_tnp_Ana_data_pp_passID_BWResCBErfExp_inputFile_v36_runningCode_v5_test_mass60to120.root")'
##recoIDPho_pt15_30_40_200
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",0)'
#root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt15_30_40_200","ptDep",1)'
###recoIDPho_pt30_40
##root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt30_40","ptDep",0)'
##root -l -b -q 'TnPEffDraw_pp_onlyPt.C++("passID_BWResCBErfExp_inputFile_v36_runningCode_v5_test_mass60to120","recoIDPho_pt30_40","ptDep",1)'
