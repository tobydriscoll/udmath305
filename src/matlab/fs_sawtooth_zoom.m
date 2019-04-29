
      close all
      
x = linspace(0.8*pi,pi,1001)';
s = 0;
N = 5:5:30;
clf
plot(x,x,'k','linewid',2), hold on
for k = 1:30
   s = s + (-1)^(k+1)*(2/k)*sin(k*x);
   if any(k==N)
       plot(x,s)
   end
end
ylim([2 3.8])
    	        
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fs_sawtooth_zoom.svg
      end
      
      