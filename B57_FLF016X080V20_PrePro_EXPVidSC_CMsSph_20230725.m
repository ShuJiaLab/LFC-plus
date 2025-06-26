% clear;  close all;  clc;
addpath(genpath('E:\00_Matlab_Code'))
addpath(genpath('E:\02_MIRO'))
addpath(genpath('E:\hflfm\HRFLFM_DataProc_new\ACsN\ACsN_code\Functions'));
addpath(genpath('E:\large_field_flfm'));

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for idxsg = 1                                                              % System parameter set                       
    Recons_43_NumEd    = 3;
    FLFRec_13_RdNum    = 501;
    FLFRec_13_RrNum    = floor(FLFRec_13_RdNum/2);

    WFM_EXPImg_Offset = 0; 
    FLF_EXPImg_Offset = 95;
    FLF_EXPVid_Offset = 95;

    Flag_multicolor    = 1;
    Flag_Normalization = 0;
    FLF_Save_Flag__Crp = 1;

    % Flag_Normalization = 1 normalize on the whole sequence (CMs)
    % Flag_Normalization = 0 normalize on each image 

    Index_Col0         = 023;
    Index_Col1         = 022;
    Index_Col2         = 023;

    lambda1            = 0.525;
    lambda2            = 0.610;
end
for idxsg = 1                                                              %Image parameter and Save path name set     
    Data_00_bit     = 16    ;                                              %get
    Data_00_maxval  = 2^Data_00_bit-1;
    Data_01_formIm  = '.tif';                                              %get
    Data_01_formVd  = '.avi';                                              %get
    Data_02_formDt  = '.mat';                                              %get
    Data_04_smoothn = 1;                                                   %Get?Recons_00_NUMd
    Data_04_Oper_sm = fspecial('gaussian',[Data_04_smoothn Data_04_smoothn],0.6);

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    File_00_path = '..\';                                
    File_00_Dash = '\'; 
    File_00_Line = '_'; 
    File_01_sav = 'sav'; 
    File_02_raw = 'raw'; 
    File_04_rec = 'rec'; 
    File_06_pro = 'pro';
    
    File_0a_sim = 'sim'; 
    File_0b_exp = 'exp'; 
    File_0c_bkg = 'bkg'; 

    File_10_WFMPSF        = '1WFMPSF'; 
    File_11_WFMPSF_SimSav = [File_00_path,File_10_WFMPSF,'_1',File_0a_sim,File_01_sav];mkdir(File_11_WFMPSF_SimSav);
    File_12_WFMPSF_ExpRaw = [File_00_path,File_10_WFMPSF,'_2',File_0b_exp,File_02_raw];mkdir(File_12_WFMPSF_ExpRaw);
    File_13_WFMPSF_BkgRaw = [File_00_path,File_10_WFMPSF,'_3',File_0c_bkg,File_02_raw];mkdir(File_13_WFMPSF_BkgRaw);
    File_14_WFMPSF_SimRec = [File_00_path,File_10_WFMPSF,'_4',File_0a_sim,File_04_rec];mkdir(File_14_WFMPSF_SimRec);
    File_15_WFMPSF_ExpRec = [File_00_path,File_10_WFMPSF,'_5',File_0b_exp,File_04_rec];mkdir(File_15_WFMPSF_ExpRec);
    File_16_WFMPSF_ExpPro = [File_00_path,File_10_WFMPSF,'_6',File_0b_exp,File_06_pro];

    File_20_WFMImg        = '2WFMImg'; 
    File_21_WFMImg_SimSav = [File_00_path,File_20_WFMImg,'_1',File_0a_sim,File_01_sav];mkdir(File_21_WFMImg_SimSav);
    File_22_WFMImg_ExpRaw = [File_00_path,File_20_WFMImg,'_2',File_0b_exp,File_02_raw];mkdir(File_22_WFMImg_ExpRaw);
    File_23_WFMImg_BkgRaw = [File_00_path,File_20_WFMImg,'_3',File_0c_bkg,File_02_raw];mkdir(File_23_WFMImg_BkgRaw);
    File_24_WFMImg_SimRec = [File_00_path,File_20_WFMImg,'_4',File_0a_sim,File_04_rec];mkdir(File_24_WFMImg_SimRec);
    File_25_WFMImg_ExpRec = [File_00_path,File_20_WFMImg,'_5',File_0b_exp,File_04_rec];mkdir(File_25_WFMImg_ExpRec);
    File_26_WFMImg_ExpPro = [File_00_path,File_20_WFMImg,'_6',File_0b_exp,File_06_pro];

    File_30_FLFPSF        = '3FLFPSF'; 
    File_31_FLFPSF_SimSav = [File_00_path,File_30_FLFPSF,'_1',File_0a_sim,File_01_sav];mkdir(File_31_FLFPSF_SimSav);
    File_32_FLFPSF_ExpRaw = [File_00_path,File_30_FLFPSF,'_2',File_0b_exp,File_02_raw];mkdir(File_32_FLFPSF_ExpRaw);
    File_33_FLFPSF_BkgRaw = [File_00_path,File_30_FLFPSF,'_3',File_0c_bkg,File_02_raw];mkdir(File_33_FLFPSF_BkgRaw);
    File_34_FLFPSF_SimRec = [File_00_path,File_30_FLFPSF,'_4',File_0a_sim,File_04_rec];
    File_35_FLFPSF_ExpRec = [File_00_path,File_30_FLFPSF,'_5',File_0b_exp,File_04_rec];
    File_36_FLFPSF_ExpPro = [File_00_path,File_30_FLFPSF,'_6',File_0b_exp,File_06_pro];

    File_40_FLFImg        = '4FLFImg'; 
    File_41_FLFImg_SimSav = [File_00_path,File_40_FLFImg,'_1',File_0a_sim,File_01_sav];mkdir(File_41_FLFImg_SimSav);
    File_42_FLFImg_ExpRaw = [File_00_path,File_40_FLFImg,'_2',File_0b_exp,File_02_raw];mkdir(File_42_FLFImg_ExpRaw);
    File_43_FLFImg_BkgRaw = [File_00_path,File_40_FLFImg,'_3',File_0c_bkg,File_02_raw];mkdir(File_43_FLFImg_BkgRaw);
    File_44_FLFImg_SimRec = [File_00_path,File_40_FLFImg,'_4',File_0a_sim,File_04_rec];
    File_45_FLFImg_ExpRec = [File_00_path,File_40_FLFImg,'_5',File_0b_exp,File_04_rec];
    File_46_FLFPSF_ExpPro = [File_00_path,File_40_FLFImg,'_6',File_0b_exp,File_06_pro];

    File_50_FLFVid        = '5FLFVid'; 
    File_51_FLFVid_SimSav = [File_00_path,File_50_FLFVid,'_1',File_0a_sim,File_01_sav];mkdir(File_51_FLFVid_SimSav);
    File_52_FLFVid_ExpRaw = [File_00_path,File_50_FLFVid,'_2',File_0b_exp,File_02_raw];
    File_53_FLFVid_BkgRaw = [File_00_path,File_50_FLFVid,'_3',File_0c_bkg,File_02_raw];
    File_54_FLFVid_SimRec = [File_00_path,File_50_FLFVid,'_4',File_0a_sim,File_04_rec];
    File_55_FLFVid_ExpRec = [File_00_path,File_50_FLFVid,'_5',File_0b_exp,File_04_rec];
    File_56_FLFVid_ExpPro = [File_00_path,File_50_FLFVid,'_6',File_0b_exp,File_06_pro];

    File_90_RayTracingsav = [File_00_path,'\','90_Ray_Tracingsave'];mkdir(File_90_RayTracingsav);
end
for idxsg = 1                                                              % System and simulate parameter 16XWV2       
                                                                           % System parameters                    
   [Fl_01_obj,Dm_01_obj,fn_01_obj          ,...
    Fl_01_tub,Ma_01_obj,NA_01_obj,Ind01_obj,...
    Fl_02_tub,Dm_02_tub,fn_02_tub          ,...
    Fl_03_ent,Dm_03_ent,fn_03_ent          ,...
    Fl_04_MLA,Dm_04_MLA,fn_04_MLA,det_08MLA,...
    Fl_04bMLA,Dm_04_mic,Pi_04_MLA,Ind04_MLA,...
    Num05_cam,Dm_05_cam,Pi_05_cam          ,...
    Fl_07_img,Dm_07_img,fn_07_img          ,...
    lambdaAir,lambdaLen,k0       ,kn       ,...
    del_01_oo,del_02_ot,del_03_te,del_04_em,...
    del_05_mc,dell05_mc,del_06_ti,del_07_ec,...
    dis_01_oo,dis_02_ot,dis_03_te,dis_04_em,...
    dis_05_mc,dis_06_ti,dis_07_ec] = F16_FLF016XWV20_sys_para_525nm();
                                                                       % Simulation parameters                
   [Step_NIP_Finetune,Step_Propergation,...
    Flag_WFMPSFOnly  ,Flag_Simulation  ,...
    Flag_simPSFfine  ,Flag_Profilesim  ,...
    P291_NIP_Size_Ext,P292_NIP_Size_Wav,P293_NIP_Size_Num,...
    P490_MLA_Beam_Rat,P491_MLA_lens_Num,...
    P492_MLA_lens_Ext,Flag_MLA_size_Odd,...
    Flag_MLA_grid_Hex,Flag_MLA_grid_Inv,...
    Flag_Lens_On_axis,Flag_Lens_All_Use,...          
    Flag_Lens_Tra_Cir,Flag_Lens_Apt_Cir,...
    Flag_Aperture      ] = F16_FLF016XWV20_Sim_Para();
end
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for idxsg = 1                                                              % FLFimg and Sub Crop range set    

    FLF_Location = imread([File_00_path,'\','FLF_Location.tif']);          U40_Imshow_Sat((FLF_Location-88).^4, 1)

    FLF_ExpImg_range_y = 000+(1:1698);  disp(length(FLF_ExpImg_range_y))
    FLF_ExpImg_range_x = 000+(1:1698);  disp(length(FLF_ExpImg_range_x))
                                                                           U40_Imshow_Sat( uint16( (FLF_Location(FLF_ExpImg_range_y,FLF_ExpImg_range_x)-090).^4), 1)
    FLF_ExpSub_range_y = -005+(1:0566)+0566;  disp(length(FLF_ExpSub_range_y))
    FLF_ExpSub_range_x = -001+(1:0566)+0566;  disp(length(FLF_ExpSub_range_x))       
    Sub_Location_org   =           FLF_Location(FLF_ExpSub_range_y,FLF_ExpSub_range_x)      ;
                                                                           U40_Imshow_Sat((Sub_Location_org-80).^3, 2)
    Sub_Location_ort   =flip(rot90(FLF_Location(FLF_ExpSub_range_y,FLF_ExpSub_range_x),3),2);
                                                                           U40_Imshow_Sat(Sub_Location_ort, 2)
    FLF_PSFSub_crp_sfx = +08;
    FLF_PSFSub_crp_sfy = +00;
    FLF_PSFSub_crp_sfz = -00;
    FLF_Load_ImshowMag = 3;

    FLF_Test_Index_Ini = 1;
    FLF_Test_Index_End = 1;
    FLF_Test_Index_Stp = 1;

    S27_DataSave_MOV_1FOVV2_Test(File_32_FLFPSF_ExpRaw, '..',...
                                 FLF_Load_ImshowMag,Data_02_formDt,Recons_43_NumEd, ...
                                 FLF_Test_Index_Ini,FLF_Test_Index_End,FLF_Test_Index_Stp,...
                                 FLF_ExpImg_range_x,FLF_ExpImg_range_y,FLFRec_13_RdNum   ,...
                                 FLF_PSFSub_crp_sfx,FLF_PSFSub_crp_sfy,FLF_PSFSub_crp_sfz,'',3)
end
close all;clc

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% FLFVID parameter set                              
for idxsg = 1                                                              
    EXP_group = [06,12,062];
    BKG_group = [06,12,062];
    File_0h_Sbk = '_2SubBKG'; 
    File_0i_Crp = '_3Croped'; 
    File_0k_Dns = '_4Denois'; 
    File_0m_DCR = '_5DftCor'; 
    File_0o_DCP = '_6Decomp'; 
    File_0p_DCP = '_6DecomL'; 
    File_0q_DCP = '_6DecomS'; 
    FLF_PSFSub_crp_sfz = 00;
    FLF_BkgRationMVVOL = 1;
    FLF_ExpSub_crp_Apt = 0;

    FLF_Load_FrameRate = 0.01;


    FLF_ExpBKG_GrpName = num2str(BKG_group','%02d');           BKG_gpnum = size(FLF_ExpBKG_GrpName,1);
    FLF_ExpVid_GrpName = num2str(EXP_group','%02d');           EXP_gpnum = size(FLF_ExpVid_GrpName,1);
    
    FLF_ExpVid_SBKName = [FLF_ExpVid_GrpName,repmat(File_0h_Sbk,EXP_gpnum,1)];
    FLF_ExpVid_CrpName = [FLF_ExpVid_GrpName,repmat(File_0i_Crp,EXP_gpnum,1)];
    FLF_ExpVid_DNSName = [FLF_ExpVid_GrpName,repmat(File_0k_Dns,EXP_gpnum,1)];
    FLF_ExpVid_DCRName = [FLF_ExpVid_GrpName,repmat(File_0m_DCR,EXP_gpnum,1)];
    FLF_ExpVid_DCPName = [FLF_ExpVid_GrpName,repmat(File_0o_DCP,EXP_gpnum,1)];
    FLF_ExpVid_DCPNamL = [FLF_ExpVid_GrpName,repmat(File_0p_DCP,EXP_gpnum,1)];
    FLF_ExpVid_DCPNamS = [FLF_ExpVid_GrpName,repmat(File_0q_DCP,EXP_gpnum,1)];
    
    for idxfl = 1:BKG_gpnum                                                
        mkdir([File_53_FLFVid_BkgRaw,FLF_ExpBKG_GrpName(idxfl,:)])
    end
    for idxfl = 1:EXP_gpnum                                                
        mkdir([File_52_FLFVid_ExpRaw,FLF_ExpVid_GrpName(idxfl,:)])
        mkdir([File_56_FLFVid_ExpPro,FLF_ExpVid_SBKName(idxfl,:)])
        mkdir([File_56_FLFVid_ExpPro,FLF_ExpVid_CrpName(idxfl,:)])
        mkdir([File_56_FLFVid_ExpPro,FLF_ExpVid_DNSName(idxfl,:)])
%         mkdir([File_56_FLFVid_ExpPro,FLF_ExpVid_DCRName(idxfl,:)])
%         mkdir([File_56_FLFVid_ExpPro,FLF_ExpVid_DCPName(idxfl,:)])
%         mkdir([File_56_FLFVid_ExpPro,FLF_ExpVid_DCPNamL(idxfl,:)])
%         mkdir([File_56_FLFVid_ExpPro,FLF_ExpVid_DCPNamS(idxfl,:)])
    end

end
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Noise crop                        
for idxfl = 1:BKG_gpnum                                                    
    S27_DataSave_MOV_0BKGV2( [File_53_FLFVid_BkgRaw,FLF_ExpBKG_GrpName(idxfl,:)], ...
                              File_32_FLFPSF_ExpRaw,Data_02_formDt ,Recons_43_NumEd,...
                              FLF_PSFSub_crp_sfy,FLF_PSFSub_crp_sfx,0,...
                              FLF_ExpImg_range_y,FLF_ExpImg_range_x,FLFRec_13_RrNum,...
                              FLF_EXPVid_Offset ,0)
    disp(['idxfl',num2str(idxfl)])
end

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Video FOV AND BKG SUB ALL                      
for idxsg = 1                                                              % FLFimg read and background substraction 
    FLF_Load_Index_Ini = zeros(EXP_gpnum,1);
    FLF_Load_Index_End = zeros(EXP_gpnum,1);
    FLF_Load_Index_Stp = 1;

    FLF_Save_Index_Ini = zeros(EXP_gpnum,1);
    FLF_Save_Index_End = zeros(EXP_gpnum,1);
    FLF_Save_Index_Seg = 1;

    for idxfl = 06                                                        
%         FLF_Load_Index_Ini(idxfl) = 00001;
%         FLF_Load_Index_End(idxfl) = 00001;
%         FLF_Save_Index_Ini(idxfl) = 00001;
%         FLF_Save_Index_End(idxfl) = 00001;
          FLF_Load_Index_Ini(idxfl) = 00001;
          FLF_Load_Index_End(idxfl) = 00051;  
          FLF_Save_Index_Ini(idxfl) = 00001;
          FLF_Save_Index_End(idxfl) = 00051;  

        FLF_PSFSub_crp_sfz = 0;

        S28_DataSave_MOV_3FOVSBKoCRPV2(File_32_FLFPSF_ExpRaw,  File_53_FLFVid_BkgRaw,FLF_ExpBKG_GrpName(EXP_group==idxfl,:),...
                                       File_52_FLFVid_ExpRaw,  File_56_FLFVid_ExpPro,FLF_ExpVid_GrpName(EXP_group==idxfl,:),...
                                       Data_01_formIm,Data_02_formDt,Recons_43_NumEd,...
                                       FLF_Load_Index_Ini(idxfl),FLF_Load_Index_End(idxfl),FLF_Load_Index_Stp,...
                                       FLF_Save_Index_Ini(idxfl),FLF_Save_Index_End(idxfl),FLF_Save_Index_Seg,...
                                       FLF_ExpImg_range_x,FLF_ExpImg_range_y,FLFRec_13_RdNum   ,...
                                       FLF_PSFSub_crp_sfx,FLF_PSFSub_crp_sfy,FLF_PSFSub_crp_sfz,...
                                       0                 ,0                 ,0                 ,...
                                       FLF_Load_FrameRate,File_0h_Sbk       ,FLFRec_13_RrNum   ,...
                                       FLF_EXPImg_Offset ,FLF_BkgRationMVVOL,FLF_ExpSub_crp_Apt)
    end
    for idxfl = 12                                                        
%         FLF_Load_Index_Ini(idxfl) = 00001;
%         FLF_Load_Index_End(idxfl) = 00001;
%         FLF_Save_Index_Ini(idxfl) = 00001;
%         FLF_Save_Index_End(idxfl) = 00001;
          FLF_Load_Index_Ini(idxfl) = 00001;
          FLF_Load_Index_End(idxfl) = 00051;  
          FLF_Save_Index_Ini(idxfl) = 00001;
          FLF_Save_Index_End(idxfl) = 00051;  

        FLF_PSFSub_crp_sfz = 0;

        S28_DataSave_MOV_3FOVSBKoCRPV2(File_32_FLFPSF_ExpRaw,  File_53_FLFVid_BkgRaw,FLF_ExpBKG_GrpName(EXP_group==idxfl,:),...
                                       File_52_FLFVid_ExpRaw,  File_56_FLFVid_ExpPro,FLF_ExpVid_GrpName(EXP_group==idxfl,:),...
                                       Data_01_formIm,Data_02_formDt,Recons_43_NumEd,...
                                       FLF_Load_Index_Ini(idxfl),FLF_Load_Index_End(idxfl),FLF_Load_Index_Stp,...
                                       FLF_Save_Index_Ini(idxfl),FLF_Save_Index_End(idxfl),FLF_Save_Index_Seg,...
                                       FLF_ExpImg_range_x,FLF_ExpImg_range_y,FLFRec_13_RdNum   ,...
                                       FLF_PSFSub_crp_sfx,FLF_PSFSub_crp_sfy,FLF_PSFSub_crp_sfz,...
                                       0                 ,0                 ,0                 ,...
                                       FLF_Load_FrameRate,File_0h_Sbk       ,FLFRec_13_RrNum   ,...
                                       FLF_EXPImg_Offset ,FLF_BkgRationMVVOL,FLF_ExpSub_crp_Apt)
    end
    for idxfl = 62                                                        
%         FLF_Load_Index_Ini(idxfl) = 00001;
%         FLF_Load_Index_End(idxfl) = 00001;
%         FLF_Save_Index_Ini(idxfl) = 00001;
%         FLF_Save_Index_End(idxfl) = 00001;
          FLF_Load_Index_Ini(idxfl) = 00001;
          FLF_Load_Index_End(idxfl) = 01001;  
          FLF_Save_Index_Ini(idxfl) = 00001;
          FLF_Save_Index_End(idxfl) = 01001;  

        FLF_PSFSub_crp_sfz = 0;

        S28_DataSave_MOV_3FOVSBKoCRPV2(File_32_FLFPSF_ExpRaw,  File_53_FLFVid_BkgRaw,FLF_ExpBKG_GrpName(EXP_group==idxfl,:),...
                                       File_52_FLFVid_ExpRaw,  File_56_FLFVid_ExpPro,FLF_ExpVid_GrpName(EXP_group==idxfl,:),...
                                       Data_01_formIm,Data_02_formDt,Recons_43_NumEd,...
                                       FLF_Load_Index_Ini(idxfl),FLF_Load_Index_End(idxfl),FLF_Load_Index_Stp,...
                                       FLF_Save_Index_Ini(idxfl),FLF_Save_Index_End(idxfl),FLF_Save_Index_Seg,...
                                       FLF_ExpImg_range_x,FLF_ExpImg_range_y,FLFRec_13_RdNum   ,...
                                       FLF_PSFSub_crp_sfx,FLF_PSFSub_crp_sfy,FLF_PSFSub_crp_sfz,...
                                       0                 ,0                 ,0                 ,...
                                       FLF_Load_FrameRate,File_0h_Sbk       ,FLFRec_13_RrNum   ,...
                                       FLF_EXPImg_Offset ,FLF_BkgRationMVVOL,FLF_ExpSub_crp_Apt)
    end
   
end

for idxsg = 1                                                              % Video crop                              
    FLF_ExpSub_crp_sfx = zeros(EXP_gpnum,1);
    FLF_ExpSub_crp_sfy = zeros(EXP_gpnum,1);
    FLF_ExpSub_crp_sfz = zeros(EXP_gpnum,1);
    FLF_ExpSub_crp_rad = zeros(EXP_gpnum,1);

    FLF_ExpVid_Frameps = 100;
    FLF_ExpSub_crp_rad(idxfl==EXP_group) = FLFRec_13_RrNum;

    FLF_save_PeroidIni = 00001;
    FLF_save_PeroidEnd = 00051;
    FLF_save_PeroidSeg = 1;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Video crop     
    for idxfl = 06                                                      
        S27_DataSave_MOV_3CrpV2( File_32_FLFPSF_ExpRaw   ,File_56_FLFVid_ExpPro, ...
                                 Data_01_formIm ,Data_02_formDt,Recons_43_NumEd, ...
                                 FLF_Save_Index_Ini(idxfl),FLF_Save_Index_End(idxfl),FLF_Save_Index_Seg, ...
                                 FLF_save_PeroidIni,FLF_save_PeroidEnd,FLF_save_PeroidSeg, ...
                                 FLF_ExpSub_crp_sfx(idxfl==EXP_group) ,FLF_ExpSub_crp_sfy(idxfl==EXP_group), ...
                                 FLF_ExpSub_crp_sfz(idxfl==EXP_group) , ...
                                 FLF_Load_FrameRate,FLFRec_13_RdNum   ,FLF_ExpSub_crp_rad(idxfl==EXP_group), ...
                                 File_0h_Sbk,File_0i_Crp,FLF_ExpVid_GrpName(idxfl==EXP_group,:),FLF_ExpSub_crp_Apt )
    end
    for idxfl = 12                                                      
        S27_DataSave_MOV_3CrpV2( File_32_FLFPSF_ExpRaw   ,File_56_FLFVid_ExpPro, ...
                                 Data_01_formIm ,Data_02_formDt,Recons_43_NumEd, ...
                                 FLF_Save_Index_Ini(idxfl),FLF_Save_Index_End(idxfl),FLF_Save_Index_Seg, ...
                                 FLF_save_PeroidIni,FLF_save_PeroidEnd,FLF_save_PeroidSeg, ...
                                 FLF_ExpSub_crp_sfx(idxfl==EXP_group) ,FLF_ExpSub_crp_sfy(idxfl==EXP_group), ...
                                 FLF_ExpSub_crp_sfz(idxfl==EXP_group) , ...
                                 FLF_Load_FrameRate,FLFRec_13_RdNum   ,FLF_ExpSub_crp_rad(idxfl==EXP_group), ...
                                 File_0h_Sbk,File_0i_Crp,FLF_ExpVid_GrpName(idxfl==EXP_group,:),FLF_ExpSub_crp_Apt )
    end
    FLF_save_PeroidIni = 00001;
    FLF_save_PeroidEnd = 01001;
    FLF_save_PeroidSeg = 1;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Video crop     
    for idxfl = 62                                                      
        S27_DataSave_MOV_3CrpV2( File_32_FLFPSF_ExpRaw   ,File_56_FLFVid_ExpPro, ...
                                 Data_01_formIm ,Data_02_formDt,Recons_43_NumEd, ...
                                 FLF_Save_Index_Ini(idxfl),FLF_Save_Index_End(idxfl),FLF_Save_Index_Seg, ...
                                 FLF_save_PeroidIni,FLF_save_PeroidEnd,FLF_save_PeroidSeg, ...
                                 FLF_ExpSub_crp_sfx(idxfl==EXP_group) ,FLF_ExpSub_crp_sfy(idxfl==EXP_group), ...
                                 FLF_ExpSub_crp_sfz(idxfl==EXP_group) , ...
                                 FLF_Load_FrameRate,FLFRec_13_RdNum   ,FLF_ExpSub_crp_rad(idxfl==EXP_group), ...
                                 File_0h_Sbk,File_0i_Crp,FLF_ExpVid_GrpName(idxfl==EXP_group,:),FLF_ExpSub_crp_Apt )
    end

end
close all;clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Video crop 1:4    
for idxfl = 2                                                              % Correlation                      
    for idxta = 1                                                          % FLFimg read and save name set    
        FLF_ExpVid_saveUniN = [File_56_FLFVid_ExpPro,FLF_ExpVid_GrpName(idxfl==EXP_group,:),File_0i_Crp,'\','FLF_ExpImg'];
        FLF_ExpVid_LoadUniN = [File_56_FLFVid_ExpPro,FLF_ExpVid_GrpName(idxfl==EXP_group,:),File_0i_Crp,'\','FLF_ExpImg'];

        FLF_ExpVid_LoadDep =[num2str(FLF_save_PeroidIni*FLF_Load_FrameRate),'-',...
                             num2str(FLF_save_PeroidEnd*FLF_Load_FrameRate),'-',...
                             num2str(FLF_save_PeroidSeg*FLF_Load_FrameRate),'s'];
        FLF_save_PeroidInd = FLF_save_PeroidIni:FLF_save_PeroidSeg:FLF_save_PeroidEnd;
        FLF_save_PeroidLen = length( FLF_save_PeroidInd );

        SaveNameUniN = [FLF_ExpVid_LoadUniN,'_','73Croped','_',FLF_ExpVid_LoadDep];
    end
        FLFimgMaxValue    = zeros(FLF_save_PeroidLen,1);
    for idxfr = 1:FLF_save_PeroidLen   
        FLFimg_74cCrpnor = imread([SaveNameUniN,'_','Frm',num2str(FLF_save_PeroidInd(idxfr),'%05.0f'),Data_01_formIm]);
        FLFimgMaxValue(idxfr)    = max(FLFimg_74cCrpnor,[],'all' );
        disp(idxfr)
    end
    save([FLF_ExpVid_LoadUniN,'FrameMaxV',Data_02_formDt],'FLFimgMaxValue')
    figure,plot(+FLFimgMaxValue)

       [~,FLF_save_PeroidStd]= max(FLFimgMaxValue);
        FLFimgCorrelation = zeros(FLF_save_PeroidLen,1);        
        FLFimg_74cCrpIni = imread([SaveNameUniN,'_','Frm',num2str(FLF_save_PeroidStd       ,'%05.0f'),Data_01_formIm]);
    for idxfr = 1:FLF_save_PeroidLen   
        FLFimg_74cCrpnor = imread([SaveNameUniN,'_','Frm',num2str(FLF_save_PeroidInd(idxfr),'%05.0f'),Data_01_formIm]);
        FLFimgCorrelation(idxfr) = corr2(FLFimg_74cCrpIni, FLFimg_74cCrpnor );
        disp(idxfr)
    end
    save([FLF_ExpVid_LoadUniN,'FrameCorr',Data_02_formDt],'FLFimgCorrelation')
    figure,plot(+FLFimgCorrelation)
end

for idxfl = 2                                                              % Correlation                      
    FLF_ExpVid_saveUniN = [File_56_FLFVid_ExpPro,FLF_ExpVid_GrpName(idxfl==EXP_group,:),File_0i_Crp,'\','FLF_ExpImg'];
    FLF_ExpVid_LoadUniN = [File_56_FLFVid_ExpPro,FLF_ExpVid_GrpName(idxfl==EXP_group,:),File_0i_Crp,'\','FLF_ExpImg'];

    load([FLF_ExpVid_LoadUniN,'FrameCorr',Data_02_formDt],'FLFimgCorrelation')

    figure,plot(+FLFimgCorrelation)
    figure,plot(-FLFimgCorrelation)

    FLFimgCorrelation_Sort = sort(FLFimgCorrelation);
    FLFimgCorrelation_Use  = FLFimgCorrelation_Sort(2:end);

    % [~,SystoleTPts] = findpeaks(+FLFimgCorrelation                      ,'MinPeakHeight',+mean(FLFimgCorrelation_Use));
    % BeatTPeroid = mean(diff(SystoleTPts));

    [~,Systole_Pts] = findpeaks(+FLFimgCorrelation,'MinPeakDistance',150,'MinPeakHeight',+mean(FLFimgCorrelation_Use));
    [~,diastolePts] = findpeaks(-FLFimgCorrelation,'MinPeakDistance',150,'MinPeakHeight',-mean(FLFimgCorrelation_Use));
    figure,plot(1:FLF_save_PeroidLen, FLFimgCorrelation,Systole_Pts, FLFimgCorrelation(Systole_Pts),'o',diastolePts, FLFimgCorrelation(diastolePts),"diamond")
    
%     Systole_Pts = [Systole_Temp(1)-round(mean(diff(Systole_Temp))),Systole_Temp']+FLF_save_PeroidIni-1;
    Beat_Peroid = round(60/(mean(diff(Systole_Pts))*FLF_Load_FrameRate));

    save([FLF_ExpVid_LoadUniN,'Systole_Pts',Data_02_formDt],'FLFimgCorrelation','Systole_Pts','diastolePts','Beat_Peroid')
end

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Denois                            
for idxfl = 1                                                          % MIRO denoise 1                   
    % close all
    FLF_save_CrMIROIni = 00001;
    FLF_save_CrMIROEnd = 01001;
    FLF_save_CrMIROSeg = 1;
    FLF_save_mvMIROIni = FLF_save_CrMIROIni;
    FLF_save_mvMIROEnd = FLF_save_CrMIROEnd;
    FLF_save_mvMIROSeg = 1;
    
%     FLF_ExpVid_Frameps = 100;
    Flag_Decomposition = 0;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    GroupName  = FLF_ExpVid_GrpName(idxfl==EXP_group,:);
    SubImSize  = FLF_ExpSub_crp_rad(idxfl==EXP_group)*2+1;
    LoadSuffix = File_0i_Crp;
    SaveSuffix = File_0k_Dns;

    Load_Index_Ini = FLF_save_CrMIROIni;
    Load_Index_End = FLF_save_CrMIROEnd;
    Load_Index_Seg = FLF_save_CrMIROSeg;

    Save_Index_Ini = FLF_save_CrMIROIni;
    Save_Index_End = FLF_save_CrMIROEnd;
    Save_Index_Seg = FLF_save_CrMIROSeg;    

    % Load ideal image
    loadpath = [File_56_FLFVid_ExpPro,GroupName,LoadSuffix,'\','FLF_ExpImg'];
    savepath = [File_56_FLFVid_ExpPro,GroupName,SaveSuffix,'\','FLF_ExpImg'];
    lambda1 = .610;
    lambda2 = .525;
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Load and save Index set    
%     load([loadpath,'Systole_Pts.mat'],'Systole_Pts','diastolePts');
%     Peroids_PtsTep =sort([Systole_Pts;diastolePts]);
%     Peroids_PtsUse = Peroids_PtsTep((FLF_save_mvMIROIni<Peroids_PtsTep)&(Peroids_PtsTep<FLF_save_mvMIROEnd));
%     
%     Save_Index_Ini = Peroids_PtsUse(1);
%     Save_Index_End = Peroids_PtsUse(end)-1;
%     Save_Index_Seg = FLF_save_mvMIROSeg;    

    LoadnameDepth =[num2str(Load_Index_Ini*FLF_Load_FrameRate),'-',...
                    num2str(Load_Index_End*FLF_Load_FrameRate),'-',...
                    num2str(Load_Index_Seg*FLF_Load_FrameRate),'s'];
    SavenameDepth =[num2str(Save_Index_Ini*FLF_Load_FrameRate),'-',...
                    num2str(Save_Index_End*FLF_Load_FrameRate),'-',...
                    num2str(Save_Index_Seg*FLF_Load_FrameRate),'s'];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MIRO parameter set
    idxfr  = 1
    Frame  = ['Frm',num2str(idxfr,'%05.0f')];
    imgtep = imread([loadpath,'_','7',LoadSuffix(2:end),'_',LoadnameDepth,'_', Frame,Data_01_formIm]);
    imgsiz = size(imgtep);


%     for idxPd = 1:(size(Peroids_PtsUse,1)-1) 
%         disp(idxPd)
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MIRO parameter initialization
% 
%         Frame_ini = Peroids_PtsUse(idxPd);
%         Frame_end = Peroids_PtsUse(idxPd+1)-1;
%         Frame_Ind = Frame_ini:Frame_end;
%         Frame_Len = length(Frame_Ind);
     for idxPd = 1:1001
        idxPd
        Frame_Len = 1;
        Frame_Ind = idxPd;
        FLFvidOrg = zeros([imgsiz,Frame_Len]);
        FLFvidDns = zeros([imgsiz,Frame_Len]);
    
        for idxt = 1:Frame_Len                                             
            FLFvidOrg(:,:,idxt) = imread([loadpath,'_','7',LoadSuffix(2:end),'_',LoadnameDepth,'_', ...
                                         'Frm',num2str(Frame_Ind(idxt),'%05d'),Data_01_formIm]);
            disp(idxt)
        end

%         figure;imshow(rescale(FLFvidOrg));
%         if ~exist('SLsys','var')                                       
%            SLsys =  getSLsys(FLFvidOrg, 3);
%         end

        [rows, cols] = size(FLFvidOrg);
        mask = ones(rows/3, cols/3);
%         mask(rows/6+0.5, :) = 0;  % Block out an area around the peak
        mask(:,rows/6+0.5) = 0;  % Block out an area around the peak
% %         mask(251,251) = 1;

        for idxxi = 1:Recons_43_NumEd                                      
        for idxet = 1:Recons_43_NumEd                                      
            FLFvidsub = FLFvidOrg((idxxi-1)*SubImSize+(1:SubImSize), ...
                                  (idxet-1)*SubImSize+(1:SubImSize),:);

            FLFvidsub_fil = real(ifft2(ifftshift(fftshift(fft2(FLFvidsub)).*mask)));
            FLFvidsub_fil(FLFvidsub_fil<0) = 0;
%         figure;imshow(rescale(FLFvidsub_fil)*3);
%         figure;imshow(rescale(FLFvidsub)*3);

%         adjustedImage = adapthisteq(rescale(FLFvidsub), 'ClipLimit',0.05);
%         figure;imshow(rescale(adjustedImage));
            if ~xor(mod(idxxi,2),mod(idxet,2))                             
                LambdaM = lambda1;
                NA = 0.2;
                FLFvidsub_fil = FLFvidsub;
            else
                LambdaM = lambda2;
                NA = 0.078;
            end
%              
%             [VidDNS] = MIRO(FLFvidsub_fil,...
%                         'Offset'                , 0,...
%                         'Gain'                  , 2.1,...
%                         'Lambda'                , LambdaM,...
%                         'NA'                    , 0.078,...
%                         'Magnification'         , 3.6, ...  
%                         'Mode'                  , 'y',...
%                         'OptionalFilter'        , 2,...
%                         'LambdaVideo '          , 0.75, ...
%                         'LambdaNLM '            , 0.5, ...
%                         'max_scale_factor'      , 5,...
%                         'HS'                    , 0,...
%                         'DisplayImages'         , 0,...
%                         'h'                     , 1,...
%                         'ResolutionCheckAuto'   , 0,...
%                         'ResolutionCheckNFrames', 1,...
%                         'SpectralFilterOn'      , 1,...
%                         'kmin'                  , 0.1,...
%                         'k'                     , 0.25, ...
%                         'shearletSystem'        , SLsys ...
%                         );

            [VidDNS] = ACSN(FLFvidsub_fil,NA,LambdaM,1.8,'Offset', 0,'Gain', 2.1);
%             if xor(mod(idxxi,2),mod(idxet,2))                             
%                [VidDNS] = ACSN(FLFvidsub,NA,LambdaM,1.8,'Offset', 0,'Gain', 2.1, 'weight', 1);
%             else
%                 VidDNS = FLFvidsub;
%             end

%             figure;imshow(rescale(VidDNS)*3);
%             VidDNS = FLFvidsub_fil;

            FLFvidDns((idxxi-1)*SubImSize+(1:SubImSize), ...
                      (idxet-1)*SubImSize+(1:SubImSize),:) = VidDNS;
            disp(idxxi);disp(idxet);
        end
        end
%         figure;imshow(rescale(FLFvidDns)*2);
%         imwrite(uint16(FLFvidDns),'acsn.tif');
        for idxt = 1:Frame_Len                                             
            imwrite(uint16(FLFvidDns(:,:,idxt)),[savepath,'_','7',SaveSuffix(2:end),'_',SavenameDepth,'_', ...
                                                 'Frm',num2str(Frame_Ind(idxt),'%05d'),Data_01_formIm]);            
            disp(idxt) 
        end
        close all
    end
    
    S27_DataSave_MOV_4NorV1( File_56_FLFVid_ExpPro,...
                             Data_01_formIm ,Data_02_formDt,Data_01_formVd,...
                             Index_Col0,Index_Col1,Index_Col2     ,FLF_ExpVid_Frameps,...
                             Save_Index_Ini    ,Save_Index_End    ,Save_Index_Seg,...
                             Save_Index_Ini    ,Save_Index_End    ,Save_Index_Seg,...
                             FLF_Load_FrameRate,FLF_ExpSub_crp_rad(idxfl==EXP_group), ...
                             Flag_multicolor   ,Flag_Normalization,File_0k_Dns,FLF_ExpVid_GrpName(idxfl==EXP_group,:));
end

path = 'F:\reconstruction\20240226\recon\5FLFVid_6exppro01_4Denoisnor';
file = dir(path);
file = file(3:end);
for i = 1:size(file,1)
    i
    load([path,'\',file(i).name]);
    for idxxi = 1:Recons_43_NumEd
        for idxet = 1:Recons_43_NumEd
            FLFvidsub = FLFimg_74cCrpnor((idxxi-1)*SubImSize+(1:SubImSize), ...
                (idxet-1)*SubImSize+(1:SubImSize),:);
            %             if ~xor(mod(idxxi,2),mod(idxet,2))
            %             figure;imshow(rescale(FLFvidsub)*2);
            %             hold on;
            %             clear m  n
            %             [x,y,c] = ginput(1);
            %             m(1) = x;
            %             n(1) = y;
            %             plot(x,y,'r');
            %             k = 2;
            %             while(c == 1)
            %                 [x1,y1,c1] = ginput(1);
            %                 if c1 == 1
            %                     m(k) = x1;
            %                     n(k) = y1;
            %                     plot(x,y,'r');
            %                     line([m(k-1) m(k)],[n(k-1) n(k)]);
            %                     k = k+1;
            %                     c = c1;
            %                 else
            %                     break
            %                 end
            %             end
            %             line([m(k-1) m(1)],[n(k-1) n(1)]);
            %             mask{idxxi,idxet} = roipoly(FLFvidsub,m,n);
            %             end
            %         end
            %         end
            if ~xor(mod(idxxi,2),mod(idxet,2))
                masks = mask{idxxi,idxet};
                FLFvidsub_ = FLFvidsub;
                FLFvidsub_(masks) = imadjust(FLFvidsub(masks),[0 0.2],[0 0.5]);
            else
                FLFvidsub_ = FLFvidsub;
            end
            %                 figure;imshow(rescale(FLFvidsub_)*1);
            FLFvidDns((idxxi-1)*SubImSize+(1:SubImSize), ...
                (idxet-1)*SubImSize+(1:SubImSize),:) = FLFvidsub_;
            disp(idxxi);disp(idxet);
        end
    end
    FLFimg_74cCrpnor = FLFvidDns;
    save((['F:\reconstruction\20240226\recon\5FLFVid_6exppro01_4Denoisnor_\',file(i).name]),'FLFimg_74cCrpnor');
end 

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Decompose                         
for idxsg = 1                                                              
    FLF_Save_DenoisIni = [002,006,000,018,016,000,008];
    FLF_Save_DenoisEnd = [684,686,000,697,684,000,684];
    FLF_Save_DenoisSeg = 1;

    FLF_ExpVid_Frameps = 100;
    FLF_Load_FrameRate = 0.01;
end

for idxfl = 1                                                              % Decomposition                    
%     FLF_ExpSub_crp_rad(idxfl) = 160;
    PCA_Sparsity = 5;

    FLF_Save_SparseIni = FLF_Save_DenoisIni;
    FLF_Save_SparseEnd = FLF_Save_DenoisEnd;
    FLF_Save_SparseSeg = FLF_Save_DenoisSeg;

    S27_DataSave_MOV_6DCP(  File_56_FLFVid_ExpPro                        , ...
                            Data_01_formIm,Data_02_formDt,Recons_43_NumEd, ...
                            FLF_Save_DenoisIni(idxfl),FLF_Save_DenoisEnd(idxfl),FLF_Save_DenoisSeg, ...
                            FLF_Save_SparseIni(idxfl),FLF_Save_SparseEnd(idxfl),FLF_Save_SparseSeg, ...
                            FLF_Load_FrameRate,FLF_ExpSub_crp_rad(idxfl),PCA_Sparsity  , ...
                            File_0i_Crp,File_0k_Dns,File_0o_DCP,File_0p_DCP,File_0q_DCP, ...
                            FLF_ExpVid_GrpName(idxfl,:) )
end

for idxsg = 1                                                              
    FLF_load_DecVidIni = [039,000];
    FLF_load_DecVidEnd = [924,000];
    FLF_load_DecVidSeg = 1

    FLF_save_DecVidIni = FLF_load_DecVidIni;
    FLF_save_DecVidEnd = FLF_load_DecVidEnd;
    FLF_save_DecVidSeg = FLF_load_DecVidSeg;
    
    FLF_ExpVid_Frameps = 100;
    FLF_Load_FrameRate = 0.01;

    PCA_Sparsity = 5;
end

for idxfl = 1                                                              % Decomposition normalization      
    S27_DataSave_MOV_4NorV1(File_56_FLFVid_ExpPro,...
                            Data_01_formIm    ,Data_02_formDt                  ,Data_01_formVd    ,...
                            Index_Col0,Index_Col1,Index_Col2                   ,FLF_ExpVid_Frameps,...
                            FLF_load_DecVidIni(idxfl),FLF_load_DecVidEnd(idxfl),FLF_load_DecVidSeg,...
                            FLF_save_DecVidIni(idxfl),FLF_save_DecVidEnd(idxfl),FLF_save_DecVidSeg,...
                            FLF_Load_FrameRate       ,FLF_ExpSub_crp_rad(idxfl),...
                            Flag_multicolor          ,Flag_Normalization,[File_0q_DCP,num2str(PCA_Sparsity)],...
                            FLF_ExpVid_GrpName(idxfl,:));
end


'\5FLFVid_6exppro01_6DecomS5\FLF_ExpImg_76DecomS5_0.39-9.24-0.01s_Frm00039.tif'
'\5FLFVid_6exppro01_6DecomS5\FLF_ExpImg_76DecompS5_0.39-9.24-0.01s_Frm00039.tif'

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
path = 'E:\large_field_flfm\20231120\00016\5FLFVid_2expraw01';
file = dir(path);
file = file(3:end);
for i = 001:338
    flfm = imread([path,file(i).name]);
    flfm_sub = flfm-95;
    flfm_sub(flfm_sub<0) = 0;
    
    save(['FLF_ExpImg_74cCrpnor_0.01-3.59-0.01s_Frm00',num2str(i),'.mat']);
end
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for idxt = 039:924
    load(['H:\20230528_Fit\5FLFVid_6exppro01_6DecomS\', ...
          'FLF_ExpImg_74Denois_0.39-9.24-0.01s_Frm',num2str(idxt,'%05d'),'.mat'],'recon')
    imwrite(uint16(recon),['H:\20230528_Fit\5FLFVid_6exppro01_6DecomS\', ...
                           'FLF_ExpImg_76DecompS5_0.39-9.24-0.01s_Frm',num2str(idxt,'%05d'),'.tif'])
    disp(idxt)
end

for idxt = 039:924
    S09_Rename('H:\20230528_Fit\5FLFVid_6exppro01_6DecomS5\', ...
               ['FLF_ExpImg_76DecompS5_0.39-9.24-0.01s_Frm',num2str(idxt,'%05d'),'.tif'], ...
               ['FLF_ExpImg_76DecomS5_0.39-9.24-0.01s_Frm',num2str(idxt,'%05d'),'.tif'])
    disp(idxt)
end

%% 
addpath(genpath('E:\21_MIRO'));

figure;imshow(raw(1108:1108+300,592:592+300),[]);
im = raw(1108:1108+300,592:592+300);
[rows, cols] = size(im);
mask = ones(rows, cols);
mask(151, :) = 0;  % Block out an area around the peak
mask(:,151) = 0;  % Block out an area around the peak
image_filtered = ifft2(ifftshift(fftshift(fft2(im)).*mask));
image_filtered(image_filtered<0) = 0;
figure;imshow(rescale(image_filtered)*3);
figure;imshow(rescale(im)*3);

fft_shift = fftshift(fft2(data_raw(:,:,2)));
figure;imshow(1+log(abs(fft_shift)),[]);

mask = ones(rows, cols);
mask(241, :) = 0;  % Block out an area around the peak
mask(:,241) = 0;  % Block out an area around the peak
mask(241,241) = 1;

[rows, cols] = size(fft_shift);
[x, y] = meshgrid(-cols/2:cols/2-1, -rows/2:rows/2-1);
radius = 60; % Radius of the low-pass filter
lpFilter = (x.^2 + y.^2) < radius^2;

figure;imshow(~mask.*~lpFilter);

figure;imshow(1+log(abs(fft_shift.*~(~mask.*~lpFilter))),[]);
image_filtered = ifft2(ifftshift(fft_shift.*~(~mask.*~lpFilter)));
image_filtered(image_filtered<0) = 0;
figure;imshow(image_filtered,[]);

image_filtered = ifft2(ifftshift(fft_shift.*mask));
image_filtered(image_filtered<0) = 0;
figure;imshow(rescale(image_filtered)*3);

figure;imshow(data_raw(:,:,2),[]);

first_img = FLFimg_72_SubBKG;
size_x = 1/3*size(first_img,1);
size_y = 1/3*size(first_img,2);
Mask_1 = xor(mod(repmat((1:3),[3,1]),2),mod(repmat((1:3)',[1,3]),2));
Mask_2 = ~Mask_1;

Even = kron(Mask_1,ones(size_x,size_y));
Odd = kron(Mask_2,ones(size_x,size_y));

% index of nine elements
Ax = kron([1,2,3]',ones(1,3));
Ay = Ax';
Ax_i = reshape(Ay,[1 9]);
Ay_i = reshape(Ax,[1 9]);
ind = reshape([1:9],[3 3])';

for i = 1:9
    Coord_xl(i) = 1+(Ay_i(i)-1)*size_x;
    Coord_xu(i) = size_x+(Ay_i(i)-1)*size_x;
    Coord_yl(i) = 1+(Ax_i(i)-1)*size_x;
    Coord_yu(i) = size_y+(Ax_i(i)-1)*size_y;
end

for j = 1:9
    data_raw(:,:,j) = FLFimg_72_SubBKG(Coord_xl(j):Coord_xu(j),Coord_yl(j):Coord_yu(j));
end

for idxxi = 1:3
    for idxet = 1:3
        if ~xor(mod(idxxi,2),mod(idxet,2))
            LambdaM = 0.61;
        else
            LambdaM = 0.525;
        end

        if ~exist('SLsys','var')
            SLsys =  getSLsys(FLFimg_72_SubBKG, 3);
        end

        FLFvidsub = data_raw(:,:,(idxxi-1)*3+idxet);
        [data_miro(:,:,(idxxi-1)*3+idxet)] = MIRO(image_filtered,...
            'Offset'                , 0,...
            'Gain'                  , 2.1,...
            'Lambda'                , LambdaM,...
            'NA'                    , 0.078,...
            'Magnification'         , 3.6, ...
            'Mode'                  , 'y',...
            'OptionalFilter'        , 1,...
            'LambdaVideo '          , 0.75, ...
            'LambdaNLM '            , 0.5, ...
            'max_scale_factor'      , 5,...
            'HS'                    , 0,...
            'DisplayImages'         , 1,...
            'h'                     , 1,...
            'ResolutionCheckAuto'   , 0,...
            'ResolutionCheckNFrames', 1,...
            'SpectralFilterOn'      , 1,...
            'kmin'                  , 0.1,...
            'k'                     , 0.25, ...
            'shearletSystem'        , SLsys ...
            );
        disp(idxxi);disp(idxet);
    end
end

for e = 1:9
    FLFimg_72_SubBKG1(Coord_xl(e):Coord_xu(e),Coord_yl(e):Coord_yu(e)) = data_miro(:,:,e);
end

figure;
subplot(121);imshow(U61_Imshow_B16_Col(FLFimg_72_SubBKG1,011));
subplot(122);imshow(U61_Imshow_B16_Col(FLFimg_72_SubBKG,011));

close all;

FLFimg_72_SubBKG = FLFimg_72_SubBKG1;
save('FLF_ExpImg_72SubBKG_0.01-0.01-0.01s_Frm00001.mat',"FLFimg_72_SubBKG");

imwrite(U61_Imshow_B16_Col(FLFimg_72_SubBKG1,011),'miro_subbkg.tif');
imwrite(U61_Imshow_B16_Col(FLFimg_72_SubBKG,011),'subbkg.tif');


path = 'E:\large_field_flfm\20231120\00016\5FLFVid_6exppro03_4Denois';
file = dir(path);
file = file(3:end);
for i = 1:157
    img = imread([path,'\',file(i).name]);
    crop = img(482:481*2,1:481);
    imwrite(crop,['E:\large_field_flfm\20231120\00016\03_ele\',file(i).name]);
    i
end















