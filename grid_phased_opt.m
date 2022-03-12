function [SideLobe,x,y] = grid_phased_opt(a)

data_pseudoarray;
d=3;
dd=4.5;
for i=1:1:a
    

    [x1(:,:,i),y1(:,:,i)]=GetPointsRandom(1,d,d,3);
    [x2(:,:,i),y2(:,:,i)]=GetPointsRandom(1,d,d,3);
    [x3(:,:,i),y3(:,:,i)]=GetPointsRandom(1,d,d,3);
    [x4(:,:,i),y4(:,:,i)]=GetPointsRandom(1,d,d,3);
    [x5(:,:,i),y5(:,:,i)]=GetPointsRandom(1,d,d,3);
    [x6(:,:,i),y6(:,:,i)]=GetPointsRandom(1,d,d,3);
    [x7(:,:,i),y7(:,:,i)]=GetPointsRandom(1,d,d,3);
    [x8(:,:,i),y8(:,:,i)]=GetPointsRandom(1,d,d,3);
    [x9(:,:,i),y9(:,:,i)]=GetPointsRandom(1,d,d,3);
    [x10(:,:,i),y10(:,:,i)]=GetPointsRandom(1,d,d,3);
    [x11(:,:,i),y11(:,:,i)]=GetPointsRandom(1,d,d,3);
    [x12(:,:,i),y12(:,:,i)]=GetPointsRandom(1,d,d,3);
    [x13(:,:,i),y13(:,:,i)]=GetPointsRandom(1,d,d,3);
    [x14(:,:,i),y14(:,:,i)]=GetPointsRandom(1,d,d,3);
    [x15(:,:,i),y15(:,:,i)]=GetPointsRandom(1,d,d,3);
    [x16(:,:,i),y16(:,:,i)]=GetPointsRandom(1,d,d,3);
    [x17(:,:,i),y17(:,:,i)]=GetPointsRandom(1,d,d,3);
    [x18(:,:,i),y18(:,:,i)]=GetPointsRandom(1,d,d,3);
    [x19(:,:,i),y19(:,:,i)]=GetPointsRandom(1,d,d,3);
    [x20(:,:,i),y20(:,:,i)]=GetPointsRandom(1,d,d,3);
    dx=dd.*[0,2,3,4,0,2,3,4,0,2,3,4,0,2,3,4,0,2,3,4];
    dy=dd.*[0,0,0,0,2,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5];
    x(:,:,i)=[x1(:,:,i),x2(:,:,i),x3(:,:,i),x4(:,:,i),x5(:,:,i),x6(:,:,i),x7(:,:,i),...
        x8(:,:,i),x9(:,:,i),x10(:,:,i),x11(:,:,i),x12(:,:,i),x13(:,:,i),x14(:,:,i),x15(:,:,i),x16(:,:,i),...
        x17(:,:,i),x18(:,:,i),x19(:,:,i),x20(:,:,i)];
    y(:,:,i)=[y1(:,:,i),y2(:,:,i),y3(:,:,i),y4(:,:,i),y5(:,:,i),y6(:,:,i),y7(:,:,i),y8(:,:,i),y9(:,:,i),y10(:,:,i),...
        y11(:,:,i),y12(:,:,i),y13(:,:,i),y14(:,:,i),y15(:,:,i),y16(:,:,i),y17(:,:,i),y18(:,:,i),y19(:,:,i),y20(:,:,i)];
    elempos(:,:,i)=[x(:,:,i)+dx;y(:,:,i)+dy; 0 0 0 0 0 0 0 0 0 0 0 0 ...
    0 0 0 0 0 0 0 0];
    arbitrary = phased.ConformalArray(...
    'ElementPosition', elempos(:,:,i),...
    'ElementNormal', [0;90] ,...
    'Element',ant);
    V(:,:,i)=pattern(arbitrary,fc,[-180:10:180],[-90:1:90],'PropagationSpeed',c, ...
    'CoordinateSystem','polar','Type','directivity');
    SideLobe(i)= findpeaks(V(:,19,i),'NPeaks',1,'SortStr','descend');
    MainLobe(i) = max(V(:,19,i));
%     MLR(i)=MainLobe(i)-SideLobe(i);
    i=i+1

end
elempos
figure
M=bar(MainLobe);

title('Main Lobe distribution | No cutoff')
xlabel('Trial #')
ylabel('Magnitude')
for i=1:length(MainLobe)
    xtips1 = M(1).XEndPoints(i);
    ytips1 = M(1).YEndPoints(i);
    labels1 ="  "+MainLobe(i);
    h1=text(xtips1,ytips1,labels1,'HorizontalAlignment','left',...
        'VerticalAlignment','middle');
    set(h1,'Rotation',90);
end



figure
S=bar(SideLobe);


title('Side Lobe Distribution | No cutoff')
xlabel('Trial #')
ylabel('Magnitude')
for i=1:length(SideLobe)
    xtips2 = S(1).XEndPoints(i);
    ytips2 = S(1).YEndPoints(i);
    labels2 ="  "+SideLobe(i);
    h2=text(xtips2,ytips2,labels2,'HorizontalAlignment','left',...
        'VerticalAlignment','middle');
    set(h2,'Rotation',90);
end



% figure
% MS=bar(MLR);
% 
% title('Main Lobe to Side Lobe Ratio Distribution | No cutoff')
% xlabel('Trial #')
% ylabel('Magnitude')
% for i=1:length(MLR)
%     xtips3 = MS(1).XEndPoints(i);
%     ytips3 = MS(1).YEndPoints(i);
%     labels3 ="  "+MLR(i);
%     h3=text(xtips3,ytips3,labels3,'HorizontalAlignment','left',...
%         'VerticalAlignment','middle');
%     set(h3,'Rotation',90);
% end

end