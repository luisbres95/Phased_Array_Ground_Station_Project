function [SideLobe,x,y] = phased_opt1(a)

data_pseudoarray;
for i=1:1:a
    [x(:,:,i),y(:,:,i)]=GetPointsRandom(20,16,16,3);
    elempos(:,:,i)=[x(:,:,i);y(:,:,i); 0 0 0 0 0 0 0 0 0 0 0 0 ...
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
ylim([26 26.3])
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
ylim([0 25])

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