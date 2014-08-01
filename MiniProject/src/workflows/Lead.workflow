<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>follow_up</fullName>
        <description>follow up</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/follow_up</template>
    </alerts>
    <fieldUpdates>
        <fullName>DNC_workflow_action</fullName>
        <field>RecordTypeId</field>
        <lookupValue>DNC</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>DNC workflow action</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Land_line_Workflow_action</fullName>
        <field>RecordTypeId</field>
        <lookupValue>LANDLINE</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Land line Workflow action</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Mobile_workflow_action</fullName>
        <field>RecordTypeId</field>
        <lookupValue>MOBILE</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Mobile workflow action</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>No_number_Workflow_action</fullName>
        <field>RecordTypeId</field>
        <lookupValue>NO_NUMBER</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>No number Workflow action</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>DNC</fullName>
        <actions>
            <name>DNC_workflow_action</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Lead.DoNotCall</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Land line Workflow</fullName>
        <actions>
            <name>Land_line_Workflow_action</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(LEN( Phone )  &gt; 0,LEN( MobilePhone)=0, DoNotCall = false)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Mobile workflow</fullName>
        <actions>
            <name>Mobile_workflow_action</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>OR( AND(  LEN(Phone) &gt; 0 , LEN(MobilePhone) &gt; 0, DoNotCall  = False), AND(LEN(Phone) = 0,LEN(MobilePhone) &gt; 0,DoNotCall  = False))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>No number</fullName>
        <actions>
            <name>No_number_Workflow_action</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND( LEN(Phone)= 0,LEN( MobilePhone ) = 0, DoNotCall = False)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>follow up</fullName>
        <actions>
            <name>follow_up</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>follow_up__c - TODAY() &lt; 0</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
