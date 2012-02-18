Setup.Package
{
 	vendor = "liflg.org",
 	id = "hg2",
 	description = "Heavy Gear 2",
 	version = "1.00b-english",
 	splash = "splash.png",
 	superuser = false,
	write_manifest = true,
 	support_uninstall = true,
 	recommended_destinations =
 	{
 		"/usr/local/games",
		"/opt",
		MojoSetup.info.homedir,
 	},

 	Setup.Readme
 	{
 		description = "README",
 		source = "README.liflg"
 	},

	Setup.Media
 	{
 		id = "hg2-disc",
		description = "Heavy Gear 2 Loki Disc",
		uniquefile = "bin/x86/glibc-2.1/hg2"	
 	},

	Setup.Option {
		required = true,
		description = "Files for Heavy Gear 2",
		bytes = 518509888,
                Setup.DesktopMenuItem
                {
                	disabled = false,
			name = "Heavy Gear 2",
                        genericname = "Heavy Gear 2",
                        tooltip = "Play Heavy Gear 2",
                        builtin_icon = false,
                        icon = "icon.xpm",
                        commandline = "%0/hg2.sh",
                        category = "Game",
                },

		Setup.File {
			source = "media://hg2-disc/binaries.tar.gz",
			filter = function(dest)
				if dest == "hg2stub" then
					return dest, "0755"
				end
				return dest
			end

		},
		
		Setup.File {
			source = "media://hg2-disc/data.tar.gz",
		},
		
		Setup.File 
		{
			source = "media://hg2-disc/",
			wildcards = {"icon.bmp", "icon.xpm", "README", "shell/*"},
		},

		Setup.File 
		{
			source = "media://hg2-disc/bin/x86/glibc-2.1/",
			permissions = "0755",
		},

		Setup.File 
		{
			wildcards = "hg2.sh",
			permissions = "0755",
		},

		Setup.File
		{	
			wildcards = "README.liflg",
		},

		Setup.File
		{
			source = "base:///libttf.tar.xz/",
		},

		Setup.File
		{
			source = "base:///libglib1.2ldbl_1.2.10-19_i386.tar.xz/",
		},

		Setup.Option {
			value = true,
			required = true,
			description = "Apply Patch 1.00b",
			tooltip = "Latest update from Loki",
			bytes = 7692226,
			Setup.File{
				allowoverwrite = true,
				source = "base:///patch-1.00b.tar.xz/",
				filter = function(dest)
					if ( string.match( dest, "hg2" ) ) then
						return dest, "0755"
					end
					return dest
				end
			},
		},
	},
}
