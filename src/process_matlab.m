d = dir('matlab/*.m');
cd matlab

for f = 1:length(d)
    [fp,fn,fe] = fileparts(d(f).name);
    close all
    output = runit(fn);
    if ~isempty(get(0,'children'))
        set(gcf,'paperpos',[0 0 5 2.75])
        print('-dsvg',[fn '.svg'])
 %       print('-depsc',[fn '.eps'])
    elseif ~isempty(output)
        fid = fopen([fn '.out'],'w');
        fprintf(fid,output);
        fclose(fid);
    end
end

cd ..

function output = runit(script)
output = evalc(script);
end
