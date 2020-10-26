<style>
    table,table tr th, table tr td { border:1px solid black; }
</style>
<div style="text-align: center;width: 100%">
    <h1>测序项目确认</h1>
    <table style="width: 100%;border: 1px solid black">
        <tr>
            <td>项目名称:</td>
            <td>${projectName}</td>
        </tr>
        <tr>
            <td>数据类型:</td>
            <td>${dateType}</td>
        </tr>
        <tr>
            <td>负责人:</td>
            <td>${preMan}</td>
        </tr>
        <tr>
            <td>邮箱:</td>
            <td>
                <#list emails as email>
                    ${email + ","}
                </#list>
            </td>
        </tr>
        <tr>
            <td>样本类型:</td>
            <td>${sampleTypes}</td>
        </tr>
        <tr>
            <td>项目描述:</td>
            <td>${projectDesc}</td>
        </tr>
        <tr>
            <td>样品录入负责人:</td>
            <td>${spip}</td>
        </tr>
        <tr>
            <td>样品制备负责人:</td>
            <td>${spmk}</td>
        </tr>
        <tr>
            <td>文库制备负责人:</td>
            <td>${lib}</td>
        </tr>
        <tr>
            <td>数据交付负责人:</td>
            <td>${disData}</td>
        </tr>
        <tr>
            <td>生信分析负责人:</td>
            <td>${bio}</td>
        </tr>
        <tr>
            <td>备注:</td>
            <td>${rmk}</td>
        </tr>
    </table>
    <div>
        <a href="${confirmUrl}">confirm</a>
        &nbsp;
        <a href="${refuseUrl}">refuse</a>
    </div>
</div>
