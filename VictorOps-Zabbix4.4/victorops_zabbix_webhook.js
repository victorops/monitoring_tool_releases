//Get all the alert variables
var params = JSON.parse(value);
//Zabbix.Log(1, "params created");
var action_payload=params.action_payload;
//Zabbix.Log(1, "action payload created: " + action_payload);

//Use regex to check for invalid quotes and newline chars in the action field values
//action_payload=action_payload.replace(/([ :])(\")([\w\s-/$]+)(\")([ }"\.])/g, "$1$3$5");
//Zabbix.Log(1, "action payload regex 1: " + action_payload);
//action_payload=action_payload.replace(/[\n\r]/g, " ");
//Zabbix.Log(1, "action payload regex 2: " + action_payload);

//Build JSON payload
var fields = JSON.parse(action_payload);
//Zabbix.Log(1, "FIELDS after PARSE: "+fields);

//set fields for use in VictorOps endpoint mapping
if (fields.MONITOR_NAME) {
fields.monitor_name = fields.MONITOR_NAME;
fields.VO_ZABBIX_HOST = fields.MONITOR_NAME;
delete fields.MONITOR_NAME;
}
fields.VO_ORGANIZATION_KEY = params.VO_ORGANIZATION_KEY;
fields.VO_ORGANIZATION_ID = params.VO_ORGANIZATION_ID;
fields.VO_ROUTING_KEY = params.VO_ROUTING_KEY;
fields.VO_ZABBIX_ALERT_TIME = Date.now();
fields["ESC.HISTORY"] = params.VO_STATE_MESSAGE;

//Declare curl request
var req = new CurlHttpRequest();
req.AddHeader('Content-Type: application/json');
//Make the POST to the VO Zabbix Endpoint
//https://alert.victorops.com/integrations/zabbix/20140212/alert
var resp = req.Post('https://alert.victorops.com/integrations/zabbix/20140212/alert',
JSON.stringify(fields)
);

if (req.Status() != 200) {
throw 'Response code: '+req.Status();
}

return resp;
