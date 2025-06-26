% contourhist
% Draw a histogram contour using the histogram object information (from Matlab's "histogram" function)
% 
% Syntax
% contourhist(h)
% contourhist(h, Name, Value)
% hc = contourhist(___)
% 
% Description
% contourhist(h) creates a histogram contour based on the histogram object information (h) after using "histogram" function.
% contourhist(h, Name, Value) specifies additional options through Name,Value pair arguments. 
%                             For example, you can specify 'Color' and a scalar to change the contour's color,
%                             or 'LineWidth' and a scalar to change the contour's width.
% hc = contourhist(___) returns a column vector of chart line objects. Use hc to modify properties. For a list of properties, see Chart Line Properties.
%
%
% Example
% 
% A1 = randn(1,10^4);
% h  = histogram(A1);
% h.NumBins = 24;
% 
% hold on
% hc = contourhist(h, 'Color', [1 0 0], 'LineWidth', 6);
% hold off
%
% Author: Javier Lopez-Calderon
% Manhattan, New York City
% April 2016

function hc = contourhist(h, varargin)
    % Input parser setup
    p = inputParser;
    p.FunctionName  = mfilename;
    p.CaseSensitive = false;
    p.addRequired('h');
    p.addParameter('Color', 'b');
    p.addParameter('LineWidth', 4, @isnumeric);
    p.parse(h, varargin{:});
    lcolor =  p.Results.Color;
    lwidth =  p.Results.LineWidth;

    % Increase resolution for smooth contour
    N = 100 * h.NumBins;
    x1 = h.BinEdges(1:end-1) + h.BinWidth / 2;  % Use bin centers
    x2 = linspace(h.BinEdges(1), h.BinEdges(end), N);

    % Interpolate using spline for smooth curve
    y2 = interp1(x1, h.Values, x2, 'spline');

    % Plot the smoothed contour
    hc = plot(x2, y2, 'Color', lcolor, 'LineWidth', lwidth);
%     hold on;
%     bar(h.BinEdges(1:end-1) + h.BinWidth / 2, h.Values, 'FaceAlpha', 0.3, 'EdgeColor', 'none');
%     hold off;
end