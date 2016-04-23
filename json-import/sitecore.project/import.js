var fs = require("fs");
var Client = require("node-rest-client").Client

var client = new Client();

var args = {
  headers : {
              "Accept" : "application/json",
              "User-Agent" : "Octocat-Emoji-Import",
              "Cache-Control" : "private"
            }
}

client.get("https://api.github.com/emojis", args, function(data, response) {
  var item = {
    Item : {
             Template : "Folder",
             Children : []
           }
  };
  
  var i = 0;
  
  for (var key in data) {
    if (i++ > 50) break;
    
    item.Item.Children.push({ 
      Item : { 
        Template : "Emoji",
        Name : key, 
        Fields : {
          "Url" : data[key],
          "Alt" : "Emoji: " + key,
        } 
      }
    });
  }

  fs.writeFile("items/master/sitecore/content/Home/Emoji.item.json", JSON.stringify(item, true), function(err) {
    if (err) {
      return console.log(err);
    }
  });
  
}).on('error', function (err) {
	console.log('something went wrong on the request', err.request.options);
});

// handling client error events 
client.on('error', function (err) {
	console.error('Something went wrong on the client', err);
});

