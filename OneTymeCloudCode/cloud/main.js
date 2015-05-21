// Require and initialize the Twilio module with your credentials
Parse.Cloud.define("sendText", function(request, response) {
var client = require('twilio')('AC56a769b2eb0e37e5b78b7c9bbb5bac35', '7ae4ad745d1160045fd092e75b4c982a');
var to
// Send an SMS message
client.sendSms({
    to:request.params.to, 
    from: request.params.from, 
    body: request.params.body
  }, function(err, responseData) { 
    if (err) {
      console.log(err);
    } else { 
      console.log(responseData.from); 
      console.log(responseData.body);
      response.success("The text has been sent!");
    }
  }
);
});