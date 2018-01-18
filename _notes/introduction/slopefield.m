function slopefield(f,tbounds,ybounds) 

t = linspace(tbounds(1),tbounds(2),25);
y = linspace(ybounds(1),ybounds(2),25);
[T,Y] = ndgrid(t,y);

f = eval(vectorize(f));
quiver(T,Y,ones(size(T)),f(T,Y),'.')
axis tight

end