#include <iostream>
#include <fstream>
#include <sstream>
#include <string.h>

#include "TSystem.h"
#include "TTree.h"
#include "TKey.h"
#include "TH1.h"
#include "TH2.h"
#include "TPave.h"
#include "TText.h"

#include "TROOT.h"
#include "TFile.h"
#include "TGraphAsymmErrors.h"
#include "TCanvas.h"
#include "TLegend.h"
#include "TF1.h"

#include "RooFit.h"
#include "RooRealVar.h"
#include "RooDataSet.h"
#include "RooArgSet.h"

#include "TStyle.h"
#include "TLatex.h"
#include "TDirectory.h"
#include "TCollection.h"
#include "TPostScript.h"
#include "TMath.h"

#include "toyStudy.h"

using namespace RooFit;
using namespace std;

/////////////////////////////////////////////////
//              P A R A M E T E R S            //
/////////////////////////////////////////////////

// pp or PbPb?
bool isPbPb = false;
TString collTag = "pp"; // isPbPb ? "PbPb" : "pp";

// do the toy study for the correction factors?
bool doToys = false;

//////////////////////////////////////////////////////////////////////////

// Automatic parameters (shouldn't require modification by the user)
const int nAbsEtaBins = 1;
TString cutTag("phoTree"); 
TString allTag("recoIDPho_1bin");
TString ptTag("recoIDPho_pt");
TString etaTag("recoIDPho_abseta");
TString etaPtTag("recoIDPho_pt_abseta");
TString centPtTag("recoIDPho_pt_cent");
TString centVar("centBin");
TString etaVar("probe_abseta");
TString ptVar("probe_pt");

const double effmin = 0.;
const double sfrange = 0.15;

// Function Define
TH2F *plotEff2D(RooDataSet *a, TString b, const char* varx, const char* vary);
vector<TGraphAsymmErrors*> plotEff_Nbins(RooDataSet *a, int aa, const char* varx, const char* var2);
TGraphAsymmErrors *plotEff_1bin(RooDataSet *a, int aa, const char* varx);
void formatTH1F(TH1* a, int b, int c, int d);
void formatTGraph(TGraph* a, int b, int c, int d);
void formatTLeg(TLegend* a);
void CalEffErr(TGraph *a, double *b);
void CalEffErr(vector<TGraphAsymmErrors*> a, double **b);

// From here you need to set up your environments.
//void TnPEffDraw_pp_onlyPt(TString mode="ISO", TString func="BWResCBCheb", TString ver="v8") {
//void TnPEffDraw_pp_onlyPt(TString inputPrefix="passISO_VoigtErfExp_recoIDPho_v29_isoEff_diPhoMass_mass60to110_pt15to200_binsForFit30_isoEff") {
void TnPEffDraw_pp_onlyPt(TString inputPrefix="passISO_VoigtErfExp_recoIDPho_v29_isoEff_peakPass90_peakFail65_mass70to110_pt15to200_binsForFit30_isoEff", TString inputTag="recoIDPho_pt", TString st_dep = "ptDep", bool isCntEff=false) {

    TString path = "/u/user/goyeonju/PRODUCTION/CMSSW_10_3_3_patch1_TnP/src/PhysicsTools/TagAndProbe/test/outputTnPresult/";

    const char* fDataName = Form("%sNew_tnp_Ana_data_pp_%s.root",path.Data(),inputPrefix.Data());
    const char* fMCName =  Form("%sNew_tnp_Ana_mc_pp_%s.root",path.Data(),inputPrefix.Data());
    TString fout_name = Form("correction_functions_pp_%s_%s_%s.txt",st_dep.Data(), inputPrefix.Data(),inputTag.Data());
    if(isCntEff) fout_name = Form("correction_functions_pp_%s_%s_%s_cntEff.txt",st_dep.Data(), inputPrefix.Data(),inputTag.Data());
    ofstream file_sfs(Form("./outputSF/%s",fout_name.Data()));

    // gROOT->Macro("~/logon.C");
    gROOT->SetStyle("Plain");
    gStyle->SetOptStat(0);
    gStyle->SetTitle(0);
    gStyle->SetPadLeftMargin(0.11);
    gStyle->SetPadBottomMargin(0.13);
    gStyle->SetTitleYOffset(1.0);


    cout << "here1 "<<endl;
    //data and MC root files as well as single bin for integrated efficiency
    TFile *f9 = new TFile(fMCName);
    TFile *f10 = new TFile(fDataName);

    cout << "Set RooDataSets for DATA and MC"<<endl;
    TString st_efftype = "fit_eff";
    if(isCntEff) st_efftype = "cnt_eff";
    RooDataSet *daPtData0 = (RooDataSet*)f9->Get(cutTag + "/" + inputTag + "/" + st_efftype); 
    RooDataSet *daPtData1 = (RooDataSet*)f10->Get(cutTag + "/" + inputTag + "/" + st_efftype); 
    cout << "here2.1 "<<endl;
    TGraphAsymmErrors *ComPt0 = plotEff_1bin(daPtData0, 1, "probe_pt");
    TGraphAsymmErrors *ComPt1 = plotEff_1bin(daPtData1, 1, "probe_pt");

    cout << "here3.1 "<<endl;
    ComPt0->SetMarkerStyle(20);
    ComPt0->SetMarkerSize(1.4);
    ComPt0->SetMarkerColor(kRed+1);
    ComPt0->SetLineColor(kRed+1);
    ComPt1->SetMarkerStyle(25);
    ComPt1->SetMarkerSize(1.4);
    ComPt1->SetMarkerColor(kBlue+1);
    ComPt1->SetLineColor(kBlue+1);
    cout << "here4 "<<endl;

    TCanvas *c1 = new TCanvas("c1","",700,600);
    c1->cd();
    TPad *pad1 = new TPad("pad1","pad1",0, 0.26 ,1,1);
    c1->cd();
    TPad *pad2 = new TPad("pad2","pad2",0,0,1,0.3*0.96);
    pad1->SetBottomMargin(0.04);
    pad2->SetTopMargin(0);
    pad2->SetFillColor(0);
    pad2->SetFillStyle(0);
    pad2->SetBottomMargin(gStyle->GetPadBottomMargin()/0.3);
    pad1->SetTopMargin(gStyle->GetPadTopMargin()/0.7);
    // pad2->SetGridy();
    pad1->Draw();
    pad1->cd();

    TH1F *hPad = new TH1F("hPad",Form(";E_{T}^{#gamma} [GeV];%sEfficiency",""),5,20,200);
    TH1F *hPad1 = new TH1F("hPad1",Form(";E_{T}^{#gamma} [GeV];%sEfficiency",""),10,20,200);
    hPad->GetXaxis()->CenterTitle();
    hPad1->GetXaxis()->CenterTitle();
    hPad->GetXaxis()->SetLabelSize(0.);
    hPad->GetXaxis()->SetTitleSize(0.);
    hPad->GetXaxis()->SetTitleOffset(1.2);
    hPad->GetYaxis()->SetLabelSize(0.05);
    hPad->GetYaxis()->SetTitleSize(0.05);
    hPad->GetYaxis()->SetTitleOffset(1.);
    hPad1->GetXaxis()->SetLabelSize(0.);
    hPad1->GetXaxis()->SetTitleSize(0.);
    hPad1->GetXaxis()->SetTitleOffset(1.2);
    hPad1->GetYaxis()->SetLabelSize(0.05);
    hPad1->GetYaxis()->SetTitleSize(0.05);
    hPad1->GetYaxis()->SetTitleOffset(1.);


    hPad->GetYaxis()->SetRangeUser(effmin,1.05);
    hPad1->GetYaxis()->SetRangeUser(effmin,1.05);

    pad2->cd();
    pad2->SetGridy();
    double tsize = (1./0.36)*hPad->GetYaxis()->GetTitleSize(); // 1./0.36
    TH1F *hPadr = (TH1F*) hPad->Clone("hPadr"); hPadr->GetYaxis()->SetRangeUser(1.-sfrange,1.+sfrange);
    hPadr->GetYaxis()->SetTitle("SF");
    hPadr->GetXaxis()->SetTitleSize(tsize);
    hPadr->GetXaxis()->SetLabelSize(tsize);
    hPadr->GetYaxis()->SetTitleSize(tsize);
    hPadr->GetYaxis()->SetLabelSize(tsize);
    hPadr->GetYaxis()->SetNdivisions(504,kTRUE);
    TH1F *hPad1r = (TH1F*) hPad1->Clone("hPad1r"); hPad1r->GetYaxis()->SetRangeUser(1.-sfrange,1.+sfrange);
    hPad1r->GetYaxis()->SetTitle("SF");
    hPad1r->GetYaxis()->CenterTitle(true);
    hPad1r->GetXaxis()->CenterTitle(true);
    hPad1r->GetYaxis()->SetTitleOffset(hPad1r->GetTitleOffset("Y")*0.33);
    hPad1r->GetXaxis()->SetTitleSize(tsize);
    hPad1r->GetXaxis()->SetLabelSize(tsize);
    hPad1r->GetYaxis()->SetTitleSize(tsize);
    hPad1r->GetYaxis()->SetLabelSize(tsize);
    hPad1r->GetYaxis()->SetNdivisions(504,kTRUE);

    pad1->cd();

    //---------- This is for pt dependence
    pad1->cd();
    hPad1->Draw();

    ComPt0->Draw("pz same");
    ComPt1->Draw("pz same");

    float xpos = 0.43;
    float ypos = 0.60;
    float dy = 0.06;
    cout << "here6 "<<endl;
    TLatex *lt2 = new TLatex();
    lt2->SetNDC();
    char legs2[512];
    TLegend *leg2 = new TLegend(0.43,0.15,0.88,0.33);
    leg2->SetFillStyle(0);
    leg2->SetFillColor(0);
    leg2->SetBorderSize(0);
    leg2->SetTextSize(0.045);
    //leg2->SetHeader(TString("#splitline{") + " Efficiency}{(#eta #in [0,1.44])}");
    sprintf(legs2,"MC");
    //sprintf(legs2,"MC STARLIGHT: %.4f^{ + %.3f}_{ - %.3f}", Trk0[0], Trk0[1], Trk0[2]);
    leg2->AddEntry(ComPt0,legs2,"pl");
    sprintf(legs2,"data");
    leg2->AddEntry(ComPt1,legs2,"pl");
    leg2->Draw("same");
    leg2->Draw("same");

    lt2->SetTextSize(0.05);
    lt2->DrawLatex(xpos,ypos,"CMS Preliminary");
    lt2->DrawLatex(xpos,ypos-dy,collTag + "  #sqrt{s_{NN}} = 5.02 TeV");
    lt2->DrawLatex(xpos,ypos-2.5*dy,"#font[42]{|#eta^{#gamma}| < 1.44}");
    //lt2->DrawLatex(xpos,ypos-3.5*dy,"#font[42]{Centrality 0-100 %}");
    //lt2->DrawLatex(0.43,0.60,"CMS Preliminary");
    //lt2->DrawLatex(0.43,0.54,collTag + "  #sqrt{s_{NN}} = 5.02 TeV");

    // now take care of the data/mc ratio panel
    c1->cd();
    // pad2->SetFrameFillStyle(4000);
    pad2->Draw();
    pad2->cd();
    hPad1r->Draw();

    cout << "here7 "<<endl;
    int nbins_pt = ComPt0->GetN();
    double *xr_pt = new double[nbins_pt];
    double *yr_pt = new double[nbins_pt];
    double *xrlo_pt = new double[nbins_pt];
    double *yrlo_pt = new double[nbins_pt];
    double *xrhi_pt = new double[nbins_pt];
    double *yrhi_pt = new double[nbins_pt];

    // here we assume that the mc uncertainty is negligible compared to the data one: simply scale everything by the central value.
    for (int j=0; j<nbins_pt; j++)
    {
        xr_pt[j] = ComPt1->GetX()[j];
        xrlo_pt[j] = ComPt1->GetErrorXlow(j);
        xrhi_pt[j] = ComPt1->GetErrorXhigh(j);
        yr_pt[j] = ComPt1->GetY()[j]/ComPt0->GetY()[j];
        yrlo_pt[j] = ComPt1->GetErrorYlow(j)/ComPt0->GetY()[j];
        yrhi_pt[j] = ComPt1->GetErrorYhigh(j)/ComPt0->GetY()[j];
    }
    TGraphAsymmErrors *gratio2 = new TGraphAsymmErrors(nbins_pt,xr_pt,yr_pt,xrlo_pt,xrhi_pt,yrlo_pt,yrhi_pt);
    gratio2->SetMarkerStyle(20);
    gratio2->SetMarkerColor(kBlack);
    gratio2->SetMarkerSize(1.0);
    gratio2->SetLineColor(kBlack);
    gratio2->SetLineWidth(1);
    gratio2->Draw("pz same");

    cout << "here8 "<<endl;
    TString output_pdf_name = "Eff_" + st_dep + "_" + collTag + "_" + inputPrefix + "_" + inputTag + ".pdf";
    if(isCntEff) output_pdf_name = "Eff_" + st_dep + "_" + collTag + "_" + inputPrefix + "_" + inputTag + "_cntEff.pdf";
    c1->SaveAs("./outputDrawEff/"+output_pdf_name);

    file_sfs << "x point \t y point"<< endl;
    file_sfs << "---------------------------------"<< endl;
    for (int i=0; i<nbins_pt; i++)
        file_sfs << xr_pt[i] << " \t " << yr_pt[i] << endl; 

    file_sfs.close();
}

void formatTH1F(TH1* a, int b, int c, int d){
    a->SetLineWidth(2);
    a->SetLineStyle(c);
    a->SetMarkerSize(2);
    a->SetLineColor(b);
    a->SetMarkerColor(b);
    a->GetYaxis()->SetTitle("Efficiency");
    if(d == 1){
        a->GetXaxis()->SetTitle("p_{T} [GeV/c]");
        //a->GetXaxis()->SetTitle("SC E_{T} [GeV/c]");
    }else if(d == 2){
        a->GetXaxis()->SetTitle("#eta");
    }else if(d == 3){
        a->GetXaxis()->SetTitle("rapidity");
    }else if(d == 4){
        a->GetXaxis()->SetTitle("Centrality");
    }
    a->GetXaxis()->CenterTitle(true);
    a->GetXaxis()->SetLabelSize(0.05);
    a->GetXaxis()->SetTitleSize(0.05);
    a->GetXaxis()->SetTitleOffset(0.9);
    a->GetYaxis()->SetLabelSize(0.05);
    a->GetYaxis()->SetTitleSize(0.05);
    a->GetYaxis()->SetTitleOffset(0.8);

}

void formatTLeg(TLegend* a){

    a->SetFillStyle(0);
    a->SetFillColor(0);
    a->SetBorderSize(0);
    a->SetTextSize(0.03);

}


void formatTGraph(TGraph* a, int b, int c, int d)
{

    a->SetMarkerStyle(c);
    a->SetMarkerColor(b);
    a->SetMarkerSize(1.0);
    a->SetLineColor(b);
    a->SetLineWidth(1);
    a->GetXaxis()->SetLabelSize(0.05);
    a->GetXaxis()->SetTitleSize(0.06);
    a->GetXaxis()->SetTitleOffset(0.9);
    a->GetYaxis()->SetTitle("Efficiency");
    a->GetXaxis()->CenterTitle();
    if(d == 1){ 
        // a->GetXaxis()->SetTitle("p_{T} (GeV/c)"); 
        a->GetXaxis()->SetTitle("SC E_{T} (GeV/c)"); 
    }else if(d == 2){ 
        a->GetXaxis()->SetTitle("eta"); 
    }else if(d == 3){ 
        a->GetXaxis()->SetTitle("rapidity"); 
    }else if(d == 4){
        a->GetXaxis()->SetTitle("Centrality");
    }   
    a->GetYaxis()->SetRangeUser(0,1);
    a->GetXaxis()->SetRangeUser(0,10);
    a->GetYaxis()->SetLabelSize(0.05);
    a->GetYaxis()->SetTitleSize(0.05);
    a->GetYaxis()->SetTitleOffset(0.9);


}

TGraphAsymmErrors *plotEff_1bin(RooDataSet *a, int aa, const char* varx){
    const RooArgSet *set = a->get();
    RooRealVar *xAx = (RooRealVar*)set->find(varx);
    RooRealVar *eff = (RooRealVar*)set->find("efficiency");

    const int nbins = xAx->getBinning().numBins();

    double tx[nbins], txhi[nbins], txlo[nbins];
    double ty[nbins], tyhi[nbins], tylo[nbins];

    for (int i=0; i<nbins; i++) {
        a->get(i);
        ty[i] = eff->getVal();
        tx[i] = xAx->getVal();
        txhi[i] = fabs(xAx->getErrorHi());
        txlo[i] = fabs(xAx->getErrorLo()); 
        tyhi[i] = fabs(eff->getErrorHi());
        tylo[i] = fabs(eff->getErrorLo()); 
    }

    cout<<"NBins : "<<nbins<<endl;

    const double *x = tx;
    const double *xhi = txhi;
    const double *xlo = txlo;
    const double *y = ty;
    const double *yhi = tyhi;
    const double *ylo = tylo;


    TGraphAsymmErrors *b = new TGraphAsymmErrors();
    if(aa == 1) {*b = TGraphAsymmErrors(nbins,x,y,xlo,xhi,ylo,yhi);}
    if(aa == 0) {*b = TGraphAsymmErrors(nbins,x,y,0,0,ylo,yhi);}
    b->SetMaximum(1.1);
    b->SetMinimum(0.0);
    b->SetMarkerStyle(20);
    b->SetMarkerColor(kRed+2);
    b->SetMarkerSize(1.0);
    b->SetTitle("");
    b->GetXaxis()->SetTitleSize(0.1);
    b->GetYaxis()->SetTitleSize(0.1);
    b->GetXaxis()->SetTitle("#eta");
    b->GetYaxis()->SetTitle("Efficiency");
    b->GetXaxis()->CenterTitle();
    //b->Draw("apz");

    for (int i=0; i<nbins; i++) {
        cout << x[i] << " " << y[i] << " " << yhi[i] << " " << ylo[i] << endl;
    }

    return b;

}

vector<TGraphAsymmErrors*> plotEff_Nbins(RooDataSet *a, int aa, const char* varx, const char* var2){
    const RooArgSet *set = a->get();
    RooRealVar *xAx = (RooRealVar*)set->find(varx);
    RooRealVar *abseta = (RooRealVar*)set->find(var2);
    RooRealVar *eff = (RooRealVar*)set->find("efficiency");

    const int nbins = xAx->getBinning().numBins();
    const int nbins2 = abseta->getBinning().numBins();
    cout << nbins << " " << nbins2 << endl;

    double **tx = new double*[nbins2], **txhi = new double*[nbins2], **txlo = new double*[nbins2];
    double **ty = new double*[nbins2], **tyhi = new double*[nbins2], **tylo = new double*[nbins2];
    for (int i=0; i<nbins2; i++)
    {
        tx[i] = new double[nbins];
        txlo[i] = new double[nbins];
        txhi[i] = new double[nbins];
        ty[i] = new double[nbins];
        tylo[i] = new double[nbins];
        tyhi[i] = new double[nbins];
    }

    for (int i=0; i<nbins*nbins2; i++) {
        a->get(i);
        int bin1 = xAx->getBinning().binNumber(xAx->getVal());
        int bin2 = abseta->getBinning().binNumber(abseta->getVal());
        ty[bin2][bin1] = eff->getVal();
        tx[bin2][bin1] = xAx->getVal();
        txhi[bin2][bin1] = fabs(xAx->getErrorHi());
        txlo[bin2][bin1] = fabs(xAx->getErrorLo()); 
        tyhi[bin2][bin1] = fabs(eff->getErrorHi());
        tylo[bin2][bin1] = fabs(eff->getErrorLo()); 
    }

    cout<<"NBins pt: "<<nbins<<endl;


    vector<TGraphAsymmErrors*> result;
    for (int i=0; i<nbins2; i++)
    {
        const double *x = tx[i];
        const double *xhi = txhi[i];
        const double *xlo = txlo[i];
        const double *y = ty[i];
        const double *yhi = tyhi[i];
        const double *ylo = tylo[i];
        TGraphAsymmErrors *b = new TGraphAsymmErrors();
        if(aa == 1) {*b = TGraphAsymmErrors(nbins,x,y,xlo,xhi,ylo,yhi);}
        if(aa == 0) {*b = TGraphAsymmErrors(nbins,x,y,0,0,ylo,yhi);}
        b->SetMaximum(1.1);
        b->SetMinimum(0.0);
        b->SetMarkerStyle(20);
        b->SetMarkerColor(kRed+2);
        b->SetMarkerSize(1.0);
        b->SetTitle("");
        b->GetXaxis()->SetTitleSize(0.05);
        b->GetYaxis()->SetTitleSize(0.05);
        // b->GetXaxis()->SetTitle("p_{T} [GeV/c]");
        b->GetXaxis()->SetTitle("E_{T} [GeV/c]");
        b->GetYaxis()->SetTitle("Efficiency");
        b->GetXaxis()->CenterTitle();
        //b->Draw("apz");
        result.push_back(b);
    }

    // for (int i=0; i<nbins; i++) {
    //   cout << x[i] << " " << y[i] << " " << yhi[i] << " " << ylo[i] << endl;
    // }

    return result;

}


TH2F *plotEff2D(RooDataSet *a, TString b, const char* varx, const char* vary){
    const RooArgSet *set = a->get();
    RooRealVar *yAx = (RooRealVar*)set->find(vary);
    RooRealVar *xAx = (RooRealVar*)set->find(varx);
    RooRealVar *eff = (RooRealVar*)set->find("efficiency");

    //const int xnbins = xAx->getBinning().numBins();
    //const int ynbins = yAx->getBinning().numBins();

    const double *xvbins = xAx->getBinning().array();
    const double *yvbins = yAx->getBinning().array();

    TH2F* h = new TH2F(b, "", xAx->getBinning().numBins(), xvbins, yAx->getBinning().numBins(), yvbins);

    gStyle->SetPaintTextFormat("5.2f");
    gStyle->SetPadRightMargin(0.12);
    gStyle->SetPalette(1);
    h->SetOption("colztexte");
    h->GetZaxis()->SetRangeUser(-0.001,1.001);
    h->SetStats(kFALSE);
    // h->GetYaxis()->SetTitle("p_{T} [GeV/c]");
    h->GetYaxis()->SetTitle("E_{T} [GeV/c]");
    h->GetXaxis()->SetTitle("#eta");
    h->GetXaxis()->CenterTitle();
    h->GetYaxis()->CenterTitle();
    h->GetXaxis()->SetTitleSize(0.05);
    h->GetYaxis()->SetTitleSize(0.05);
    h->GetYaxis()->SetTitleOffset(0.8);
    h->GetXaxis()->SetTitleOffset(0.9);
    for(int i=0; i<a->numEntries(); i++){
        a->get(i);
        h->SetBinContent(h->FindBin(xAx->getVal(), yAx->getVal()), eff->getVal());
        h->SetBinError(h->FindBin(xAx->getVal(), yAx->getVal()), (eff->getErrorHi()-eff->getErrorLo())/2.);
    }

    return h;

}


void CalEffErr(TGraph *a, double *b){
    const int nbins = 100;
    double x[nbins], y[nbins];
    double sum = 0, errHighSum = 0, errLowSum = 0, sqSumHigh = 0, sqSumLow = 0;
    //double b[3] = 0;

    int nBins = a->GetN();
    for(int i=0;i<a->GetN();i++){
        a->GetPoint(i,x[i],y[i]);
        //cout<<"Eff x = "<<x[i]<<" y = "<<y[i]<<endl;
        double eHigh = a->GetErrorYhigh(i);
        double eLow = a->GetErrorYlow(i);
        //cout<<"Err high = "<<eHigh<<" low = "<<eLow<<endl;
        sum += y[i];
        errHighSum += eHigh;
        sqSumHigh += eHigh*eHigh;
        errLowSum += eLow;
        sqSumLow += eLow*eLow;
    }
    b[0] = sum/nBins;
    b[1] = sqrt(sqSumHigh)/nBins;
    b[2] = sqrt(sqSumLow)/nBins;
    //cout<<"b1 : "<<b[0]<<", b2 : "<<b[1]<<", b3 : "<<b[2]<<endl;

    cout<<b[0]<<"^{"<<b[1]<<"}_{"<<b[2]<<"}"<<endl;
    cout << " what? " << endl;
    //return b[3];
}

void CalEffErr(vector<TGraphAsymmErrors*> a, double **b){
    const int nbins = 100;
    cout << "s" << endl;
    const int vsize = a.size();
    cout << "b" << endl;

    for (int vbin=0; vbin<vsize; vbin++)
    {
        double x[nbins], y[nbins];
        double sum = 0, errHighSum = 0, errLowSum = 0, sqSumHigh = 0, sqSumLow = 0;
        //double b[3] = 0;

        int nBins = a[vbin]->GetN();
        for(int i=0;i<a[vbin]->GetN();i++){
            a[vbin]->GetPoint(i,x[i],y[i]);
            //cout<<"Eff x = "<<x[i]<<" y = "<<y[i]<<endl;
            double eHigh = a[vbin]->GetErrorYhigh(i);
            double eLow = a[vbin]->GetErrorYlow(i);
            //cout<<"Err high = "<<eHigh<<" low = "<<eLow<<endl;
            sum += y[i];
            errHighSum += eHigh;
            sqSumHigh += eHigh*eHigh;
            errLowSum += eLow;
            sqSumLow += eLow*eLow;
        }
        b[vbin][0] = sum/nBins;
        b[vbin][1] = sqrt(sqSumHigh)/nBins;
        b[vbin][2] = sqrt(sqSumLow)/nBins;
        //cout<<"b1 : "<<b[0]<<", b2 : "<<b[1]<<", b3 : "<<b[2]<<endl;

        cout<<b[vbin][0]<<"^{"<<b[vbin][1]<<"}_{"<<b[vbin][2]<<"}"<<endl;
        cout << " what_2? " << endl;
    }
    cout << " what_3? " << endl;
    //return b[3];
}
