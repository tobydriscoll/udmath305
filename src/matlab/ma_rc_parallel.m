
      close all
      
A = [ 1 2; -2 -4 ];
b = [1 ; 1];

clf
fimplicit(@(x,y) A(1,1)*x+A(1,2)*y-b(1),[-2 2])
hold on
fimplicit(@(x,y) A(2,1)*x+A(2,2)*y-b(2),[-2 2])

axis equal, grid on
axis([-2 2 -2 2])
plot([0 0],[-2 2],'k-','linewid',2)
plot([-2 2],[0 0],'k-','linewid',2)
xlabel('x'), ylabel('y')
        
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg ma_rc_parallel.svg
      end
      
      