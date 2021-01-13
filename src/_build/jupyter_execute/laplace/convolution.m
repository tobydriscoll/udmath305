restoredefaultpath
set(0,'defaultlinelinewidth',1)
set(0,'defaultaxesfontsize',6)

%plot -s 800,400 -r 160 -f png

bc = webread('https://api.coindesk.com/v1/bpi/historical/close.json');
data = jsondecode(bc);
v = struct2cell(data.bpi);
v = cat(1,v{:});
plot(v,'-ko')

plot(v,'-ko')
for i = 4:31
    z(i) = (v(i) + v(i-1) + v(i-2) + v(i-3)) / 4;
end
z(1:3) = NaN;  % not a number
hold on
plot(z)

plot(v,'-ko')
w = [4 3 2 1];
for i = 4:31
    z(i) = (w(1)*v(i) + w(2)*v(i-1) + w(3)*v(i-2) + w(4)*v(i-3)) / sum(w);
end
z(1:3) = NaN;  % not a number
hold on
plot(z)
