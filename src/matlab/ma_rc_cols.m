
      close all
      
A = [ 3 1; -1 3 ];
b = [7 ; 1];

clr = get(gca,'colororder');
plot([0 2*A(1,1) b(1) A(1,2)],[0 2*A(2,1) b(2) A(2,2)],'--','color',[.5 .5 .5])
hold on
plot([0 A(1,1)],[0 A(2,1)],'color',clr(1,:))
plot([0 A(1,2)],[0 A(2,2)],'color',clr(2,:))
plot([0 b(1)],[0 b(2)])

axis equal, grid on
axis([-2 8 -5 5])
plot([0 0],[-5 5],'k-','linewid',2)
plot([-2 8],[0 0],'k-','linewid',2)

xlabel('b_1'), ylabel('b_2')
        
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg ma_rc_cols.svg
      end
      
      