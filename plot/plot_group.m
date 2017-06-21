function h = plot_group(S,F,F_hat,rhos,ks,k,midx,h)
% Auxiliary plotting function for group_demo
%
% See also GROUP_DEMO.
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
title('S (median subj.)');
xlabel('region');
ylabel('region');

subplot(2,2,2);
plot(ks(1):k,mean(rhos),'o-k','Linewidth',2);
set(gca,'XTick',ks);
hold on;
plot(ks(1):k,mean(rhos) + std(rhos),'o:b','Linewidth',2);
plot(ks(1):k,mean(rhos) - std(rhos),'o:r','Linewidth',2);
grid on;
ylim([0 1.05]);
xlim([ks(1) ks(end)]);
set(gca,'XTick',ks(1):k);
legend({'mean','mean+std','mean-std'},'location','southeast');
xlabel('max walk length, k');
ylabel('Functional correlation quality');

subplot(2,2,3);
imagesc(F);
title('F (median subj.)');
xlabel('region');
ylabel('region');

subplot(2,2,4);
imagesc(F_hat);
title('Approx. F (median subj.)');
xlabel('region');
ylabel('region');

rhosk = smcorr(F,F_hat);

ha = findall(gcf,'Tag','scribeOverlay');
if ~isempty(ha)
    ha.delete();
end

stitstr = 'Group Spectral Mapping';

annotation(gcf,'textbox',[0 0 1 1],'String',stitstr, ...
    'Fontsize',13,'LineStyle','none', ...
    'HorizontalAlignment','center','VerticalAlignment','top','Interpreter', 'none');

utitstr = sprintf('k = %d, median subj. id = %d,  off-diag correlation = %1.3f',k,midx,rhosk);

annotation(gcf,'textbox',[0 0 1 1],'String',utitstr, ...
    'Fontsize',13,'LineStyle','none', ...
    'HorizontalAlignment','center','VerticalAlignment','bottom','Interpreter', 'none');

drawnow;

end