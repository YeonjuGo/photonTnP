import FWCore.ParameterSet.Config as cms

import sys
args =sys.argv[1:]
if len(args) < 8: 
    type = "pbpb"
    #dataOrMC = "mc"
    dataOrMC = "mc"
    #choose your pass mode among passID, passISO, passHLT, passHLT_low, passL1
    pass_str = "passISO"
    #choose your pdf here among VoigtExp, BWResCBExp, BWResCBCheb 
    PDFName = "CBExGaussLinear"
    #output file name
    outputFilePrefix = "v29_isoEff_scan"
    #input file name
    inputfileversion = "v29_isoEff"
    #mass range 
    mass_i = "60" 
    #mass range 
    mass_f = "110"
else: 
    type = "pbpb"
    #type = args[1]
    dataOrMC = args[1]
    pass_str = args[2]
    PDFName = args[3]
    outputFilePrefix= args[4]
    inputfileversion = args[5]
    mass_i = args[6] 
    mass_f = args[7]
#print "Will run type ", type, " on ", dataOrMC, ", fit with", PDFName, " for ", pass_str, " input file version ", inputfileversion, ", output file name ", version, "mass range [", mass_i, "," ,mass_f, "]"

process = cms.Process("TagProbe")
process.load('FWCore.MessageService.MessageLogger_cfi')
process.source = cms.Source("EmptySource")
process.maxEvents = cms.untracked.PSet( input = cms.untracked.int32(1) )    

EFFICIENCYSET =cms.PSet(
        recoIDPho_ptDep15_40_200_cent0_100 = cms.PSet(
            EfficiencyCategoryAndState = cms.vstring(pass_str,"true"),
            UnbinnedVariables = cms.vstring("diPhoMass","final_weight"),
            BinnedVariables = cms.PSet(
                probe_pt = cms.vdouble(15,40,200),
                centBin = cms.vdouble(0,200),
            ),
         BinToPDFmap = cms.vstring(PDFName)
        ),
        #recoIDPho_ptDep40_200_cent0_100 = cms.PSet(
        #    EfficiencyCategoryAndState = cms.vstring(pass_str,"true"),
        #    UnbinnedVariables = cms.vstring("diPhoMass","final_weight"),
        #    BinnedVariables = cms.PSet(
        #        probe_pt = cms.vdouble(40,200),
        #        centBin = cms.vdouble(0,200),
        #    ),
        # BinToPDFmap = cms.vstring(PDFName)
        #),
        #recoIDPho_ptDep15_30_40_200_cent0_100 = cms.PSet(
        #    EfficiencyCategoryAndState = cms.vstring(pass_str,"true"),
        #    UnbinnedVariables = cms.vstring("diPhoMass","final_weight"),
        #    BinnedVariables = cms.PSet(
        #        probe_pt = cms.vdouble(15,30,40,200),
        #        centBin = cms.vdouble(0,200),
        #    ),
        # BinToPDFmap = cms.vstring(PDFName)
        #),
        #recoIDPho_ptDep15_30_40_45_200_cent0_100 = cms.PSet(
        #    EfficiencyCategoryAndState = cms.vstring(pass_str,"true"),
        #    UnbinnedVariables = cms.vstring("diPhoMass","final_weight"),
        #    BinnedVariables = cms.PSet(
        #        probe_pt = cms.vdouble(15,30,40,45,200),
        #        centBin = cms.vdouble(0,200),
        #    ),
        # BinToPDFmap = cms.vstring(PDFName)
        #),
        #recoIDPho_pt15_200_centDep0_10_30_100 = cms.PSet(
        #    EfficiencyCategoryAndState = cms.vstring(pass_str,"true"),
        #    UnbinnedVariables = cms.vstring("diPhoMass","final_weight"),
        #    BinnedVariables = cms.PSet(
        #        probe_pt = cms.vdouble(15,200),
        #        centBin = cms.vdouble(0,20,60,200),
        #    ),
        # BinToPDFmap = cms.vstring(PDFName)
        #),
        #recoIDPho_ptDep15_30_35_40_45_50_200_cent0_100 = cms.PSet(
        #    EfficiencyCategoryAndState = cms.vstring(pass_str,"true"),
        #    UnbinnedVariables = cms.vstring("diPhoMass","final_weight"),
        #    BinnedVariables = cms.PSet(
        #        probe_pt = cms.vdouble(15,30,35,40,45,50,200),
        #        centBin = cms.vdouble(0,200),
        #    ),
        # BinToPDFmap = cms.vstring(PDFName)
        #),
        #recoIDPho_ptDep15_30_40_45_200_cent0_100 = cms.PSet(
        #    EfficiencyCategoryAndState = cms.vstring(pass_str,"true"),
        #    UnbinnedVariables = cms.vstring("diPhoMass","final_weight"),
        #    BinnedVariables = cms.PSet(
        #        probe_pt = cms.vdouble(15,30,40,45,200),
        #        centBin = cms.vdouble(0,200),
        #    ),
        # BinToPDFmap = cms.vstring(PDFName)
        #),
        #recoIDPho_ptDep15_40_200_cent0_10 = cms.PSet(
        #    EfficiencyCategoryAndState = cms.vstring(pass_str,"true"),
        #    UnbinnedVariables = cms.vstring("diPhoMass","final_weight"),
        #    BinnedVariables = cms.PSet(
        #        probe_pt = cms.vdouble(15,40,200),
        #        centBin = cms.vdouble(0,20),
        #    ),
        # BinToPDFmap = cms.vstring(PDFName)
        #),
        #recoIDPho_ptDep15_40_200_cent10_100 = cms.PSet(
        #    EfficiencyCategoryAndState = cms.vstring(pass_str,"true"),
        #    UnbinnedVariables = cms.vstring("diPhoMass","final_weight"),
        #    BinnedVariables = cms.PSet(
        #        probe_pt = cms.vdouble(15,40,200),
        #        centBin = cms.vdouble(10,100),
        #    ),
        # BinToPDFmap = cms.vstring(PDFName)
        #),
)


process.tagProbeFitTreeAnalyzer = cms.EDAnalyzer("TagProbeFitTreeAnalyzer",
    # IO parameters:
    InputFileNames = cms.vstring("file:./inputTnPFiles/output_%s_PbPb_%s_%s.root" % (dataOrMC,inputfileversion,pass_str) ),
    #InputFileNames = cms.vstring("file:/afs/cern.ch/work/i/ikucher/TnP_EG/photonRaa/output_pp%s_allStats.root" % dataOrMC),
    InputDirectoryName = cms.string("phoTree"),
    InputTreeName = cms.string("fitter_tree"),
    OutputFileName = cms.string("outputTnPresult/New_tnp_Ana_%s_%s_%s_%s_%s_mass%sto%s.root" % ( dataOrMC, type, pass_str, PDFName, outputFilePrefix, mass_i, mass_f)),
    #numbrer of CPUs to use for fitting
    NumCPU = cms.uint32(20),
    #NumCPU = cms.uint32(25),
    # specifies whether to save the RooWorkspace containing the data for each bin and
    # the pdf object with the initial and final state snapshots
    binnedFit = cms.bool(False),
    #binsForFit = cms.uint32(25),
    binsForFit = cms.uint32(30),
    binsForMassPlots = cms.uint32(30),
    SaveWorkspace = cms.bool(False),
    WeightVariable = cms.string("final_weight"),
    
    # defines all the real variables of the probes available in the input tree and intended for use in the efficiencies
    Variables = cms.PSet(
                         diPhoMass           = cms.vstring("dipho Mass", mass_i, mass_f, "GeV/c^{2}"), 
                         probe_pt            = cms.vstring("Probe p_{T}", "15.0", "200.0", "GeV/c"),
                         probe_eta           = cms.vstring("Probe #eta", "-1.44", "1.44", ""),
                         probe_abseta        = cms.vstring("Probe |#eta|", "0.0", "1.44", ""),
                         centBin             = cms.vstring("centr", "0", "200", ""),
                         final_weight        = cms.vstring("weight", "-1.", "50.", "")
    ),
    # defines all the discrete variables of the probes available in the input tree and intended for use in the efficiency calculations
    Categories = cms.PSet(
            passID = cms.vstring("passID", "dummy[true=1,false=0]"),
            passISO = cms.vstring("passISO", "dummy[true=1,false=0]"),
            #passL1 = cms.vstring("passL1", "dummy[true=1,false=0]"),
            passHLT = cms.vstring("passHLT", "dummy[true=1,false=0]"),
            #passHLT_low = cms.vstring("passHLT_low", "dummy[true=1,false=0]")
    ),

    # defines all the PDFs that will be available for the efficiency calculations; uses RooFit's "factory" syntax;
    # each pdf needs to define "signal", "backgroundPass", "backgroundFail" pdfs, "efficiency[0.9,0,1]" and "signalFractionInPassing[0.9]" are used for initial values  
    PDFs = cms.PSet(
      VoigtErfExp8 = cms.vstring(
         "Voigtian::signal(diPhoMass, mean[91,85,95], width[3,1,10], sigma[3,1,10])",
         "RooCMSShape::backgroundPass(diPhoMass, alphaPass[89.,60.,90.], betaPass[0.070, 0.0001,0.1], gammaPass[0.17, 0.05, 1.0], peakPass[90.0])",
         "RooCMSShape::backgroundFail(diPhoMass, alphaFail[90.], betaFail[0.092, 0.08,0.1], gammaFail[0.06, 0.07, 0.05], peakFail[90.0])",
         "efficiency[0.9,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      VoigtErfExp7 = cms.vstring(
         "Voigtian::signal(diPhoMass, mean[91,85,95], width[3,1,10], sigma[3,1,10])",
         "RooCMSShape::backgroundPass(diPhoMass, alphaPass[85.,80.,90.], betaPass[0.155, 0.10,0.20], gammaPass[0.2, 0.15, 0.30], peakPass[90.0])",
         "RooCMSShape::backgroundFail(diPhoMass, alphaFail[83.,80.,86.], betaFail[0.155, 0.10,0.20], gammaFail[0.2, 0.15, 0.30], peakFail[90.0])",
         "efficiency[0.9,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      VoigtErfExp6 = cms.vstring(
         "Voigtian::signal(diPhoMass, mean[91,85,95], width[3,1,10], sigma[3,1,10])",
         "RooCMSShape::backgroundPass(diPhoMass, alphaPass[60.,50.,90.], betaPass[0.001, 0.,0.1], gammaPass[0.1, 0, 2.0], peakPass[90.0])",
         "RooCMSShape::backgroundFail(diPhoMass, alphaFail[83.,80.,86.], betaFail[0.155, 0.10,0.20], gammaFail[0.2, 0.15, 0.30], peakFail[90.0])",
         "efficiency[0.9,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      VoigtErfExp5 = cms.vstring(
         "Voigtian::signal(diPhoMass, mean[91,85,95], width[3,1,10], sigma[3,1,10])",
         "RooCMSShape::backgroundPass(diPhoMass, alphaPass[89.,60.,90.], betaPass[0.070, 0.0001,0.1], gammaPass[0.17, 0.05, 1.0], peakPass[90.0])",
         "RooCMSShape::backgroundFail(diPhoMass, alphaFail[90.], betaFail[0.083, 0.05,0.1], gammaFail[0.22, 0.05, 2.0], peakFail[90.0])",
         "efficiency[0.9,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      VoigtErfExp4 = cms.vstring(
         "Voigtian::signal(diPhoMass, mean[91,85,95], width[3,1,10], sigma[3,1,10])",
         "RooCMSShape::backgroundPass(diPhoMass, alphaPass[89.,60.,90.], betaPass[0.070, 0.0001,0.1], gammaPass[0.17, 0.05, 1.0], peakPass[90.0])",
         "RooCMSShape::backgroundFail(diPhoMass, alphaFail[90.,60.,90.], betaFail[0.083, 0.01,0.1], gammaFail[0.22, 0.05, 1.0], peakFail[90.0])",
         "efficiency[0.9,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      VoigtErfExp3 = cms.vstring(
         "Voigtian::signal(diPhoMass, mean[91,85,95], width[3,1,10], sigma[3,1,10])",
         "RooCMSShape::backgroundPass(diPhoMass, alphaPass[89.,60.,90.], betaPass[0.070, 0.0001,0.1], gammaPass[0.17, 0.05, 1.0], peakPass[90.0])",
         "RooCMSShape::backgroundFail(diPhoMass, alphaFail[90.,60.,90.], betaFail[0.083, 0.0001,0.1], gammaFail[0.22, 0.05, 1.0], peakFail[90.0])",
         "efficiency[0.9,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      VoigtErfExp2 = cms.vstring(
         "Voigtian::signal(diPhoMass, mean[91,85,95], width[3,1,10], sigma[3,1,10])",
         "RooCMSShape::backgroundPass(diPhoMass, alphaPass[60.,50.,90.], betaPass[0.001, 0.,0.1], gammaPass[0.1, 0, 1.0], peakPass[90.0])",
         "RooCMSShape::backgroundFail(diPhoMass, alphaFail[60.,50.,90.], betaFail[0.001, 0.,0.1], gammaFail[0.1, 0, 1.0], peakFail[90.0])",
         "efficiency[0.9,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      VoigtErfExp = cms.vstring(
         "Voigtian::signal(diPhoMass, mean[91,85,95], width[3,1,10], sigma[3,1,10])",
         "RooCMSShape::backgroundPass(diPhoMass, alphaPass[60.,50.,90.], betaPass[0.001, 0.,0.2], gammaPass[0.1, 0, 2.0], peakPass[90.0])",
         "RooCMSShape::backgroundFail(diPhoMass, alphaFail[60.,50.,90.], betaFail[0.001, 0.,0.2], gammaFail[0.1, 0, 2.0], peakFail[90.0])",
         "efficiency[0.9,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      VoigtExp3 = cms.vstring(
         "Voigtian::signal(diPhoMass, mean[91,85,95], width[3,0.1,10], sigma[3,1,10])",
         "Exponential::backgroundPass(diPhoMass, lp[-0.27,-1.0,1.0])",
         "Exponential::backgroundFail(diPhoMass, lf[-0.182,-0.4,-0.1])",
         "efficiency[0.9,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      VoigtExp2 = cms.vstring(
         "Voigtian::signal(diPhoMass, mean[91,85,95], width[3,0.1,10], sigma[3,1,10])",
         "Exponential::backgroundPass(diPhoMass, lp[-0.27,-1.0,1.0])",
         "Exponential::backgroundFail(diPhoMass, lf[-0.082,-0.2,0.1])",
         "efficiency[0.9,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      VoigtExp = cms.vstring(
         #v29_isoEff_exp3
         #"Voigtian::signal(diPhoMass, mean[91.0,90.0,91.4], width[3,1,10], sigma[3,1,10])",
         #v29_isoEff_exp2
         #"Voigtian::signal(diPhoMass, mean[91.2,91.0,91.4], width[3,1,10], sigma[3,1,10])",
         "Voigtian::signal(diPhoMass, mean[91,85,95], width[3,0.1,10], sigma[3,1,10])",
         #v29_isoEff_exp1
         #"Exponential::backgroundPass(diPhoMass, lp[-0.27,-1.0,1.0])",
         #"Exponential::backgroundFail(diPhoMass, lf[-0.086,-1.0,1.0])",
         "Exponential::backgroundPass(diPhoMass, lp[-0.27,-1.0,1.0])",
         "Exponential::backgroundFail(diPhoMass, lf[-0.086,-2.0,1.0])",
         "efficiency[0.9,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      VoigtCheb1 = cms.vstring(
         "Voigtian::signal(diPhoMass, mean[91,85,95], width[3.2,0.8,8], sigma[2.4,1.1,10])",
         "Chebychev::backgroundPass(diPhoMass, {c1p[0.1,-4,4]})",
         "Chebychev::backgroundFail(diPhoMass, {c1f[0.7,-5,5]})",
         "efficiency[0.9,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      VoigtCheb2 = cms.vstring(
         "Voigtian::signal(diPhoMass, mean[91,85,95], width[3.2,0.8,8], sigma[2.4,1.1,10])",
         "Chebychev::backgroundPass(diPhoMass, {c1p[0.1,-4,4], c2p[0.1,-5,5]})",
         "Chebychev::backgroundFail(diPhoMass, {c1f[0.7,-5,5], c2f[-0.1,-5,5]})",
         "efficiency[0.9,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      VoigtCheb3 = cms.vstring(
         "Voigtian::signal(diPhoMass, mean[91,85,95], width[3.2,0.8,8], sigma[2.4,1.1,10])",
         "Chebychev::backgroundPass(diPhoMass, {c1p[0.1,-4,4], c2p[0.1,-5,5],c3p[0.1,-4,4]})",
         "Chebychev::backgroundFail(diPhoMass, {c1f[0.7,-5,5], c2f[-0.1,-5,5],c3f[-0.11,-4,4]})",
         "efficiency[0.9,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      VoigtCheb4 = cms.vstring(
         "Voigtian::signal(diPhoMass, mean[91,85,95], width[3.2,0.8,8], sigma[2.4,1.1,10])",
         "Chebychev::backgroundPass(diPhoMass, {c1p[0.1,-4,4], c2p[0.1,-5,5],c3p[0.1,-4,4],c4p[0.1,-4,4]})",
         "Chebychev::backgroundFail(diPhoMass, {c1f[0.7,-5,5], c2f[-0.1,-5,5],c3f[-0.11,-4,4],c4f[-0.11,-4,4]})",
         "efficiency[0.9,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      BWResCBErfExp6 = cms.vstring(
         "BreitWigner::bw(diPhoMass, m0[91.2,81.2,101.2], width[2.495,1,10])",
         "RooCBShape::res(diPhoMass, peak[0], sigma[1.7,0.01,10], alpha[1.8,0,3], n[0.8,0,10])",
         "FCONV::signal(diPhoMass, bw, res)",
         "RooCMSShape::backgroundPass(diPhoMass, alphaPass[60.,50.,90.], betaPass[0.001, 0.,0.1], gammaPass[0.1, 0, 2.0], peakPass[90.0])",
         "RooCMSShape::backgroundFail(diPhoMass, alphaFail[83.,80.,86.], betaFail[0.155, 0.10,0.20], gammaFail[0.2, 0.15, 0.30], peakFail[90.0])",
         "efficiency[0.8,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      BWResCBErfExp5 = cms.vstring(
         "BreitWigner::bw(diPhoMass, m0[91.2,81.2,101.2], width[2.495,1,10])",
         "RooCBShape::res(diPhoMass, peak[0], sigma[1.7,0.01,10], alpha[1.8,0,3], n[0.8,0,10])",
         "FCONV::signal(diPhoMass, bw, res)",
         "RooCMSShape::backgroundPass(diPhoMass, alphaPass[60.,50.,90.], betaPass[0.001, 0.,0.1], gammaPass[0.1, 0, 2.0], peakPass[90.0])",
         "RooCMSShape::backgroundFail(diPhoMass, alphaFail[66.,50.,90.], betaFail[0.001, 0.,0.2], gammaFail[0.1, 0, 0.3], peakFail[90.0])",
         "efficiency[0.8,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      BWResCBErfExp4 = cms.vstring(
         "BreitWigner::bw(diPhoMass, m0[91.2,81.2,101.2], width[2.495,1,10])",
         "RooCBShape::res(diPhoMass, peak[0], sigma[1.7,0.01,10], alpha[1.8,0,3], n[0.8,0,10])",
         "FCONV::signal(diPhoMass, bw, res)",
         "RooCMSShape::backgroundPass(diPhoMass, alphaPass[60.,50.,90.], betaPass[0.001, 0.,0.1], gammaPass[0.1, 0, 2.0], peakPass[90.0])",
         "RooCMSShape::backgroundFail(diPhoMass, alphaFail[60.,50.,90.], betaFail[0.001, 0.,0.05], gammaFail[0.1, 0, 0.2], peakFail[90.0])",
         "efficiency[0.8,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      BWResCBErfExp3 = cms.vstring(
         "BreitWigner::bw(diPhoMass, m0[91.2,81.2,101.2], width[2.495,1,10])",
         "RooCBShape::res(diPhoMass, peak[0], sigma[1.7,0.01,10], alpha[1.8,0,3], n[0.8,0,10])",
         "FCONV::signal(diPhoMass, bw, res)",
         "RooCMSShape::backgroundPass(diPhoMass, alphaPass[60.,50.,90.], betaPass[0.001, 0.,0.01], gammaPass[0.1, 0, 2.0], peakPass[90.0])",
         "RooCMSShape::backgroundFail(diPhoMass, alphaFail[60.,50.,90.], betaFail[0.001, 0.,0.01], gammaFail[0.1, 0, 2.0], peakFail[90.0])",
         "efficiency[0.8,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      BWResCBErfExp2 = cms.vstring(
         "BreitWigner::bw(diPhoMass, m0[91.2,81.2,101.2], width[2.495,1,10])",
         "RooCBShape::res(diPhoMass, peak[0], sigma[1.7,0.01,10], alpha[1.8,0,3], n[0.8,0,10])",
         "FCONV::signal(diPhoMass, bw, res)",
         "RooCMSShape::backgroundPass(diPhoMass, alphaPass[60.,50.,90.], betaPass[0.001, 0.,0.1], gammaPass[0.1, 0, 2.0], peakPass[90.0])",
         "RooCMSShape::backgroundFail(diPhoMass, alphaFail[60.,50.,90.], betaFail[0.001, 0.,0.1], gammaFail[0.1, 0, 2.0], peakFail[90.0])",
         "efficiency[0.8,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      BWResCBErfExp = cms.vstring(
         "BreitWigner::bw(diPhoMass, m0[91.2,81.2,101.2], width[2.495,1,10])",
         "RooCBShape::res(diPhoMass, peak[0], sigma[1.7,0.01,10], alpha[1.8,0,3], n[0.8,0,10])",
         "FCONV::signal(diPhoMass, bw, res)",
         "RooCMSShape::backgroundPass(diPhoMass, alphaPass[60.,50.,90.], betaPass[0.001, 0.,0.2], gammaPass[0.1, 0, 2.0], peakPass[90.0])",
         "RooCMSShape::backgroundFail(diPhoMass, alphaFail[60.,50.,90.], betaFail[0.001, 0.,0.2], gammaFail[0.1, 0, 2.0], peakFail[90.0])",
         "efficiency[0.8,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      BWResCBExp = cms.vstring(
         "BreitWigner::bw(diPhoMass, m0[91.2,81.2,101.2], width[2.495,1,10])",
         "RooCBShape::res(diPhoMass, peak[0], sigma[1.7,0.01,10], alpha[1.8,0,3], n[0.8,0,10])",
         "FCONV::signal(diPhoMass, bw, res)",
         "Exponential::backgroundPass(diPhoMass, lp[0,-5,5])",
         "Exponential::backgroundFail(diPhoMass, lf[0,-5,5])",
         "efficiency[0.9,0.,1]",
         "signalFractionInPassing[0.9]",
         ),
      BWResCBCheb3 = cms.vstring(
         "BreitWigner::bw(diPhoMass, m0[91.2,81.2,101.2], width[2.495,1,10])",
         "RooCBShape::res(diPhoMass, peak[0], sigma[1.28,0.01,10], alpha[1.22,0.5,3.6], n[2.0,0.5,4.0])",
         "FCONV::signal(diPhoMass, bw, res)",
         "Chebychev::backgroundPass(diPhoMass, {c1p[-0.1,-3,3], c2p[-0.1,-4,4],c3p[0.1,-3,3]})",
         "Chebychev::backgroundFail(diPhoMass, {c1f[-0.7,-5,5], c2f[-0.1,-5,5],c3f[0.1,-3,3]})",
         #"Chebychev::backgroundPass(diPhoMass, {c1p[0,-10,10], c2p[0,-10,10], c3p[0,-10,10]})",
         #"Chebychev::backgroundFail(diPhoMass, {c1f[-0.7,-10,10], c2f[0,-10,10], c3f[0,-10,10]})",
         "efficiency[0.75,0.,1]",
         "signalFractionInPassing[0.9]",
         ),
      BWResCBCheb2 = cms.vstring(
         "BreitWigner::bw(diPhoMass, m0[91.2,81.2,101.2], width[2.495,1,10])",
         "RooCBShape::res(diPhoMass, peak[0], sigma[1.28,0.01,10], alpha[1.22,0.5,3.6], n[2.0,0.5,4.0])",
         "FCONV::signal(diPhoMass, bw, res)",
         "Chebychev::backgroundPass(diPhoMass, {c1p[-0.1,-3,3], c2p[-0.1,-4,4]})",
         "Chebychev::backgroundFail(diPhoMass, {c1f[-0.7,-5,5], c2f[-0.1,-5,5]})",
         "efficiency[0.75,0.,1]",
         "signalFractionInPassing[0.9]",
         ),
      BWResCBCheb1 = cms.vstring(
         "BreitWigner::bw(diPhoMass, m0[91.2,81.2,101.2], width[2.495,1,10])",
         "RooCBShape::res(diPhoMass, peak[0], sigma[1.28,0.01,10], alpha[1.22,0.5,3.6], n[2.0,0.5,4.0])",
         "FCONV::signal(diPhoMass, bw, res)",
         "Chebychev::backgroundPass(diPhoMass, {c1p[-0.1,-3,3]})",
         "Chebychev::backgroundFail(diPhoMass, {c1f[-0.7,-5,5]})",
         "efficiency[0.75,0.,1]",
         "signalFractionInPassing[0.9]",
         ),
      
     ),
    # defines a set of efficiency calculations, what PDF to use for fitting and how to bin the data;
    # there will be a separate output directory for each calculation that includes a simultaneous fit, side band subtraction and counting. 
    Efficiencies = EFFICIENCYSET 
)

process.fitness = cms.Path(
    process.tagProbeFitTreeAnalyzer
)
