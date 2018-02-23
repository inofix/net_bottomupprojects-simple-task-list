<#--
Any changes here will be overwritten by 'template/task.ftl' at
https://github.com/inofix/net_bottomupprojects-simple-task-list.git
please commit your changes there.
-->

<#if locale == 'de_DE'>
    <#assign ownedBy = "Zugewiesen an:">
<#else>
    <#assign ownedBy = "Assigned to:">
</#if>

<#if severity.getData() == 'blocker'>
    <#assign severitycolor = "rgba(220, 20, 60, 0.9)">
<#elseif severity.getData() == 'critical'>
    <#assign severitycolor = "rgba(255, 0, 0, 0.7)">
<#elseif severity.getData() == 'major'>
    <#assign severitycolor = "rgba(255, 126, 0, 0.6)">
<#elseif severity.getData() == 'minor'>
    <#assign severitycolor = "rgba(255, 255, 0, 0.6)">
<#else>
    <#assign severitycolor = "rgba(0, 255, 255, 0.6)">
</#if>

<#assign pComplete = percentComplete.getData()?number />
<#if (pComplete > 99)>
    <#assign pComplete = 99 />
<#elseif (pComplete < 1)>
    <#assign pComplete = 1 />
</#if>

<#if (status.getData() != '["open"]')>
    <#assign pComplete = 100 />
</#if>

<div>
    <p>
    ${ownedBy}
    <ul>
        <li>${owner.getData()}</li>
    </ul>
    </p>
    <div class="alt">
        (${severity.getData()}) - ${percentComplete.getData()}% - ${status.getData()}
    </div>
    <div class="bar" style="width: 100%; height: 8px; background-color: ${severitycolor};">
        <div class="progress" style="width: ${pComplete}%; height: 7px; background-color: rgba(0, 255, 0, 0.8)"></div>
    </div>
    <p>
        ${description.getData()}
    </p>
</div>
