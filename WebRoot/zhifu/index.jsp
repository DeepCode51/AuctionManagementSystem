<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML XMLNS:CC>
<HEAD><TITLE>支付宝 - 网上支付 安全快速！</TITLE>
    <META http-equiv=Content-Type content="text/html; charset=utf-8">
    <META content=网上购物/网上支付/安全支付/安全购物/购物，安全/支付,安全/支付宝/安全,支付/安全，购物/支付,
          name=description 在线 付款,收款 网上,贸易 网上贸易.>
    <META content=网上购物/网上支付/安全支付/安全购物/购物，安全/支付,安全/支付宝/安全,支付/安全，购物/支付, name=keywords
          在线 付款,收款 网上,贸易 网上贸易.>
    <LINK href="images/layout.css"
          type=text/css rel=stylesheet>

    <SCRIPT language=JavaScript>
        function CheckForm() {
            if (document.alipayment.aliorder.value.length == 0) {
                alert("请输入图书名称.");
                document.alipayment.aliorder.focus();
                return false;
            }
            if (document.alipayment.alimoney.value.length == 0) {
                alert("请输入付款金额.");
                document.alipayment.alimoney.focus();
                return false;
            }
            var reg = new RegExp(/^\d*\.?\d{0,2}$/);
            if (!reg.test(document.alipayment.alimoney.value)) {
                alert("请正确输入付款金额");
                document.alipayment.alimoney.focus();
                return false;
            }
            if (Number(document.alipayment.alimoney.value) < 0.01) {
                alert("付款金额金额最小是0.01.");
                document.alipayment.alimoney.focus();
                return false;
            }
        }

        function glowit(which) {
            if (document.all.glowtext[which].filters[0].strength == 2)
                document.all.glowtext[which].filters[0].strength = 1
            else
                document.all.glowtext[which].filters[0].strength = 2
        }

        function glowit2(which) {
            if (document.all.glowtext.filters[0].strength == 2)
                document.all.glowtext.filters[0].strength = 1
            else
                document.all.glowtext.filters[0].strength = 2
        }

        function startglowing() {
            if (document.all.glowtext && glowtext.length) {
                for (i = 0; i < glowtext.length; i++)
                    eval('setInterval("glowit(' + i + ')",150)')
            } else if (glowtext)
                setInterval("glowit2(0)", 150)
        }

        if (document.all)
            window.onload = startglowing


    </SCRIPT>
</HEAD>
<style>
    <!--
    #glowtext {
        filter: glow(color=red, strength=2);
        width: 100%;
    }
.bg{
    background:  rgb(239,239,239);

}
.tab{
    background: white;
    width: 55%;
    height: 39%;
    padding-left: 150px;
}

    -->
</style>
<BODY class="bg" text=#000000 bgcolor="#a9a9a9" leftMargin=0 topMargin=4>
<CENTER>

    <TABLE cellSpacing=0 cellPadding=0 width=760 border=0 style="width: 100%;height: 70px">
        <TBODY style="background: white;">
        <TR>
            <TD style="font-size: 18px;font-weight: bold;padding-left: 490px">订单模拟支付</TD>
        </TR>
        </TBODY>
    </TABLE>
    <BR>

    <FORM name=alipayment onSubmit="return CheckForm();" action=alipayto.asp
          method=post target="_blank">

        <table class="tab">
            <tr>
                <td>
                    <TABLE cellSpacing=0 cellPadding=0 width=740 border=0>
                        <tr style="height: 40px">

                        </tr>
                        <TR>
                            <TD class=form-left>收款方：</TD>
                            <TD class=form-star> </TD>
                            <TD class=form-right>****</TD>
                        </TR>

                        <TR >
                            <TD class=form-left>订单号：</TD>
                            <TD class=form-star></TD>
                            <TD class=form-right><span><%=request.getParameter("ordersn")%></span></TD>
                        </TR>
                        <TR >
                            <TD class=form-left>付款金额：</TD>
                            <TD class=form-star> </TD>
                            <TD class=form-right>
                                <span style="color:rgb(15,194,103);font-size: 20px"><%=request.getParameter("zongji")%></span></TD>
                        </TR>
                        <tr style="height: 25px">

                        </tr>
                        <TR >
                            <TD colspan="3" align="center">
                                <HR width=730 SIZE=2 color="#DCDCDC">
                            </TD>
                        </TR>
                        <tr style="height: 25px">

                        </tr>
                        <TR >
                            <TD class=form-left>支付方式：</TD>
                            <TD class=form-star></TD>
                            <TD class=form-right>
                                <table>

                                    <tr>
                                        <td>
                                            <input type="radio" checked name="pay_bank" value="ICBCB2C"/>
                                        </td>
                                        <td style="width: 150px">
                                           <img src="images/wxzf.png" border="0" height="54px"/>
                                        </td>
                                        <td>
                                            <input type="radio" name="pay_bank" value="ICBCB2C"/>
                                        </td>

                                        <td>
                                            <img src="images/zfbzf.png" border="0" width="130px" height="50px"/>
                                        </td>
                                        <td>
                                            <input type="radio" name="pay_bank" value="ICBCB2C"/>
                                        </td>
                                        <td><img
                                                src="images/qqzf.png" border="0"/>
                                        </td>
                                        <td>
                                            <input type="radio" name="pay_bank" value="ICBCB2C"/>
                                        </td>
                                        <td><img
                                                src="images/wyzf.png" border="0"/>
                                        </td>
                                    </tr>


                                </table>
                            </TD>
                        </TR>
                        <tr style="height: 25px">

                        </tr>
                        <TR>
                            <TD class=form-left></TD>
                            <TD class=form-star></TD>
                            <TD class=form-right>
                                <img src="images/lijizhifu.png"
                                                      onClick="javascript:location.href='../zhifu.jsp?id=<%=request.getParameter("id")%>&biao=<%=request.getParameter("biao")%>&referer='+encodeURIComponent(document.referrer);">
                            </TD>
                        </TR>
                        <tr style="height: 300px">

                        </tr>
                    </TABLE>
                </td>

            </tr>
        </table>

    </FORM>

</BODY>
</HTML>
