function coords = pseudo_array()
coords = [ ];

n = 20;

radius=3;

low_bound=-8;

upper_bound=8;

coord=unifrnd(low_bound,upper_bound,[2 1]);
% unifrnd
% coords=[coords, coord]
coords=horzcat(coords,coord);
counter=1;

loops=0;

while counter<n
    flag=true;
    coord=unifrnd(low_bound,upper_bound,[2 1]);
    
    for i=1:range(counter)
        distance=sqrt( (coord(1)-coords(1,i)).^2 + (coord(2)-coords(2,i)).^2 );
        if all(distance<radius)
            flag=False;
            coord=unifrnd(low_bound,upper_bound,[2 1]);
            loops=loops+1;
            break
        end
        if all(distance >= radius)
            continue
        end   
    end
    if flag == true
        counter=counter+1;
        coords=horzcat(coords,coord);
    end
end






end

