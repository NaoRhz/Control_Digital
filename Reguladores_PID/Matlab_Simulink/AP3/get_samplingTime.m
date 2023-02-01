function [T] = get_samplingTime(tr, dampingFactor)
%% Sampling time calculationing
    % First method
    % Sampling time:
    T1=tr/10;    
    
    % Second method
    % ζ = dampingFactor
    % tr = establishment time

    % sigma = σ
    sigma = 4/tr;   
    % wn = parte real del polo (Hz), y fctAmortg = ζ
    wn = sigma/dampingFactor;                               
    % wd = parte imaginaria del polo (Hz)
    wd=wn*sqrt(1-((dampingFactor)^2));    
    % Sampling time:
    T2=pi/(5*wd);  

    % The optimal sampling time
    T=min(T1, T2);
end