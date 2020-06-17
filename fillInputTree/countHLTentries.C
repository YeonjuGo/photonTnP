//#define MC // comment this line to run on data

#ifdef MC
#include "ggTreeReaderPbPb.C"
#include "hltTreeReaderPbPb.C"
#include "globalTreeReaderPbPb.C"
#include "hiEvtTreeReaderPbPb.C"
#include "hltobjTreeReaderHiPho40PbPb.C"
#define ggTreeReaderPbPb ggTreeReaderPbPb
#define hltTreeReaderPbPb hltTreeReaderPbPb
#define globalTreeReaderPbPb globalTreeReaderPbPb
#define hiEvtTreeReaderPbPb hiEvtTreeReaderPbPb
#define hltobjTreeReaderPbPb hltobjTreeReaderHiPho40PbPb

#else
#include "ggTreeReaderPbPbData.C"
#include "hltTreeReaderPbPbData.C"
#include "globalTreeReaderPbPbData.C"
#include "hiEvtTreeReaderPbPbData.C"
#include "hltobjTreeReaderHiPho40PbPbData.C"
#define ggTreeReaderPbPb ggTreeReaderPbPbData
#define hltTreeReaderPbPb   hltTreeReaderPbPbData
#define globalTreeReaderPbPb globalTreeReaderPbPbData
#define hiEvtTreeReaderPbPb hiEvtTreeReaderPbPbData
#define hltobjTreeReaderPbPb hltobjTreeReaderHiPho40PbPbData
#endif
#include "TH1F.h"
#include "TH1D.h"
#include "TF1.h"
#include "TRandom3.h"
#include "TLorentzVector.h"
#include <iostream>
#include <iostream>
#include <fstream>
#include <sstream>
#include <cstring>
#include <string>
#include <algorithm>



using namespace std;


void countHLTentries() {
   TChain *tchHLT = new TChain("hltanalysis/HltTree");

   ifstream myReadFile;
   myReadFile.open("pbpb_ZtoEE_list_inKNU.txt");
   //string path = "/mnt/hadoop/cms/store/user/rbi/HIPhoton40AndZ/azsigmon-HIRun2015E-PromptReco-AOD-DielectronSkim-ElePt8-v3_forest_csjet_v1_3/160315_214446/0000/";
   char output[800];

   if (myReadFile.is_open()) {
     while (!myReadFile.eof()) {
       myReadFile >> output;
       if (myReadFile.eof()) break;

       stringstream ss;
       string s_output = "";
       string finalPath = "";
       ss << output;
       ss >> s_output;

       //finalPath += path;
       finalPath += s_output;
       cout << "path = " << finalPath << endl;
       tchHLT->Add(finalPath.c_str());
     }
   }
   cout << "all added" << endl;
   myReadFile.close();
   cout << "file is closed" << endl;

   cout << tchHLT->GetEntriesFast() << endl;
   cout << tchHLT->GetEntries() << endl;
   cout << tchHLT->GetEntriesFast() << endl;

   tchHLT->SetBranchStatus("*",0);
   tchHLT->SetBranchStatus("HLT_HISinglePhoton40_Eta1p5_v1",1);
   tchHLT->SetBranchStatus("HLT_HISinglePhoton20_Eta1p5_v1",1);

   Int_t HLT_HISinglePhoton40_Eta1p5_v1, HLT_HISinglePhoton20_Eta1p5_v1;
   TBranch        *b_HLT_HISinglePhoton20_Eta1p5_v1;
   TBranch        *b_HLT_HISinglePhoton40_Eta1p5_v1;
   tchHLT->SetBranchAddress("HLT_HISinglePhoton40_Eta1p5_v1", &HLT_HISinglePhoton40_Eta1p5_v1, &b_HLT_HISinglePhoton40_Eta1p5_v1);
   tchHLT->SetBranchAddress("HLT_HISinglePhoton20_Eta1p5_v1", &HLT_HISinglePhoton20_Eta1p5_v1, &b_HLT_HISinglePhoton20_Eta1p5_v1);


   Long64_t nentries = tchHLT->GetEntriesFast();

   // Loop 
   int n_hlt20not40 = 0;
   int n_hlt20and40 = 0;

   for (Long64_t jentry=0; jentry<nentries;jentry++) {
      if (jentry%10000==0) cout << "--> " << jentry << "/" << nentries << endl;
      tchHLT->GetEntry(jentry);
      //Long64_t ientry_hlt = hltR.LoadTree(jentry);
      //if (ientry_hlt < 0) break;
      //cout << "after hltobg" << endl;

      bool hlt20 = HLT_HISinglePhoton20_Eta1p5_v1;
      if(!hlt20) continue;

      bool hlt20not40 = HLT_HISinglePhoton20_Eta1p5_v1 && !HLT_HISinglePhoton40_Eta1p5_v1;
      bool hlt20and40 = HLT_HISinglePhoton20_Eta1p5_v1 && HLT_HISinglePhoton40_Eta1p5_v1;

      if(hlt20not40) n_hlt20not40++; 
      else if(hlt20and40) n_hlt20and40++; 
      else continue; 
   }

   cout << " HLT20 && !HLT40 = " << n_hlt20not40 << endl;
   cout << " HLT20 && HLT40 = " << n_hlt20and40 << endl;

}

