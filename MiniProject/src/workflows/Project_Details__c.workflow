<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>prj_end_date</fullName>
        <description>prj end date</description>
        <protected>false</protected>
        <recipients>
            <field>Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Project_end_date_template</template>
    </alerts>
    <alerts>
        <fullName>project_end_date</fullName>
        <description>project end date</description>
        <protected>false</protected>
        <recipients>
            <recipient>tejashree@tchavan.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/MarketingProductInquiryResponse</template>
    </alerts>
    <alerts>
        <fullName>task_assigmnent</fullName>
        <description>task assigmnent</description>
        <protected>false</protected>
        <recipients>
            <field>Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/task_assignment</template>
    </alerts>
    <fieldUpdates>
        <fullName>project_manager_mail</fullName>
        <field>Manager_Email__c</field>
        <formula>Manager__r.Email_Address__c</formula>
        <name>project manager mail</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>project_status</fullName>
        <field>Status__c</field>
        <literalValue>Closed</literalValue>
        <name>project status</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>clender task</fullName>
        <actions>
            <name>about_assignment</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <formula>true</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>project end date</fullName>
        <actions>
            <name>prj_end_date</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>End_Date__c - TODAY()    = 5</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>project manager mail</fullName>
        <actions>
            <name>project_manager_mail</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>true</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>project status</fullName>
        <actions>
            <name>project_status</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>End_Date__c  = TODAY()</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>task manager</fullName>
        <actions>
            <name>task_assigmnent</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>true</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <tasks>
        <fullName>about_assignment</fullName>
        <assignedTo>tejashree@tchavan.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>-5</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>Project_Details__c.End_Date__c</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>about assignment</subject>
    </tasks>
</Workflow>
