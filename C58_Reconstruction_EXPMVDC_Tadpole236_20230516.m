% clear;  close all;  clc;
addpath(genpath('E:\00_Matlab_Code'))
addpath(genpath('E:\A_Fiji.app\Fiji.app\scripts'))
addpath(genpath('E:\02_ACsN'))
addpath(genpath('E:\02_MIRO'))

%% General Parameter Set %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    for idxsg = 1	                                                       % Save path name   set                 
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
        File_46_FLFImg_ExpPro = [File_00_path,File_40_FLFImg,'_6',File_0b_exp,File_06_pro];
        
        File_50_FLFVid        = '5FLFVid'; 
        File_51_FLFVid_SimSav = [File_00_path,File_50_FLFVid,'_1',File_0a_sim,File_01_sav];mkdir(File_51_FLFVid_SimSav);
        File_52_FLFVid_ExpRaw = [File_00_path,File_50_FLFVid,'_2',File_0b_exp,File_02_raw];mkdir(File_52_FLFVid_ExpRaw);
        File_53_FLFVid_BkgRaw = [File_00_path,File_50_FLFVid,'_3',File_0c_bkg,File_02_raw];mkdir(File_53_FLFVid_BkgRaw);
        File_54_FLFVid_SimRec = [File_00_path,File_50_FLFVid,'_4',File_0a_sim,File_04_rec];
        File_55_FLFVid_ExpRec = [File_00_path,File_50_FLFVid,'_5',File_0b_exp,File_04_rec];
        File_56_FLFVid_ExpPro = [File_00_path,File_50_FLFVid,'_6',File_0b_exp,File_06_pro];
        
        File_90_RayTracingsav = [File_00_path,'\','90_Ray_Tracingsave'];mkdir(File_90_RayTracingsav);
    end
    for idxsg = 1                                                          % Image  parameter set                 
        Data_00_bit     = 16    ;                                          %get
        Data_00_maxval  = 2^Data_00_bit-1;
        Data_01_formIm  = '.tif';                                          %get
        Data_01_formVd  = '.avi';                                          %get
        Data_02_formDt  = '.mat';                                          %get
        Data_04_smoothn = 1;                                               %Get?Recons_00_NUMd
        Data_04_Oper_sm = fspecial('gaussian',[Data_04_smoothn Data_04_smoothn],0.6);
    end
%% System parameter set 16X_NEW_300 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for idxsg = 1                                                          % System and simulate parameter 16XWV2 
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
    for idxsg = 1                                                          % Object parameters    set             
        Object_31_ZuFOV  = + 150.000*10^-6;                                % Get
        Object_31_ZlFOV  = - 150.000*10^-6;                                % Get
        Object_32_Z_stp  =   000.400*10^-6;                                % Get
        
       [Object_31_ZmFOV,Object_33_ZuNum,Object_33_ZlNum,...
        Object_33_ZdNum,Object_34_Z_Ind,Object_35_ZCoor] = S01_Coord_create_ud(...
        Object_31_ZuFOV,Object_31_ZlFOV,Object_32_Z_stp);
    end
%% System Charaterization %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
    for idxsg = 1                                                          % Ray tracing figure set and draw      
        Para_Raytrace_step_xx = 0.05;
        Para_Raytrace_Ray_num = 35;
        Para_draw_axis        = 0;
        
        Ini_coorr = 0.0;
        Ini_coorz = 0.5;
        I91_ray_tracing_CPU_20191221(dis_01_oo ,Fl_01_obj,Dm_01_obj,...
                                     dis_02_ot ,Fl_02_tub,Dm_02_tub,...
                                     dis_03_te ,Fl_03_ent,Dm_03_ent,...
                                     dis_04_em ,Fl_04_MLA,Dm_04_mic,...
                                     dis_05_mc ,Pi_04_MLA,Dm_04_MLA,...
                                     Ma_01_obj,NA_01_obj,Pi_05_cam,...
                                     Para_Raytrace_step_xx,Para_Raytrace_Ray_num,Ini_coorr,...
                                     Flag_Lens_On_axis    ,Para_draw_axis       ,Ini_coorz,...
                                     File_90_RayTracingsav,Data_01_formIm)
    end
    for idxta = 1                                                          % Theoretical predicted Character      
        %FLFM system AND FLFM system-imaging
       [Ma_06_Mic,Ma_06_FLF,fn_06_FLF                  ,...
        fn_06_sub,Ma_07_img                            ,...
        Theory_21_BakRd,Theory_22_NatRd,Theory_23_FouRd,...
        Theory_31_RatEl,Theory_31_NumEl                ,...
        Theory_41_ResNL,Theory_41_ResNA                ,...
        Theory_51_FWHML,Theory_52_FWHMA                ,...
        Theory_61_ResR0,Theory_62_ResZ0,Theory_63_ResZE,...
        Theory_71_FOVR0                                ,...
        Theory_72_DOFZ0,Theory_73_FOVZu,Theory_74_FOVZl,...
        Theory_32_NumEl,Theory_73_FOV_R,Theory_74_DOF_Z,...
        Theory_66_Res_R,Theory_67_Res_Z,Theory_68_ResZR,...
        Path_s010_ObjLam,Path_s020_FouLFM,Path_s021_MLALFM,Path_s040_zrange] =  ...
        F03_FLFsys_Characters_Lable(Fl_01_obj,NA_01_obj,Ma_01_obj,...
                                  Fl_01_tub,Fl_02_tub          ,...
                                  Fl_03_ent,Fl_07_img          ,...
                                  Fl_04_MLA,Dm_04_mic,Pi_04_MLA,...
                                  fn_01_obj,fn_04_MLA,lambdaAir,...
                                  del_05_mc,del_03_te,del_04_em,...
                                  Object_34_Z_Ind,Object_32_Z_stp,...
                                  Object_31_ZuFOV,Object_31_ZlFOV);
    end
close all
%% CSF&PSF calculation and data storage %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for idxsg = 1                                                          % Sampling parameter set               
        NIP_SegSZ = 600;
        Data_05_Refine = 2;
        Data_05_DownRT = 1;                                                % Downsampling ratio
                                                                           % Mic & MLA & FLP characterization  
       [Data_06_CCD_DN   ,Data_06_CCD_RF     ,...
        P27_NIP_RefAr_Odd,P27_NIP_RefAr_Eve  ,...
        P27_WFM_RefAd_Odd,P27_WFM_RefAd_Eve  ,...
        P35_Len_NumPd_DN ,P37_Len_NumPd_RF ,P37_Len_NumAd_RF,...
        P47_Fou_NumAd_RF ,P47_MLA_NumAdSim ,P47_MLA_NumAd_RF,...
        Path_s011Lsample ,Path_s031Lsample]= F02_FLFsys_SampleL(                ...
        Ma_06_Mic, NA_01_obj, Pi_04_MLA, Dm_04_mic, Pi_05_cam, Num05_cam       ,...
        Data_05_DownRT   ,Data_05_Refine   ,Object_31_ZmFOV  ,Object_33_ZdNum  ,...
        Theory_22_NatRd  ,Theory_23_FouRd  ,Theory_31_NumEl  ,Theory_41_ResNL  ,...
        Flag_simPSFfine  ,Flag_WFMPSFOnly  ,Flag_Simulation  ,...
        P291_NIP_Size_Ext,P292_NIP_Size_Wav,P293_NIP_Size_Num,...
        Flag_MLA_size_Odd,P492_MLA_lens_Ext,P491_MLA_lens_Num);
    end
%% For image %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % For image
        FLFRec_06_Iters = 6;
        FLFRec_07_PSFpw = 1;
        FLFRec_53cMdNum = 501;
        Path_s090_IterPW = F04_FLFrec_para_Lable(FLFRec_06_Iters,FLFRec_07_PSFpw);
        
    for idxta = 1                                                          % Reconstruction parameter set               
        Path_L259Time = '240217_1322';
        Path_L359Time = '240217_1322';
        Path_L449Time = '240217_1322';
        Path_L459Time = '240217_1322';
        Path_L549Time = '240217_1322';
        Path_L559Time = '62_4Denoisnor';
        
        Recons_51_NumML_sim_x = 91;                                        %get
        Recons_51_NumML_sim_y = 91;                                        %get
        Recons_52_NumML_exp_x = 93;                                        %get
        Recons_52_NumML_exp_y = 93;                                        %get
        
        WFMImg_01_Flag = 25;                                               % 'Experiment  Img 25'
        
        
        FLFPSF_01_Flag = 33;                                               % 'Simulated   PSF 10'
                                                                           % 'SimulateCrp PSF 11'
                                                                           % 'Experiment  PSF 20'
                                                                           % 'Hybried     PSF 30'
                                                                           % 'HyRried_rez PSF 31'
                                                                           % 'HyRried_crp PSF 32'
%         FLFImg_01_Flag = 47;                                             % 'Simulated  PSF  34'
        FLFImg_01_Flag = 57;                                               % 'Simulated  PSF  34'
                                                                           % 'Experiment PSF  35'
                                                                           % 'Simulated  Img  44'
                                                                           % 'Simulated  crp  46'
                                                                           % 'Experiment Img  45'
                                                                           % 'Experiment crp  47'
                                                                           % 'Simulated  Vid  54'
                                                                           % 'Experiment Vid  55'
                                                                           % 'Simulated  Vids 56'
                                                                           % 'Experiment Vids 57'
                                                                           
        FLFRec_01_Flag = 3;                                                % 'Single frame      1'
                                                                           % 'Volumetric stacks 2' 
                                                                           % 'Temperal   frames 3' 
        Recons_03_dzstr = 1e-9;
        Recons_03_zcstr = 50000;
        
        FLFPSF_31_ZlFOV = -200.000*10^-6;                                  %GET
        FLFPSF_31_ZuFOV = +200.000*10^-6;                                  %GET
        FLFPSF_32_Z_Stp = Object_32_Z_stp;                                 
        
        FLFImg_31_ZlFOV = -000.000*10^-6;                                  %GET
        FLFImg_31_ZuFOV = +000.000*10^-6;                                  %GET
        FLFImg_32_Z_Stp = Object_32_Z_stp;                                 
                
        FLFImg_31_ZlSeg = -000.000*10^-6;                                  %GET
        FLFImg_31_ZuSeg = +000.000*10^-6;                                  %GET
        FLFImg_32_Z_Seg = 1;                                               %GET
        
        FLFRec_31_ZuFOV = +200.000*10^-6;                                  %GET
        FLFRec_31_ZlFOV = -200.000*10^-6;                                  %GET
        FLFRec_32_Z_Stp = Object_32_Z_stp;                                     
        FLFRec_32_Z_Seg = 4;
        
        FLFImg_41_TlVid =  000.010;                                        %GET
        FLFImg_41_TuVid =  010.010;                                        %GET
        FLFImg_42_T_Stp =  000.010;                                        %GET
        
        FLFImg_41_TlSeg =  000.010;                                        %GET
        FLFImg_41_TuSeg =  010.010;                                        %GET
        FLFImg_42_T_Seg =  1;                                              %GET

%         Recons_11_FOVXX = Theory_05_FOVX0;                               %SET
%         Recons_21_FOVYY = Theory_05_FOVY0;                               %SET
        WFMImg_31_ZuFOV = +048.000*10^-6;                                  %GET
        WFMImg_31_ZlFOV = -048.000*10^-6;                                  %GET
        WFMImg_32_Z_Stp =  000.400*10^-6;                                  
        
        WFMImg_31_ZlSeg = -040.000*10^-6;                                  %GET
        WFMImg_31_ZuSeg = +040.000*10^-6;                                  %GET
        WFMImg_32_Z_Seg = 1;                                               %GET
        
        FLFRec_53_MdLen = 3;
        FLFRec_53_MrRat = 1.51; 
        FLFRec_53_MrNum = floor(FLFRec_53_MrRat);
        FLFRec_53_MdNum = FLFRec_53_MrNum*2+1;                             %GET
    end
        
    for idxta = 1                                                          % Reconstruction coordinates and paths generate  
       [WFMImg_31_ZmFOV,WFMImg_33_ZuNum,WFMImg_33_ZlNum,WFMImg_33_ZdNum,WFMImg_34_Z_Ind,WFMImg_35_ZCoor,...
        WFMSeg_38_Frm_Z,                WFMSeg_33_ZcNum,WFMSeg_33_ZdNum,WFMSeg_34_Z_Ind,WFMSeg_35_ZCoor,...
        FLFPSF_31_ZmFOV,FLFPSF_33_ZuNum,FLFPSF_33_ZlNum,FLFPSF_33_ZdNum,FLFPSF_34_Z_Ind,FLFPSF_35_ZCoor,...
        FLFRec_38_Frm_Z,                FLFRec_33_ZcNum,FLFRec_33_ZdNum,FLFRec_34_Z_Ind,FLFRec_35_ZCoor,...
        FLFImg_31_ZmFOV,FLFImg_33_ZuNum,FLFImg_33_ZlNum,FLFImg_33_ZdNum,FLFImg_34_Ind_Z,FLFImg_35_ZCoor,...
        FLFSeg_38_Z_Frm,                FLFSeg_33_ZcNum,FLFSeg_33_ZdNum,FLFSeg_34_Z_Ind,FLFSeg_35_ZCoor,...
        FLFImg_41_TmFOV,FLFImg_43_TuNum,FLFImg_43_TlNum,FLFImg_43_TdNum,FLFImg_44_T_Ind,FLFImg_45_TCoor,...
        FLFSeg_48_T_Frm,                FLFSeg_43_TcNum,FLFSeg_43_TdNum,FLFSeg_44_T_Ind,FLFSeg_45_TCoor,...
        FLFRec_03_MRaxi,FLFRec_04_MRmax,FLFRec_04_MRmin,FLFRec_03_fnum ,...
        FLFRec_13_Xrnum,FLFRec_13_XrNum,Recons_13_NumXc,FLFRec_13_XdNum,FLFRec_14_X_Ind,FLFRec_10_XCoor,...
        FLFRec_23_Yrnum,FLFRec_23_YrNum,Recons_23_NumYc,FLFRec_23_YdNum,FLFRec_24_Y_Ind,FLFRec_20_YCoor,...
        FLFRec_54_M_Ind,Path_s050_zrange] = S07_Coord_All(...
        WFMImg_31_ZuFOV,WFMImg_31_ZlFOV,WFMImg_32_Z_Stp,...
        WFMImg_31_ZuSeg,WFMImg_31_ZlSeg,WFMImg_32_Z_Seg,...
        FLFPSF_31_ZuFOV,FLFPSF_31_ZlFOV,FLFPSF_32_Z_Stp,...
        FLFRec_31_ZuFOV,FLFRec_31_ZlFOV,FLFRec_32_Z_Seg,...
        FLFImg_31_ZuFOV,FLFImg_31_ZlFOV,FLFImg_32_Z_Stp,...
        FLFImg_31_ZuSeg,FLFImg_31_ZlSeg,FLFImg_32_Z_Seg,...
        FLFImg_41_TuVid,FLFImg_41_TlVid,FLFImg_42_T_Stp,...
        FLFImg_41_TuSeg,FLFImg_41_TlSeg,FLFImg_42_T_Seg,...
        FLFRec_53_MrNum,Pi_05_cam,Pi_04_MLA,Ma_06_FLF,fn_06_FLF);

       [Path_L310_PSF,Path_L311_PSF,Path_L312_PSF                     ,...
        Path_L31A_PSF,Path_L31B_PSF,Path_L31C_PSF                     ,...
        Path_L32A_PSF,Path_L32B_PSF,Path_L32C_PSF] = S08_Load_Name_PSF(...
        Path_s020_FouLFM,Path_s031Lsample,Path_s040_zrange,...
        FLFPSF_31_ZlFOV ,FLFPSF_31_ZuFOV ,FLFRec_53cMdNum ,...
        File_31_FLFPSF_SimSav,File_32_FLFPSF_ExpRaw);

       [Path_L572cEnd,...
        Path_L250_Uni,Path_L250_Img,...
        Path_L340_Uni,Path_L340_Img,Path_L360_Uni,Path_L360_Img,...
        Path_L350_Uni,Path_L350_Img,...
        Path_L440_Uni,Path_L440_Img,Path_L460_Uni,Path_L460_Img,...
        Path_L450_Uni,Path_L450_Img,Path_L470_Uni,Path_L470_Img,...
        Path_L540_Uni,Path_L540_Img,Path_L560_Uni,Path_L560_Img,...
        Path_L550_Uni,Path_L550_Img,Path_L570_Uni,Path_L570_Img,...
        Path_L570cUni,Path_L570cImg] = S08_Load_Name_Img(...
        Path_s020_FouLFM,Path_s031Lsample  ,...
        WFMImg_31_ZlFOV ,WFMImg_31_ZuFOV   ,...
        FLFPSF_31_ZlFOV ,FLFPSF_31_ZuFOV   ,FLFImg_31_ZlFOV ,FLFImg_31_ZuFOV   ,...
        FLFImg_41_TlVid ,FLFImg_41_TuVid   ,FLFImg_42_T_Stp ,FLFSeg_44_T_Ind   ,...
        File_26_WFMImg_ExpPro,Path_L259Time,File_36_FLFPSF_ExpPro,Path_L359Time,...
        File_41_FLFImg_SimSav,Path_L449Time,File_46_FLFImg_ExpPro,Path_L459Time,...
        File_51_FLFVid_SimSav,Path_L549Time,File_56_FLFVid_ExpPro,Path_L559Time,...
        FLFRec_53cMdNum ,Data_02_formDt);

       [Path_s200_update,Path_s204_unifor,Path_s201_unifor,...
        Path_s400_update,Path_s401_unifor,Path_s404_unifor,...
        Path_s41o_FLFCrp,Path_s41p_FLFRez,Path_s41q_WFMPSF,Path_s41rsWFMPSF,Path_s41s_Hybper,...
        Path_s270_WFMImg,Path_s275_WFMdec,Path_s276_WFMreg,Path_s277_WFMcmp,...
        Path_s278_WFMcmp,...
        Path_s470_Object,Path_s472_Objnor,Path_s472_Objb16,Path_s474_ObjCrp,Path_s477_Objrez,...
        Path_s460_FLFSub,Path_s485_FLFLsp,Path_s486_FLFNor,Path_s487_FLFRez,Path_s495_FLFHsp,...
        Path_s4a0_HybImg,Path_s4b0_HydImg,Path_s4c0_Hydae8,Path_s4d0_Hydpe4,...
        Path_s40y_Profil,Path_s40z_Analys,...
        Text_s401Rescale,Text_s402Cropped,...
        Text_s554MIP3Dmv,Text_s554MIP3DmL,Text_s557MIP3Dmp,...
        Text_s554_MIPCro,Path_s554lMIPCro,...
        Text_s556_PtsAll,Text_s556_BoxReg,Text_s557_DataSV,Text_s558_T_Disp,Text_s559_T_CaTr...
        ] = S20_DataSave_PathSet(         ...
        Path_s010_ObjLam,Path_s020_FouLFM,Path_s021_MLALFM,WFMImg_01_Flag,...
        Path_s011Lsample,Path_s031Lsample,Path_s090_IterPW,FLFImg_01_Flag,...
        File_14_WFMPSF_SimRec,File_15_WFMPSF_ExpRec,File_24_WFMImg_SimRec,File_25_WFMImg_ExpRec,...
        File_34_FLFPSF_SimRec,File_35_FLFPSF_ExpRec,File_44_FLFImg_SimRec,...
        File_45_FLFImg_ExpRec,File_54_FLFVid_SimRec,File_55_FLFVid_ExpRec);

%         load([File_56_FLFVid_ExpPro,Path_L559Time,'\FLF_ExpImgSystole_Pts',Data_02_formDt],'FLFimgCorrelation','Systole_Pts','diastolePts','Beat_Peroid')
        FLFRec_49_Fram0 = 0001;
%         FLFRec_49_Fram1 = Systole_Pts(1);
%         FLFRec_49_Fram2 = diastolePts(1);
    end
    
    for idxsg = 1                                                          % Image croping - croping pattern simulation 
%         Recons_51_Stoper = I25_MLA_Modulation_SQU_Aperture_Num(                 ...
%                              Fl_04_MLA       , k0             ,Data_06_CCD_RF  ,...
%                              P37_Len_NumPd_RF,P37_Len_NumPd_RF,P37_Len_NumAd_RF,...
%                              P47_MLA_NumAd_RF,P47_Fou_NumAd_RF,P490_MLA_Beam_Rat,...
%                              Flag_LensTraCir,Flag_LensletCen,1,Flag_LensAlluse);
%         Recons_51_Stpcro = I25_MLA_Modulation_SQU_Aperture_Num(                 ...
%                              Fl_04_MLA       , k0             ,Data_06_CCD_RF  ,...
%                              P37_Len_NumPd_RF,P37_Len_NumPd_RF,P37_Len_NumAd_RF,...
%                              P47_MLA_NumAd_RF,P47_Fou_NumAd_RF,1.51            ,...
%                              1,Flag_LensletCen,1,0);
%         Recons_51_StoAbs = imbinarize(O10_pixelBinning(Recons_51_Stoper,Data_05_Rifine));imshow(Recons_51_StoAbs)
%         Recons_51_StcAbs = imbinarize(O10_pixelBinning(Recons_51_Stpcro,Data_05_Rifine));imshow(Recons_51_StcAbs)
%         Recons_51_StpAbs = xor(Recons_51_StcAbs,Recons_51_StoAbs)                       ;imshow(Recons_51_StpAbs)

%         Recons_50_CoorM = (abs(Recons_54_Ind_M)+1)'*(abs(Recons_54_Ind_M)+1);
%         Recons_51_StrAbs= kron(Recons_50_CoorM,ones(160));                 U60_Imshow_B16(Recons_51_StrAbs)
        Recons_50_Mask_1 = xor(mod(repmat((1:3),[3,1]),2),mod(repmat((1:3)',[1,3]),2));
        Recons_50_Mask_2 = ~Recons_50_Mask_1;
        
        Recons_51_StpCro = kron(Recons_50_Mask_1,ones(FLFRec_53cMdNum,FLFRec_53cMdNum));
        Recons_51_StpPer = kron(Recons_50_Mask_2,ones(FLFRec_53cMdNum,FLFRec_53cMdNum));
                                                                           figure,imshow(Recons_51_StpCro);
                                                                           figure,imshow(Recons_51_StpPer);
    end
    close all;clc
%% Data imput: Using entire information%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    switch FLFPSF_01_Flag                                                  % FLF PSF load and space characterization    
        case 10                                                            % 'Simulated   PSF 10'
            load([Path_L310_PSF,'_','6_3DNDat_Down',Data_02_formDt]);      FLFPSF_64_NorCrp = P62_FLF_PSF3Dn_nor(:,:,FLFRec_38_Frm_Z);  
                                                                           U_Image_show_16(203,FLFPSF_64_NorCrp(:,:,FLFRec_33_ZcNum));     clear P62_FLF_PSF3Dn_nor;   
            FLFRec_13_RdNum  = P17_ParityMatch_Min(round(Pi_04_MLA*FLFRec_53_MdLen/Data_06_CCD_DN),size(RecRez_64_PSFunc,1));   % get
            if mod(FLFRec_13_RdNum,2)                                      
                load([Path_L310_PSF,'_','6_WFModd_Down',Data_02_formDt]);   WFMPSF_64_NorCrp = P62_WFM_PSFodd_nor(:,:,FLFRec_38_Frm_Z);	U_Image_show_16(201,WFMPSF_64_NorCrp(  :,:,FLFRec_33_ZcNum));   clear P62_WFM_PSFodd_nor;   
            else
                load([Path_L310_PSF,'_','6_WFMeve_Down',Data_02_formDt]);   WFMPSF_64_NorCrp = P62_WFM_PSFeve_nor(:,:,FLFRec_38_Frm_Z);  U_Image_show_16(202,WFMPSF_64_NorCrp(  :,:,FLFRec_33_ZcNum));   clear P62_WFM_PSFeve_nor;   
            end
            RezRec_13_RdNum  = size(RecRez_64_PSFunc,1);                   Recons_15_RcNum = ceil(RezRec_13_RdNum/2);        
            FLFPSF_74_NorCrp = P35_Imgcrop_centerS(FLFPSF_64_NorCrp,FLFRec_13_RdNum);	clear RecFLF_64_PSFunc;
            RezPSF_74_NorCrp = P35_Imgcrop_centerS(RecRez_64_PSFunc,RezRec_13_RdNum);    
                                                                           U_Image_show_16(206,RezPSF_74_NorCrp(:,:,FLFRec_33_ZcNum));     clear RecRez_64_PSFunc;
            FLFRec_33_ZdNum  = size(FLFImg_74_NorCrp,3);
        case 11                                                            % 'SimulateCrp PSF LS'
            load([Path_L31C_PSF,Data_02_formDt]);                      
            FLFPSF_74_NorCrp = FLF_SimPSF_bin_crp(:,:,:);              
            clear FLF_SimPSF_bin_crp;
        case 12                                                            % 'SimulateCrp PSF HS'
            load([Path_L31D_PSF,Data_02_formDt]);                      
            FLFPSF_74_NorCrp = V40_NorGPU_one(FLF_SimPSF_rez_crp(:,:,:));
%                 RecFLF_64_PSFcrp = V40_NorGPU_one(FLF_SimPSF_rez_crp(:,:,:).*Recons_51_StrAbs);
            clear FLF_SimPSF_bin_crp;
        case 30                                                            
            load([Path_L32A_PSF,Data_02_formDt]);                      
            FLFPSF_74_NorCrp = FLF_HybPSF_Nor(:,:,:);                  
            clear FLF_HybPSF_Nor;
        case 31                                                            
            load([Path_L32B_PSF,Data_02_formDt]);                      
            FLFPSF_74_NorCrp = rescale(FLF_HyRPSF_Nor(:,:,:).^FLFRec_07_PSFpw);
            U65_Imshow_B16_3DMaxP_Fire(FLF_HyRPSF_Nor);                
            clear FLF_HyRPSF_Nor;
        case 32                                                            
            load([Path_L32C_PSF,Data_02_formDt]);                          
            FLFPSF_74_NorCrp = rescale(FLF_HySPSF_Nor(:,:,FLFRec_34_Z_Ind-FLFPSF_34_Z_Ind(1)+1).^FLFRec_07_PSFpw);
            U65_Imshow_B16_MIP_3D_Fire(FLF_HySPSF_Nor);                    
            clear FLF_HySPSF_Nor;
            U65_Imshow_B16_MIP_3D_Fire(FLFPSF_74_NorCrp);
        case 33                                                            
            load([Path_L32B_PSF,Data_02_formDt]);                      
            FLF_ExpPSF_Zshift = -0;
            FLF_SubPSF_crp_rad =  250;
            Recons_43_NumEd   = 3;

            load([File_32_FLFPSF_ExpRaw,'\','FLFM_PSF_CenfitCoordinates_sub','.mat'],'FLF_ExpPSF_sub_Xfit','FLF_ExpPSF_sub_Yfit');

            FLF_HySPSF_Nor = S21_DataSave_FLF_HySPSF_Back( FLF_HyRPSF_Nor  ,FLF_SubPSF_crp_rad ,Recons_43_NumEd,...
                                                        FLF_ExpPSF_sub_Yfit,FLF_ExpPSF_sub_Xfit,FLF_ExpPSF_Zshift);
            FLFPSF_74_NorCrp = rescale(FLF_HySPSF_Nor(:,:,FLFRec_34_Z_Ind-FLFRec_34_Z_Ind(1)+1).^FLFRec_07_PSFpw);
%             U65_Imshow_B16_MIP_3D_Fire(FLF_HySPSF_Nor);
%             U65_Imshow_B16_MIP_3D_Fire(FLFPSF_74_NorCrp);
            clear FLF_HySPSF_Nor;

            clear FLF_HyRPSF_Nor;
        otherwise                                                          
            
    end
    
    switch FLFImg_01_Flag                                                  % FLF IMG load and Path choice               
        case 21
            for idxsg = 1                                                  % Reconstruction data load and crop - simulated  PSF  
                load([Path_L31C_PSF,Data_02_formDt]);                      
                FLFImg_74_Crpnor = FLF_SimPSF_bin_crp(:,:,:);              U65_Imshow_B16_3DMaxP_Fire(FLFImg_74_Crpnor);
                FLFImg_74_NorCrp = single(V41_NorGPU_one_1b1(FLFImg_74_Crpnor(:,:,FLFSeg_38_Z_Frm)));
                                                                           U65_Imshow_B16_3DMaxP_Fire(FLFImg_74_NorCrp);
                clear FLF_SimPSF_bin_crp;
            end
            for idxsg = 1                                                  % Reconstruction data load and crop - simulated  PSFHS
                load(Path_L31D_PSF);                      
                FLFImg_74_Crpnor = FLF_SimPSF_rez_crp(:,:,:);              U65_Imshow_B16_3DMaxP_Fire(FLFImg_74_Crpnor);
                FLFImg_74_NorCrp = single(V41_NorGPU_one_1b1((FLFImg_74_Crpnor(:,:,FLFSeg_38_Z_Frm))));
                                                                           U65_Imshow_B16_3DMaxP_Fire(FLFImg_74_NorCrp);
                clear FLF_SimPSF_bin_crp;
            end
        case 35
            for idxsg = 1                                                  % Reconstruction data load and crop - Experiment PSF  
                load(Path_L350_Img);                                   U60_Imshow_B16(FLF_DnsPSF_Nor(:,:,end));
                FLFImg_74_NorCrp = single(FLF_DnsPSF_Nor(:,:,FLFSeg_38_Z_Frm));
                clear FLF_DnsPSF_Nor;
            end
        case 44
            for idxsg = 1                                                  % Reconstruction data load and crop - simulated  Fix  
                load(Path_L440_Img);                                   U60_Imshow_B16(ObjFLF_72_Orgnor(:,:,end));
                FLFImg_74_NorCrp = single(ObjFLF_72_Orgnor(:,:,FLFSeg_38_Z_Frm));
            end
        case 45
            for idxsg = 1                                                  % Reconstruction data load and crop - Experiment Fix  
                load(Path_L450_Img);                                   U60_Imshow_B16(FLFimg_74_Crpnor(:,:,end));
                FLFImg_74_NorCrp = single(FLFimg_74_Crpnor(:,:,FLFSeg_38_Z_Frm));
                clear FLFimg_74_Crpnor;
            end
        case 46
            for idxsg = 1                                                  % Reconstruction data load and crop - simulated  Fix  
                load(Path_L460_Img);                                   U60_Imshow_B16(ObjFLF_72cOrgnor(:,:,end));
                FLFImg_74_NorCrp = single(ObjFLF_72cOrgnor(:,:,FLFSeg_38_Z_Frm));
                clear ObjFLF_82cOrgnor;
            end
        case 47
            for idxsg = 1                                                  % Reconstruction data load and crop - simulated  Fix  
                load(Path_L470_Img);                                   U60_Imshow_B16(FLFimg_74cCrpnor(:,:,end));
                FLFImg_74_NorCrp = single(FLFimg_74cCrpnor(:,:,FLFSeg_38_Z_Frm));
                clear FLFimg_74cCrpnor;
            end
        case 57                                                            % Reconstruction data load and crop - Experiment Fix  (19)_10_5000  
                load(Path_L570_Img);                                        figure,imshow(FLFimg_74cCrpnor(:,:,end),[]);
%                 FLFimg_72_SubBKG(FLFimg_72_SubBKG<0) = 0;
%                 FLFImg_74_NorCrp = single(FLFimg_72_SubBKG);               figure,imshow(FLFImg_74_NorCrp,[]);
                FLFImg_74_NorCrp = single(FLFimg_74cCrpnor);
                clear RecFLF_84cCrpnor;
        otherwise
    end
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    for idxta = 1                                                          % Reconstruction FLF OTF processing          
        FLFPSF_74_NorCr1 = FLFPSF_74_NorCrp.*repmat(Recons_51_StpPer, [1,1,FLFRec_33_ZdNum]);
        U65_Imshow_B16_MIP_3D_Fire(FLFPSF_74_NorCr1);                      
%        [FLFPSF_75_OTFunc, FLFPSF_75tOTFunc] = N32_DeconvRL_3D_APU_OTF_FLFM_NnTn( single( FLFPSF_74_NorCrp ) );gpuDevice;
       [FLFPSF_75_OTFun1, FLFPSF_75tOTFun1] = N32_DeconvRL_3D_APU_OTF_FLFM_N1T1( single( FLFPSF_74_NorCr1 ) );gpuDevice;
%        [FLFPSF_75_OTFun1_s, FLFPSF_75tOTFun1_s] = N32_DeconvRL_3D_APU_OTF_FLFM_N1T1_s( single( FLFPSF_74_NorCr1 ) );gpuDevice;
                FLFPSF_70_VLsize = size(FLFPSF_74_NorCrp);
    end
    save([Path_s485_FLFLsp,'OTF1',Data_02_formDt],'FLFPSF_75_OTFun1','FLFPSF_75tOTFun1','-v7.3','-nocompression');
    clear FLFPSF_74_NorCr1;

    for idxta = 1                                                          % Reconstruction FLF OTF processing          
        FLFPSF_74_NorCr2 = FLFPSF_74_NorCrp.*repmat(Recons_51_StpCro, [1,1,FLFRec_33_ZdNum]);
        U65_Imshow_B16_MIP_3D_Fire(FLFPSF_74_NorCr2);                       
%        [FLFPSF_75_OTFunc, FLFPSF_75tOTFunc] = N32_DeconvRL_3D_APU_OTF_FLFM_NnTn( single( FLFPSF_74_NorCrp ) );gpuDevice;
       [FLFPSF_75_OTFun2, FLFPSF_75tOTFun2] = N32_DeconvRL_3D_APU_OTF_FLFM_N1T1( single( FLFPSF_74_NorCr2 ) );gpuDevice;
%        [FLFPSF_75_OTFun2_s, FLFPSF_75tOTFun2_s] = N32_DeconvRL_3D_APU_OTF_FLFM_N1T1_s2( single( FLFPSF_74_NorCr2 ) );gpuDevice;
                FLFPSF_70_VLsize = size(FLFPSF_74_NorCrp);
    end
    save([Path_s485_FLFLsp,'OTF2',Data_02_formDt],'FLFPSF_75_OTFun2','FLFPSF_75tOTFun2','-v7.3','-nocompression');
    clear FLFPSF_74_NorCr2;
    clear FLFPSF_74_NorCrp;
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Recons_06_PSFIM  = 1e0;                                                % FLForg and FLFrez Reconstruction and save  
    FLFRec_09_ColSat = 2;
    switch  FLFRec_01_Flag                                                 
    otherwise

        for idxsg = 1                                                      % Reconstruction crop range set (Test)       
            FLFimg_09_VidCo0 = 'fire';
            FLFImg_41_TlSeg =  000.010;                                        %GET
            FLFImg_41_TuSeg =  010.010;                                        %GET
            FLFImg_42_T_Seg =  1;                                              %GET
           [FLFSeg_48_T_Frm,FLFSeg_43_TdNum,~              ,FLFSeg_44_T_Ind,FLFSeg_45_TCoor] = S02_Coord_Used(...
            FLFImg_41_TlSeg,FLFImg_41_TuSeg,FLFImg_42_T_Seg,FLFImg_44_T_Ind,FLFImg_45_TCoor);
           
            FLFImg_74_NorCrp = single(FLFimg_74cCrpnor);
%             FLFImg_74_NorCrp = single(FLFimg_72_SubBKG);
            FLFImg_74_NorCr1= FLFImg_74_NorCrp.*Recons_51_StpPer;
            FLFImg_74_NorCr2= FLFImg_74_NorCrp.*Recons_51_StpCro;

            Magnify_val = 65535;
            Max_BKG_rat = 0.001^2;
          %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Reconstruction parameter set
            Image_data  = single( Magnify_val * FLFImg_74_NorCr1);
            
            OTF_N_data  = gpuArray(single( Magnify_val.* FLFPSF_75_OTFun1));
%                                                                            clear   FLFPSF_75_OTFun1
            OTF_T_data  = gpuArray(single( Magnify_val.* FLFPSF_75tOTFun1));
%                                                                            clear   FLFPSF_75tOTFun1
            Image_size = [size(Image_data,1), size(Image_data,2)];
            PSF__depth =                      size(OTF_N_data,3) ;
            Recon_size = [size(OTF_N_data,1), size(OTF_N_data,2)];
          %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Reconstruction
            for idxt = FLFRec_49_Fram0                                     
                Path_L554_Index  = num2str(FLFSeg_44_T_Ind(idxt),'%05d');
%                 load([Path_L570_Uni,Path_L554_Index,Data_02_formDt],'FLFimg_72_SubBKG');
%                 FLFimg_72_SubBKG(FLFimg_72_SubBKG<0) = 0;
%                 FLFimg_74cCrpnor = FLFimg_72_SubBKG;
                load([Path_L570_Uni,Path_L554_Index,Data_02_formDt],'FLFimg_74cCrpnor');
                                                                         figure,imshow(FLFimg_74cCrpnor(:,:,end),[]);
                FLFImg_74_NorCr1 = single(rescale(FLFimg_74cCrpnor)).*Recons_51_StpPer;
                                                                           clear RecFLF_84cCrpnor;
                figure,  histogram(FLFImg_74_NorCr1(FLFImg_74_NorCr1>0),200);
                FLFImg_74_CrpNo1 = 0.040;
                FLFImg_75_Denois = FLFImg_74_NorCr1 - FLFImg_74_CrpNo1;    FLFImg_75_Denois(FLFImg_75_Denois<0)=0;
                figure,  histogram(FLFImg_75_Denois(FLFImg_75_Denois>0));  
                                                                           figure,imshow(FLFImg_75_Denois(:,:,end),[]);
                %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Start APU deconvolution
                        Image_data = gpuArray(single( Magnify_val.*(FLFImg_75_Denois+Max_BKG_rat)));

                disp(['FFT size is '   num2str(Recon_size(1)) 'X' num2str(Recon_size(2))]); 
                disp('Start iteration');
                tic

                        FFTPad_Tep = gpuArray.zeros( Recon_size             ,'single');
                        Recon_data =          zeros([Image_size, PSF__depth],'single');  
                    for idxk = 1:PSF__depth                                
                        ImgFFT_Pad = FFTPad_Tep;  ImgFFT_Pad( 1:Image_size(1), 1:Image_size(2) ) = Image_data;

                        Recon_temp =         real( ifft2( fft2(ImgFFT_Pad).* OTF_T_data(:,:,idxk) ) ) ;
                        Recon_data( : , : ,idxk) = Recon_temp( 1:Image_size(1), 1:Image_size(2));
                    end
                for idxit = 7:10%1:FLFRec_06_Iters                              
                    % ForwardProject
                        Recon_Proj = gpuArray.zeros( Image_size             ,'single');
                    for idxk = 1:PSF__depth                                           
                        PrjFFT_Pad = FFTPad_Tep;  PrjFFT_Pad( 1:Image_size(1), 1:Image_size(2) ) = Recon_data(:,:,idxk);

                        Prj_SLayer =        real( ifft2( fft2(PrjFFT_Pad).* OTF_N_data(:,:,idxk) ) ) ;
                        Recon_Proj = Recon_Proj + Prj_SLayer( 1:Image_size(1), 1:Image_size(2));
                    end
                    % BackwardProject
                    for idxk = 1:PSF__depth                                           
                        PrjErr_Pad = FFTPad_Tep;  PrjErr_Pad( 1:Image_size(1), 1:Image_size(2) ) = Image_data./Recon_Proj;

                        Err_SLayer =         real( ifft2( fft2(PrjErr_Pad).* OTF_T_data(:,:,idxk) ) ) ;
                        Recon_data( : , : ,idxk) = Err_SLayer( 1:Image_size(1), 1:Image_size(2)).* Recon_data( : , : ,idxk);
                    end
                        Recon_data(isnan(Recon_data)) = 0;
                    disp(idxit)
                end     
                toc
            end
                                                                           U65_Imshow_B16_MIP_3D_Fire(Recon_data);
            FLFRec_85_RecNor = P35_Imgcrop_centerS(gather(Recon_data),FLFRec_53cMdNum);
                                                                           U65_Imshow_B16_MIP_3D_Fire(FLFRec_85_RecNor);
%             U55_Imshow_B08_MIP_3D_Col(   FLFRec_85_RecNor,011,1,1);
%             U55_Imshow_B08_MIP_3D_ColAdj(FLFRec_85_RecNor,011,1,1);
            figure;imshow(U65_Imshow_B16_MIP_3D_Col(imresize(FLFRec_85_RecNor,Ma_01_obj/Ma_06_FLF/FLFRec_32_Z_Seg),011,1));
            FLFRec_18cX_Ind  = 5:495;                                     disp(length(FLFRec_18cX_Ind));
            FLFRec_28cY_Ind  = 5:495;                                     disp(length(FLFRec_28cY_Ind));
            FLFRec_38cZ_Ind  = (620:690)-518;%(630:683)-518;                                   disp(length(FLFRec_38cZ_Ind));
            FLFRec_86_FlpNor1 = rot90(flip(flip(FLFRec_85_RecNor(FLFRec_28cY_Ind,FLFRec_18cX_Ind,FLFRec_38cZ_Ind),2),1 ),3);
            U65_Imshow_B16_MIP_3D_Fire(FLFRec_86_FlpNor1);
%             U55_Imshow_B08_MIP_3D_ColAdj(FLFRec_86_FlpNor,011,1,1);

%             for idxt = FLFRec_49_Fram2                                     
%                 Path_L554_Index  = num2str(FLFSeg_44_T_Ind(idxt),'%05d');
%                 load([Path_L570_Uni,Path_L554_Index,Data_02_formDt],'FLFimg_74cCrpnor');
%                                                                            figure,imshow(FLFimg_74cCrpnor(:,:,end),[]);
%                 FLFImg_74_NorCr1 = single(FLFimg_74cCrpnor.*Recons_51_StpPer);
%                                                                            clear RecFLF_84cCrpnor;
%                 figure,  histogram(FLFImg_74_NorCr1(FLFImg_74_NorCr1>0),200);
%                 FLFImg_74_CrpNo1 = 0.010;
%                 FLFImg_75_Denois = FLFImg_74_NorCr1 - FLFImg_74_CrpNo1;    FLFImg_75_Denois(FLFImg_75_Denois<0)=0;
%                 figure,  histogram(FLFImg_75_Denois(FLFImg_75_Denois>0));  
%                                                                            figure,imshow(FLFImg_75_Denois(:,:,end),[]);
%                 %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Start APU deconvolution
%                         Image_data = gpuArray(single( Magnify_val.*(FLFImg_75_Denois+Max_BKG_rat)));
% 
%                 disp(['FFT size is '   num2str(Recon_size(1)) 'X' num2str(Recon_size(2))]); 
%                 disp('Start iteration');
% 
%                         FFTPad_Tep = gpuArray.zeros( Recon_size             ,'single');
%                         Recon_data = gpuArray.zeros([Image_size, PSF__depth],'single');  
%                     for idxk = 1:PSF__depth                                
%                         ImgFFT_Pad = FFTPad_Tep;  ImgFFT_Pad( 1:Image_size(1), 1:Image_size(2) ) = Image_data;
% 
%                         Recon_temp =         real( ifft2( fft2(ImgFFT_Pad).* OTF_T_data(:,:,idxk) ) ) ;
%                         Recon_data( : , : ,idxk) = Recon_temp( 1:Image_size(1), 1:Image_size(2));
%                     end
%                 for idxit = 1:FLFRec_06_Iters                              
%                     tic;                                                               % ForwardProject
%                         Recon_Proj = gpuArray.zeros( Image_size             ,'single');
%                     for idxk = 1:PSF__depth                                           
%                         PrjFFT_Pad = FFTPad_Tep;  PrjFFT_Pad( 1:Image_size(1), 1:Image_size(2) ) = Recon_data(:,:,idxk);
% 
%                         Prj_SLayer =        real( ifft2( fft2(PrjFFT_Pad).* OTF_N_data(:,:,idxk) ) ) ;
%                         Recon_Proj = Recon_Proj + Prj_SLayer( 1:Image_size(1), 1:Image_size(2));
%                     end
%                                                                                        % BackwardProject
%                     for idxk = 1:PSF__depth                                           
%                         PrjErr_Pad = FFTPad_Tep;  PrjErr_Pad( 1:Image_size(1), 1:Image_size(2) ) = Image_data./Recon_Proj;
% 
%                         Err_SLayer =         real( ifft2( fft2(PrjErr_Pad).* OTF_T_data(:,:,idxk) ) ) ;
%                         Recon_data( : , : ,idxk) = Err_SLayer( 1:Image_size(1), 1:Image_size(2)).* Recon_data( : , : ,idxk);
%                     end
%                         Recon_data(isnan(Recon_data)) = 0;
%                     disp(idxit)
%                 end
% 
%             end
%             U55_Imshow_B08_MIP_3D_ColAdj(FLFRec_85_RecNor,011,1,1)
%             FLFRec_85_RecNor = P35_Imgcrop_centerS(gather(Recon_data),FLFRec_53cMdNum);
%                                                                            U65_Imshow_B16_MIP_3D_Fire(FLFRec_85_RecNor);
%             FLFRec_18cX_Ind  = 30:320;                                     disp(length(FLFRec_18cX_Ind));
%             FLFRec_28cY_Ind  = 30:320;                                     disp(length(FLFRec_28cY_Ind));
%             FLFRec_38cZ_Ind  =(344:774)-343;                               disp(length(FLFRec_38cZ_Ind));
%             FLFRec_86_FlpNor = rot90(flip(flip(FLFRec_85_RecNor(FLFRec_28cY_Ind,FLFRec_18cX_Ind,FLFRec_38cZ_Ind),2),1 ),3);
%             U55_Imshow_B08_MIP_3D_ColAdj(FLFRec_86_FlpNor,011,1,1);
%             close all
%             %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%             FLFRec_18cX_Ind  = 30:320;                                     disp(length(FLFRec_18cX_Ind));
%             FLFRec_28cY_Ind  = 30:320;                                     disp(length(FLFRec_28cY_Ind));
%             FLFPSF_38cZ_Ind  =(344:784)-343;                               disp(length(FLFPSF_38cZ_Ind));
%             FLFRec_38cZ_Ind  = 21:length(FLFPSF_38cZ_Ind)-10;              disp(length(FLFRec_38cZ_Ind));
% 
%             FLFPSF_75_OTFun1 = OTF_N_data;                                 
%             OTF_N_data = single(FLFPSF_75_OTFun1(:,:,FLFPSF_38cZ_Ind));
%             FLFPSF_75tOTFun1 = OTF_T_data;                                 
%             OTF_T_data = single(FLFPSF_75tOTFun1(:,:,FLFPSF_38cZ_Ind));
%             
%             Image_size = [size(Image_data,1), size(Image_data,2)];
%             PSF__depth =                      size(OTF_N_data,3) ;
%             Recon_size = [size(OTF_N_data,1), size(OTF_N_data,2)];
% 
%             for idxt = FLFRec_49_Fram0                                     
%                 Path_L554_Index  = num2str(FLFSeg_44_T_Ind(idxt),'%05d');
%                 load([Path_L570_Uni,Path_L554_Index,Data_02_formDt],'FLFimg_74cCrpnor');
%                                                                            figure,imshow(FLFimg_74cCrpnor(:,:,end),[]);
%                 FLFImg_74_NorCr1 = single(FLFimg_74cCrpnor.*Recons_51_StpPer);
%                                                                            clear RecFLF_84cCrpnor;
%                 figure,  histogram(FLFImg_74_NorCr1(FLFImg_74_NorCr1>0),200);
%                 FLFImg_74_CrpNo1 = 0.030;
%                 FLFImg_75_Denois = FLFImg_74_NorCr1 - FLFImg_74_CrpNo1;    FLFImg_75_Denois(FLFImg_75_Denois<0)=0;
%                 figure,  histogram(FLFImg_75_Denois(FLFImg_75_Denois>0));
%                                                                            figure,imshow(FLFImg_75_Denois(:,:,end),[]);
%                 %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Start APU deconvolution
%                         Image_data = gpuArray(single( Magnify_val.*(FLFImg_75_Denois+Max_BKG_rat)));
% 
%                 disp(['FFT size is '   num2str(Recon_size(1)) 'X' num2str(Recon_size(2))]); 
%                 disp('Start iteration');
% 
%                         FFTPad_Tep = gpuArray.zeros( Recon_size             ,'single');
%                                                                                        % Inverse PSF
%                         Recon_data = gpuArray.zeros([Image_size, PSF__depth],'single');  
%                     for idxk = 1:PSF__depth                                           
%                         ImgFFT_Pad = FFTPad_Tep;  ImgFFT_Pad( 1:Image_size(1), 1:Image_size(2) ) = Image_data;
% 
%                         Recon_temp = gather( real( ifft2( fft2(ImgFFT_Pad).* OTF_T_data(:,:,idxk) ) ) );
%                         Recon_data( : , : ,idxk) = Recon_temp( 1:Image_size(1), 1:Image_size(2));
%                     end
%                 for idxit = 1:FLFRec_06_Iters                                         
%                     tic;                                                               % ForwardProject
%                         Recon_Proj =          zeros( Image_size              ,'single');
%                     for idxk = 1:PSF__depth                                           
%                         PrjFFT_Pad = FFTPad_Tep;  PrjFFT_Pad( 1:Image_size(1), 1:Image_size(2) ) = Recon_data(:,:,idxk);
% 
%                         Prj_SLayer = gather( real( ifft2( fft2(PrjFFT_Pad).* OTF_N_data(:,:,idxk) ) ) );
%                         Recon_Proj = Recon_Proj + Prj_SLayer( 1:Image_size(1), 1:Image_size(2));
%                     end
%                                                                                        % BackwardProject
%                     for idxk = 1:PSF__depth                                           
%                         PrjErr_Pad = FFTPad_Tep;  PrjErr_Pad( 1:Image_size(1), 1:Image_size(2) ) = Image_data./Recon_Proj;
% 
%                         Err_SLayer =       gather( real( ifft2( fft2(PrjErr_Pad).* OTF_T_data(:,:,idxk) ) ) );
%                         Recon_data( : , : ,idxk) = Err_SLayer( 1:Image_size(1), 1:Image_size(2)).* Recon_data( : , : ,idxk);
%                     end
%                         Recon_data(isnan(Recon_data)) = 0;
%                     disp(idxit)
%                 end
%             end
%                                                                            U65_Imshow_B16_MIP_3D_Fire(Recon_data);
%             FLFRec_85_RecNo1 = P35_Imgcrop_centerS(gather(Recon_data),FLFRec_53cMdNum);
%                                                                            U65_Imshow_B16_MIP_3D_Fire(FLFRec_85_RecNo1);
%             FLFRec_86_FlpNo1 = rot90(flip(flip(FLFRec_85_RecNo1(FLFRec_28cY_Ind,FLFRec_18cX_Ind,FLFRec_38cZ_Ind),2),1 ),3);
%                                                                            U65_Imshow_B16_MIP_3D_Fire(FLFRec_86_FlpNo1);
%             FLFPSF_75_OTFun1 = OTF_N_data;
%             FLFPSF_75tOTFun1 = OTF_T_data;
%             save([Path_s485_FLFLsp,'OTF1',Data_02_formDt],'FLFPSF_75_OTFun1','FLFPSF_75tOTFun1','-v7.3','-nocompression');
% 
%             Image_data = single( Magnify_val .* FLFImg_74_NorCr2);
%             OTF_N_data = single( Magnify_val .* FLFPSF_75_OTFun2(:,:,FLFPSF_38cZ_Ind) );
%             OTF_T_data = single( Magnify_val .* FLFPSF_75tOTFun2(:,:,FLFPSF_38cZ_Ind) );
%             OTF_N_data = single( Magnify_val .* FLFPSF_75_OTFun2);
%             OTF_T_data = single( Magnify_val .* FLFPSF_75tOTFun2);
%            
%             Image_size = [size(Image_data,1), size(Image_data,2)];
%             PSF__depth =                      size(OTF_N_data,3) ;
%             Recon_size = [size(OTF_N_data,1), size(OTF_N_data,2)];
% 
%             for idxt = [FLFRec_49_Fram0,FLFRec_49_Fram1,FLFRec_49_Fram2]                                     
%                 Path_L554_Index  = num2str(FLFSeg_44_T_Ind(idxt),'%05d');
%                 load([Path_L570_Uni,Path_L554_Index,Data_02_formDt],'FLFimg_74cCrpnor');
%                                                                            figure,imshow(FLFimg_74cCrpnor(:,:,end),[]);
%                 FLFImg_74_NorCr2 = single(FLFimg_74cCrpnor.*Recons_51_StpCro);
%                                                                            clear RecFLF_84cCrpnor;
%                                                                            figure,imshow(FLFImg_74_NorCr2(:,:,end),[]);
%                 figure,  histogram(FLFImg_74_NorCr2(FLFImg_74_NorCr2>0),200);
%                 FLFImg_74_CrpNo1 = 0.000;
%                 FLFImg_75_Denois = FLFImg_74_NorCr2 - FLFImg_74_CrpNo1;    FLFImg_75_Denois(FLFImg_75_Denois<0)=0;
%                 figure,  histogram(FLFImg_75_Denois(FLFImg_75_Denois>0));
%                                                                            figure,imshow(rescale(FLFImg_75_Denois(:,:,end)));                                                                           
%                 %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Start APU deconvolution
%                         Image_data = gpuArray(single( Magnify_val.*(FLFImg_75_Denois+Max_BKG_rat)));
% 
%                 disp(['FFT size is '   num2str(Recon_size(1)) 'X' num2str(Recon_size(2))]); 
%                 disp('Start iteration');
% 
%                         FFTPad_Tep = gpuArray.zeros( Recon_size              ,'single');
%                                                                                        % Inverse PSF
%                         Recon_data = gpuArray.zeros([Image_size, PSF__depth],'single');  
%                     for idxk = 1:PSF__depth                                           
%                         ImgFFT_Pad = FFTPad_Tep;  ImgFFT_Pad( 1:Image_size(1), 1:Image_size(2) ) = Image_data;
% 
%                         Recon_temp = gather( real( ifft2( fft2(ImgFFT_Pad).* OTF_T_data(:,:,idxk) ) ) );
%                         Recon_data( : , : ,idxk) = Recon_temp( 1:Image_size(1), 1:Image_size(2));
%                     end
%                 for idxit = 1:FLFRec_06_Iters                                              
%                     tic;                                                               % ForwardProject
%                         Recon_Proj =          zeros( Image_size              ,'single');
%                     for idxk = 1:PSF__depth                                           
%                         PrjFFT_Pad = FFTPad_Tep;  PrjFFT_Pad( 1:Image_size(1), 1:Image_size(2) ) = Recon_data(:,:,idxk);
% 
%                         Prj_SLayer = gather( real( ifft2( fft2(PrjFFT_Pad).* OTF_N_data(:,:,idxk) ) ) );
%                         Recon_Proj = Recon_Proj + Prj_SLayer( 1:Image_size(1), 1:Image_size(2));
%                     end
%                                                                                        % BackwardProject
%                     for idxk = 1:PSF__depth                                           
%                         PrjErr_Pad = FFTPad_Tep;  PrjErr_Pad( 1:Image_size(1), 1:Image_size(2) ) = Image_data./Recon_Proj;
% 
%                         Err_SLayer =       gather( real( ifft2( fft2(PrjErr_Pad).* OTF_T_data(:,:,idxk) ) ) );
%                         Recon_data( : , : ,idxk) = Err_SLayer( 1:Image_size(1), 1:Image_size(2)).* Recon_data( : , : ,idxk);
%                     end
%                         Recon_data(isnan(Recon_data)) = 0;
%                     disp(idxit)
%                 end
%                 
%                 FLFRec_85_RecNo2 = P35_Imgcrop_centerS(gather(Recon_data),FLFRec_53cMdNum);
%                                                                            figure;imshow(U65_Imshow_B16_MIP_3D_Fire(FLFRec_85_RecNo2));
%                 FLFRec_86_FlpNo2 = rot90(flip(flip(FLFRec_85_RecNo2(FLFRec_28cY_Ind,FLFRec_18cX_Ind,FLFRec_38cZ_Ind),2),1 ),3);
%                                                                                U65_Imshow_B16_MIP_3D_Fire(FLFRec_86_FlpNo2);
%               Recon_crop = FLFRec_85_RecNo2(35:end-35,35:end-35,end-180:end-50);
%               figure;imshow(U65_Imshow_B16_MIP_3D_Fire(Recon_crop));
%               FLFRec_85_RecNo2(FLFRec_85_RecNo2<0) = 0;
%               figure;imshow(U65_Imshow_B16_MIP_3D_Col(imresize(Recon_crop,Ma_01_obj/Ma_06_FLF/FLFRec_32_Z_Seg),011,1));
%               save('recon.mat','FLFRec_85_RecNo2','FLFRec_85_RecNor');
%             end
% 
%             Path_L554_Index = num2str(FLFSeg_44_T_Ind(FLFRec_49_Fram0),'%05d');
%             save([Path_s485_FLFLsp,Path_L554_Index ,Data_02_formDt],'FLFRec_86_FlpNo1','FLFRec_86_FlpNo2','-v7.3');
% 
%             FLFRec_96_FlpRe1 = rescale(imresize(FLFRec_86_FlpNo1,Ma_01_obj/Ma_06_FLF));
%                                                                            U65_Imshow_B16_MIP_3D_Fire(FLFRec_96_FlpRe1);
%             FLFRec_96_FlpRe2 = rescale(imresize(FLFRec_86_FlpNo2,Ma_01_obj/Ma_06_FLF));
%                                                                            U65_Imshow_B16_MIP_3D_Fire(FLFRec_96_FlpRe2);
%             FLFRec_96cFlpco1 = U65_Imshow_B16_MIP_3D_Col(FLFRec_96_FlpRe1,022,5);
%             FLFRec_96cFlpco2 = U65_Imshow_B16_MIP_3D_Col(FLFRec_96_FlpRe2,023,5);
%             FLFRec_96cFlpcol = ceil((FLFRec_96cFlpco1 + FLFRec_96cFlpco2)/1.2);
%             figure,imshow(FLFRec_96cFlpcol)
%             imwrite(FLFRec_96cFlpcol,'test.tif')
% 
%             FLFPSF_75_OTFun2 = OTF_N_data;      clear OTF_N_data
%             FLFPSF_75tOTFun2 = OTF_T_data;      clear OTF_T_data
%             save([Path_s485_FLFLsp,'OTF2',Data_02_formDt],'FLFPSF_75_OTFun2','FLFPSF_75tOTFun2','-v7.3','-nocompression');
%         end
% 
%         for idxsg = 1                                                      % Reconstruction frame by frame (All)        
%             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Reconstruction parameter set
%             FLFRec_18cX_Ind  = 35:481-35;                                     disp(length(FLFRec_18cX_Ind));
%             FLFRec_28cY_Ind  = 35:481-35;                                     disp(length(FLFRec_28cY_Ind));
%             FLFPSF_38cZ_Ind  = 501-325:501;                                       disp(length(FLFPSF_38cZ_Ind));
%             FLFRec_38cZ_Ind  = 501-325:501;                                       disp(length(FLFRec_38cZ_Ind));
%             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             FLFImg_41_TlSeg =  000.010;                                        %GET
%             FLFImg_41_TuSeg =  001.960;                                        %GET
%             FLFImg_42_T_Seg =  1;                                              %GET
%            [FLFSeg_48_T_Frm,FLFSeg_43_TdNum,~              ,FLFSeg_44_T_Ind,FLFSeg_45_TCoor] = S02_Coord_Used(...
%             FLFImg_41_TlSeg,FLFImg_41_TuSeg,FLFImg_42_T_Seg,FLFImg_44_T_Ind,FLFImg_45_TCoor);
%             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             for idxta = 1                                                  
%                 Path_L554_Index  = num2str(FLFSeg_44_T_Ind(0001),'%05d');
%                 load([Path_L570_Uni,Path_L554_Index,Data_02_formDt]);
%                 FLFimg_72_SubBKG(FLFimg_72_SubBKG<0) = 0;
%                 FLFimg_74cCrpnor = FLFimg_72_SubBKG;
%                                                                            figure,imshow(FLFimg_74cCrpnor(:,:,end),[]);
%                 FLFImg_74_NorCrp = single(FLFimg_74cCrpnor);               clear FLFimg_74cCrpnor;
%                 FLFImg_74_NorCr1 = single(FLFImg_74_NorCrp.*Recons_51_StpPer);
%                 FLFImg_74_NorCr2 = single(FLFImg_74_NorCrp.*Recons_51_StpCro);
%                                                                            clear FLFimg_74cCrpnor;
%                                                                            figure,imshow(FLFImg_74_NorCr1(:,:,end),[]);
%                 figure,  histogram(FLFImg_74_NorCr1(FLFImg_74_NorCr1>0),200);
%                 FLFImg_74_CrpNo1 = 0.01;
%                 FLFImg_75_Denois = FLFImg_74_NorCr1 - FLFImg_74_CrpNo1;    FLFImg_75_Denois(FLFImg_75_Denois<0)=0;
%                                                                            figure,imshow(FLFImg_75_Denois(:,:,end),[]);
%                 figure,  histogram(FLFImg_75_Denois(FLFImg_75_Denois>0));
% 
%                                                                            figure,imshow(FLFImg_74_NorCr2(:,:,end),[]);
%                 figure,  histogram(FLFImg_74_NorCr2(FLFImg_74_NorCr2>0),200);
%                 FLFImg_74_CrpNo2 = 0.01;
%                 FLFImg_75_Denois = FLFImg_74_NorCr2 - FLFImg_74_CrpNo2;    FLFImg_75_Denois(FLFImg_75_Denois<0)=0;
%                                                                            figure,imshow(FLFImg_75_Denois(:,:,end),[]);
%                 figure,  histogram(FLFImg_75_Denois(FLFImg_75_Denois>0));
% 
%                 Magnify_val     = 65535;
%                 Max_BKG_rat     = 0.001^2;
%             end
% 
%             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Reconstruction frame by frame (All) 
%             if ~(exist('FLFPSF_75_OTFun1','var')&&exist('FLFPSF_75tOTFun1','var')) 
%                 load([Path_s485_FLFLsp,'OTF1',Data_02_formDt],'FLFPSF_75_OTFun1','FLFPSF_75tOTFun1');
%             end
% 
%                 Image_data = gpuArray(FLFImg_75_Denois);
%                 OTF_N_data = gpuArray(FLFPSF_75_OTFun1);
% %                 OTF_T_data = gpuArray(FLFPSF_75tOTFun1);
%                 OTF_T_data = FLFPSF_75tOTFun1;
%                 
%                 clear FLFPSF_75_OTFun1
%                 clear FLFPSF_75tOTFun1
%                 Image_size = [size(Image_data,1), size(Image_data,2)];
%                 PSF__depth =                      size(OTF_N_data,3) ;
%                 Recon_size = [size(OTF_N_data,1), size(OTF_N_data,2)];
%                 disp(['FFT size is ' num2str(Recon_size(1)) 'X' num2str(Recon_size(2))]); 

            if ~(exist('FLFPSF_75_OTFun1','var')&&exist('FLFPSF_75tOTFun1','var')) 
%                 load([Path_s485_FLFLsp,'OTF1',Data_02_formDt],'FLFPSF_75_OTFun1','FLFPSF_75tOTFun1');
                load(['F:\reconstruction\20240624\reconstruction\5FLFVid_5exprec240624_1607' ...
                    '\FLF_016XNA0.80La525nm_ft300mmfe200mm_MLAS1300P3300f23.0_P6.5umRF2DN1SPD4103It6Pw1_8_FLFLspOTF1.mat']);
            end

            OTF_N_data  = gpuArray(single( Magnify_val.* FLFPSF_75_OTFun1)); clear   FLFPSF_75_OTFun1
            OTF_T_data  = gpuArray(single( Magnify_val.* FLFPSF_75tOTFun1)); clear   FLFPSF_75tOTFun1

            for idxt = 0001:FLFSeg_43_TdNum                                
                Path_L554_Index = num2str(FLFSeg_44_T_Ind(idxt),'%05d');
                load([Path_L570_Uni,Path_L554_Index,Data_02_formDt]);
%                                                                            U60_Imshow_B16(FLFimg_74cCrpnor(:,:,end));
%                 FLFimg_74cCrpnor = imread(['..\5FLFVid_6exppro04_4Denois\FLF_ExpImg_74Denois_0.01-10.01-0.01s_Frm',Path_L554_Index,'.tif']);
                FLFImg_74_NorCrp = single(FLFimg_74cCrpnor);               clear FLFimg_74cCrpnor;
                FLFImg_74_NorCr1 = single(FLFImg_74_NorCrp.*Recons_51_StpPer);
                                                                           clear FLFimg_74cCrpnor;
                FLFImg_74_CrpNo1 = mean(FLFImg_74_NorCr1(954:994,523:563),'all');
                FLFImg_75_Denois = FLFImg_74_NorCr1 - FLFImg_74_CrpNo1;    FLFImg_75_Denois(FLFImg_75_Denois<0)=0;
             %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Start APU deconvolution
%                                                                            U60_Imshow_B16(FLFImg_75_Denois(:,:,end));
                disp(['FFT size is '   num2str(Recon_size(1)) 'X' num2str(Recon_size(2))]); 
                disp('Start iteration');               
                        Image_data = gpuArray(single( Magnify_val.*(FLFImg_75_Denois+Max_BKG_rat)));
                        FFTPad_Tep = gpuArray.zeros( Recon_size             ,'single');
                        Recon_data =          zeros([Image_size, PSF__depth],'single'); 
                    for idxk = 1:PSF__depth                                % Inverse PSF
                        ImgFFT_Pad = FFTPad_Tep;  ImgFFT_Pad( 1:Image_size(1), 1:Image_size(2) ) = Image_data;

                        Recon_temp =         real( ifft2( fft2(ImgFFT_Pad).* OTF_T_data(:,:,idxk) ) ) ;
                        Recon_data( : , : ,idxk) = Recon_temp( 1:Image_size(1), 1:Image_size(2));
                    end
                for idxit = 1:10 %1:FLFRec_06_Iters                                           
%                                                                          % ForwardProject
                        Recon_Proj = gpuArray.zeros( Image_size             ,'single');
                    for idxk = 1:PSF__depth                                           
                        PrjFFT_Pad = FFTPad_Tep;  PrjFFT_Pad( 1:Image_size(1), 1:Image_size(2) ) = Recon_data(:,:,idxk);

                        Prj_SLayer = real( ifft2( fft2(PrjFFT_Pad).* OTF_N_data(:,:,idxk) ) ) ;
                        Recon_Proj = Recon_Proj + Prj_SLayer( 1:Image_size(1), 1:Image_size(2));
                    end
                                                                           % BackwardProject
                    for idxk = 1:PSF__depth                                           
                        PrjErr_Pad = FFTPad_Tep;  PrjErr_Pad( 1:Image_size(1), 1:Image_size(2) ) = Image_data./Recon_Proj;

                        Err_SLayer = real( ifft2( fft2(PrjErr_Pad).* OTF_T_data(:,:,idxk) ) ) ;
                        Recon_data( : , : ,idxk) = Err_SLayer( 1:Image_size(1), 1:Image_size(2)).* Recon_data( : , : ,idxk);
                    end
                        Recon_data(isnan(Recon_data)) = 0;
                    disp(idxit)
                end
                FLFRec_86_FlpNo1 = rot90(flip(flip(Recon_data( FLFRec_28cY_Ind+FLFRec_53cMdNum,...
                                                               FLFRec_18cX_Ind+FLFRec_53cMdNum,FLFRec_38cZ_Ind),2),1),3);
                if idxt == 0001
                    figure;imshow(U65_Imshow_B16_MIP_3D_Fire(FLFRec_86_FlpNo1));
                end
%                     figure;imshow(U65_Imshow_B16_MIP_3D_Fire(FLFRec_86_FlpNo1));
                save([Path_s485_FLFLsp,'R',Path_L554_Index,Data_02_formDt],'FLFRec_86_FlpNo1','-v7.3');
                disp(idxt)
%                 close all
            end
            clear OTF_N_data OTF_T_data
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Reconstruction frame by frame (All) 
            if ~(exist('FLFPSF_75_OTFun2','var')&&exist('FLFPSF_75tOTFun2','var')) 
%                 load([Path_s485_FLFLsp,'OTF2',Data_02_formDt],'FLFPSF_75_OTFun2','FLFPSF_75tOTFun2');
                load(['F:\reconstruction\20240624\reconstruction\5FLFVid_5exprec240624_1607' ...
                    '\FLF_016XNA0.80La525nm_ft300mmfe200mm_MLAS1300P3300f23.0_P6.5umRF2DN1SPD4103It6Pw1_8_FLFLspOTF2.mat']);
            end

                Image_data = gpuArray(FLFImg_75_Denois);

                OTF_T_data = gpuArray(single( Magnify_val.*FLFPSF_75_OTFun2)); clear FLFPSF_75_OTFun2;
                OTF_N_data = gpuArray(single( Magnify_val.*FLFPSF_75tOTFun2)); clear FLFPSF_75tOTFun2;
                
                Image_size = [size(Image_data,1), size(Image_data,2)];
                PSF__depth =                      size(OTF_N_data,3) ;
                Recon_size = [size(OTF_N_data,1), size(OTF_N_data,2)];
                disp(['FFT size is ' num2str(Recon_size(1)) 'X' num2str(Recon_size(2))]); 

            for idxt = 0001:FLFSeg_43_TdNum                                
                Path_L554_Index = num2str(FLFSeg_44_T_Ind(idxt),'%05d');
                load([Path_L570_Uni,Path_L554_Index,Data_02_formDt]);
%                                                                            U60_Imshow_B16(FLFimg_74cCrpnor(:,:,end));
%                 FLFimg_74cCrpnor = imread(['..\5FLFVid_6exppro04_4Denois\FLF_ExpImg_74Denois_0.01-10.01-0.01s_Frm',Path_L554_Index,'.tif']);
                FLFImg_74_NorCrp = single(FLFimg_74cCrpnor);               clear FLFimg_74cCrpnor;
                FLFImg_74_NorCr2 = single(FLFImg_74_NorCrp).*Recons_51_StpCro;
                FLFImg_74_CrpNo2 = 0; % mean(FLFImg_74_NorCr2(FLFImg_74_NorCr2>0))-0.008;
                                                                           clear FLFimg_74cCrpnor;
                FLFImg_75_Denois = FLFImg_74_NorCr2 - FLFImg_74_CrpNo2;    FLFImg_75_Denois(FLFImg_75_Denois<0)=0;
             %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Start APU deconvolution
%                                                                            U60_Imshow_B16(FLFImg_75_Denois(:,:,end));
                disp(['FFT size is '   num2str(Recon_size(1)) 'X' num2str(Recon_size(2))]); 
                disp('Start iteration');
                
                        Image_data = gpuArray(single(Magnify_val.*(FLFImg_75_Denois+Max_BKG_rat)));
                        FFTPad_Tep = gpuArray.zeros( Recon_size            ,'single');
                        Recon_data =          zeros([Image_size,PSF__depth],'single'); 
                    for idxk = 1:PSF__depth                                           % Inverse PSF
                        ImgFFT_Pad = FFTPad_Tep;  ImgFFT_Pad( 1:Image_size(1), 1:Image_size(2) ) = Image_data;

                        Recon_temp =         real( ifft2( fft2(ImgFFT_Pad).* OTF_T_data(:,:,idxk) ) ) ;
                        Recon_data( : , : ,idxk) = Recon_temp( 1:Image_size(1), 1:Image_size(2));
                    end
                for idxit = 1:10 %1:FLFRec_06_Iters                                                      
                        % ForwardProject
                        Recon_Proj = gpuArray.zeros( Image_size             ,'single');
                    for idxk = 1:PSF__depth                                           
                        PrjFFT_Pad = FFTPad_Tep;  PrjFFT_Pad( 1:Image_size(1), 1:Image_size(2) ) = Recon_data(:,:,idxk);

                        Prj_SLayer =        real( ifft2( fft2(PrjFFT_Pad).* OTF_N_data(:,:,idxk) ) ) ;
                        Recon_Proj = Recon_Proj + Prj_SLayer( 1:Image_size(1), 1:Image_size(2));
                    end
                                                                                       % BackwardProject
                    for idxk = 1:PSF__depth                                           
                        PrjErr_Pad = FFTPad_Tep;  PrjErr_Pad( 1:Image_size(1), 1:Image_size(2) ) = Image_data./Recon_Proj;

                        Err_SLayer =         real( ifft2( fft2(PrjErr_Pad).* OTF_T_data(:,:,idxk) ) ) ;
                        Recon_data( : , : ,idxk) = Err_SLayer( 1:Image_size(1), 1:Image_size(2)).* Recon_data( : , : ,idxk);
                    end
                        Recon_data(isnan(Recon_data)) = 0; 
                    disp(idxit)
                end
%                 FLFRec_85_RecNor = P35_Imgcrop_centerS(gather(Recon_data),FLFRec_53cMdNum);
% %                                                                            U65_Imshow_B16_MIP_3D_Fire(FLFRec_85_RecNor);
                FLFRec_86_FlpNo2 = rot90(flip(flip(Recon_data( FLFRec_28cY_Ind+FLFRec_53cMdNum,...
                                                               FLFRec_18cX_Ind+FLFRec_53cMdNum,FLFRec_38cZ_Ind),2),1),3);
%                     figure;imshow(U65_Imshow_B16_MIP_3D_ColAdj(gather(FLFRec_86_FlpNo1),031,1)+U65_Imshow_B16_MIP_3D_ColAdj(gather(FLFRec_86_FlpNo2),032,1));
%                     figure;imshow(U65_Imshow_B16_MIP_3D_Col(imresize(gather(FLFRec_86_FlpNo1(340:350,285:295,1:20)),16/14.4),031,1)+U65_Imshow_B16_MIP_3D_Col(imresize(gather(FLFRec_86_FlpNo2(340:350,285:295,1:20)),16/14.4),032,1));
%                     figure;imshow(U65_Imshow_B16_MIP_3D_Col(gather(FLFRec_86_FlpNo2),011,1));
%                     figure;imshow(U65_Imshow_B16_MIP_3D_Fire(Recon_data(FLFRec_28cY_Ind+FLFRec_53cMdNum,FLFRec_18cX_Ind+FLFRec_53cMdNum,:));
                save([Path_s485_FLFLsp,'G',Path_L554_Index,Data_02_formDt],'FLFRec_86_FlpNo2','-v7.3');
                disp(idxt)
                close all  
            end
            clear OTF_N_data OTF_T_data

            roi1 = imresize(gather(FLFRec_86_FlpNo1(340:350,285:295,1:20)),16/14.4);
            roi2 = imresize(gather(FLFRec_86_FlpNo2(340:350,285:295,1:20)),16/14.4);
            roi1_n = rescale(roi1);
            for i = 1:20 
                imwrite(uint8(roi1_n(:,:,i)*255),'roi_r.tif','WriteMode','append');
            end
            roi2_n = rescale(roi2);
            for i = 1:20 
                imwrite(uint8(roi2_n(:,:,i)*255),'roi_g.tif','WriteMode','append');
            end

            FLFRec_88cFlpRe1_n = rescale(FLFRec_88cFlpRe1);
            for i = 1:61 
                imwrite(uint8(FLFRec_88cFlpRe1_n(:,:,i)*255),'FLFRec_88cFlpRe1_n.tif','WriteMode','append');
            end
            FLFRec_88cFlpRe2_n = rescale(FLFRec_88cFlpRe2);
            for i = 1:61 
                imwrite(uint8(FLFRec_88cFlpRe2_n(:,:,i)*255),'FLFRec_88cFlpRe2_n.tif','WriteMode','append');
            end            

            nuclei = imresize(gather(FLFRec_86_FlpNo2),16/14.4);
            U65_Imshow_B16_MIP_3D_Fire(nuclei);

            bw = imbinarize(rescale(nuclei));
            U65_Imshow_B16_MIP_3D_Fire(bw);

            bw = bwareaopen(bw, 50); 
            U65_Imshow_B16_MIP_3D_Fire(bw);
% 
%             bw = imopen(bw, strel('sphere', 1));
%             U65_Imshow_B16_MIP_3D_Fire(bw);

            cc = bwconncomp(bw);
            numberOfCells = cc.NumObjects;
            stats = regionprops(cc, 'Centroid');
            centroids = cat(1, stats.Centroid);

%             % Label connected components
%             labeledImage = bwlabeln(bw);
% 
%             % Optionally apply watershed segmentation to separate closely touching nuclei
%             % This step might be necessary if cells are very dense and overlap significantly
%             D = -bwdist(~bw); % Compute the distance transform
%             mask = imextendedmin(D, 2); % Define extended minima
%             D2 = imimposemin(D, mask);
%             labeledImage = watershed(D2);
%             labeledImage(~bw) = 0; % Impose the initial mask
% 
%             % Count the number of unique labels, which corresponds to the number of cells
%             numberOfCells = max(labeledImage(:));
% 
%             % Display the results
%             fprintf('The number of cells in the stack is %d.\n', numberOfCells);
% 
%             % Optionally visualize the labeled nuclei
%             figure;
%             imshow3D(labeledImage);

            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% First frame image save 
            for idxt = 0001                                                
                Path_L554_Index = num2str(FLFSeg_44_T_Ind(idxt),'%05d');
                load([Path_s485_FLFLsp,'R',Path_L554_Index,Data_02_formDt],'FLFRec_86_FlpNo1');
                load([Path_s485_FLFLsp,'G',Path_L554_Index,Data_02_formDt],'FLFRec_86_FlpNo2');
                FLFRec_88cFlpRe1 = imresize(gather(FLFRec_86_FlpNo1(:,:,:)),Ma_01_obj/Ma_06_FLF/FLFRec_32_Z_Seg);
                FLFRec_88cFlpRe2 = imresize(gather(FLFRec_86_FlpNo2(:,:,:)),Ma_01_obj/Ma_06_FLF/FLFRec_32_Z_Seg);
                FLFRec_88cFlpRe1 = FLFRec_88cFlpRe1(:,:,:);
                FLFRec_88cFlpRe2 = FLFRec_88cFlpRe2(:,:,:);
                FLFRec_88_MIPco1 = U55_Imshow_B08_MIP_3D_Col(FLFRec_88cFlpRe1,022,1,1);
                FLFRec_88_MIPco2 = U55_Imshow_B08_MIP_3D_Col(FLFRec_88cFlpRe2,023,1,1);
                S50_Imsave_B08_Nor( [Path_s487_FLFRez,Path_L554_Index,'R'],Data_01_formIm,FLFRec_88cFlpRe1,0);
                S50_Imsave_B08_Nor( [Path_s487_FLFRez,Path_L554_Index,'G'],Data_01_formIm,FLFRec_88cFlpRe2,0);

                S60_Imsave_B16_Nor( [Path_s487_FLFRez,Path_L554_Index,'R'],Data_01_formIm,FLFRec_88cFlpRe1,022,0);
                S60_Imsave_B16_Nor( [Path_s487_FLFRez,Path_L554_Index,'G'],Data_01_formIm,FLFRec_88cFlpRe2,023,0);
            end
        end
    end
        
    for idxsg = 1                                                          % Video made for reconstruction              
        for idxt = FLFRec_49_Fram0                                         % Video 
                
            FLFimg_09_VidCo0 = 011;
            FLFimg_09_VidCo1 = 022;
            FLFimg_09_VidCo2 = 023;
            FLFImg_41_TlSeg =  000.010;                                        %GET
            FLFImg_41_TuSeg =  009.990;                                        %GET
            FLFImg_42_T_Seg =  1;                                              %GET
           [FLFSeg_48_T_Frm,FLFSeg_43_TdNum,~              ,FLFSeg_44_T_Ind,FLFSeg_45_TCoor] = S02_Coord_Used(...
            FLFImg_41_TlSeg,FLFImg_41_TuSeg,FLFImg_42_T_Seg,FLFImg_44_T_Ind,FLFImg_45_TCoor);
            Text_s554TimeInd = [num2str(FLFImg_41_TlSeg),File_00_Line,...
                                num2str(FLFImg_41_TuSeg)];
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
            Path_L554_Index  = num2str(FLFSeg_44_T_Ind(idxt),'%05d');
            load([Path_s485_FLFLsp,'R',Path_L554_Index,Data_02_formDt],'FLFRec_86_FlpNo1');
            load([Path_s485_FLFLsp,'G',Path_L554_Index,Data_02_formDt],'FLFRec_86_FlpNo2');

            FLFRec_88cFlpRe1 = imresize(gather(FLFRec_86_FlpNo1),Ma_01_obj/Ma_06_FLF/FLFRec_32_Z_Seg);
            FLFRec_88cFlpRe2 = imresize(gather(FLFRec_86_FlpNo2),Ma_01_obj/Ma_06_FLF/FLFRec_32_Z_Seg);

            FLFRec_88_MIPco1 = U65_Imshow_B16_MIP_3D_ColAdj(FLFRec_88cFlpRe1,031,1.1);
            FLFRec_88_MIPco2 = U65_Imshow_B16_MIP_3D_ColAdj(FLFRec_88cFlpRe2,032,1.3);
            FLFRec_88_colsiz = size(FLFRec_88_MIPco2,1);
            RecFLF_89_MIP3D1 = FLFRec_88_MIPco1;
            RecFLF_89_MIP3D2 = FLFRec_88_MIPco2;
            RecFLF_89_MIP3Dt = FLFRec_88_MIPco1+FLFRec_88_MIPco2;
%             RecFLF_89_MIP3Dt = FLFRec_88_MIPco2;
%             RecFLF_89_MIP3Db =[FLFRec_88_MIPco1,ones(size(FLFRec_88_MIPco1,1),10,3)*255,FLFRec_88_MIPco2];
            figure,imshow(RecFLF_89_MIP3Dt)
        end

%         FLFSeg_43_TdNum = 100;
%         RecFLF_89_MIP3DmR = zeros([size(RecFLF_89_MIP3D2),FLFSeg_43_TdNum],'uint16');
%         RecFLF_89bMIP3Dmv = zeros([size(RecFLF_89_MIP3D1),FLFSeg_43_TdNum],'uint8');
%         for idxt = 1:FLFSeg_43_TdNum                                       % 3DMIP    Video made             
%             Path_L554_Index  = num2str(FLFSeg_44_T_Ind(idxt),'%05d');
%             load([Path_s485_FLFLsp,'R',Path_L554_Index,Data_02_formDt],'FLFRec_86_FlpNo1');
%             load([Path_s485_FLFLsp,'G',Path_L554_Index,Data_02_formDt],'FLFRec_86_FlpNo2');
%             FLFRec_88cFlpRe2 = imresize(gather(FLFRec_86_FlpNo2),Ma_01_obj/Ma_06_FLF/FLFRec_32_Z_Seg);
% 
%             FLFRec_88_MIPco2 = U65_Imshow_B16_MIP_3D_Col(FLFRec_88cFlpRe2,011,1);
%             RecFLF_89_MIP3DmR(:,:,:,idxt) = FLFRec_88_MIPco2;
%             disp(idxt);                                                close all;
%         end
%             save(          [Path_s487_FLFRez,Text_s554MIP3Dmv,Text_s554TimeInd,'G' ,Data_02_formDt],'RecFLF_89_MIP3DmR','-v7.3');
%             T35_Vdsave_B08([Path_s487_FLFRez,Text_s554MIP3Dmv,Text_s554TimeInd,'G'],Data_01_formVd,  im2uint8(RecFLF_89_MIP3DmR) ,100    );
 
        for idxt = 1                                                       % Video legend set                
            Fond_Size = 025;
            clear RecFLF_96_MIP3DmvL

            Fig_TxVet = 0021;           Fig_Txtop = 0005;
            Fig_FrVet = size(FLFRec_88cFlpRe1,2)-80;          Fig_Frtop = 0005;

            Fig_XYVet = size(FLFRec_88cFlpRe1,1)-60;           Fig_RsVet = size(FLFRec_88cFlpRe1,1)-20;
            Fig_YZVet = size(FLFRec_88cFlpRe1,1)-60;           Fig_ZsVet = size(FLFRec_88cFlpRe1,1)-20;

            Fig_XYHoz = size(FLFRec_88cFlpRe1,2)-90;          Fig_RsHoz = size(FLFRec_88cFlpRe1,2)-70;
            Fig_YZHoz = size(FLFRec_88cFlpRe1,2)+20;           Fig_ZsHoz = size(FLFRec_88cFlpRe1,2)+25;

            Fig_SCwid = 006;
            Fig_XYlen = 100;
            Fig_YZlen = 050;
            Fig_XYpix = Pi_05_cam/Ma_01_obj*FLFRec_32_Z_Seg*1e6;
            Fig_YZpix =     FLFPSF_32_Z_Stp*FLFRec_32_Z_Seg*1e6;

            Fig_Title = '';
            Fig_XYscT = [num2str(Fig_XYlen) native2unicode([hex2dec('CE') hex2dec('BC')], 'UTF-8') 'm'];
            Fig_YZscT = [num2str(Fig_YZlen) native2unicode([hex2dec('CE') hex2dec('BC')], 'UTF-8') 'm'];

            Fig_TimeT = [num2str(FLFSeg_45_TCoor(FLFRec_49_Fram0),'%.2f'),'s'];

            RecFLF_96_MIP3DmvL = RecFLF_89_MIP3Dt;
            RecFLF_96_MIP3DmvL = insertText(RecFLF_96_MIP3DmvL,...
                [Fig_TxVet,Fig_Txtop],Fig_Title,'Font','Arial Bold','BoxOpacity',0,'FontSize',Fond_Size,'TextColor','white');
            RecFLF_96_MIP3DmvL = insertText(RecFLF_96_MIP3DmvL,...
                [Fig_FrVet,Fig_Frtop],Fig_TimeT,'Font','Arial Bold','BoxOpacity',0,'FontSize',Fond_Size,'TextColor','white');
            RecFLF_96_MIP3DmvL = insertText(RecFLF_96_MIP3DmvL,...
                [Fig_XYHoz,Fig_XYVet],Fig_XYscT,'Font','Arial Bold','BoxOpacity',0,'FontSize',Fond_Size,'TextColor','white');
%             RecFLF_96_MIP3DmvL = insertText(RecFLF_96_MIP3DmvL,...
%                 [Fig_YZHoz,Fig_YZVet],Fig_YZscT,'Font','Arial Bold','BoxOpacity',0,'FontSize',Fond_Size,'TextColor','white');
            RecFLF_96_MIP3DmvL(Fig_RsVet+(1:Fig_SCwid),Fig_RsHoz+(1:round(Fig_XYlen/Fig_XYpix)),:,:) = 65535;
            RecFLF_96_MIP3DmvL(Fig_ZsVet+(1:Fig_SCwid),Fig_ZsHoz+(1:round(Fig_YZlen/Fig_YZpix)),:,:) = 65535;
            figure,imshow(RecFLF_96_MIP3DmvL);
        end
            close all;

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 3D MIP Video made (Entire and cropped)
            RecFLF_89_MIP3Dmv = zeros([size(RecFLF_89_MIP3Dt),FLFSeg_43_TdNum],'uint8');
%             RecFLF_89bMIP3Dmv = zeros([size(RecFLF_89_MIP3Db),FLFSeg_43_TdNum],'uint8');
        for idxt = 1:FLFSeg_43_TdNum                                       % 3D MIP Video made             
            Path_L554_Index  = num2str(FLFSeg_44_T_Ind(idxt),'%05d');
            load([Path_s485_FLFLsp,'R',Path_L554_Index,Data_02_formDt],'FLFRec_86_FlpNo1');
            load([Path_s485_FLFLsp,'G',Path_L554_Index,Data_02_formDt],'FLFRec_86_FlpNo2');

            FLFRec_88cFlpRe1 = imresize(gather(FLFRec_86_FlpNo1),Ma_01_obj/Ma_06_FLF/FLFRec_32_Z_Seg);
            FLFRec_88cFlpRe2 = imresize(gather(FLFRec_86_FlpNo2),Ma_01_obj/Ma_06_FLF/FLFRec_32_Z_Seg);

            FLFRec_88_MIPco1 = U55_Imshow_B08_MIP_3D_ColAdj(FLFRec_88cFlpRe1,031,1.1);
            FLFRec_88_MIPco2 = U55_Imshow_B08_MIP_3D_ColAdj(FLFRec_88cFlpRe2,032,1.3);
%             figure;imshow(FLFRec_88_MIPco1+FLFRec_88_MIPco2);          
            RecFLF_89_MIP3Dmv(:,:,:,idxt) = FLFRec_88_MIPco1+FLFRec_88_MIPco2;
%             RecFLF_89bMIP3Dmv(:,:,:,idxt) =[FLFRec_88_MIPco1,ones(FLFRec_88_colsiz(1),10,3)*255,FLFRec_88_MIPco2];
%             figure,imshow(RecFLF_89_MIP3Dmv(:,:,:,idxt))
            disp(idxt);                                                close all;
        end
%            Path_s487_FLFRez = '..\5FLFVid_5exprec240217_1322\FLF_016XNA0.80La525nm_ft300mmfe200mm_MLAS1300P3300f23.0_P6.5umRF2DN1SPD4103It20Pw1_8_FLFRez'       
            save(          [Path_s487_FLFRez,Text_s554MIP3Dmv,    Text_s554TimeInd ,Data_02_formDt],'RecFLF_89_MIP3Dmv','-v7.3');
            T35_Vdsave_B08([Path_s487_FLFRez,Text_s554MIP3Dmv,    Text_s554TimeInd],Data_01_formVd,  im2uint8(RecFLF_89_MIP3Dmv) ,100 );
                       
            RecFLF_88_MIP3DmvL = RecFLF_89_MIP3Dmv;
%             RecFLF_88_MIP3DmvL = RecFLF_89_MIP3DmR; 
            RecFLF_88_MIP3DmvL(Fig_RsVet+(1:Fig_SCwid),Fig_RsHoz+(1:round(Fig_XYlen/Fig_XYpix)),:,:) = 65535;
            RecFLF_88_MIP3DmvL(Fig_ZsVet+(1:Fig_SCwid),Fig_ZsHoz+(1:round(Fig_YZlen/Fig_YZpix)),:,:) = 65535;
            figure,imshow(RecFLF_88_MIP3DmvL(:,:,:,0001));
            figure,imshow(RecFLF_88_MIP3DmvL(:,:,:,end ));

        for idxt = 1:FLFSeg_43_TdNum                                       % 3DMIP Video legend make       
            Fig_TimeT = [num2str(FLFSeg_45_TCoor(idxt),'%.2f'),'s'];
            RecFLF_88_MIP3DmvL(:,:,:,idxt) = insertText(RecFLF_88_MIP3DmvL(:,:,:,idxt),...
                [Fig_TxVet,Fig_Txtop],Fig_Title,'Font','Arial Bold','BoxOpacity',0,'FontSize',Fond_Size,'TextColor','white');
            RecFLF_88_MIP3DmvL(:,:,:,idxt) = insertText(RecFLF_88_MIP3DmvL(:,:,:,idxt),...
                [Fig_FrVet,Fig_Frtop],Fig_TimeT,'Font','Arial Bold','BoxOpacity',0,'FontSize',Fond_Size,'TextColor','white');
            RecFLF_88_MIP3DmvL(:,:,:,idxt) = insertText(RecFLF_88_MIP3DmvL(:,:,:,idxt),...
                [Fig_XYHoz,Fig_XYVet],Fig_XYscT,'Font','Arial Bold','BoxOpacity',0,'FontSize',Fond_Size,'TextColor','white');
%             RecFLF_88_MIP3DmvL(:,:,:,idxt) = insertText(RecFLF_88_MIP3DmvL(:,:,:,idxt),...
%                 [Fig_YZHoz,Fig_YZVet],Fig_YZscT,'Font','Arial Bold','BoxOpacity',0,'FontSize',Fond_Size,'TextColor','white');
            disp(idxt)
        end
            figure,imshow(RecFLF_88_MIP3DmvL(:,:,:,end));
            
            clear RecFLF_89_MIP3Dmv;
            save(          [Path_s487_FLFRez,Text_s554MIP3DmL,Text_s554TimeInd ,Data_02_formDt],'RecFLF_88_MIP3DmvL','-v7.3');
            T35_Vdsave_B08([Path_s487_FLFRez,Text_s554MIP3DmL,Text_s554TimeInd],Data_01_formVd , im2uint8(RecFLF_88_MIP3DmvL) ,100);
    end    
    clear RecFLF_88_MIP3DmvL;


%     path = 'E:\large_field_flfm\20231120\00016\5FLFVid_5exprec231205_1459';
%     file = dir(path);
%     file = file(3:end);
%     for i = 1:size(file,1)
%         load([path,'\',file(i).name]);
%         org_dns = imresize(gather(FLFRec_86_FlpNo2),16/7.2);
%         FLFRec_88_MIPco2 = U65_Imshow_B16_MIP_3D_Col(org_dns,023,2);
%         colstack(:,:,:,i) = FLFRec_88_MIPco2;
%         i
%     end
% 
%     T35_Vdsave_B08('E:\large_field_flfm\20231120\00016\5FLFVid_5exprec231205_1459\colstack',Data_01_formVd , im2uint8(colstack) ,100);
    
 
%% zoom in colorplot
    FLFRec_88_MIPco1 = U65_Imshow_B16_MIP_3D_Col(FLFRec_88cFlpRe1(230:280,1:112,10:100),022,1);
    FLFRec_88_MIPco2 = U65_Imshow_B16_MIP_3D_Col(FLFRec_88cFlpRe2(230:280,1:112,10:100),023,1.2);
    figure;imshow(FLFRec_88_MIPco1);
    figure;imshow(FLFRec_88_MIPco2);
    figure;imshow(FLFRec_88_MIPco1+FLFRec_88_MIPco2);
    imwrite(FLFRec_88_MIPco1,'nucle.tif');
    imwrite(FLFRec_88_MIPco2,'cytopls.tif');
    imwrite(FLFRec_88_MIPco1+FLFRec_88_MIPco2,'hybrid.tif');   

    FLFRec_88_MIPco1 = U65_Imshow_B16_MIP_3D_Col(FLFRec_88cFlpRe1(475:524,295:357,40:100),022,1);
    FLFRec_88_MIPco2 = U65_Imshow_B16_MIP_3D_Col(FLFRec_88cFlpRe2(475:524,295:357,40:100),023,1);
    figure;imshow(FLFRec_88_MIPco1);
    figure;imshow(FLFRec_88_MIPco2);
    figure;imshow(FLFRec_88_MIPco1+FLFRec_88_MIPco2);
    imwrite(FLFRec_88_MIPco1,'nucle2.tif');
    imwrite(FLFRec_88_MIPco2,'cytopls2.tif');
    imwrite(FLFRec_88_MIPco1+FLFRec_88_MIPco2,'hybrid2.tif');

    figure;imshow(FLFRec_88_MIPco2);  
    FLFRec_88cFlpRe2_n = rescale(FLFRec_88cFlpRe2);

    for i = 1:size(FLFRec_88cFlpRe2,3)
        imwrite(uint8(FLFRec_88cFlpRe2_n(:,:,i)*255),'F:\reconstruction\20240507\reconstruction\Util\G1.tif','WriteMode','append');
    end

    %% PIV
%     for i = 1:size(FLFRec_88cFlpRe1,3)
%         imwrite(double(rescale(FLFRec_88cFlpRe1(:,:,i))),'Re1.tif','WriteMode','append');
%         imwrite(double(rescale(FLFRec_88cFlpRe2(:,:,i))),'Re2.tif','WriteMode','append');       
%         i
%     end

for i = 1:FLFSeg_43_TdNum-1
    i
    Path_L554_Index  = num2str(FLFSeg_44_T_Ind(i),'%05d')
    load([Path_s485_FLFLsp,'R',Path_L554_Index,Data_02_formDt],'FLFRec_86_FlpNo1');
    FLFRec_88cFlpRe1 = imresize(gather(FLFRec_86_FlpNo1),Ma_01_obj/Ma_06_FLF/FLFRec_32_Z_Seg);
    Re1= FLFRec_88cFlpRe1;

    Path_L554_Index  = num2str(FLFSeg_44_T_Ind(i+1),'%05d')
    load([Path_s485_FLFLsp,'R',Path_L554_Index,Data_02_formDt],'FLFRec_86_FlpNo1');
    FLFRec_88cFlpRe1 = imresize(gather(FLFRec_86_FlpNo1),Ma_01_obj/Ma_06_FLF/FLFRec_32_Z_Seg);
    Re2= FLFRec_88cFlpRe1;

    %         for j = 1:size(FLFRec_88cFlpRe1,3)
    %             imwrite(double(rescale(FLFRec_88cFlpRe1(:,:,j))),['R_fr',num2str(i),'.tif'],'WriteMode','append');
    %         end
    %     end
    %
    %     figure;imshow(U65_Imshow_B16_MIP_3D_ColAdj(Re1,022,1) + U65_Imshow_B16_MIP_3D_ColAdj(Re2,023,1));

    Re1_c = Re1(1:end,1:end,50:350);
    Re2_c = Re2(1:end,1:end,50:350);

    clear Re1 Re2
    imageStack = Re1_c;
    imageStack2 = Re2_c;

%     figure;imshow(U65_Imshow_B16_MIP_3D_Col(imageStack,011,1));
%     figure;imshow(U65_Imshow_B16_MIP_3D_Col(imageStack2,011,1));

    % Calculate the size of the image stack
    [sizeX, sizeY, sizeZ] = size(imageStack);
    subvolSize = [128,128,64];
    newSubvolSize = [256,256,72];
    padSize = floor((newSubvolSize-subvolSize) / 2);
    Imgstk_pdd = padarray(imageStack2, padSize, 'both');
    [sizeX2, sizeY2, sizeZ2] = size(Imgstk_pdd);

    overlap = 50; % Overlap percentage

    % Overlap calculations
    overlapFactor = (100 - overlap) / 100;
    stepSizeX = round(subvolSize(1) * overlapFactor);
    stepSizeY = round(subvolSize(2) * overlapFactor);
    stepSizeZ = round(subvolSize(3) * overlapFactor);

    % Adjust the number of subvolumes based on the overlap
    numSubvolsX = floor((sizeX - subvolSize(1)) / stepSizeX) + 1;
    numSubvolsY = floor((sizeY - subvolSize(2)) / stepSizeY) + 1;
    numSubvolsZ = floor((sizeZ - subvolSize(3)) / stepSizeZ) + 1;

    % Iterate over each dimension
    parfor x = 1:numSubvolsX
        for y = 1:numSubvolsY
            for z = 1:numSubvolsZ
                % Calculate the indices for the current subvolume
                xIndices = (1:subvolSize(1)) + (x-1)*stepSizeX;
                yIndices = (1:subvolSize(2)) + (y-1)*stepSizeY;
                zIndices = (1:subvolSize(3)) + (z-1)*stepSizeZ;

                centerX = floor((xIndices(1)+xIndices(end))/2);
                centerY = floor((yIndices(1)+yIndices(end))/2);
                centerZ = floor((zIndices(1)+zIndices(end))/2);

                % Ensure indices do not exceed image dimensions
                xIndices(xIndices > sizeX) = [];
                yIndices(yIndices > sizeY) = [];
                zIndices(zIndices > sizeZ) = [];

                % Extract the subvolume
                subvolumes = imageStack(xIndices, yIndices, zIndices);

                % Calculate the indices for the new subvolume
                xIndices2 = round(centerX - newSubvolSize(1)/2 + 1):round(centerX + newSubvolSize(1)/2);
                yIndices2 = round(centerY - newSubvolSize(2)/2 + 1):round(centerY + newSubvolSize(2)/2);
                zIndices2 = round(centerZ - newSubvolSize(3)/2 + 1):round(centerZ + newSubvolSize(3)/2);

                xIndices2(xIndices2 > sizeX2) = [];
                yIndices2(yIndices2 > sizeY2) = [];
                zIndices2(zIndices2 > sizeZ2) = [];

                % Calculate the valid range of indices within the original image stack
                validX = xIndices2 + padSize(1);
                validY = yIndices2 + padSize(2);
                validZ = zIndices2 + padSize(3);

                % Extract and place the valid region into the new subvolume
                newSubvolume = Imgstk_pdd(validX, validY, validZ);

                volume1 = subvolumes;
                volume2 = newSubvolume;
                volume1_Padded = padarray(volume1, floor(size(volume2) - size(volume1))/2, 'both');

                % Ensure the volumes are the same size
                assert(all(size(volume1_Padded) == size(volume2)), 'Volumes must be the same size.');

                % Apply FFT to both volumes
                fftVolume1 = fftn(volume1_Padded);
                fftVolume2 = fftn(volume2);

                % Compute cross-correlation in frequency domain
                crossCorrelationFreq = fftVolume1 .* conj(fftVolume2);

                % Compute the inverse FFT to get the cross-correlation in spatial domain
                correlation = ifftn(crossCorrelationFreq);

                % Shift the zero-frequency component to the center of the array
                correlation = fftshift(correlation);

                % Find the indices of the maximum correlation value
                [~, maxIndex] = max(abs(correlation(:)));
                [dx, dy, dz] = ind2sub(size(correlation), maxIndex);

                % Calculate displacement
                % Adjust indices based on the size of the volumes
                sizeVolume = size(volume2);
                displacement{x,y,z} = [(dx - sizeVolume(1)/2), (dy - sizeVolume(2)/2), (dz - sizeVolume(3)/2)];
            end
        end
        x
    end
    %     figure;imshow(U65_Imshow_B16_MIP_3D_ColAdj(volume1_Padded,022,1)+U65_Imshow_B16_MIP_3D_ColAdj(volume2,023,1));

    % Initialize arrays to hold the start and end points of the vectors
    startPoints = zeros(numSubvolsX * numSubvolsY * numSubvolsZ, 3);
    endPoints = zeros(size(startPoints));

    index = 1;
    for x = 1:numSubvolsX
        for y = 1:numSubvolsY
            for z = 1:numSubvolsZ

                xIndices = (1:subvolSize(1)) + (x-1)*stepSizeX;
                yIndices = (1:subvolSize(2)) + (y-1)*stepSizeY;
                zIndices = (1:subvolSize(3)) + (z-1)*stepSizeZ;

                centerX = floor((xIndices(1)+xIndices(end))/2);
                centerY = floor((yIndices(1)+yIndices(end))/2);
                centerZ = floor((zIndices(1)+zIndices(end))/2);

                startPoints(index, :) = [centerX, centerY, centerZ];
                displacementVec = displacement{x,y,z};

                if displacementVec(2) > 0 || displacementVec(2) < -20 || abs(displacementVec(1)) > 20 || abs(displacementVec(3)) > 10
                    displacementVec = [0,0,0];
                end

                displacementVec = -displacementVec;
                displacementVec_{x,y,z} = displacementVec;
                Coord{x,y,z} = [centerX,centerY,centerZ];

                endPoints(index, :) = startPoints(index, :) + displacementVec;
                index = index + 1;
            end
        end
    end

%     save('vectorfieldmatrix.mat', 'VectMatrix', 'Coordmatrix' );
%     save('vectorfield.mat', 'displacementVec_', 'Coord' );

%     for i = 1:4080
%         Magnet(i) = norm(VectMatrix(i,:));
%     end
%     XYZM = [Coordmatrix,Magnet'];
%     save('XYZM.mat', 'XYZM');

    C = displacementVec_;
    n = numel(C); % Total number of cells
    
    idx = 1;
    VectMatrix = zeros(n, 3); % Preallocate the matrix
    Coordmatrix = zeros(n, 3); 
    Magnet = zeros(n, 1); 

    for z = 1:numSubvolsZ
        for y = 1:numSubvolsY
            for x = 1:numSubvolsX
                VectMatrix(idx, :) = C{x,y,z}; % Assign the 1x3 matrix from each cell to the result matrix
                Coordmatrix(idx,:) = Coord{x,y,z};
                Magnet(idx) = norm(VectMatrix(idx,:));
                idx = idx+1
            end
        end
    end

    save(['F:\reconstruction\20240105\Recon\Util\New folder\vecfield_',num2str(i,'%05d'),'.mat'],'startPoints','endPoints');

    %% save file into dat format for tecplot loading
    XYZUVWM = [Coordmatrix,VectMatrix,Magnet];

    dlmwrite(['F:\reconstruction\20240105\Recon\Util\New folder\vecfield_',num2str(i,'%05d'),'.dat'],[],'delimiter','\t','precision','%.8f','newline','pc'); 
    fileID = fopen(['F:\reconstruction\20240105\Recon\Util\New folder\vecfield_', num2str(i, '%05d'), '.dat'], 'a');

    if fileID == -1
        error('Failed to open file for writing.');
    end

    titleStr = 'TITLE = "Vel Field"';
    variablesStr = 'VARIABLES = "x", "y", "z", "Vx", "Vy", "Vz", "M"';
    zoneStr = sprintf('ZONE T = "Frame %d", I=%d, J=%d, K=%d', i, numSubvolsX, numSubvolsY, numSubvolsZ);

    fprintf(fileID, '%s\n', titleStr);
    fprintf(fileID, '%s\n', variablesStr);
    fprintf(fileID, '%s\n', zoneStr);

    dlmwrite(['F:\reconstruction\20240105\Recon\Util\New folder\vecfield_',num2str(i,'%05d'),'.dat'], XYZUVWM,'-append', 'delimiter','\t','precision','%.8f','newline','pc');
    fclose(fileID); % Close the file after reading
end

    vectorLengths = sqrt((endPoints(:,1) - startPoints(:,1)).^2 + ...
        (endPoints(:,2) - startPoints(:,2)).^2 + ...
        (endPoints(:,3) - startPoints(:,3)).^2);
    % Normalize the vector lengths to [0, 1] for colormap indexing
    normalizedLengths = (vectorLengths - min(vectorLengths)) / ...
        (max(vectorLengths) - min(vectorLengths));

    % Choose a colormap
    colormapName = 'jet'; % This can be any colormap supported by MATLAB
    colors = colormap(colormapName); % Retrieve the colormap array

    % Map the normalized lengths to the colormap
    numColors = size(colors, 1);
    colorIndices = ceil(normalizedLengths * numColors);
    colorIndices(colorIndices < 1) = 1; % Ensure indices are at least 1

    % Assign a color to each vector
    vectorColors = colors(colorIndices, :);

    % Plotting the vectors
    figure;
    hold on; % Allow multiple plots in the same figure
    for i = 1:size(startPoints, 1)
        V = endPoints(:,1) - startPoints(:,1);
        quiver3(startPoints(i,1), startPoints(i,2), startPoints(i,3), ...
            endPoints(i,1) - startPoints(i,1), ...
            endPoints(i,2) - startPoints(i,2), ...
            endPoints(i,3) - startPoints(i,3), ...
            5,'Color', vectorColors(i,:),'MaxHeadSize', 10/norm(V)); % Use the assigned color
    end
    hold off;

    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    title('3D Displacement Vectors');
    axis equal;
    grid on;
    xlim([0 size(imageStack,1)]);
    ylim([0 size(imageStack,2)]);
    %     view([0 90 0]);



    %% segmentation
    FLFRec_88_MIPco1 = U65_Imshow_B16_MIP_3D_Col(FLFRec_88cFlpRe1(:,:,1:100),022,1);
    for i = 1:10
        Path_L554_Index  = num2str(FLFSeg_44_T_Ind(i),'%05d')
        load([Path_s485_FLFLsp,'R',Path_L554_Index,Data_02_formDt],'FLFRec_86_FlpNo1');
        FLFRec_88cFlpRe1 = imresize(gather(FLFRec_86_FlpNo1),Ma_01_obj/Ma_06_FLF/FLFRec_32_Z_Seg);
        bw = imbinarize(rescale(FLFRec_88cFlpRe1(:,1:580,:)),0.07);
%         bw1 = imclose(bw,strel('disk',2));
        bw2 = bwareaopen(bw,200);
        bw3 = imopen(bw2,strel('disk',2));
        D = bwdist(~bw3);
        D = -D;
%         D(~bw3) = Inf;
        L = watershed(D);
        L(~bw3) = 0;
        bw_t = bw3;
        bw_t(L==0) = 0;
        cc = bwconncomp(bw2);
        numberOfCells(i) = cc.NumObjects;
        cellStats = regionprops3(cc, 'Centroid', 'EquivDiameter', 'SurfaceArea', 'Volume');
        Stats = [Stats;cellStats];
        figure;imshow(U65_Imshow_B16_MIP_3D_Col(bw3,011,1));
        i
    end

    figure;imshow(U65_Imshow_B16_MIP_3D_Col(FLFRec_88cFlpRe1(:,1:580,:),011,1));

    path_c = 'F:\reconstruction\20240214\Recon\5FLFVid_6exppro01_4Denois';
    file  = dir(path_c);
    file = file(3:end);
    for i = 1:100
        cen_ele(:,:,i) = imread([path_c,'\',file(i).name]);
        imwrite(cen_ele(482:481*2,482:481*2,i),['F:\reconstruction\20240214\Recon\central_ele','\',num2str(i,'%05d'),'.tif']);
    end

    bw1 = imclose(bw,strel('disk',2));
    figure;imshow(U65_Imshow_B16_MIP_3D_Col(bw2,011,1));

    cc = bwconncomp(bw1);
    numberOfCells = cc.NumObjects;

    cellStats = regionprops3(cc, 'Centroid', 'EquivDiameter', 'SurfaceArea', 'Volume');

    cellCenters = cellStats.Centroid;

    figure;histogram(Stats.EquivDiameter*0.8,100,'EdgeAlpha',0.5,'FaceAlpha',0.5);
    xlim([2,30]);
    set(gca,'FontSize',22);
    xlabel('diameter (μm)');
    ylabel('numOfCells (*10^4)');
    yticks([0:5000:10000]);
    yticklabels({'0','0.5','1'});

    figure;histogram(Stats.Volume);
   
    Stats = Stats(266692-264070+1:end,:);
    save('statistic016.mat','Stats');
    
    sum(numberOfCells)
    figure;bar(numberOfCells(1:end-1),0.5);
    num_s = smooth(numberOfCells(1:end-1),2);hold on;plot(num_s,'linewidth',2);
    set(gca,'FontSize',22);
    xticks([0:50:150]);
    xticklabels({'0','0.5','1','1.5'});
    xlabel('time (s)');
    ylabel('numOfCells');

%     pathele = 'F:\reconstruction\20231120\00016\03_ele';
%     fileele = dir(pathele);
%     fileele = fileele(3:end);
% 
%     for i = 1:156
%         ele(:,:,i) = imread([pathele,'\',fileele(i).name]);
%         i
%     end
% 
%     for n = 69:155
%         n
%         cross_corr = xcorr2(ele(1:360,:,n), ele(122:end,:,n+1));
% %         cross_corr = xcorr2(ele(1:240,:,n), ele(241:end,:,n+1));
%         % Find the peak in the cross-correlation
%         [~, idx] = max(abs(cross_corr(:)));
%         [y_peak, x_peak] = ind2sub(size(cross_corr), idx);
% 
%         % Calculate displacement in pixels
%         % Assuming the center of the image is the origin
%         displacement_pixels(n,:) = [x_peak - size(ele(1:360,:,1),2), y_peak - size(ele(1:360,:,1),1)];
% %         displacement_pixels_2(n,:) = [x_peak - size(ele(1:240,:,n),2), y_peak - size(ele(1:240,:,n),1)];
%     end
% 
%     mean(displacement_pixels(1:end-2,2))+160
%     
%     figure;imshow(U65_Imshow_B16_MIP_3D_Col(vol(:,:,50:150),011,1));
%     figure;imshow(sum(vol(:,:,50:150),3),[]);
%     
%     for i = 1:156
%         load([path,'/',file(i).name]);
%         vol = imresize(gather(FLFRec_86_FlpNo2),16/7.2);
%         stack(:,:,i) = sum(vol(:,:,50:150),3);
%         i
%     end
%     
%     for n = 1:155
%         n
%         cross_corr = xcorr2(stack(:,1:611,n), stack(:,306:end,n+1));
%         [~, idx] = max(abs(cross_corr(:)));
%         [y_peak, x_peak] = ind2sub(size(cross_corr), idx);
% 
%         displacement_pixels(n,:) = [x_peak - size(stack(:,306:end,1),2), y_peak - size(stack(:,306:end,1),1)];
% %         displacement_pixels_2(n,:) = [x_peak - size(ele(1:240,:,n),2), y_peak - size(ele(1:240,:,n),1)];
%     end 
%     
%     for i = 1:156
%         imwrite(im2uint8(rescale(stack(:,:,i))),['F:\reconstruction\20231120\00016\03_50-150stack\',num2str(i,'%05d'),'.tif']);
%         i
%     end

    
    
    
    
    
    