
      close all
      
A = @(omega,Z) 1./(-omega.^2 + 2i*Z.*omega + 1 );
fsurf( @(omega,Z) log10(abs(A(omega,Z))),[0 1.5 1e-3 1])
view(-36,50), set(gca,'ydir','rev')
view(20,20)
xlabel('driving frequency')
ylabel('damping intensity')
zlabel('log_{10}(gain)')
hold on
Z = linspace(1e-3,1,300);
rhomax = real(sqrt(1-2*Z.^2));
plot3(rhomax,Z,log10(abs(A(rhomax,Z))),'w','linew',3)
					
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg so_oscgain.svg
      end
      
      