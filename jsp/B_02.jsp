<%@ page import = "java.io.*,java.util.*" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %><a href="https://oss-auth.blinklab.com/oss/serv/debug.jsp">debug</a>



<!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->
<!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<!-- Flush buffer before setting locale to ensure encoding is preserved -->
<html>
<head>
  <!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<link rel="shortcut icon" href="/oss/favicon.ico" /> 
<link href="/oss/oss/common/css/oss.css" rel="stylesheet" type="text/css" />
<link href="/oss/oss/common/css/error.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
<!--
	var ecCheck = false;
	var errorCheck = false;
	var buttonsCheck = false;
	var imagesCheck = false;
	var soundCheck = false;
	var shopCheck = false;
	var ossCheck = false;
//-->
</script>

<SCRIPT language="JavaScript" src="/oss/oss/common/js//ec.js"></SCRIPT>
<SCRIPT language="JavaScript" src='/oss/oss/common/js//error.js'></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//buttons.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//images.js"></SCRIPT>
<SCRIPT language="JavaScript" src='/oss/oss/common/js//sound.js'></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//shop.js"></SCRIPT>
<SCRIPT language="JavaScript" src="/oss/oss/common/js//oss.js"></SCRIPT>

<script type="text/JavaScript">
<!--
var testMode = 'false';

function getMethod()
{
	return 'GET';	
}

function getPostParams()
{
    var params = "";    
   
   return params;
}

function isConnectingPage()
{
    var isConnecting = '';
    return (isConnecting == 'true');
}

function initPageCommon()
{
	var isShoppingManualEnabled = "true";
    	if (ecSupportsSession()) {
        	isShoppingManualEnabled = ec.getSessionValue("isShopManEnabled");
    	}
    
    	if (isShoppingManualEnabled != "true") {
    		hideElement("tophelpshadow");
	    	hideElement("help");
    	}
    	
	var ecsUrl = null;
	var iasUrl = null;
	var ccsUrl = null;
	var ucsUrl = null;
	var currBalance = null;

    // js file loading check
	var shopErrCheck = new wiiShop();
	if (shopErrCheck != null && "error" in shopErrCheck) {
		// shopErrCheck.error(209620, 1);
		if (!ecCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!errorCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!buttonsCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!imagesCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!soundCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!shopCheck) {
			shopErrCheck.error(209620, 1);
		} else if (!ossCheck) {
			shopErrCheck.error(209620, 1);
		}
	}

	init();
	
	// Cancel any ongoing async ops
	ec.cancelOperation();
	

	ecsUrl = 'https://ecs.blinklab.com/oss/ecs/services/ECommerceSOAP';

	iasUrl = 'https://ias.blinklab.com/oss/ias/services/IdentityAuthenticationSOAP';

	ccsUrl = 'http://ccs.cdn.blinklab.com/ccs/download';

	ucsUrl = 'https://ccs.blinklab.com/ccs/download';
	

	ec.setWebSvcUrls(ecsUrl, iasUrl);
	ec.setContentUrls (ccsUrl, ucsUrl);
	
	

	imagesPath = "/oss/oss/common/images/";
	htmlPath = "/oss/oss/common/html";
	ossPath = "https://oss-auth.blinklab.com/oss/serv/";
	secureOssPath = "https://oss-auth.blinklab.com/oss/serv/";	

	ecTimeout = new ECTimeout(parseInt("60000"));
	
	
	currBalance = document.getElementById("currentBalance");
	if(currBalance) {
		currBalance.innerHTML = getBalance();
	}		
	
	setLogUrl("Log.jsp");

    if(shop.isCompatibleMode)
    {
        setEulaUrl("L_01.jsp");
    }
    else
    {
        setEulaUrl("L_03_UA_1.jsp");
    }

	
	MM_preloadImages('/oss/oss/common/images//banner/under_banner_a.gif');
	var supportsCreditCard = 'true';
	if (ecSupportsSession()) {
        	ec.setSessionValue("supportsCreditCard", supportsCreditCard);
    	}

    updateHistory();
	var isConnecting = isConnectingPage();
    setConnectingToServer(isConnecting);
    
    if (isHRPDisablePage()) {
	   	wiiDisableHRP();
	} else {
	   	wiiEnableHRP();
	}
}

<!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->


// Takes a progress object and returns the OSS error message to be displayed to the user
function getOssErrorMsg(progress)
{
	if (progress.status >= 0) { return ""; }
	
    var status = progress.status;
    var errCode = progress.errCode;
    var errInfo = progress.errInfo;

    var msg;	

	var a = new Array();	
	// EC lib Errors
	//a[-(EC_ERROR_CANCELED)] = "???OSS_ERROR_NETWORK_TIMEOUT???";
	a[-(EC_ERROR_NET_NA)] = "There was a network error. Please check your Internet settings and your network configuration.";
	a[-(EC_ERROR_ECARD)] = "The activation number you entered is incorrect.<BR><BR>Please try again.";
	a[-(EC_ERROR_REGISTER)] = "The Wii Number you entered is incorrect.";
	a[-(EC_ERROR_ALREADY_OWN)] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	msg = a[-status];

    if (status == EC_ERROR_WS_REPORT) {
    	 msg = getWebServiceErrorMsg(errCode, errInfo);
    } else if (status == EC_ERROR_NET_CONTENT ||
               status == EC_ERROR_FAIL ||
    	       status == EC_ERROR_WS_RECV) {
    	if (errCode != null && errCode < 0) {
    	    var httpStatus = errCodeToHTTPStatus(errCode);
    	    var nhttpStatus = errCodeToNHTTPStatus(errCode);    
      	    if (nhttpStatus == 0 && shop.isCompatibleMode) {
    		    msg = "There was a network error. Check your settings under the Internet option in System Settings on the Wii U Menu.";
    		} else if (nhttpStatus == 0) {
    		    msg = "There was a network error. Please check your Internet settings and your network configuration.";
    		} else if (nhttpStatus != 0) {
    		    msg = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
    		}
    	}
    }
        
    if (msg == null || msg == '') {
    	msg = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	}
	return msg;
}

function setErrorHtmlMsg(elem, errorCode, errorMsg)
{
    var html =
	 	'<span class="warningRed">'
		+ "Error Code: <span id='errorCode'></span></span>"
		+ '<BR><span class="contentsRedM">' + errorMsg + '</span>';
	elem.innerHTML = html;
	document.getElementById("errorCode").innerHTML = errorCode;
}

function setErrorHtml(elem, progress)
{
	if (elem != null) {
	    var errorCode = getOssErrorCode(progress);
    	var errorMsg = getOssErrorMsg(progress);
    	setErrorHtmlMsg(elem, errorCode, errorMsg);
	}
}


// Web service error messages 
// (only include message that may potentially be displayed to user)
// (errCode is progress.errCode from a web service)
// (errInfo is progress.errInfo from a web service)
function getWebServiceErrorMsg(errCode, errInfo)
{
	var a = new Array();
	
	// ECS Errors
	a[617] = "The activation number you entered is incorrect.<BR><BR>Please try again.";
	a[618] = "This Nintendo eShop Card cannot be used in your region.";
	a[621] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[623]	= "You have downloaded this title before, and your trial period has expired. You cannot re-download it.";
	a[642] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[643] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[644] = "Credit cards cannot be used with this console.<BR>Please contact your local customer support centre.<BR>For contact details, visit support.nintendo.com.";
	a[645] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	
	// ECS Gift Errors
	a[646] = "An error has occurred that cannot be resolved at this time. Please try again later.<BR><BR>If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[621] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[626] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[625] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	
	// ETS Errors
	a[705] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[706] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[707] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	
	// PAS Errors
	a[810]	= "An error occurred when processing Wii Points. Please try again.<BR><BR>If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[811]	= "The activation number you entered has expired.";
	//a[812]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[813]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	//a[814]	= "???OSS_ERROR_ECARD_NOT_USABLE???";
	a[815]	= "This Nintendo eShop Card has already been redeemed.";
	a[819]	= "The activation number you entered is incorrect.<BR><BR>Please try again.";
	
	a[826]	= "The server is busy.<BR><BR>Please try again later.";
	a[829]	= "The server is busy.<BR><BR>Please try again later.";
	a[830]	= "The activation number you entered is incorrect.<BR><BR>Please try again.";
	a[831] = "This Nintendo eShop Card cannot be used in your region.";

	// IAS Errors 
	a[901]	= "The Wii Number you entered is incorrect.";
	a[903]	= "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[928] = "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[958]	= "An error has occurred that cannot be resolved at this time.<BR><BR>Please try again later. If this continues, please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[942] = "Unable to confirm the e-mail address at this time because of a server error.<BR><BR>Please try again later.";
	a[943]	= "An error occurred while linking the e-mail address. Please check the e-mail address and password and try again. <BR><BR>If you have forgotten your e-mail address or password, please visit www.club-nintendo.com.";

	a[941] = "An error occurred while linking the e-mail address. Please check the e-mail address and password and try again. <BR><BR>If you have forgotten your e-mail address or password, please visit www.club-nintendo.com.";
	
	// More IAS Errors
	a[1401] = "An error occurred while linking the e-mail address. Please check the e-mail address and password and try again. <BR><BR>If you have forgotten your e-mail address or password, please visit www.club-nintendo.com.";
	a[1402] = "Due to restrictions on your Club Nintendo membership, it cannot be linked to this WiiMart Account.";
        a[1403] = "Due to restrictions on your My Nintendo membership, it cannot be linked to this WiiMart Account.<BR><BR>Visit support.nintendo.com for assistance.";
	a[1499] = "Unable to confirm the User Name at this time. The server is currently undergoing maintenance.<BR><BR>Sorry for the inconvenience. Please try again later.";
	
	// OSS Errors
	a[1610]	= "The Wii Download Ticket you entered has expired.";
	a[1611]	= "The Wii Download Ticket code you entered is incorrect.<BR><BR>Please verify the code and try again.";
	a[1612] = "The Wii Download Ticket you entered cannot be used in your region.<BR><BR>Please verify the code and try again.";
	a[1613] = "There is no software available at this time for the Wii Download Ticket code you entered. Please check you have entered the correct code.<BR><BR>NOTE: If you have activated Parental Controls, you may not be able to view all available software in the WiiMart. Please check your Parental Controls settings.";
	
	
	var msg = a[errCode];
	if(msg == null || msg == "") { // default errors
		if ((errCode >= 1400 && 
		     errCode <= 1499)) {
			msg = "Unable to confirm the e-mail address at this time because of a server error.<BR><BR>Please try again later.";
		}
	}
	return msg;
}

// NOA errors
function getNOAError(code)
{
	var a=new Array();
	
	a[NOA_ERROR_CountyRequired] 				= "(N/A)";
	a[NOA_ERROR_FoundOnBlacklist]				= "This credit card cannot be used.<BR>Please contact your local customer support centre. For contact details, visit support.nintendo.com.";
	a[NOA_ERROR_BillingAddress]                             = "The address you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidCardType]                            = "This credit card number is invalid.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidVfyValue]                            = "The credit card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidCcNumberAndExpDate]                  = "The credit card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidCreditCardNumber]			= "This credit card number is invalid.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidExpDate]				= "The credit card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_InvalidPostalCode]                          = "The postcode does not match the country settings entered in your Wii Settings.<BR><BR>Please verify the information and try again.";
	a[NOA_ERROR_TechnicalDifficulties]			= "Unable to confirm credit card information at this time.<BR><BR>Please try again later.";
	a[NOA_ERROR_TryAgainLater]				= "Unable to confirm credit card information at this time.<BR><BR>Please try again later.";

	a[NOA_RESULT_ERROR_CreditCardDeclined]			= "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Funds]		= "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Inactive]		= "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Exp]		= "The credit card expiration date is invalid.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Code]		= "The credit card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_CCNum]		= "This credit card number is invalid.<BR><BR>Please verify the information and try again.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Limit]            = "This credit card can&rsquo;t be used.<BR><BR>Please contact your credit card company for more information.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_Invalid]		= "The credit card information you&rsquo;ve entered is incorrect.<BR><BR>Please verify the information and try again.";
	a[NOA_RESULT_ERROR_CreditCardDeclined_AVS]		= "(N/A)";

	a[NOA_ERROR_EmptyVfyValue]				= "Please enter the 3 digit security code.";

	var msg = a[code];
	return msg;
}

// IAS errors
function isLoyaltyError(progress)
{
	if (progress.status == EC_ERROR_WS_REPORT) {
		if ((progress.errCode >= 1400 && 
		     progress.errCode <= 1499) ||
			(progress.errCode == 942) ||
			(progress.errCode == 943) ||
			(progress.errCode == 941)) {
			return true;
		}
	}
	return false;
}	

function needCheckRegistration(progress)
{
	if (progress.status == EC_ERROR_WS_REPORT) {
		if ((progress.errCode == 903) ||
		     (progress.errCode == 642) ||
		     (progress.errCode == 625)) {
			return true;
		}
	}
	return false;		
}

function needSyncEticket(progress)
{
	if (progress.status == EC_ERROR_WS_REPORT) {
		if (progress.errCode == 621) {
			return true;
		}
	}
	return false;		
}



//-->

</script>
<title>Wii Software</title>
<style type="text/css">
/* B_02:  Wii Exclusive Software Top */


body,td,th {
	font-family: Wii NTLG Gothic JPN Regular, Wii NTLG PGothic JPN Regular;
	font-size: 22px;
	color: #323232;
}
#text01-01 {
	position:absolute;
	left:29px;
	top:28px;
	width:442px;
	height:28px;
	z-index:49;
}
#text02-01 {	position:absolute;
	left:29px;
	top:80px;
	width:431px;
	height:18px;
	z-index:48;
}
#text03-01 {	position:absolute;
	left:250px;
	top:106px;
	width:318px;
	height:240px;
	z-index:47;
}
#Layer1 {
	position:absolute;
	left:40px;
	top:106px;
	width:195px;
	height:137px;
	z-index:72;
}
#Layer2 {
	position:absolute;
	left:40px;
	top:245px;
	width:195px;
	height:24px;
	z-index:71;
}
.styleInternetChannel {
    font-size: 15px;
    line-height: 17px;	
}
<!--
body {
	background-image: url(/oss/oss/common/images//back/B_02back.gif);
	background-repeat: no-repeat;
}
-->
</style>
<script type="text/JavaScript">
<!--
function initPage()
{
	initPageCommon();
	MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif','/oss/oss/common/images//banner/help_b.gif','/oss/oss/common/images//banner/top_b.gif');
	setUnderButtonL(true, "Back", "javascript:showBack()", "wiiCancelSound()");


}
//-->
</script>
</head>

<body onload="initPage();var shop = new wiiShop();var unused = shop.connecting;">
<!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->
<div id="constElements">
  <div id="tophelpshadow"><img src="/oss/oss/common/images//banner/top_help_shadow01.gif" width="132" height="75" /></div>
  <div id="help">
    <img src="/oss/oss/common/images//banner/help_a.gif" name="ManualImage"
     width="52" height="55" border="0" id="ManualImageID"  onmouseout="MM_swapImgRestore()" 
     onmouseover="MM_swapImage('ManualImage','','/oss/oss/common/images//banner/help_b.gif',1); wiiFocusSound();"
     onclick="showHelp(); wiiSelectSound();"/>
    <img src="/oss/oss/common/images//banner/help_gray.gif" 
     width="52" height="55" border="0" id="ManualGrayImageID" style="display:none" />
    <img src="/oss/oss/common/images//spacer.gif" name="HelpSpacer" width="52" height="55" border="0"
     id='HelpSpacer' style="position:absolute; top:0px; left:0px; display:none"/>
  </div>

  <div id="top">
    <img src="/oss/oss/common/images//banner/top_a.gif" name="TopImage" 
     width="52" height="55" border="0" id="TopImageID" onmouseout="MM_swapImgRestore()" 
     onmouseover="MM_swapImage('TopImage','','/oss/oss/common/images//banner/top_b.gif',1); wiiFocusSound();"
     onclick="showHome(); wiiCancelSound();"/>
    <img src="/oss/oss/common/images//banner/top_gray.gif" 
     width="52" height="55" border="0" id="TopGrayImageID" style="display:none" />
    <img src="/oss/oss/common/images//spacer.gif" name="MainSpacer" width="52" height="55" border="0"
     id='MainSpacer' style="position:absolute; top:0px; left:0px; display:none"/>
  </div>
  
  <div class="dot" id="line01">･･･････････････････････････････････････････････････････････&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;･･</div>
  <div class="dot" id="line02">･･･････････････････････････････････････････････････････････････････････････</div>
  <div class="dot" id="upperLineLong" style="display:none">･･･････････････････････････････････････････････････････････････････････････</div>
  
  <div id='balanceInfo' onclick="showPoints(); wiiSelectSound();" 
   onmouseover="MM_swapImage('PointSpacer','','/oss/oss/common/images//banner/Addpoints_everywhere.gif',1);wiiFocusSound();" 
   onmouseout="MM_swapImgRestore();">
    <script type="text/JavaScript">MM_preloadImages('/oss/oss/common/images//banner/Addpoints_everywhere.gif');</script>
    <img src="/oss/oss/common/images//spacer.gif" name="PointSpacer" width="130" height="55" border="0"
     id='PointSpacer' style="position:absolute; top:376px; left:239px; z-index:20;"/>
    <div id="Wiipoint">
      <div align="center" class="buttonTextBlackM">Wii Points</div>
    </div>
    <div id="point" class="wiiPoint"><span id="currentBalance"></span></div>
  </div>
</div>
<!--  -----------------------------------------------------  -->
<!--  Copyright 2005-2014 Acer Cloud Technology, Inc.        -->
<!--  All Rights Reserved.                                   -->
<!--                                                         -->
<!--  This software contains confidential information and    -->
<!--  trade secrets of Acer Cloud Technology, Inc.           -->
<!--  Use, disclosure or reproduction is prohibited without  -->
<!--  the prior express written permission of Acer Cloud     -->
<!--  Technology, Inc.                                       -->
<!--  -----------------------------------------------------  -->
<script language="JavaScript">MM_preloadImages('/oss/oss/common/images//banner/under_banner_b.gif');</script>
<div id="underButtonL" style="display:none">
    <div id="underbannershadowL" class="buttonBannerShadow">
   	  <img src="/oss/oss/common/images//banner/under_banner_shadow.gif" width="211" height="75" />
   	</div>
    <div id="underbannerL" class="buttonBanner">
    	<img src="/oss/oss/common/images//banner/under_banner_a.gif" width="187" height="55" id="underImgL" />
    </div>
    <div id="underspacerL" class="buttonSpacer">
	  <a href="" id="underlinkL">
    	<img id="underimageL" src="/oss/oss/common/images//spacer.gif" width="187" height="55" border="0"  
    	onmouseover="MM_swapImage('underImgL','','/oss/oss/common/images//banner/under_banner_b.gif',1); snd.playSE( cSE_Forcus );" 
    	onmouseout="MM_swapImgRestore()"/>
      </a>	
    </div>
    <div id="underwordL" align="center" class="buttonTextBlackM buttonWord">
    </div>
</div>

<div id="underButtonR" style="display:none">
    <div id="underbannershadowR" class="buttonBannerShadow">
   	  <img src="/oss/oss/common/images//banner/under_banner_shadow.gif" width="211" height="75" />
   	</div>
    <div id="underbannerR" class="buttonBanner">
    	<img src="/oss/oss/common/images//banner/under_banner_a.gif" width="187" height="55" id="underImgR" />
    </div>
    <div id="underspacerR" class="buttonSpacer">
	  <a href="" id="underlinkR">
    	<img id="underimageR" src="/oss/oss/common/images//spacer.gif" width="187" height="55" border="0"  
    	onmouseover="MM_swapImage('underImgR','','/oss/oss/common/images//banner/under_banner_b.gif',1); snd.playSE( cSE_Forcus ); " 
    	onmouseout="MM_swapImgRestore()"/>
      </a>	
    </div>
    <div id="underwordR" align="center" class="buttonTextBlackM buttonWord">
    </div>
</div>

<div id="underButton" style="display:none">
    <div id="underbannershadow" class="buttonBannerShadow">
    	<img src="/oss/oss/common/images//banner/under_banner_shadow.gif" width="211" height="75" /></div>
    <div id="underbanner" class="buttonBanner">
    	<img src="/oss/oss/common/images//banner/under_banner_a.gif" width="187" height="55" id="underImg" /></div>
    <div id="underspacer" class="buttonSpacer">
	<a href="" id="underlink">
    	<img id="underimage" src="/oss/oss/common/images//spacer.gif" width="187" height="55" border="0" 
    	onmouseover="MM_swapImage('underImg','','/oss/oss/common/images//banner/under_banner_b.gif',1); snd.playSE( cSE_Forcus );" 
    	onmouseout="MM_swapImgRestore()">
    	</a>
    </div>
    <div id="underword" align="center" class="buttonTextBlackM buttonWord"></div>
</div>


<div id="text01-01" align="left" class="titleBlackL">
  Wii Software</div>
<div id="text02-01" align="left" class="headerBlueM">
  Get new Wii Channels here.</div>
<div id="text03-01" class="catalogTitleBlack_01">The WiiMart isn&rsquo;t just about downloading Virtual Console games 窶錀 we&rsquo;ve also created new software just for Wii. One example is the Internet Channel.<BR><BR>The Internet Channel allows you to surf the web from the comfort of your couch. We&rsquo;re planning to release the Internet Channel in the near future. Check back often for this and other exciting Channels.</div>
<div id="Layer1">
    <img src="/oss/oss/common/images//banner/wii_ware_Google_AllLang.gif" width="195" height="137" border=0/>
</div>
<div style="font-size: 12px;" class="contentsBlack" id="Layer2">
  <div align="left">Google is a trademark of Google Inc.</div>
</div>

</body>
</html>
