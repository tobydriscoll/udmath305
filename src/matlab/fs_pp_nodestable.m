
      close all
      
							A = [-4 -1; -2 -5];
							[V,D] = eig(A);
							lam = diag(D);
							
							clf
							plot(0,0,'r.','markersize',18)
							hold on
							
							% plot directions
							[x1,x2] = meshgrid(-1:.2:1);
							v = A*[x1(:)';x2(:)'];
							sz = size(x1);
							quiver(x1,x2,reshape(v(1,:),sz),reshape(v(2,:),sz))
							
							% plot eigenvectors
							plot(5*[-V(1,:);V(1,:)],5*[-V(2,:);V(2,:)],'k','linew',2)
							
							% plot trajectories
							colr = get(gca,'colororder');
							t = linspace(0,10,300);
							for theta = 2*pi*(0:23)/24
								for j = 1:length(t)
									X = expm(t(j)*A);
									x(:,j) = X*[ cos(theta); sin(theta) ];
								end
								plot(x(1,:),x(2,:),'linew',1.5,'color',colr(1,:))
							end
							
							axis([-1.1 1.1 -1.1 1.1]), axis square
							title('stable node')
							xlabel('x_1')
							ylabel('x_2')		
						
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg fs_pp_nodestable.svg
      end
      
      