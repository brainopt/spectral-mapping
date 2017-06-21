function h = plot_individual(S,F,F_hat,rhos,k,ks,sidx,h)
% Auxiliary plotting function for individual_demo
%
% See also INDIVIDUAL_DEMO.
%
% Author: Cassiano Becker, June 2017
%
% ---- BEGIN CODE ----

if isempty(h)
    h = figure();
    set(h,'WindowStyle','normal');
    set(h, 'Position', [0 0 800 800]);
end

subplot(2,2,1);
imagesc(S)
title('S');
xlabel('region');
ylabel('region');

subplot(2,2,2);
plot(ks(1):k, rhos,'-o','LineWidth',2);
set(gca,'XTick',ks(1):k);
grid on;
title('Approximation')
xlabel('max walk length');
ylabel('matrix correlation quality');
ylim([0 1.05]);
xlim([ks(1) ks(end)]);

subplot(2,2,3);
imagesc(F);
title('F');
xlabel('region');
ylabel('region');

subplot(2,2,4);
imagesc(F_hat);
title('Approx. F');
xlabel('region');
ylabel('region');

ha = findall(gcf,'Tag','scribeOverlay');
if ~isempty(ha)
    ha.delete();
end

stitstr = 'Individual Spectral Mapping';

annotation(gcf,'textbox',[0 0 1 1],'String',stitstr, ...
    'Fontsize',13,'LineStyle','none', ...
    'HorizontalAlignment','center','VerticalAlignment','top','Interpreter', 'none');

utitstr = sprintf('k = %d, subject id = %d,  correlation = %1.3f',k,sidx,rhos(end));

annotation(gcf,'textbox',[0 0 1 1],'String',utitstr, ...
    'Fontsize',13,'LineStyle','none', ...
    'HorizontalAlignment','center','VerticalAlignment','bottom','Interpreter', 'none');

pause(1);
    
end