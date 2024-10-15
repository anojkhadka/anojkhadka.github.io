
close all;
x1 = [[-6 -2],[-2 2],[2 6]];
y1 = [[-2, 2],[-2 2], [-2 2]];
m = 1;
f_x = 0;
x2 = linspace(-6,6);

while m< 126
        f_x = f_x + (4/(m*pi))*((-1)^(m+1))*sin((m*pi*x2)/2);   
        
        if m == 1
            val1 = f_x;
        elseif m == 5
            val2 = f_x;
        elseif m == 25
            val3 = f_x;
        elseif m == 125
            val4 = f_x;
        end
        m = m + 1;
end

fourier_values = [val1; val2; val3; val4];
fig = figure('Position',[600 100 1500 1000]);

for ind1 = 1:4
   
    exponent = 5^(ind1 - 1);
    yval = fourier_values(ind1,:);
    plot(x1,y1, Color='blue',LineWidth= 4)
    xlabel('X', 'FontSize',14, 'FontWeight','bold')
    ylabel('f(x)', 'FontSize',14, 'FontWeight','bold')
    % ylim([-3 3]);
    hold on
    plot(x2, yval, Color='red', LineWidth= 4)
    text(-6, 2.5,"Fourier series approximation with" + " " + num2str(exponent) + " " + "terms", FontSize=24, Color="#FF00FF")
    ax = gca;
    ax.XAxisLocation = 'origin';
    ax.YAxisLocation = 'origin';
    ax.GridAlpha = 1;
    ax.XGrid = 'on';
    ax.GridLineStyle = "-.";
    ax.XAxis.FontSize = 20;
    ax.YAxis.FontSize = 20;
    ax.XAxis.FontWeight = 'bold';
    ax.YAxis.FontWeight = 'bold';
    ax.YLim = [-3 3];
    ax.XLim = [-6.5 6.5];
    drawnow
    frame = getframe(fig);
    im{ind1} = frame2im(frame);
    cla

end


fouriermodelling = "FourierModelling.gif";

for ind2 = 1:4
    [f, map] = rgb2ind(im{ind2}, 256);

    if ind2 ==1 
        imwrite(f, map, "fouriermodelling", "gif", "loopCount", Inf, "DelayTime", 1);
    else
        imwrite(f, map, "fouriermodelling", "gif", "writemode", "append", "DelayTime", 1);
    end
end

