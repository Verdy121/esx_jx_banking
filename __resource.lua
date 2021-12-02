resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'esx_jx_banking simppeli esx scripti tehty esx_atm pohjalle!'

version '1.1.0'

server_scripts {
	'@es_extended/locale.lua',
	'locales/de.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/de.lua',
	'locales/fr.lua',
	'locales/es.lua',
	'locales/sv.lua',
	'locales/cs.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/de.lua',
	'locales/br.lua',
	'locales/en.lua',
	'locales/fi.lua',
	'locales/fr.lua',
	'locales/es.lua',
	'locales/de.lua',
	'locales/sv.lua',
	'locales/cs.lua',
	'config.lua',
	'client/main.lua'
}

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/roboto.ttf',
	'html/img/fleeca.png',
	'html/img/tabletti.png',
	'html/img/redilogotransparent.png',
	'html/css/app.css',
	'html/scripts/app.js'
}

dependency 'es_extended'