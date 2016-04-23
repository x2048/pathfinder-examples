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
  
  for (var key in data) {
    item.Item.Children.push({ 
      Item : { 
        Template : "Emoji",
        Name : key, 
        Fields : {
          "__Display Name" : key,
          "Url" : data[key]
        } 
      }
    });
  }

  fs.writeFile("items/master/sitecore/content/Home/emoji.item.json", JSON.stringify(item, true), function(err) {
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

