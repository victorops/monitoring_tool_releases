<?xml version="1.0" encoding="UTF-8"?>
<zabbix_export>
    <version>5.0</version>
    <date>2020-07-24T17:45:21Z</date>
    <media_types>
        <media_type>
            <name>VictorOps</name>
            <type>WEBHOOK</type>
            <parameters>
                <parameter>
                    <name>ACTION_ID</name>
                    <value>{ACTION.ID}</value>
                </parameter>
                <parameter>
                    <name>ACTION_NAME</name>
                    <value>{ACTION.NAME}</value>
                </parameter>
                <parameter>
                    <name>DATE</name>
                    <value>{DATE}</value>
                </parameter>
                <parameter>
                    <name>EVENT_AGE</name>
                    <value>{EVENT.AGE}</value>
                </parameter>
                <parameter>
                    <name>EVENT_DATE</name>
                    <value>{EVENT.DATE}</value>
                </parameter>
                <parameter>
                    <name>EVENT_ID</name>
                    <value>{EVENT.ID}</value>
                </parameter>
                <parameter>
                    <name>EVENT_STATUS</name>
                    <value>{EVENT.STATUS}</value>
                </parameter>
                <parameter>
                    <name>EVENT_TIME</name>
                    <value>{EVENT.TIME}</value>
                </parameter>
                <parameter>
                    <name>EVENT_VALUE</name>
                    <value>{EVENT.VALUE}</value>
                </parameter>
                <parameter>
                    <name>HOST_CONN1</name>
                    <value>{HOST.CONN1}</value>
                </parameter>
                <parameter>
                    <name>HOST_DNS1</name>
                    <value>{HOST.DNS1}</value>
                </parameter>
                <parameter>
                    <name>HOST_HOST1</name>
                    <value>{HOST.HOST1}</value>
                </parameter>
                <parameter>
                    <name>HOST_IP1</name>
                    <value>{HOST.IP1}</value>
                </parameter>
                <parameter>
                    <name>HOST_NAME</name>
                    <value>{HOST.NAME}</value>
                </parameter>
                <parameter>
                    <name>HOST_NAME1</name>
                    <value>{HOST.NAME1}</value>
                </parameter>
                <parameter>
                    <name>HOST_PORT1</name>
                    <value>{HOST.PORT1}</value>
                </parameter>
                <parameter>
                    <name>ITEM_DESCRIPTION1</name>
                    <value>{ITEM.DESCRIPTION1}</value>
                </parameter>
                <parameter>
                    <name>ITEM_ID1</name>
                    <value>{ITEM.ID1}</value>
                </parameter>
                <parameter>
                    <name>ITEM_KEY1</name>
                    <value>{ITEM.KEY1}</value>
                </parameter>
                <parameter>
                    <name>ITEM_KEY_ORIG1</name>
                    <value>{ITEM.KEY.ORIG1}</value>
                </parameter>
                <parameter>
                    <name>ITEM_LASTVALUE1</name>
                    <value>{ITEM.LASTVALUE1}</value>
                </parameter>
                <parameter>
                    <name>ITEM_NAME1</name>
                    <value>{ITEM.NAME1}</value>
                </parameter>
                <parameter>
                    <name>ITEM_NAME_ORIG1</name>
                    <value>{ITEM.NAME.ORIG1}</value>
                </parameter>
                <parameter>
                    <name>ITEM_VALUE1</name>
                    <value>{ITEM.VALUE1}</value>
                </parameter>
                <parameter>
                    <name>PAYLOAD</name>
                    <value>{ALERT.MESSAGE}</value>
                </parameter>
                <parameter>
                    <name>TIME</name>
                    <value>{TIME}</value>
                </parameter>
                <parameter>
                    <name>TRIGGER_DESCRIPTION</name>
                    <value>{TRIGGER.DESCRIPTION}</value>
                </parameter>
                <parameter>
                    <name>TRIGGER_EXPRESSION</name>
                    <value>{TRIGGER.EXPRESSION}</value>
                </parameter>
                <parameter>
                    <name>TRIGGER_HOSTGROUP.NAME</name>
                    <value>{TRIGGER.HOSTGROUP.NAME}</value>
                </parameter>
                <parameter>
                    <name>TRIGGER_ID</name>
                    <value>{TRIGGER.ID}</value>
                </parameter>
                <parameter>
                    <name>TRIGGER_KEY</name>
                    <value>{ITEM.KEY}</value>
                </parameter>
                <parameter>
                    <name>TRIGGER_NAME</name>
                    <value>{TRIGGER.NAME}</value>
                </parameter>
                <parameter>
                    <name>TRIGGER_NAME_ORIG</name>
                    <value>{TRIGGER.NAME.ORIG}</value>
                </parameter>
                <parameter>
                    <name>TRIGGER_NSEVERITY</name>
                    <value>{TRIGGER.NSEVERITY}</value>
                </parameter>
                <parameter>
                    <name>TRIGGER_SEVERITY</name>
                    <value>{TRIGGER.SEVERITY}</value>
                </parameter>
                <parameter>
                    <name>TRIGGER_STATUS</name>
                    <value>{TRIGGER.STATUS}</value>
                </parameter>
                <parameter>
                    <name>TRIGGER_TEMPLATE_NAME</name>
                    <value>{TRIGGER.TEMPLATE.NAME}</value>
                </parameter>
                <parameter>
                    <name>TRIGGER_URL</name>
                    <value>{TRIGGER.URL}</value>
                </parameter>
                <parameter>
                    <name>TRIGGER_VALUE</name>
                    <value>{TRIGGER.VALUE}</value>
                </parameter>
                <parameter>
                    <name>VO_ORGANIZATION_ID</name>
                    <value/>
                </parameter>
                <parameter>
                    <name>VO_ORGANIZATION_KEY</name>
                    <value/>
                </parameter>
                <parameter>
                    <name>VO_ROUTING_KEY</name>
                    <value>{ALERT.SENDTO}</value>
                </parameter>
                <parameter>
                    <name>VO_STATE_MESSAGE</name>
                    <value>{ALERT.SUBJECT}</value>
                </parameter>
            </parameters>
            <script>//Get all the alert variables&#13;
var params = JSON.parse(value);&#13;
//Zabbix.Log(1, &quot;params created&quot;);&#13;
var action_payload=params.PAYLOAD;&#13;
//Zabbix.Log(1, &quot;payload created: &quot; + action_payload);&#13;
&#13;
//Build JSON payload&#13;
var fields = JSON.parse(action_payload);&#13;
//Zabbix.Log(1, &quot;FIELDS after PARSE: &quot;+fields);&#13;
//set fields for use in VictorOps endpoint mapping&#13;
if (fields.MONITOR_NAME) {&#13;
  fields.monitor_name = fields.MONITOR_NAME;&#13;
  fields.VO_ZABBIX_HOST = fields.MONITOR_NAME;&#13;
  delete fields.MONITOR_NAME;&#13;
}&#13;
fields.VO_ORGANIZATION_KEY = params.VO_ORGANIZATION_KEY;&#13;
fields.VO_ORGANIZATION_ID = params.VO_ORGANIZATION_ID;&#13;
fields.VO_ROUTING_KEY = params.VO_ROUTING_KEY;&#13;
fields.VO_ZABBIX_ALERT_TIME = Date.now();&#13;
fields[&quot;ESC.HISTORY&quot;] = params.VO_STATE_MESSAGE;&#13;
fields[&quot;TRIGGER.KEY&quot;]=params.ITEM_KEY;&#13;
fields[&quot;TRIGGER.DESCRIPTION&quot;]=params.TRIGGER_DESCRIPTION;&#13;
fields[&quot;TRIGGER.HOSTGROUP.NAME&quot;]=params.TRIGGER_HOSTGROUP_NAME;&#13;
fields[&quot;TRIGGER.EXPRESSION&quot;]=params.TRIGGER_EXPRESSION;&#13;
fields[&quot;TRIGGER.ID&quot;]=params.TRIGGER_ID;&#13;
fields[&quot;TRIGGER.NAME&quot;]=params.TRIGGER_NAME;&#13;
fields[&quot;TRIGGER.NAME.ORIG&quot;]=params.TRIGGER_NAME_ORIG;&#13;
fields[&quot;TRIGGER.NSEVERITY&quot;]=params.TRIGGER_NSEVERITY;&#13;
fields[&quot;TRIGGER.SEVERITY&quot;]=params.TRIGGER_SEVERITY;&#13;
fields[&quot;TRIGGER.STATUS&quot;]=params.TRIGGER_STATUS;&#13;
fields[&quot;TRIGGER.TEMPLATE.NAME&quot;]=params.TRIGGER_TEMPLATE_NAME;&#13;
fields[&quot;TRIGGER.URL&quot;]=params.TRIGGER_URL;&#13;
fields[&quot;TRIGGER.VALUE&quot;]=params.TRIGGER_VALUE;&#13;
fields[&quot;DATE&quot;]=params.DATE;&#13;
fields[&quot;EVENT.AGE&quot;]=params.EVENT_AGE;&#13;
fields[&quot;EVENT.DATE&quot;]=params.EVENT_DATE;&#13;
fields[&quot;EVENT.ID&quot;]=params.EVENT_ID;&#13;
fields[&quot;EVENT.STATUS&quot;]=params.EVENT_STATUS;&#13;
fields[&quot;EVENT.TIME&quot;]=params.EVENT_TIME;&#13;
fields[&quot;EVENT.VALUE&quot;]=params.EVENT_VALUE;&#13;
fields[&quot;HOST.CONN1&quot;]=params.HOST_CONN1;&#13;
fields[&quot;HOST.DNS1&quot;]=params.HOST_DNS1;&#13;
fields[&quot;HOST.HOST1&quot;]=params.HOST_HOST1;&#13;
fields[&quot;HOST.IP1&quot;]=params.HOST_IP1;&#13;
fields[&quot;HOST.NAME&quot;]=params.HOST_NAME;&#13;
fields[&quot;HOST.NAME1&quot;]=params.HOST_NAME1;&#13;
fields[&quot;HOST.PORT1&quot;]=params.HOST_PORT1;&#13;
fields[&quot;TIME&quot;]=params.TIME;&#13;
fields[&quot;ACTION.ID&quot;]=params.ACTION_ID;&#13;
fields[&quot;ACTION.NAME&quot;]=params.ACTION_NAME;&#13;
fields[&quot;ITEM.DESCRIPTION1&quot;]=params.ITEM_DESCRIPTION1;&#13;
fields[&quot;ITEM.ID1&quot;]=params.ITEM_ID1;&#13;
fields[&quot;ITEM.KEY1&quot;]=params.ITEM_KEY1;&#13;
fields[&quot;ITEM.KEY.ORIG1&quot;]=params.ITEM_KEY_ORIG1;&#13;
fields[&quot;ITEM.LASTVALUE1&quot;]=params.ITEM_LASTVALUE1;&#13;
fields[&quot;ITEM.NAME1&quot;]=params.ITEM_NAME1;&#13;
fields[&quot;ITEM.NAME.ORIG1&quot;]=params.ITEM_NAME_ORIG1;&#13;
fields[&quot;ITEM.VALUE1&quot;]=params.ITEM_VALUE1;&#13;
&#13;
&#13;
//Declare curl request&#13;
var req = new HttpRequest();&#13;
req.addHeader('Content-Type: application/json');&#13;
//Make the POST to the VO Zabbix Endpoint&#13;
//https://alert.victorops.com/integrations/zabbix/20140212/alert&#13;
var resp = req.post('https://alert.victorops.com/integrations/zabbix/20140212/alert',&#13;
JSON.stringify(fields));&#13;
&#13;
if (req.getStatus() != 200) {&#13;
throw 'Response code: '+req.getStatus();&#13;
}return resp;</script>
            <description>This media type is meant to send alerts from Zabbix 5.4 - 6.x to VictorOps. Fill in the fields VO_ORGANIZATION_ID and VO_ORGANIZATION_KEY with their required VictorOps values. To complete the configuration an appropriate user and action configuration is required. For complete instructions on the VictorOps Zabbix integration refer to https://help.victorops.com/knowledge-base/victorops-zabbix-integration/</description>
            <message_templates>
                <message_template>
                    <event_source>TRIGGERS</event_source>
                    <operation_mode>PROBLEM</operation_mode>
                    <subject>Incident: {ESC.HISTORY}</subject>
                    <message>{}</message>
                </message_template>
                <message_template>
                    <event_source>TRIGGERS</event_source>
                    <operation_mode>RECOVERY</operation_mode>
                    <subject>Resolved: {ESC.HISTORY}</subject>
                    <message>{&#13;
&quot;EVENT.RECOVERY.DATE&quot;:&quot;{EVENT.RECOVERY.DATE}&quot;,&#13;
&quot;EVENT.RECOVERY.ID&quot;:&quot;{EVENT.RECOVERY.ID}&quot;,&#13;
&quot;EVENT.RECOVERY.STATUS&quot;:&quot;{EVENT.RECOVERY.STATUS}&quot;,&#13;
&quot;EVENT.RECOVERY.TIME&quot;:&quot;{EVENT.RECOVERY.TIME}&quot;,&#13;
&quot;EVENT.RECOVERY.VALUE&quot;:&quot;{EVENT.RECOVERY.VALUE}&quot;&#13;
}</message>
                </message_template>
            </message_templates>
        </media_type>
    </media_types>
</zabbix_export>
