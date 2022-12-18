return {
	filetypes = { "html" },
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
		provideFormatter = true,
	},
	single_file_support = true,

	root_dir = { "package.json", ".git" },
	flags = {
		debounce_text_changes = 150,
	},
}
