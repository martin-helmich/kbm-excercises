%% ADAPTIVE GRADIENT DESCENT
%%
%% Martin Helmich <martin.helmich@hs-osnabrueck.de>
%% University of Applied Sciences Osnabrück
%%
%% This work is licensed under the Creative Commons Attribution-ShareAlike 3.0
%% Unported License. To view a copy of this license, visit
%%
%%   http://creativecommons.org/licenses/by-sa/3.0/


%% USAGE: [minimum, history] = find_minimum(@(x1,x2) x1^2*x2^2, [0 0]);
%%
%% This method searches a function's minimum using an adaptive gradient descent
%% algorith.
function[minimum, history] = find_minimum(
    func,                    % The function for which to find a minimum.
    start           = [0 0], % The starting location.
    max_iterations  = 1000,  % The maximum iteration count.
    adapt_initial   = 0.001, % The initial adaption rate.
    adapt_success   = 1.05,  % Adaption factor for successful steps.
    adapt_failure   = 0.5,   % Adaption fector for unsuccessful steps.
    break_threshold = 0.01   % Break when f(x1,x2) decreases by less then this.
)

    d  = adapt_initial;  % Initial adaption rate.
    y0 = inf;            % Previous y value (initially +inf).
    i  = 0;              % Loop counter.

    history = [];        % History of all steps (useful for plotting)
    x       = start;     % Initial state

    while i < max_iterations
        history = [history ; x];    % Keep records of all iteration steps so
                                    % they can be plotted later.
        [y, yg] = func(x(1), x(2)); % func() needs to return function value and
                                    % gradient!
    
        x = x - d * yg';
    
        if y0 > y
            d = d * adapt_success;
        elseif y0 < y
            d = d * adapt_failure;
        endif
    
        if abs(y0 - y) < break_threshold
            fprintf('Aborted gradient descent after %d iterations.\n', i);
            break
        endif
    
        y0 = y;
        i  = i + 1;
    endwhile

    minimum = [x(1) x(2) y];
endfunction
