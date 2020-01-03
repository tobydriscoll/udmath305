
      close all
      
%bc = webread('https://api.coindesk.com/v1/bpi/historical/close.json');
%data = jsondecode(bc);
load bitcoindata
v = struct2cell(data.bpi);
v = cat(1,v{:});
plot(v,'-ko')
w = [4 3 2 1];
for i = 4:31
    z(i) = (w(1)*v(i) + w(2)*v(i-1) + w(3)*v(i-2) + w(4)*v(i-3)) / sum(w);
end
z(1:3) = NaN;  % not a number
hold on, plot(z,'-o')
					
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg so_conv_bitcoin3.svg
      end
      
      