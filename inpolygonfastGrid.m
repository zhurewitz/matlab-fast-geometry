%% INPOLYGON FAST for a Grid
% Copyright (C) 2024 Zel Hurewitz
% SPDX-License-Identifier: GPL-3.0-or-later

function IN= inpolygonfastGrid(GX,GY,VX,VY)

arguments
    GX (:,1)
    GY (:,1)
    VX (:,1)
    VY (:,1)
end

[X,Y]= meshgrid(GX,GY);

X= X';
Y= Y';

SIZE= size(X);

x= X(:);
y= Y(:);

IN= inpolygonfast(x,y,VX,VY);

IN= reshape(IN,SIZE)';

end



