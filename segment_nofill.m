%% clear all;clc;close all;

%%
addpath(genpath('E:\00_Matlab_Code'))
addpath(genpath('E:\A_Fiji.app\Fiji.app\scripts'))
addpath(genpath('E:\02_ACsN'))
addpath(genpath('E:\02_MIRO'))

r_vol = [];
g_vol = [];
num_cluster_tol = 0;
num_overlap_tol = 0;
overlap_ratio_tol = [];

%%
for idxt = 00001:00100
Path_s485_FLFLsp = ['I:\IFC-16X\20240625_jk_mix\reconstruction\5FLFVid_5exprec240627_0129' ...
    '\FLF_016XNA0.80La525nm_ft300mmfe200mm_MLAS1300P3300f23.0_P6.5umRF2DN1SPD4103It6Pw1_8_FLFLsp'];
Data_02_formDt = '.mat';
Path_L554_Index  = num2str((idxt-1)*10+1,'%05d')
% Path_L554_Index = '00260';
load([Path_s485_FLFLsp,'R',Path_L554_Index,Data_02_formDt],'FLFRec_86_FlpNo1');
load([Path_s485_FLFLsp,'G',Path_L554_Index,Data_02_formDt],'FLFRec_86_FlpNo2');

FLFRec_88cFlpRe10 = imresize(gather(FLFRec_86_FlpNo1),16/14.4);
FLFRec_88cFlpRe20 = imresize(gather(FLFRec_86_FlpNo2),16/14.4);
% RecFLF_89_MIP3Dt0 = FLFRec_88_MIPco10+FLFRec_88_MIPco20;
% figure,imshow(U65_Imshow_B16_MIP_3D_ColAdj(FLFRec_88cFlpRe10,031,1.2)+U65_Imshow_B16_MIP_3D_ColAdj(FLFRec_88cFlpRe20,032,1.3));

FLFRec_88cFlpRe1 = FLFRec_88cFlpRe10(273+(-68:68),1:400,:);
FLFRec_88cFlpRe2 = FLFRec_88cFlpRe20(273+(-68:68),1:400,:);

% FLFRec_88cFlpRe1 = FLFRec_88cFlpRe10(107:107+400,39:39+400,:);
% FLFRec_88cFlpRe2 = FLFRec_88cFlpRe20(107:107+400,39:39+400,:);

FLFRec_88_MIPco1 = U65_Imshow_B16_MIP_3D_ColAdj(FLFRec_88cFlpRe1,031,1.2);
FLFRec_88_MIPco2 = U65_Imshow_B16_MIP_3D_ColAdj(FLFRec_88cFlpRe2,032,1.3);
RecFLF_89_MIP3Dt = FLFRec_88_MIPco1+FLFRec_88_MIPco2;
% figure,imshow(RecFLF_89_MIP3Dt);
% imwrite(RecFLF_89_MIP3Dt,'fr260_mip.tif');
% FLFRec_88cFlpRe1 = FLFRec_88cFlpRe10;
% FLFRec_88cFlpRe2 = FLFRec_88cFlpRe20;
% FLFRec_88_MIPco1 = U65_Imshow_B16_MIP_3D_ColAdj(rot90(FLFRec_88cFlpRe1,3),022,1.5);
% FLFRec_88_MIPco2 = U65_Imshow_B16_MIP_3D_ColAdj(rot90(FLFRec_88cFlpRe2,3),023,1.3);
% RecFLF_89_MIP3Dt = FLFRec_88_MIPco1+FLFRec_88_MIPco2;
% figure,imshow(RecFLF_89_MIP3Dt);
% imwrite(RecFLF_89_MIP3Dt,'fr1_mip.tif');

uiopen('I:\IFC-16X\20240625_jk_mix\reconstruction\5FLFVid_6exppro62_4Denois\FLF_ExpImg_74Denois_0.01-10.01-0.01s_Frm00001.tif',1);
[height, width] = size(image);
rows = 3; cols = 3;
tileHeight = floor(height / rows);
tileWidth = floor(width / cols);
elementalStack = zeros(tileHeight, tileWidth, rows * cols, 'uint8');
for i = 1:rows * cols
    r = floor((i-1) / cols) + 1;
    c = mod(i-1, cols) + 1;
    elementalStack(:, :, i) = image((r-1)*tileHeight+1:r*tileHeight, ...
                                    (c-1)*tileWidth+1:c*tileWidth);
end
figure;imshow(image,[]);
elementalStack_s = elementalStack(261-20:261+20,245-20:245+20,:);
figure;montage(elementalStack_s);
colormap('jet');

rgbStack = zeros(size(elementalStack_s,1), size(elementalStack_s,2), 3, 9, 'uint16');
red_indices = [1, 3, 5, 7, 9];
green_indices = setdiff(1:9, red_indices);

for i = 1:9
    grayImg = elementalStack_s(:, :, i);
    if ismember(i, red_indices)
        rgbImg = U61_Imshow_B16_Col(grayImg, 022);  % red
    else
        rgbImg = U61_Imshow_B16_Col(grayImg, 023);  % green
    end
    rgbStack(:,:,:,i) = rgbImg;
end
figure; col = montage(rgbStack, 'Size', [3 3]);

s1 = U61_Imshow_B16_Col(elementalStack_s(:,:,1),022);
imwrite(s1,'ele11.tif');
s5 = U61_Imshow_B16_Col(elementalStack_s(:,:,5),022);
imwrite(s5,'ele22.tif');
s2 = U61_Imshow_B16_Col(elementalStack_s(:,:,2),023);
imwrite(s2,'ele12.tif');
s6 = U61_Imshow_B16_Col(elementalStack_s(:,:,6),023);
imwrite(s6,'ele23.tif');
% 
% FLFRec_88cFlpRe1 = rot90(FLFRec_88cFlpRe10,3);
% FLFRec_88cFlpRe1 = FLFRec_88cFlpRe1(265:305,247:287,(59:93)-43);
% FLFRec_88cFlpRe2 = rot90(FLFRec_88cFlpRe20,3);
% FLFRec_88cFlpRe2 = FLFRec_88cFlpRe2(265:305,247:287,(59:93)-43);
% FLFRec_88_MIPco1 = U65_Imshow_B16_MIP_3D_Col(FLFRec_88cFlpRe1,031,1.2);
% FLFRec_88_MIPco2 = U65_Imshow_B16_MIP_3D_Col(FLFRec_88cFlpRe2,032,1.3);
% RecFLF_89_MIP3Dt = FLFRec_88_MIPco1+FLFRec_88_MIPco2;
% figure,imshow(RecFLF_89_MIP3Dt);
% FLFRec_88cFlpRe1_n = rescale(FLFRec_88cFlpRe1);
% FLFRec_88cFlpRe2_n = rescale(FLFRec_88cFlpRe2);
% for i = 1:35
%     imwrite(uint16(FLFRec_88cFlpRe1_n(:,:,i)*65535),'r_crop-2.tif','WriteMode','append');
% end
% for i = 1:35
%     imwrite(uint16(FLFRec_88cFlpRe2_n(:,:,i)*65535),'g_crop-2.tif','WriteMode','append');
% end

% FLFRec_88cFlpRe1 = FLFRec_88cFlpRe10(107+252:107+252+13,39+162:39+162+13,14:14+22);
% FLFRec_88cFlpRe2 = FLFRec_88cFlpRe20(107+252:107+252+13,39+162:39+162+13,14:14+22);
% FLFRec_88_MIPco1 = U65_Imshow_B16_MIP_3D_Col(FLFRec_88cFlpRe1,031,1.2);
% FLFRec_88_MIPco2 = U65_Imshow_B16_MIP_3D_Col(FLFRec_88cFlpRe2,032,1.3);
% RecFLF_89_MIP3Dt = FLFRec_88_MIPco1+FLFRec_88_MIPco2;
% figure,imshow(RecFLF_89_MIP3Dt);
% FLFRec_88cFlpRe1_n = rescale(FLFRec_88cFlpRe1);
% FLFRec_88cFlpRe2_n = rescale(FLFRec_88cFlpRe2);
% for i = 1:23
%     imwrite(uint16(FLFRec_88cFlpRe1_n(:,:,i)*65535),'r_crop.tif','WriteMode','append');
% end
% for i = 1:23
%     imwrite(uint16(FLFRec_88cFlpRe2_n(:,:,i)*65535),'g_crop.tif','WriteMode','append');
% end
% FLFRec_88cFlpRe1 = FLFRec_88cFlpRe10(107+252:107+252+13,39+162:39+162+13,14:14+22);
% FLFRec_88cFlpRe2 = FLFRec_88cFlpRe20(107+252:107+252+13,39+162:39+162+13,14:14+22);
% FLFRec_88_MIPco1 = U65_Imshow_B16_MIP_3D_Col(FLFRec_88cFlpRe1,031,1.2);
% FLFRec_88_MIPco2 = U65_Imshow_B16_MIP_3D_Col(FLFRec_88cFlpRe2,032,1.3);
% RecFLF_89_MIP3Dt = FLFRec_88_MIPco1+FLFRec_88_MIPco2;
% figure,imshow(RecFLF_89_MIP3Dt);
% FLFRec_88cFlpRe1_n = rescale(FLFRec_88cFlpRe1);
% FLFRec_88cFlpRe2_n = rescale(FLFRec_88cFlpRe2);
% for i = 1:23
%     imwrite(uint16(FLFRec_88cFlpRe1_n(:,:,i)*65535),'r_crop.tif','WriteMode','append');
% end
% for i = 1:23
%     imwrite(uint16(FLFRec_88cFlpRe2_n(:,:,i)*65535),'g_crop.tif','WriteMode','append');
% end
FLFRec_88cFlpRe1 = FLFRec_88cFlpRe10(107+102:107+102+50,39+231:39+231+50,(67:114)-54);
FLFRec_88cFlpRe2 = FLFRec_88cFlpRe20(107+102:107+102+50,39+231:39+231+50,(67:114)-54);
FLFRec_88_MIPco1 = U65_Imshow_B16_MIP_3D_Col(FLFRec_88cFlpRe1,031,1.2);
FLFRec_88_MIPco2 = U65_Imshow_B16_MIP_3D_Col(FLFRec_88cFlpRe2,032,1.3);
RecFLF_89_MIP3Dt = FLFRec_88_MIPco1+FLFRec_88_MIPco2;
figure,imshow(RecFLF_89_MIP3Dt);
FLFRec_88cFlpRe1_n = rescale(FLFRec_88cFlpRe1);
FLFRec_88cFlpRe2_n = rescale(FLFRec_88cFlpRe2);
for i = 1:48
    imwrite(uint16(FLFRec_88cFlpRe1_n(:,:,i)*65535),'r_crop_l.tif','WriteMode','append');
end
for i = 1:48
    imwrite(uint16(FLFRec_88cFlpRe2_n(:,:,i)*65535),'g_crop_l.tif','WriteMode','append');
end

% idxt = 100
mip = U65_Imshow_B16_MIP_3D_ColAdj(FLFRec_88cFlpRe10,031,1.2)+U65_Imshow_B16_MIP_3D_ColAdj(FLFRec_88cFlpRe20,032,1.3);
figure,imshow(mip);
imwrite(mip,'mip_100.tif');
FLFRec_88cFlpRe1 = FLFRec_88cFlpRe10(247:267,145:165,10:35);
FLFRec_88cFlpRe2 = FLFRec_88cFlpRe20(247:267,145:165,10:35);
FLFRec_88_MIPco1 = U65_Imshow_B16_MIP_3D_Col(FLFRec_88cFlpRe1,031,1.2);
FLFRec_88_MIPco2 = U65_Imshow_B16_MIP_3D_Col(FLFRec_88cFlpRe2,032,1.3);
RecFLF_89_MIP3Dt = FLFRec_88_MIPco1+FLFRec_88_MIPco2;
figure,imshow(RecFLF_89_MIP3Dt);
FLFRec_88cFlpRe1_n = rescale(FLFRec_88cFlpRe1);
FLFRec_88cFlpRe2_n = rescale(FLFRec_88cFlpRe2);
for i = 1:26
    imwrite(uint16(FLFRec_88cFlpRe1_n(:,:,i)*65535),'r_crop_100.tif','WriteMode','append');
end
for i = 1:26
    imwrite(uint16(FLFRec_88cFlpRe2_n(:,:,i)*65535),'g_crop_100.tif','WriteMode','append');
end

%% 
% figure;imshow(FLFRec_88_MIPco1);
thres = graythresh(rescale(FLFRec_88cFlpRe1))*0.9; %0.8forseg2
bw1 = imbinarize(rescale(FLFRec_88cFlpRe1),thres);
% bw1 = edge3(rescale(FLFRec_88cFlpRe1),"sobel",thres);
% figure;imshow(U65_Imshow_B16_MIP_3D_Col(bw1,031,1));
bw1_c = imclose(bw1,strel('sphere',1));
% figure;imshow(U65_Imshow_B16_MIP_3D_Col(bw1_c,031,1));
% bw1_c_f = imfill(bw1_c,'holes');
% figure;imshow(U65_Imshow_B16_MIP_3D_Col(bw1_c_f,031,1));
bw1_s = bwareaopen(bw1_c,50);
% figure;imshow(U65_Imshow_B16_MIP_3D_Col(bw1_s,031,1));

% figure;imshow(FLFRec_88_MIPco2);
thres = graythresh(rescale(FLFRec_88cFlpRe2))*0.7; %0.6forseg2
bw2 = imbinarize(rescale(FLFRec_88cFlpRe2),thres);
% figure;imshow(U65_Imshow_B16_MIP_3D_Col(bw2,032,1));
bw2_c = imclose(bw2,strel('sphere',2));
% figure;imshow(U65_Imshow_B16_MIP_3D_Col(bw2_c,032,1));
% bw2_c_f = imfill(bw2_c,'holes');
% figure;imshow(U65_Imshow_B16_MIP_3D_Col(bw2_c_f,032,1));
bw2_s = bwareaopen(bw2_c,50);
% figure;imshow(U65_Imshow_B16_MIP_3D_Col(bw2_s,032,1));

% figure;imshow(U65_Imshow_B16_MIP_3D_Col(bw1_s,031,1)+U65_Imshow_B16_MIP_3D_Col(bw2_s,032,1));

%% Find maxima in Fiji
MIP_xy = squeeze(max(FLFRec_88cFlpRe1,[],3))';  
MIP_xy = imresize(imgaussfilt(imresize(MIP_xy,2),3),0.5);
% figure;imshow(MIP_xy,[]);

if idxt == 1
    javaaddpath 'D:\matlab\java\mij.jar'.
    javaaddpath 'D:\matlab\java\ij.jar'.
    MIJ.start
end

clear imgResult Zmax
MIJ.createImage(MIP_xy);  
MIJ.run("Find Maxima...", "prominence=100 exclude output=List");
imgResult = MIJ.getResultsTable;

[height, width] = size(MIP_xy);
filteredResults = imgResult(imgResult(:,1) > 5 & imgResult(:,1) < (width - 5) & ...
                            imgResult(:,2) > 5 & imgResult(:,2) < (height - 5), :);
imgResult = filteredResults;

% figure;imshow(rescale(MIP_xy));
% hold on;
% plot(imgResult(:,1),imgResult(:,2),'r.');

for i = 1:size(imgResult,1)
    [~,Zmax(i)] = max(FLFRec_88cFlpRe1(imgResult(i,1),imgResult(i,2),:));
end

% figure;imshow(U65_Imshow_B16_MIP_3D_ColAdj(FLFRec_88cFlpRe1,031,1.2));
% hold on;plot(imgResult(:,2),imgResult(:,1),'r.');
% hold on;plot(339+Zmax',imgResult(:,1),'r.');
% hold on;plot(imgResult(:,2),219+Zmax','r.');

coord0 = [imgResult, Zmax'];
centroid = coord0;

MIP_xy = squeeze(max(FLFRec_88cFlpRe2,[],3))';  
MIP_xy = imresize(imgaussfilt(imresize(MIP_xy,2),3),0.5);
% figure;imshow(MIP_xy,[]);

clear imgResult Zmax
MIJ.createImage(MIP_xy);
MIJ.run("Find Maxima...", "prominence=100 exclude output=List");
imgResult = MIJ.getResultsTable;

filteredResults = imgResult(imgResult(:,1) > 5 & imgResult(:,1) < (width - 5) & ...
                            imgResult(:,2) > 5 & imgResult(:,2) < (height - 5), :);
imgResult = filteredResults;

for i = 1:size(imgResult,1)
    [~,Zmax(i)] = max(FLFRec_88cFlpRe2(imgResult(i,1),imgResult(i,2),:));
end

% figure;imshow(U65_Imshow_B16_MIP_3D_ColAdj(FLFRec_88cFlpRe2,032,1.2));
% hold on;plot(imgResult(:,2),imgResult(:,1),'w.');
% hold on;plot(339+Zmax',imgResult(:,1),'w.');
% hold on;plot(imgResult(:,2),219+Zmax','w.');

coord02 = [imgResult, Zmax'];
centroid2 = coord02;

MIJ.run('Clear Results'); 
MIJ.closeAllWindows;
MIJ.run('Close All'); 
% MIJ.exit();

%% segment 1
cc = bwconncomp(imdilate(bw1_s,strel('sphere',1)));
% labeledMask = labelmatrix(cc);
% figure;imshow(U65_Imshow_B16_MIP_3D_Col(labeledMask,032,1.3));
% props = regionprops3(cc, 'Centroid');
cellCenters = centroid;
numCells = size(cellCenters,1);
cellLabels = zeros(numCells, 1);

% figure;imshow(U65_Imshow_B16_MIP_3D_Col(bw1_s,012,1));
% hold on;plot(centroid(:,2),centroid(:,1),'b.');
% hold on;plot(460+centroid(:,3),centroid(:,1),'b.');
% hold on;plot(centroid(:,2),270+centroid(:,3),'b.');

% for i = 1:numCells
%     cellLabels(i) = labeledMask(cellCenters(i,1),cellCenters(i,2),cellCenters(i,3));
% end

% U65_Imshow_B16_MIP_3D_Fire(FLFRec_88cFlpRe1);
% hold on;
% for i = 1:numCells
%     text(centroid(i,2),centroid(i,1),num2str(cellLabels(i)),'FontSize',5,'Col','w');
%     hold on;
% end

% Iterate through each connected component
currentLabel = 0;
newLabelImage = zeros(size(FLFRec_88cFlpRe1));
nucl_idx = zeros(numCells,1);
for i = 1:cc.NumObjects %max(labeledMask(:))
    regionIndices = cc.PixelIdxList{i};
    [Xr, Yr, Zr] = ind2sub(size(bw1_s), regionIndices);
    voxelCoordinates = [Xr, Yr];

    % Find nucleus centers within the current region
    inRegionCentersIdx = ismember(cellCenters, [Xr, Yr, Zr], 'rows');
    inRegionCenters = cellCenters(inRegionCentersIdx, :);

    if isempty(inRegionCenters)
        % If no nucleus center is found within the region, skip to the next component
        newLabelImage(regionIndices) = 0;
        continue;
    end
    
    numInRegionCenters = size(inRegionCenters, 1);
    
    if numInRegionCenters == 1
        % If only one center, assign all voxels in the region to this center
        currentLabel = currentLabel + 1;
        nucl_Idx = find(ismember(cellCenters, inRegionCenters, 'rows'));
        newLabelImage(regionIndices) = nucl_Idx;
%             U65_Imshow_B16_MIP_3D_Fire(segmentedMembraneMask);
    else
        % Use k-means clustering to assign voxels to the nearest center
        [clusterIdx, ~] = kmeans(voxelCoordinates, numInRegionCenters, 'Start', inRegionCenters(:,1:2));
        for k = 1:numInRegionCenters
            currentLabel = currentLabel + 1;
            nucl_Idx = find(ismember(cellCenters, inRegionCenters(k, :), 'rows'));            
            clusterMask = false(size(bw1_s));
            clusterMask(regionIndices(clusterIdx == k)) = true;
%             U65_Imshow_B16_MIP_3D_Fire(clusterMask);
            newLabelImage(clusterMask) = nucl_Idx;
        end
    end
%     regionMask = (labeledMask == i); 
% %     U65_Imshow_B16_MIP_3D_Fire(regionMask);
%     inRegionCenters = cellCenters(cellLabels == i, :);
%     numInRegionCenters = size(inRegionCenters, 1);
% 
%     if numInRegionCenters > 0
%         [Xr, Yr, Zr] = ind2sub(size(regionMask), find(regionMask));
%         voxelCoordinates = [Xr, Yr];
%         idx = find(cellLabels == i); 
% 
%         if numInRegionCenters == 1
%             % If only one center, assign all voxels in the region to this center
%             currentLabel = currentLabel + 1;
%             newLabelImage(regionMask) = currentLabel;
%             nucl_idx(idx) = currentLabel;
%         else
% %             numInRegionCenters
% %             i
%             % Use k-means clustering to assign voxels to the nearest center
%             [clusterIdx, ~] = kmeans(voxelCoordinates, numInRegionCenters, 'Start', inRegionCenters(:,1:2));
%             for k = 1:numInRegionCenters
%                 currentLabel = currentLabel + 1;
%                 clusterMask = regionMask;
%                 clusterMask(sub2ind(size(clusterMask), Xr(clusterIdx == k), Yr(clusterIdx == k), Zr(clusterIdx == k))) = 0;
% %                 U65_Imshow_B16_MIP_3D_Fire(clusterMask);
%                 newLabelImage(clusterMask == 0 & regionMask) = currentLabel;
%                 nucl_idx(idx(k)) = currentLabel;
%             end
%         end
%     end
end
currentLabel
uniqueLabels1 = unique(newLabelImage(:));
uniqueLabels1(uniqueLabels1 == 0) = []; % Remove background
 
% U65_Imshow_B16_MIP_3D_Fire(newLabelImage);
% 
% U65_Imshow_B16_MIP_3D_Fire(FLFRec_88cFlpRe1);
% hold on;
% for label = uniqueLabels1'
%     cellMask = (newLabelImage == (label));
%     [B, L] = bwboundaries(max(cellMask, [], 3), 'noholes'); % 2D boundary from max projection
%     
%     for k = 1:length(B)
%         boundary = B{k};
%         plot(boundary(:,2), boundary(:,1), 'g--', 'LineWidth', 1);
%         text(mean(boundary(:,2)), mean(boundary(:,1)), num2str((label)), 'Color', 'w', 'FontSize', 10);
%     end
% end
% hold off;

%% segment 2
cc2 = bwconncomp(imdilate(bw2_s,strel('sphere',1)));
% labeledMask2 = labelmatrix(cc2);
% figure;imshow(U65_Imshow_B16_MIP_3D_Col(labeledMask,032,1.3));
cellCenters2 = centroid2;
numCells2 = size(cellCenters2,1);
cellLabels2 = zeros(numCells2, 1);

% figure;imshow(U65_Imshow_B16_MIP_3D_Col(bw2_s,012,1));
% hold on;plot(centroid(:,2),centroid(:,1),'b.');
% hold on;plot(460+centroid(:,3),centroid(:,1),'b.');
% hold on;plot(centroid(:,2),270+centroid(:,3),'b.');

% for i = 1:numCells2
%     cellLabels2(i) = labeledMask2(cellCenters2(i,1),cellCenters2(i,2),cellCenters2(i,3));
% end

% U65_Imshow_B16_MIP_3D_Fire(FLFRec_88cFlpRe2);
% hold on;
% for i = 1:numCells
%     text(centroid(i,2),centroid(i,1),num2str(cellLabels(i)),'FontSize',5,'Col','w');
%     hold on;
% end

% Iterate through each connected component
currentLabel = 0;
newLabelImage2 = zeros(size(FLFRec_88cFlpRe2));
nucl_idx2 = zeros(numCells,1);
for i = 1:cc2.NumObjects %max(labeledMask2(:))
    regionIndices = cc2.PixelIdxList{i};
    [Xr, Yr, Zr] = ind2sub(size(bw2_s), regionIndices);
    voxelCoordinates = [Xr, Yr];

    % Find nucleus centers within the current region
    inRegionCentersIdx = ismember(cellCenters2, [Xr, Yr, Zr], 'rows');
    inRegionCenters = cellCenters2(inRegionCentersIdx, :);

    if isempty(inRegionCenters)
        % If no nucleus center is found within the region, skip to the next component
        newLabelImage2(regionIndices) = 0;
        continue;
    end
    
    numInRegionCenters = size(inRegionCenters, 1);
    
    if numInRegionCenters == 1
        % If only one center, assign all voxels in the region to this center
        currentLabel = currentLabel + 1;
        nucl_Idx2 = find(ismember(cellCenters2, inRegionCenters, 'rows'));
        newLabelImage2(regionIndices) = nucl_Idx2;
%             U65_Imshow_B16_MIP_3D_Fire(segmentedMembraneMask);
    else
        % Use k-means clustering to assign voxels to the nearest center
        [clusterIdx, ~] = kmeans(voxelCoordinates, numInRegionCenters, 'Start', inRegionCenters(:,1:2));
        for k = 1:numInRegionCenters
            currentLabel = currentLabel + 1;
            nucl_Idx2 = find(ismember(cellCenters2, inRegionCenters(k, :), 'rows'));            
            clusterMask = false(size(bw1_s));
            clusterMask(regionIndices(clusterIdx == k)) = true;
%             U65_Imshow_B16_MIP_3D_Fire(clusterMask);
            newLabelImage2(clusterMask) = nucl_Idx2;
        end
    end
%     regionMask = (labeledMask2 == i); 
% %     U65_Imshow_B16_MIP_3D_Fire(regionMask);
%     inRegionCenters = cellCenters2(cellLabels2 == i, :);
%     numInRegionCenters = size(inRegionCenters, 1);
% 
%     if numInRegionCenters > 0
%         [Xr, Yr, Zr] = ind2sub(size(regionMask), find(regionMask));
%         voxelCoordinates = [Xr, Yr];
%         idx = find(cellLabels2 == i); 
% 
%         if numInRegionCenters == 1
%             % If only one center, assign all voxels in the region to this center
%             currentLabel = currentLabel + 1;
%             newLabelImage2(regionMask) = currentLabel;
%             nucl_idx2(idx) = currentLabel;
%         else
% %             numInRegionCenters
% %             i
%             % Use k-means clustering to assign voxels to the nearest center
%             [clusterIdx, ~] = kmeans(voxelCoordinates, numInRegionCenters, 'Start', inRegionCenters(:,1:2));
%             for k = 1:numInRegionCenters
%                 currentLabel = currentLabel + 1;
%                 clusterMask = regionMask;
%                 clusterMask(sub2ind(size(clusterMask), Xr(clusterIdx == k), Yr(clusterIdx == k), Zr(clusterIdx == k))) = 0;
% %                 U65_Imshow_B16_MIP_3D_Fire(clusterMask);
%                 newLabelImage2(clusterMask == 0 & regionMask) = currentLabel;
%                 nucl_idx2(idx(k)) = currentLabel;
%             end
%         end
%     end
end
currentLabel
uniqueLabels2 = unique(newLabelImage2(:));
uniqueLabels2(uniqueLabels2 == 0) = []; % Remove background

% U65_Imshow_B16_MIP_3D_Fire(newLabelImage2);
% 
% U65_Imshow_B16_MIP_3D_Fire(FLFRec_88cFlpRe2);
% hold on;
% for label = uniqueLabels2'
%     cellMask = (newLabelImage2 == (label));
%     [B, L] = bwboundaries(max(cellMask, [], 3), 'noholes'); % 2D boundary from max projection
%     
%     for k = 1:length(B)
%         boundary = B{k};
%         plot(boundary(:,2), boundary(:,1), 'g--', 'LineWidth', 1);
%         text(mean(boundary(:,2)), mean(boundary(:,1)), num2str((label)), 'Color', 'w', 'FontSize', 10);
%     end
% end
% hold off;

% %%
% figure,imshow(RecFLF_89_MIP3Dt);
% hold on;
% for label = uniqueLabels2'
%     cellMask = (newLabelImage2 == (label));
%     [B, L] = bwboundaries(max(cellMask, [], 3), 'noholes'); % 2D boundary from max projection 
%     for k = 1:length(B)
%         boundary = B{k};
%         plot(boundary(:,2), boundary(:,1), 'y', 'LineWidth', 1);
%     end
% %     [B, L] = bwboundaries(squeeze(max(cellMask, [], 2))', 'noholes'); % 2D boundary from max projection 
% %     for k = 1:length(B)
% %         boundary = B{k};
% %         plot(406+boundary(:,1), boundary(:,2), 'y', 'LineWidth', 0.1); 
% %     end
% end
% hold off;
% hold on;
% for label = uniqueLabels1'
%     cellMask = (newLabelImage == (label));
%     [B, L] = bwboundaries(max(cellMask, [], 3), 'noholes'); % 2D boundary from max projection    
%     for k = 1:length(B)
%         boundary = B{k};
%         plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 1);
%     end
% %     [B, L] = bwboundaries(squeeze(max(cellMask, [], 2))', 'noholes'); % 2D boundary from max projection 
% %     for k = 1:length(B)
% %         boundary = B{k};
% %         plot(406+boundary(:,1), boundary(:,2), 'w', 'LineWidth', 0.1); 
% %     end
% end
% hold off;

%%
overlap = newLabelImage & newLabelImage2;
% U65_Imshow_B16_MIP_3D_Fire(overlap);
overlap_s = bwareaopen(overlap,20);
% U65_Imshow_B16_MIP_3D_Fire(overlap_s);

% each column represents the label of one cell from two channels
labels1_overlap = unique(newLabelImage(overlap_s));
labels2_overlap = unique(newLabelImage2(overlap_s));

num_overlap = min(length(labels1_overlap),length(labels2_overlap));
num_overlap_tol = num_overlap_tol + num_overlap;

% % Calculate overlap ratio for each pair of overlapping labels
% overlap_ratios = [];   
% for i = 1:length(labels1_overlap)
%     label1 = labels1_overlap(i);
%     region1 = (newLabelImage == label1);
%     for j = 1:length(labels2_overlap)
%         label2 = labels2_overlap(j);
%         region2 = (newLabelImage2 == label2);
%         
%         intersection = region1 & region2;
%         union = region1 | region2;
%         
%         overlap_ratio = sum(intersection(:)) / sum(union(:));
%         overlap_ratios = [overlap_ratios; label1, label2, overlap_ratio];
%     end
% end
% if length(labels1_overlap) > 0
%     num_cluster_tol = num_cluster_tol + nnz(overlap_ratios(:,3));
%     ratio = overlap_ratios(:,3);
%     overlap_ratio_tol = [overlap_ratio_tol; ratio(ratio > 0)];
% end

overlap_ratios = [];   
for i = 1:length(labels1_overlap)
    label1 = labels1_overlap(i);
    region1 = (newLabelImage == label1);

    label2 = unique(newLabelImage2(region1 & newLabelImage2 > 0));
    label2(label2 == 0) = []; % Remove background label
    
    if ~isempty(label2)
        for k = 1:length(label2)
            region2 = (newLabelImage2 == label2(k));

            intersection = region1 & region2;
            union = region1 | region2;

            overlap_ratio = sum(intersection(:)) / sum(union(:));
            overlap_ratios = [overlap_ratios; label1, label2(k), overlap_ratio, sum(union(:)), sum(intersection(:))];
        end
    end
end

if length(labels1_overlap) > 0
    num_cluster_tol = num_cluster_tol + length(overlap_ratios);
    overlap_ratio_tol = [overlap_ratio_tol; overlap_ratios];
end

% overlapMask1 = ismember(newLabelImage, labels1_overlap);
% overlapMask2 = ismember(newLabelImage2, labels2_overlap);
% % figure;imshow(U65_Imshow_B16_MIP_3D_Col(overlapMask1,031,1)+U65_Imshow_B16_MIP_3D_Col(overlapMask2,032,1));
% overlap_mask_col = U65_Imshow_B16_MIP_3D_Col(overlapMask1,031,1)+U65_Imshow_B16_MIP_3D_Col(overlapMask2,032,1);
% % save('overlap_ratio_tol.mat','overlap_ratio_tol');
% % imwrite(overlap_mask_col,['I:\IFC-16X\20240625_jk_mix\reconstruction\Util\segmentation3\',num2str(Path_L554_Index),'.tif']);

%%
voxelVolume = 1.6^3; 
% U65_Imshow_B16_MIP_3D_Fire(segmentedMembraneMask);
newLabelImage2_o = imerode(newLabelImage2,strel('sphere',1));
newLabelImage_o = imerode(newLabelImage,strel('sphere',1));

cellStats_g = regionprops3(newLabelImage2_o, FLFRec_88cFlpRe2, 'Centroid', 'Volume', ...
    'SurfaceArea', 'EquivDiameter','BoundingBox', 'MeanIntensity', 'VoxelValues');
cellStats_r = regionprops3(newLabelImage_o, FLFRec_88cFlpRe1, 'Centroid', 'Volume', ...
    'SurfaceArea', 'EquivDiameter','BoundingBox', 'MeanIntensity', 'VoxelValues');
nonzerog = cellStats_g.Volume > 0;
nonzeror = cellStats_r.Volume > 0;
% nonzero = and(cellStats_g.Volume >= 0 , cellStats_r.Volume./cellStats_g.Volume <= 0.999);
cellStats_g0 = cellStats_g(nonzerog,:);
cellStats_r0 = cellStats_r(nonzeror,:);

% clear mitorVolumes mitogVolumes
% for i = 1:size(uniqueLabels1,1)
%     label = uniqueLabels1(i);
%     mitorVolumes(i) = sum(newLabelImage_o(:) == (label)) * voxelVolume;
% end
% for i = 1:size(uniqueLabels2,1)
%     label = uniqueLabels2(i);
%     mitogVolumes(i) = sum(newLabelImage2_o(:) == (label)) * voxelVolume;
% end
% 
% r_vol = [r_vol,mitorVolumes];
% g_vol = [g_vol,mitogVolumes];

%%
save(['I:\IFC-16X\20240625_jk_mix\reconstruction\Util\segmentation4\',num2str(Path_L554_Index),'.mat'], ...
    'uniqueLabels1','uniqueLabels2','newLabelImage2','newLabelImage','nucl_idx','nucl_idx2','cellStats_g0','cellStats_r0' ...
    ,'overlapMask1','overlapMask2','overlap_mask_col','overlap_ratios');
end

%%
figure;histogram(mitorVolumes,40);
hold on;histogram(mitogVolumes,40);
xlabel('μm^3');
ylabel('n');
legend({'nucleus','cell'});
 
figure;histogram(nucleusVolumes./cytoVolumes,30);
set(gca,'FontSize',20);
ylabel('n');
xlabel('N/C ratio');

%%
figure;histogram(r_vol(1:5842),100,'FaceColor','cyan','FaceAlpha',0.6,'EdgeAlpha',0.3);
hold on;histogram(g_vol(1:5842),120,'FaceColor','magenta','FaceAlpha',0.6,'EdgeAlpha',0.3);
xlabel('Vol. (μm^3)');
ylabel('cell count');
xlim([0 10000]);
ylim([0 800]);
set(gca,'FontSize',20);
legend({'MitoR','MitoG'});
saveas(gcf,'jk_mix_vol.tif');
saveas(gcf,'jk_mix_vol.emf');
save('vol.mat','r_vol','g_vol');

median(r_vol(1:5842))*1.6^3 %1123.5
median(g_vol(1:5842))*1.6^3 %1172.4

load('I:\IFC-16X\20240624_jk_fuse\reconstruction\Util\overlap_ratio_tol_new2.mat')
median(overlap_ratio_tol(1:6209,4))*1.6^3

overlap_ratio_tol_fuse
figure;
boxchart([r_vol(1:6209)*1.6^3,g_vol(1:6209)*1.6^3,overlap_ratio_tol_fuse(1:6209,4)*1.6^3],'MarkerStyle','none');
ylim([0 30000])
set(gca,'FontSize',20);
ylabel('Vol.(μm^3)');
saveas(gcf,'boxchart_vol3.tif');
saveas(gcf,'boxchart_vol3.emf');

load('1-100_seg4.mat')
mean(r_vol.*1.6^3)
mean(g_vol.*1.6^3)
mean(NonOverlp_vol_tol*1.6^3)       % 1117.4
x = overlap_ratio_tol(:,4);
x_norepeat = x([true; diff(x) ~= 0]);  % Keep only non-consecutive repeats
mean_value = mean(x_norepeat * 1.6^3) % 3873.6

figure;
boxplot([r_vol.*1.6^3; g_vol.*1.6^3; NonOverlp_vol_tol*1.6^3; overlap_ratio_tol(:,4)*1.6^3], ...
    [repmat({'Ctrl.-R'}, length(r_vol), 1); repmat({'Ctrl.-G'}, length(g_vol), 1) ...
    ; repmat({'Exp.-nonfuse'}, length(NonOverlp_vol_tol), 1); repmat({'Exp.-fuse'}, length(overlap_ratio_tol(:,4)), 1)],'Symbol', '');
ylim([0 30000])
set(gca,'FontSize',20);
ylabel('Cell Volume (μm^3)');
saveas(gcf,'boxchart_vol_4Group.tif');
saveas(gcf,'boxchart_vol_4Group.emf');

%%
figure;
h = histogram(overlap_ratio_tol(:,3),20,'FaceAlpha',0.3,'EdgeAlpha',0.3);
xlabel('overlap ratio');
ylabel('n');
set(gca,'FontSize',20);
hold on;
contourhist(h,'linewidth',5);
hold off;
xlim([0 0.8]);
ylim([0 600]);
box off;
saveas(gcf,'jk_mix_countour.tif');
saveas(gcf,'jk_mix_countour.emf');

mean(overlap_ratio_tol(:,3)) %ctrl 0.0285, exp 0.4017
std(overlap_ratio_tol(:,3))  %ctrl 0.0368, exp 0.1117

% load('overlap_ratio_tol_new.mat');
load('overlap_ratio_tol_mix_new2.mat')
overlap_ratio_tol_mix = overlap_ratio_tol;
c = ksdensity([overlap_ratio_tol_mix(:,3), overlap_ratio_tol_mix(:,5)], ...
              [overlap_ratio_tol_mix(:,3), overlap_ratio_tol_mix(:,5)]);
y1 = overlap_ratio_tol_mix(:,5) / 1000 * 1.6^3;
% load('overlap_ratio_tol_fuse2.mat');
load('overlap_ratio_tol_fuse_new2.mat')
d = ksdensity([overlap_ratio_tol(:,3), overlap_ratio_tol(:,5)], ...
              [overlap_ratio_tol(:,3), overlap_ratio_tol(:,5)]);
y2 = overlap_ratio_tol(:,5) / 1000 * 1.6^3;
mean(overlap_ratio_tol_mix(:,3)) % 0.0371
% std(overlap_ratio_tol_mix(:,3))  % 0.0381
median(overlap_ratio_tol_mix(:,3)) % 0.0231
mean(overlap_ratio_tol(:,3)) % 0.4020
% std(overlap_ratio_tol(:,3)) % 0.1101
median(overlap_ratio_tol(:,3)) % 0.4139

figure;
ax2 = axes;
scatter(ax2, overlap_ratio_tol(:,3), y2, 5, d, 'filled');
colormap(ax2, 'cool');
ylim(ax2, [0 8]);
ax1 = axes; 
scatter(ax1, overlap_ratio_tol_mix(:,3), y1, 5, c, 'filled');
colormap(ax1, (autumn));
set(ax1, 'FontSize', 20);
xlabel(ax1, 'Overlap Ratio');
ylabel(ax1, 'Overlap Volume (μm^3) ×1000');
ylim(ax1, [0 8]);
set(ax1, 'Color', 'none', 'FontSize', 20, 'XColor', 'none', 'YColor', 'none');
set(ax2, 'Position', get(ax1, 'Position'));
linkaxes([ax1, ax2]);
set(gca,'FontSize',20);
xlabel('overlap ratio');
ylabel('overlap vol.(μm^3) *1000');
ylim([0 8]);
saveas(gcf,'scatplot_overlp_mixed_fuse.tif');
saveas(gcf,'scatplot_overlp_mixed_fuse.emf');

saveas(gcf,'scatplot_overlp_mixed2.tif');
saveas(gcf,'scatplot_overlp_mixed2.emf');

figure;histogram(n_vol./c_vol,100);
set(gca,'FontSize',20);
ylabel('n');
xlabel('N/C ratio');

%%
overlap_ratio_tol = [];
maxCorr_tol = [];
overlap_tol = [];
for idxt = 1:100
    Path_L554_Index  = num2str((idxt-1)*10+1,'%05d')
    Data_02_formDt = '.mat';
    Path_s485_FLFLsp = ['I:\IFC-16X\20240625_jk_mix\reconstruction\5FLFVid_5exprec240627_0129' ...
        '\FLF_016XNA0.80La525nm_ft300mmfe200mm_MLAS1300P3300f23.0_P6.5umRF2DN1SPD4103It6Pw1_8_FLFLsp'];

    load([Path_s485_FLFLsp,'R',Path_L554_Index,Data_02_formDt],'FLFRec_86_FlpNo1');
    load([Path_s485_FLFLsp,'G',Path_L554_Index,Data_02_formDt],'FLFRec_86_FlpNo2');

    FLFRec_88cFlpRe10 = imresize(gather(FLFRec_86_FlpNo1),16/14.4);
    FLFRec_88cFlpRe20 = imresize(gather(FLFRec_86_FlpNo2),16/14.4);
    % RecFLF_89_MIP3Dt0 = FLFRec_88_MIPco10+FLFRec_88_MIPco20;
    % figure,imshow(U65_Imshow_B16_MIP_3D_ColAdj(FLFRec_88cFlpRe10,031,1.2)+U65_Imshow_B16_MIP_3D_ColAdj(FLFRec_88cFlpRe20,032,1.3));
    
    FLFRec_88cFlpRe1 = FLFRec_88cFlpRe10(273+(-68:68),1:400,:);
    FLFRec_88cFlpRe2 = FLFRec_88cFlpRe20(273+(-68:68),1:400,:);

    load(['I:\IFC-16X\20240625_jk_mix\reconstruction\Util\segmentation4\', ...
        num2str(Path_L554_Index,'%05d'),'.mat']);
    overlap_ratios = [];
    corrMap = [];
    unionVolume = (newLabelImage > 0) | (newLabelImage2 > 0);
    unionVolume_s = imopen(unionVolume,strel('sphere',1));
    % figure;imshow(U65_Imshow_B16_MIP_3D_Col(unionVolume_s,011,1));
    [unionLabels, numClusters] = bwlabeln(unionVolume_s,6);
    % figure;imshow(U65_Imshow_B16_MIP_3D_Col(unionVolume,011,1));
    maxCorr = zeros(numClusters,1);
    overlap = zeros(numClusters,1);

    for clusterIdx = 1:numClusters
        % Extract the current cluster
        currentCluster = (unionLabels == clusterIdx);
        % figure;imshow(U65_Imshow_B16_MIP_3D_Col(currentCluster,011,1));

        labels1 = unique(newLabelImage(currentCluster & newLabelImage > 0));
        labels1(labels1 == 0) = []; % Remove background label

        labels2 = unique(newLabelImage2(currentCluster & newLabelImage2 > 0));
        labels2(labels2 == 0) = []; % Remove background label

        % Only process clusters where both channels have at least one component
        if ~isempty(labels1) && ~isempty(labels2)
            % Compute the intersection and union volumes for the current cluster
            intersectionVolume = currentCluster & (newLabelImage > 0) & (newLabelImage2 > 0);
            unionVolumeSize = sum(currentCluster(:)); % Total volume of the cluster
            intersectionVolumeSize = sum(intersectionVolume(:)); % Intersection volume size
            % figure;imshow(U65_Imshow_B16_MIP_3D_Col(intersectionVolume,011,1));

            if intersectionVolumeSize <= 2
                disp('no overlap');
                continue
            end

%             crop = regionprops3(intersectionVolumeSize, 'BoundingBox').BoundingBox(1,:);
%             [x1,y1,z1,dx,dy,dz] = deal(crop(2), crop(1), crop(3), crop(5), crop(4), crop(6));
%             [x2,y2,z2] = deal(x1+dx-1, y1+dy-1, z1+dz-1);
            [x, y, z] = ind2sub(size(currentCluster), find(currentCluster));
            x1 = min(x); x2 = max(x);
            y1 = min(y); y2 = max(y);
            z1 = min(z); z2 = max(z);
            if (x2-x1)*(y2-y1)*(z2-z1) == 0
                disp('no overlap');
                continue
            end                
            M = currentCluster(x1:x2, y1:y2, z1:z2);
            A = FLFRec_88cFlpRe1(x1:x2, y1:y2, z1:z2) .* M;
            B = FLFRec_88cFlpRe2(x1:x2, y1:y2, z1:z2) .* M;
            corrMap = real(normxcorr3(rescale(A), rescale(B)));
            maxCorr(clusterIdx) = max(corrMap(:));
            overlap(clusterIdx) = intersectionVolumeSize / unionVolumeSize;
            % figure;imshow(U65_Imshow_B16_MIP_3D_Col(M,032,1));

            % figure;imshow(U65_Imshow_B16_MIP_3D_Col(corrMap,011,1));
            % figure;imshow(U65_Imshow_B16_MIP_3D_Col(Cluster1.*(FLFRec_88cFlpRe1),031,1));
            % figure;imshow(U65_Imshow_B16_MIP_3D_Col(A,031,1));
            % figure;imshow(U65_Imshow_B16_MIP_3D_Col(B,031,1));
            
            % Record information for each pair of labels from both channels
            for i = 1:length(labels1)
                for j = 1:length(labels2)
                    overlap_ratios = [overlap_ratios; ...
                        labels1(i), labels2(j), ...
                        intersectionVolumeSize / unionVolumeSize, ...
                        unionVolumeSize, intersectionVolumeSize];
                end
            end
        end
    end
    overlap_ratio_tol = [overlap_ratio_tol; overlap_ratios];
    maxCorr_tol = [maxCorr_tol; maxCorr];   
    overlap_tol = [overlap_tol; overlap];
%     save(['I:\IFC-16X\20240625_jk_mix\reconstruction\Util\segmentation4\',num2str(Path_L554_Index),'.mat'], ...
%     'maxCorr','corrMap','-append');
end
save('overlap_ratio_tol_mix_inter_sim.mat','overlap_ratio_tol', 'maxCorr_tol', 'overlap_tol');
save('overlap_ratio_tol_mix_inter_sim.mat','overlap_ratio_tol', 'maxCorr_tol', 'overlap_tol');

save('overlap_ratio_tol_mix_new2.mat','overlap_ratio_tol');
save('overlap_ratio_tol_mix_new2.mat','maxCorr_tol', '-append');
save('overlap_ratio_tol_mix_new2.mat','overlap_tol', '-append');

figure;
histogram(maxCorr_tol);
maxCorr_tol_nz = maxCorr_tol((maxCorr_tol>0)&(maxCorr_tol<1));
figure;
histogram(maxCorr_tol_nz);
xlim([0 1]);

% load('overlap_ratio_tol_mix_new.mat')
% load('overlap_ratio_tol_mix_inter_sim.mat')
load('overlap_ratio_tol_mix_new2.mat')
mean(maxCorr_tol(maxCorr_tol>0)) % 0.6843 % 0.6920
std(maxCorr_tol(maxCorr_tol>0))  % 0.1172
figure;
scatter(overlap_tol(maxCorr_tol>0&(maxCorr_tol<1)),maxCorr_tol(maxCorr_tol>0&(maxCorr_tol<1)),5,[0.529, 0.808, 0.980],'filled');
% load('overlap_ratio_tol_new3.mat');
% load('overlap_ratio_tol_fuse_inter_sim.mat')
load('overlap_ratio_tol_fuse_new2.mat')
maxCorr_tol_fuse = maxCorr_tol;
overlap_tol_fuse = overlap_tol;
mean(maxCorr_tol_fuse(maxCorr_tol_fuse>0)) % 0.7637 % 0.7636
std(maxCorr_tol_fuse(maxCorr_tol_fuse>0))  % 0.08
hold on;
scatter(overlap_tol_fuse(maxCorr_tol_fuse>0),maxCorr_tol_fuse(maxCorr_tol_fuse>0),5,[1.000, 0.600, 0.200],'filled');
colormap(jet);
ylabel('Pearson Correlation');
xlabel('Intersection-over-union');
set(gca,'FontSize',20);
saveas(gcf,'Pearson.tif');
saveas(gcf,'Pearson.emf');

lightBlue  = [0.529, 0.808, 0.980];  % Light Sky Blue
lightOrange = [1.000, 0.600, 0.200]; % Light Orange

%%
r_d = [];
g_d = [];
r_vol = [];
g_vol = [];
r_int = [];
g_int = [];
r_vx = [];
g_vx = [];
for idxt = 1:100
    Path_L554_Index  = num2str((idxt-1)*10+1,'%05d')
    load(['I:\IFC-16X\20240625_jk_mix\reconstruction\Util\segmentation4\', ...
        num2str(Path_L554_Index,'%05d'),'.mat']);
    r_d = [r_d; cellStats_r0.EquivDiameter];
    g_d = [g_d; cellStats_g0.EquivDiameter];
    r_vol = [r_vol; cellStats_r0.Volume];
    g_vol = [g_vol; cellStats_g0.Volume];
    r_int = [r_int; cellStats_r0.MeanIntensity];
    g_int = [g_int; cellStats_g0.MeanIntensity];
    r_vx = [r_vx; cellStats_r0.VoxelValues];
    g_vx = [g_vx; cellStats_g0.VoxelValues];
    Path_L554_Index
end   
save('1-100_seg4.mat','r_d','g_d','r_vol','g_vol','r_int','g_int','r_vx','g_vx');

mean(r_d*1.6)
mean(g_d*1.6)
mean(r_vol)
mean(g_vol)
figure;histogram(r_vol,100);
hold on;histogram(g_vol,100);

figure;histogram(r_d*1.6);
xlabel('Diameter(μm)');
ylabel('Count');
set(gca,'FontSize',20);
saveas(gcf,'r_dia.tif');
saveas(gcf,'r_dia.emf');

figure;histogram(g_d*1.6);
xlabel('Diameter(μm)');
ylabel('Count');
set(gca,'FontSize',20);
saveas(gcf,'g_dia.tif');
saveas(gcf,'g_dia.emf');

r_vol = r_vol*1.6^3;
g_vol = g_vol*1.6^3;

c = ksdensity([r_vol,cellfun(@sum,r_vx)],[r_vol,cellfun(@sum,r_vx)]);
figure;scatter(r_vol,cellfun(@sum,r_vx),5,c,'filled');
colormap(flipud(autumn));
p = polyfit(r_vol, cellfun(@sum,r_vx), 1); % Fit a first-degree polynomial (line)
colormap('autumn');
xFit = linspace(min(r_vol), 800*1.6^3, 100); % X values for the line
yFit = polyval(p, xFit); % Corresponding Y values based on the fit
hold on; % Keep the scatter plot
plot(xFit, yFit, 'k--', 'LineWidth', 1); % Plot the fitted line in black
xlabel('Volume');
ylabel('Intensities');
ylim([0,5e6]);
xlim([0 3000]);
set(gca,'FontSize',20);
saveas(gcf,'r_vol_int-2.tif');
saveas(gcf,'r_vol_int-2.emf');

% hold on;
c = ksdensity([g_vol,cellfun(@sum,g_vx)],[g_vol,cellfun(@sum,g_vx)]);
figure;
scatter(g_vol,cellfun(@sum,g_vx),5,c,'filled');
colormap(flipud(summer));
p = polyfit(g_vol, cellfun(@sum, g_vx), 1); % Fit a first-degree polynomial (line)
xFit = linspace(min(g_vol), 900*1.6^3, 100); % X values for the line
yFit = polyval(p, xFit); % Corresponding Y values based on the fit
hold on; % Keep the scatter plot
plot(xFit, yFit, 'k--', 'LineWidth', 1); % Plot the fitted line in black
xlabel('Volume');
ylabel('Intensities');
ylim([0,5e6]);
xlim([0 3000]);
set(gca,'FontSize',20);
saveas(gcf,'g_vol_int-2.tif');
saveas(gcf,'g_vol_int-2.emf');

% exclude = and(and(n_vol <= c_vol * 0.99, n_vol <= 4000), c_vol <= 8000);
% n_vol0 = n_vol(exclude);
% c_vol0 = c_vol(exclude);
% n_int0 = n_int(exclude);
% c_int0 = c_int(exclude);
% n_d0 = n_d(exclude);
% c_d0 = c_d(exclude);
