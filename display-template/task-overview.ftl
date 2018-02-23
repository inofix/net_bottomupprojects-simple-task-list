<#--
Any changes here will be overwritten by 'template/task.ftl' at
https://github.com/inofix/net_bottomupprojects-simple-task-list.git
please commit your changes there.
-->

<#if entries?has_content>
	<#list entries as curEntry>
        <#assign viewURL = assetPublisherHelper.getAssetViewURL(renderRequest, renderResponse, curEntry) />

        <#assign doc = saxReaderUtil.read(curEntry.getAssetRenderer().getArticle().getContent()) />
        <#assign owner = doc.valueOf("//dynamic-element[@name='owner']/dynamic-content/text()") />
        <#assign severity = doc.valueOf("//dynamic-element[@name='severity']/dynamic-content/text()") />
        <#assign taskStatus = doc.valueOf("//dynamic-element[@name='status']/dynamic-content/text()") />
        <#assign percentComplete = doc.valueOf("//dynamic-element[@name='percentComplete']/dynamic-content/text()")?number />

        <#if severity == 'blocker'>
            <#assign severitycolor = "rgba(220, 20, 60, 0.9)">
        <#elseif severity == 'critical'>
            <#assign severitycolor = "rgba(255, 0, 0, 0.7)">
        <#elseif severity == 'major'>
            <#assign severitycolor = "rgba(255, 126, 0, 0.6)">
        <#elseif severity == 'minor'>
            <#assign severitycolor = "rgba(255, 255, 0, 0.6)">
        <#else>
            <#assign severitycolor = "rgba(0, 255, 255, 0.6)">
        </#if>
        
        <#if (percentComplete > 99)>
            <#assign percentComplete = 99 />
        <#elseif (percentComplete < 1)>
            <#assign percentComplete = 1 />
        </#if>
        
        <#if (taskStatus != '["open"]')>
            <#assign percentComplete = 100 />
        </#if>

        <div class='task'>
            <a href="${viewURL}">${curEntry.getTitle(locale)}</a>
            (${owner})
        </div>
        <div class='bar' style='width: 100%; height: 5px; background-color: ${severitycolor};'>
            <div class='progress' style='width: ${percentComplete}%; height: 4px; background-color: rgba(126, 255, 126, 0.8);'>
                <div class='alt' style='height: 0px;'>
                    ${taskStatus} -
                    ${severity} -
                    ${percentComplete}%
                </div>
            </div>
        </div>
	</#list>
</#if>
