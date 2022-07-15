fx_version 'cerulean'
games { 'rdr3', 'gta5' }

author 'Tgds-Development-tigdes#8655'
version '1.0'

lua54 'yes'



server_scripts {
	'server/*.lua'
}

client_scripts {
	'client/*.lua'
}

files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/reset.css'
}

ui_page 'html/index.html'