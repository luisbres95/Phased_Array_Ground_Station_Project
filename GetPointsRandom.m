function [X, Y, D] = GetPointsRandom(nWant, XWidth, YWidth, MinDist)
X       = zeros(1,nWant);
Y       = zeros(1,nWant);
dist_2  = MinDist ^ 2;      % Squared once instead of SQRT each time
iLoop   = 1;                % Security break to yoid infinite loop
nValid  = 0;
while nValid < nWant && iLoop < 1e6
  newX = XWidth * rand;
  newY = YWidth * rand;
  if all(((X(1:nValid) - newX).^2 + (Y(1:nValid) - newY).^2) >= dist_2)
    % Success: The new point does not touch existing points:
    nValid    = nValid + 1;  % Append this point
    X(nValid) = newX;
    Y(nValid) = newY;
  end
  iLoop = iLoop + 1;
end
% Throw an error, if the area is filled too densely:
if nValid < nWant
  error('Cannot find wanted number of points in %d iterations.', iLoop)
end
if nargout > 2
  % D = pdist([X, Y]);   % Faster with statistics toolbox
  D = sqrt(bsxfun(@minus, X, X.') .^ 2 + bsxfun(@minus, Y, Y.') .^ 2);
end
end
