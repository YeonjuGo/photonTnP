import FWCore.ParameterSet.Config as cms

import sys
args =sys.argv[1:]
if len(args) < 8: 
    type = "pp"
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
    type = "pp"
    #type = args[1]
    dataOrMC = args[1]
    pass_str = args[2]
    PDFName = args[3]
    outputFilePrefix = args[4]
    inputfileversion = args[5]
    mass_i = args[6] 
    mass_f = args[7]
#print "Will run type ", type, " on ", dataOrMC, ", fit with", PDFName, " for ", pass_str, " input file version ", fileversion, ", output file name ", version, "mass range [", mass_i, "," ,mass_f, "]"

process = cms.Process("TagProbe")
process.load('FWCore.MessageService.MessageLogger_cfi')
process.source = cms.Source("EmptySource")
process.maxEvents = cms.untracked.PSet( input = cms.untracked.int32(1) )    

EFFICIENCYSET =cms.PSet(
        #recoIDPho_pt15_40_200 = cms.PSet(
        #    EfficiencyCategoryAndState = cms.vstring(pass_str,"true"),
        #    UnbinnedVariables = cms.vstring("diPhoMass","final_weight"),
        #    BinnedVariables = cms.PSet(
        #        probe_pt = cms.vdouble(15,40,200),
        #        probe_abseta = cms.vdouble(0.0, 1.44),
        #    ),
        # BinToPDFmap = cms.vstring(PDFName)
        #),
        recoIDPho_pt15_30_40_200 = cms.PSet(
            EfficiencyCategoryAndState = cms.vstring(pass_str,"true"),
            UnbinnedVariables = cms.vstring("diPhoMass","final_weight"),
            BinnedVariables = cms.PSet(
                probe_pt = cms.vdouble(15,30,40,200),
                probe_abseta = cms.vdouble(0.0, 1.44),
            ),
         BinToPDFmap = cms.vstring(PDFName)
        ),
        #recoIDPho_pt15_30_40_50_200 = cms.PSet(
        #    EfficiencyCategoryAndState = cms.vstring(pass_str,"true"),
        #    UnbinnedVariables = cms.vstring("diPhoMass","final_weight"),
        #    BinnedVariables = cms.PSet(
        #        probe_pt = cms.vdouble(15,30,40,50,200),
        #        probe_abseta = cms.vdouble(0.0, 1.44),
        #    ),
        # BinToPDFmap = cms.vstring(PDFName)
        #),
        #recoIDPho_pt15_40_200 = cms.PSet(
        #    EfficiencyCategoryAndState = cms.vstring(pass_str,"true"),
        #    UnbinnedVariables = cms.vstring("diPhoMass","final_weight"),
        #    BinnedVariables = cms.PSet(
        #        probe_pt = cms.vdouble(15,40,200),
        #        probe_abseta = cms.vdouble(0.0, 1.44),
        #    ),
        # BinToPDFmap = cms.vstring(PDFName)
        #),
)


process.tagProbeFitTreeAnalyzer = cms.EDAnalyzer("TagProbeFitTreeAnalyzer",
    # IO parameters:
    InputFileNames = cms.vstring("file:./inputTnPFiles/output_%s_pp_%s_%s.root" % (dataOrMC,inputfileversion,pass_str) ),
    #InputFileNames = cms.vstring("file:/afs/cern.ch/work/i/ikucher/TnP_EG/photonRaa/output_pp%s_allStats.root" % dataOrMC),
    InputDirectoryName = cms.string("phoTree"),
    InputTreeName = cms.string("fitter_tree"),
    OutputFileName = cms.string("outputTnPresult/New_tnp_Ana_%s_%s_%s_%s_%s_mass%sto%s.root" % ( dataOrMC, type, pass_str, PDFName, outputFilePrefix, mass_i, mass_f )),
    #numbrer of CPUs to use for fitting
    #NumCPU = cms.uint32(50),
    NumCPU = cms.uint32(25),
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
                         probe_pt               = cms.vstring("Probe p_{T}", "15.0", "200.0", "GeV/c"),
                         probe_eta              = cms.vstring("Probe #eta", "-1.44", "1.44", ""),
                         probe_abseta              = cms.vstring("Probe |#eta|", "0.0", "1.44", ""),
                         final_weight        = cms.vstring("weight", "-1.", "50.", "")
    ),
    # defines all the discrete variables of the probes available in the input tree and intended for use in the efficiency calculations
    Categories = cms.PSet(
            passID = cms.vstring("passID", "dummy[true=1,false=0]"),
            passISO = cms.vstring("passISO", "dummy[true=1,false=0]"),
            passL1 = cms.vstring("passL1", "dummy[true=1,false=0]"),
            passHLT = cms.vstring("passHLT", "dummy[true=1,false=0]"),
            passHLT_low = cms.vstring("passHLT_low", "dummy[true=1,false=0]")
    ),

    # defines all the PDFs that will be available for the efficiency calculations; uses RooFit's "factory" syntax;
    # each pdf needs to define "signal", "backgroundPass", "backgroundFail" pdfs, "efficiency[0.9,0,1]" and "signalFractionInPassing[0.9]" are used for initial values  
    PDFs = cms.PSet(
      CBExGaussCMSShape = cms.vstring(
          "RooCBExGaussShape::signalResPass(diPhoMass, meanP[0, -5., 5.], sigmaP[1.5, 1., 50.],alphaP[0.01, 0, 5], nP[.6, 0, 20], sigmaP_2[2, 1., 40.])",
          "RooCBExGaussShape::signalResFail(diPhoMass, meanF[0., -5., 5.], sigmaF[1.5, 1., 50.],alphaF[0.01, 0, 5], nF[.6, 0, 20], sigmaF_2[2, 1., 40.])",
          "ZGeneratorLineShape::signalPhy(diPhoMass)", ### NLO line shape
          "RooCMSShape::backgroundPass(diPhoMass, alphaPass[60.,50.,70.], betaPass[0.001, 0.,0.1], gammaPass[0.001, 0, 0.1], peakPass[90.0])",
          "RooCMSShape::backgroundFail(diPhoMass, alphaFail[60.,50.,70.], betaFail[0.001, 0.,0.1], gammaFail[0.001, 0, 0.1], peakFail[90.0])",
          "FCONV::signalPass(diPhoMass, signalPhy, signalResPass)",
          "FCONV::signalFail(diPhoMass, signalPhy, signalResFail)",     
          "efficiency[0.5,0,1]",
          "signalFractionInPassing[1.0]"     
          ),
      CBExGaussLinear = cms.vstring(
         "RooCBExGaussShape::signalResPass(diPhoMass, meanP[91, 85., 95.], sigmaP[1.5, 1., 50.],alphaP[0.01, 0, 5], nP[.6, 0, 20], sigmaP_2[2, 1., 40.])",
         "RooCBExGaussShape::signalResFail(diPhoMass, meanF[91, 85., 95.], sigmaF[1.5, 1., 50.],alphaF[0.01, 0, 5], nF[.6, 0, 20], sigmaF_2[2, 1., 40.])",
         "ZGeneratorLineShape::signalPhy(diPhoMass)", ### NLO line shape
         "Chebychev::backgroundPass(diPhoMass, c1p[0.1,-4,4])",
         "Chebychev::backgroundFail(diPhoMass, c1f[0.7,-5,5])",
         "FCONV::signalPass(diPhoMass, signalPhy, signalResPass)",
         "FCONV::signalFail(diPhoMass, signalPhy, signalResFail)",  
         "efficiency[0.9,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      VoigtGausLinear = cms.vstring(
         "Voigtian::voigt(diPhoMass, mean[91,85,95], width[3,1,10], sigma[3,1,10])",
         "Gaussian::gaus(diPhoMass, mp[80,75,105], wp[10,1,15])",
         "FCONV::signal(diPhoMass, voigt, gaus)",
         "Chebychev::backgroundPass(diPhoMass, c1p[0.1,-4,4])",
         "Chebychev::backgroundFail(diPhoMass, c1f[0.7,-5,5])",
         #"Exponential::backgroundPass(diPhoMass, lp[0,-5,5])",
         #"Exponential::backgroundFail(diPhoMass, lf[0,-5,5])",
         "efficiency[0.9,0.,1]",
         "signalFractionInPassing[0.9]",
         ),
      VoigtErfExp4 = cms.vstring(
         "Voigtian::signal(diPhoMass, mean[91,85,95], width[3,1,10], sigma[3,1,10])",
         "RooCMSShape::backgroundPass(diPhoMass, alphaPass[89.,60.,90.], betaPass[0.070, 0.0001,0.1], gammaPass[0.17, 0.05, 1.0], peakPass[90.0])",
         "RooCMSShape::backgroundFail(diPhoMass, alphaFail[90.,60.,90.], betaFail[0.083, 0.0001,0.05], gammaFail[0.10, 0.05, 0.1], peakFail[90.0])",
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
      VoiExp2 = cms.vstring(
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
      VoigtGaus = cms.vstring(
         "Voigtian::signal(diPhoMass, mean[91,85,95], width[3,1,10], sigma[3,1,10])",
         "Gaussian::backgroundPass(diPhoMass, mp[80,75,105], wp[10,1,15])",
         "Gaussian::backgroundFail(diPhoMass, mf[80,75,105], wf[15,1,25])",
         "efficiency[0.8,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      VoigtExp = cms.vstring(
         #v29_isoEff_exp3
         #"Voigtian::signal(diPhoMass, mean[91.0,90.0,91.4], width[3,1,10], sigma[3,1,10])",
         #v29_isoEff_exp2
         #"Voigtian::signal(diPhoMass, mean[91.2,91.0,91.4], width[3,1,10], sigma[3,1,10])",
         "Voigtian::signal(diPhoMass, mean[91,85,95], width[3,1,10], sigma[3,1,10])",
         #v29_isoEff_exp1
         #"Exponential::backgroundPass(diPhoMass, lp[-0.27,-1.0,1.0])",
         #"Exponential::backgroundFail(diPhoMass, lf[-0.086,-1.0,1.0])",
         "Exponential::backgroundPass(diPhoMass, lp[-0.27,-1.0,1.0])",
         "Exponential::backgroundFail(diPhoMass, lf[-0.086,-1.0,1.0])",
         "efficiency[0.9,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      VoigtCheb = cms.vstring(
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
         #"RooCMSShape::backgroundPass(diPhoMass, alphaPass[80.,50.,110.], betaPass[0.001, 0.,0.5], gammaPass[0.1, 0, 1], peakPass[90.0])",
         #"RooCMSShape::backgroundFail(diPhoMass, alphaFail[80.,50.,110.], betaFail[0.001, 0.,0.5], gammaFail[0.1, 0, 1], peakFail[95.0])",
         #bkgParVariation6
         "RooCMSShape::backgroundPass(diPhoMass, alphaPass[60.,50.,90.], betaPass[0.001, 0.,0.2], gammaPass[0.1, 0, 2.0], peakPass[90.0])",
         "RooCMSShape::backgroundFail(diPhoMass, alphaFail[60.,50.,90.], betaFail[0.001, 0.,0.2], gammaFail[0.1, 0, 2.0], peakFail[90.0])",
         #bkgParVariation6
         #"RooCMSShape::backgroundPass(diPhoMass, alphaPass[60.,50.,70.], betaPass[0.001, 0.,0.2], gammaPass[0.1, 0, 1.0], peakPass[90.0])",
         #"RooCMSShape::backgroundFail(diPhoMass, alphaFail[60.,50.,70.], betaFail[0.001, 0.,0.2], gammaFail[0.1, 0, 1.0], peakFail[90.0])",
         "efficiency[0.8,0.,1]",
         "signalFractionInPassing[0.9]"
         ),
      BWResCBGaus = cms.vstring(
         "BreitWigner::bw(diPhoMass, m0[91.2,81.2,101.2], width[2.495,1,10])",
         "RooCBShape::res(diPhoMass, peak[0], sigma[1.7,0.01,10], alpha[1.8,0,3], n[0.8,0,10])",
         "FCONV::signal(diPhoMass, bw, res)",
         "Gaussian::backgroundPass(diPhoMass, mp[80,75,105], wp[10,1,15])",
         "Gaussian::backgroundFail(diPhoMass, mf[80,75,105], wf[15,1,25])",
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
      BWResCBCheb = cms.vstring(
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
      
     ),
    # defines a set of efficiency calculations, what PDF to use for fitting and how to bin the data;
    # there will be a separate output directory for each calculation that includes a simultaneous fit, side band subtraction and counting. 
    Efficiencies = EFFICIENCYSET 
)

process.fitness = cms.Path(
    process.tagProbeFitTreeAnalyzer
)
