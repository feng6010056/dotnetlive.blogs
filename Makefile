start:
	systemctl start kestrel-dotnetlive-blogs.service

stop:
	systemctl stop kestrel-dotnetlive-blogs.service

delete_current_build:
	rm -rf /var/dotnetlive/pubsite/dotnetlive.blogs/

publish:
	git clean -df
	git pull
	dotnet restore src/DotNetLive.BlogsWeb.sln 
	cd src/DotNetLive.BlogsWeb && npm install && bower install --allow-root && gulp default
	dotnet publish src/DotNetLive.ForumBlogsWebsWeb/DotNetLive.BlogsWeb.csproj -c "Release" -o /var/dotnetlive/pubsite/dotnetlive.blogs/ 

deploy: stop publish start
