<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>sample_one_to_one_workflow</fullName>
        <field>unique_account_a__c</field>
        <formula>account_a__c</formula>
        <name>sample one to one workflow</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>sample one to one workflow</fullName>
        <actions>
            <name>sample_one_to_one_workflow</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>true</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
