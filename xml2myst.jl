subs = [
	
	r"<title>([^<]+)</title>" => s"# \1",
	r"<m>([^<]+)</m>" => s"$\1$",
	r"<idx>([^<]+)</idx>" => s"```{index} \1\n```",
	r"<term>([^<]+)</term>" => s"{term}`\1`",
	r"<em>([^<]+)</em>" => s"*\1*",
	
	"<me>" => "```{math}",
	"</me>" => "```",
	"<md>" => "\\begin{align*}",
	"</md>" => "\\end{align*}",
	"<mrow>" => "",
	"</mrow>" => "\\\\",
	"<md>" => "\\begin{align*}",
	"\\amp" => "&",
	r"</?p>" => "",
	r"</?ol>" => "",
	"<li>" => "1. ",
	"</li>" => "",
	r"<men xml:id=\"([^\"]*)\">" => s"```{math}\n:label: \1",
	"</men>" => "```",
	"<input>" => "```{code-cell}",
	"</input>" => "```",
	r"<example xml:id=\"([^\"]*)\">" => s"(\1)=\n::::{admonition,dropdown,tip} Example",
	"<example>" => "::::{admonition,dropdown,tip} Example",
	"</example>" => "::::",
	r"<definition xml:id=\"([^\"]*)\">" => s"(\1)=\n````{proof:definition}",
	"<definition>" => "````{proof:definition}",
	"</definition>" => "````",
	r"<theorem xml:id=\"([^\"]*)\">" => s"(\1)=\n````{proof:theorem}",
	"<theorem>" => "````{proof:theorem}",
	"</theorem>" => "````",
	"<proof>" => "````{proof:proof}",
	"</proof>" => "````",

	"\\gt" => ">",
	"\\lt" => "<",

	"\\bI" => "\\meye",
	r"\\b([abuvxyzABG])" => s"\\bf\1",
]

for fname in ARGS
	@show fname
	endswith(fname,".xml") && (fname = fname[1:end-4]);
	orig = readlines("$fname.xml");
	str = orig;

	for r in subs
		str = map(s->replace(s,r),str);
		#println("Done $r")
	end

	str = split( join(str,"\n"), '\n');

	# m = [  startswith(s,"# ") for s in str ];
	# idx = [1;findall(m);length(str)+1];
	# for i in 1:length(idx)-1
	# 	open("$fname-$i.md","w") do fout 
	# 		foreach(s->println(fout,s),str[idx[i]:idx[i+1]-1])
	# 	end 
	# end

	open("$fname.md","w") do fout
		foreach(s->println(fout,s),str)
	end
end