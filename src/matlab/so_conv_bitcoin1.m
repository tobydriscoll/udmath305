
      close all
      
load bitcoindata
v = struct2cell(data.bpi);
v = cat(1,v{:});
plot(v,'-o')
					
      if length(get(0,'children')) > 0
        set(gcf,'paperpos',[0 0 5 2.75])
        print -dsvg so_conv_bitcoin1.svg
      end
      
      