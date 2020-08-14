console.log('Sending...');
var Discord = require('discord.io');
var fs = require('fs');
var readTextFile = require('read-text-file');

var text =  readTextFile.readSync('temp/message');
var channel =  readTextFile.readSync('temp/channel');
var login =  readTextFile.readSync('temp/login');

var bot = new Discord.Client({
token: login,
autorun: true
}); 
bot.on('ready', function() {
});

console.log(login);
console.log(channel);
console.log(text);

bot.sendMessage({
to: channel,
message: text
});
;