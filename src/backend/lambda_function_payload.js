const AWS = require("aws-sdk");
const dynamo = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event, context) => {
  let body;
  let statusCode = 200;
  const headers = {
	"Content-Type": "application/json"
  };

  let TableName = "broadcast-table";

  try {
	switch (event.routeKey) {
  	case "GET /v1/items":
    	body = await dynamo.scan({ TableName: TableName }).promise();
    	break;
  	case "PUT /v1/items":
    	let requestJSON = JSON.parse(event.body);
    	await dynamo
      	.put({
        	TableName: TableName,
        	Item: {
          	id: requestJSON.id,
            user: requestJSON.user,
        	}
      	})
      	.promise();
    	body = `Put item with id ${requestJSON.id} for user ${requestJSON.user}`;
    	break;
  	default:
    	throw new Error(`Unsupported route: "${event.routeKey}"`);
	}
  } catch (err) {
	statusCode = 400;
	body = err.message;
  } finally {
	body = JSON.stringify(body);
  }

  return {
	statusCode,
	body,
	headers
  };
};
