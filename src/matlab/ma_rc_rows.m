
      close all
      
A = [ 3 1; -1 3 ];
b = [7 ; 1];

fimplicit(@(x,y) A(1,1)*x+A(1,2)*y-b(1),[-1 3])
hold on
fimplicit(@(x,y) A(2,1)*x+A(2,2)*y-b(2),[-1 3])

axis([-1 3 -1 3])
plot([0 0],[-1 3],'k-','linewid',2)
plot([-1 3],[0 0],'k-','linewid',2)

axis equal, grid on
xlabel('x'), ylabel('y')
        
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg ma_rc_rows.svg
      end
      
      