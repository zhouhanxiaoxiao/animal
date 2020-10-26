<style>
    table,table tr th, table tr td { border:1px solid black; }
</style>
<div style="text-align: center;width: 100%">
    <h3>${title}</h3>
    <table style="width: 100%;border: 1px solid black">
        <#list list as tr>
            <tr>
                <#list tr as td>
                    <td>${td}</td>
                </#list>
            </tr>
        </#list>
    </table>
    <div>如有疑问，请联系${userEmail}</div>
</div>
