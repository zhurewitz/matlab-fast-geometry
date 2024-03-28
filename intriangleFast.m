%% IN TRIANGLE FAST
% Copyright (C) 2024 Zel Hurewitz
% SPDX-License-Identifier: GPL-3.0-or-later
% Determine if a set of points (X,Y) are inside a set of triangles (TX,TY)

function IN= intriangleFast(X,Y,TX,TY)

arguments
    X (1,:)
    Y (1,:)
    TX (:,3)
    TY (:,3)
end

Npoints= length(X);

X= reshape(X,1,1,Npoints);
Y= reshape(Y,1,1,Npoints);

ABOVE= TY > Y; 

% Crossings from above to below line (or reverse)
CROSS= xor(ABOVE, circshift(ABOVE,-1,2)); 

VX2= circshift(TX,-1,2);
VY2= circshift(TY,-1,2);

% X-position of line cross
Xcross= TX+ (VX2-TX).*(Y- TY)./(VY2- TY);

% If number of crossings is odd, inside triangle
IN= mod(sum(CROSS & Xcross < X,2),2) == 1;

IN= reshape(IN,[],Npoints);

end