
      close all
      
load bitcoindata
v = struct2cell(data.bpi);
v = cat(1,v{:});
plot(v,'-ko')
for i = 4:31
    z(i) = (v(i)+v(i-1)+v(i-2)+v(i-3))/4;
end
z(1:3) = NaN;  % not a number
hold on, plot(z,'-o')
					
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg so_conv_bitcoin2.svg
      end
      
      