using LightXML,TimeZones
smap = XMLDocument()

# create & attach a root node
smroot = create_root(smap, "urlset")

# set attributes
set_attribute(smroot,"xmlns","http://www.sitemaps.org/schemas/sitemap/0.9")
set_attribute(smroot,"xmlns:xsi","http://www.w3.org/2001/XMLSchema-instance")
set_attribute(smroot,"xsi:schemaLocation","http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd")

# add html files
for fn in filter(s->occursin(".html",s),readdir(".."))
	url = new_child(smroot,"url")
	add_text(new_child(url,"loc"),"https://tobydriscoll.net/udmath305/"*fn)
	add_text(new_child(url,"lastmod"),"$(now(localzone()))")
	add_text(new_child(url,"priority"),"1.00")
end

save_file(smap, "../sitemap.xml")