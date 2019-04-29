
      close all
      
x = linspace(-2*pi,2*pi,1001)';
s = 0;
N = 5:5:15;
clf
plot(x,x,'k','linewid',2), hold on
for k = 1:30
   s = s + (-1)^(k+1)*(2/k)*sin(k*x);
   if any(k==N)
       plot(x,s)
   end
end
    	        
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fs_sawtooth.svg
      end
      
      