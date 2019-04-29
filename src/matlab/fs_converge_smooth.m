
      close all
      
f = @(x) exp(sin(3*x)+cos(4*x)); 

nu = 1/sqrt(2*pi);
c0 = nu*integral(f,-pi,pi);
for k = 1:30
    cplus(k) = nu*integral( @(x) f(x).*exp(-1i*k*x),-pi,pi);
    cminus(k) = nu*integral( @(x) f(x).*exp(1i*k*x),-pi,pi);
end    

x = linspace(-pi,pi,1001)';
s = nu*c0;
N = 4:4:12;
fplot(f,[-pi pi],'k','linewid',2), hold on
for k = 1:30
   s = s + nu*cplus(k)*exp(1i*k*x) + nu*cminus(k)*exp(-1i*k*x);
   if any(k==N)
       plot(x,s)
   end
end
    	        
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fs_converge_smooth.svg
      end
      
      