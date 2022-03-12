function SideLobe = mcmc_opt()


data_pseudoarray;
% [x,y]=GetPointsRandom(20,16,16,3);
% elempos=[x;y; zeros(1,20)]
elempos12 =[
    5.0784   12.2231   13.3447    1.6279    5.9264    8.2461    2.0824    2.7713    8.9341   10.5852   13.3256    0.7313    3.9616   15.7797    7.5103   14.2584   10.4380   15.1746    8.8990    5.1135
    2.1918    2.7741    7.8771    5.8357   15.1257    7.4675   11.3621   15.2800    4.1732    9.9463   13.2679    1.7294    8.8130    5.5753   12.1615    0.0628   15.0235   10.4767    0.8123    5.7293
         0         0         0         0         0         0         0         0         0         0         0         0         0         0         0         0         0         0         0         0];
%SL=12.169322635513822 dBi
elempos=[elempos12(1,:)-0.1+(0.1+0.1)*rand(1,20);...
    elempos12(2,:)-0.1+(0.1+0.1)*rand(1,20);elempos12(3,:)]
arbitrary = phased.ConformalArray(...
'ElementPosition', elempos,...
'ElementNormal', [0;90] ,...
'Element',ant);
V=pattern(arbitrary,fc,[-180:10:180],[-90:1:90],'PropagationSpeed',c, ...
'CoordinateSystem','polar','Type','directivity');
SideLobe= findpeaks(V(:,19),'NPeaks',1,'SortStr','descend')
% MainLobe(i) = max(V(:,19,i));


end