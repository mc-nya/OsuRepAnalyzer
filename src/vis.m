step=200;
dX=X(2:end)-X(1:end-1);
dY=Y(2:end)-X(1:end-1);
dist=sqrt(dX.^2+dY.^2);
speed=dist./dT(2:end);
speed(speed<0)=0;
speed(speed==Inf)=0;
speed=speed./max(speed);
%color=linspace(floor(min(speed)),ceil(max(speed)),1.0);
figure(1);

k1down=0;
k2down=0;
for outer_index=1:step:size(X,2)-step
    hold off;
    plot(X(outer_index),Y(outer_index),'kh');
    hold on;
    colormap hsv;
    colorbar;
    patch('XData',[X(outer_index:outer_index+step) NaN],'YData',[Y(outer_index:outer_index+step) NaN],  ...,
    'CData',[speed(outer_index:outer_index+step) NaN], ...,
           'facecolor','none','edgecolor','interp'); 
    for i=outer_index:outer_index+step

        if bitand(act(i),4)~=0 && k1down==0
            plot(X(i),Y(i),'k+');
            k1down=1;
        end

        if bitand(act(i),4)==0 && k1down==1
            k1down=0;
        end;

        if bitand(act(i),8)~=0 && k2down==0
            plot(X(i),Y(i),'k+');
            k2down=1;
        end

        if bitand(act(i),8)==0 && k2down==1
            k2down=0;
        end;

    end;
    title(['event ' num2str(outer_index) '~' num2str(outer_index+step)]);        
    axis([0 512 0 384])
    set(gca,'YDir','reverse');
    t=1;
end
