<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>big_deal_alert</fullName>
        <description>big deal alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>tejashree@tchavan.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SalesNewCustomerEmail</template>
    </alerts>
    <fieldUpdates>
        <fullName>cloed_one</fullName>
        <field>RecordTypeId</field>
        <lookupValue>closed_won1</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>cloed one</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Big deal alert</fullName>
        <actions>
            <name>big_deal_alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>If your opportunity stage is in &apos;negotiation/review&apos; stage, send an email to the opportunity owner indicating a big deal is being created.</description>
        <formula>AND( ISPICKVAL( StageName , &apos;negotiation/review&apos;) , Amount  &gt; 50000)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>closed one workflow</fullName>
        <actions>
            <name>cloed_one</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
