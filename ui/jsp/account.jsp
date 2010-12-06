<%@ page import="java.util.*" %>

<%@ page import="com.cloud.utils.*" %>

<%
    Locale browserLocale = request.getLocale();
    CloudResourceBundle t = CloudResourceBundle.getBundle("resources/resource", browserLocale);
%>
<!-- account detail panel (begin) -->
<!-- Loading -->
    
 
<div class="main_title" id="right_panel_header">
    <div class="main_titleicon">
        <img src="images/title_accountsicon.gif" alt="Accounts" /></div>
    <h1>
        Accounts</h1>
</div>
<div class="contentbox" id="right_panel_content">
	
    <div class="info_detailbox errorbox" id="after_action_info_container_on_top" style="display: none">
        <p id="after_action_info">
        </p>
    </div>
    <div class="tabbox" style="margin-top: 15px;">
        <div class="content_tabs on">
            <%=t.t("Details")%></div>
    </div> 
    <div id="tab_content_details">
        <div class="rightpanel_mainloader_panel" style="display:none;">
              <div class="rightpanel_mainloaderbox">
                   <div class="rightpanel_mainloader_animatedicon"></div>
                   <p>Loading &hellip;</p>    
              </div>               
        </div>
        <div class="grid_container">
        	<div class="grid_header">
            	<div id="grid_header_title" class="grid_header_title">(title)</div>
                <div id="action_link" class="grid_actionbox" id="account_action_link">
                    <div class="grid_actionsdropdown_box" id="action_menu" style="display: none;">
                        <ul class="actionsdropdown_boxlist" id="action_list">
                        	<li><%=t.t("no.available.actions")%></li>
                        </ul>
                    </div>
                </div>
                <div class="gridheader_loaderbox" id="spinning_wheel" style="border: 1px solid #999;
                display: none;">
                    <div class="gridheader_loader" id="icon">
                    </div>
                    <p id="description">
                        Detaching Disk &hellip;</p>
                </div>
            </div>
            <div class="grid_rows odd">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("ID")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="id">
                    </div>
                </div>
            </div>
            <div class="grid_rows even">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("Role")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="role">
                    </div>
                </div>
            </div>
            <div class="grid_rows odd">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("Account")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="account">
                    </div>
                </div>
            </div>
            <div class="grid_rows even">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("Domain")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="domain">
                    </div>
                </div>
            </div>
            <div class="grid_rows odd">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("VMs")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="vm_total">
                    </div>
                </div>
            </div>
            <div class="grid_rows even">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("IPs")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="ip_total">
                    </div>
                </div>
            </div>
            <div class="grid_rows odd">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("Bytes.Received")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="bytes_received">
                    </div>
                </div>
            </div>
            <div class="grid_rows even">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("Bytes.Sent")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="bytes_sent">
                    </div>
                </div>
            </div>
            <div class="grid_rows odd">
                <div class="grid_row_cell" style="width: 20%;">
                    <div class="row_celltitles">
                        <%=t.t("State")%>:</div>
                </div>
                <div class="grid_row_cell" style="width: 79%;">
                    <div class="row_celltitles" id="state">
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- account detail panel (end) -->


<div id="dialog_resource_limits" title="Resource Limits" style="display:none">
	<p>
	    <%=t.t("please.specify.limits.to.the.various.resources.-1.means.the.resource.has.no.limits")%>	    
	</p>
	<div class="dialog_formcontent">
		<form action="#" method="post" id="form_acquire">
			<ol>
				<li>
					<label><%=t.t("instance.limit")%>:</label>
					<input class="text" type="text" name="limits_vm" id="limits_vm" value="-1" />
					<div id="limits_vm_errormsg" class="dialog_formcontent_errormsg" style="display:none;"></div> 
				</li>
				<li>
					<label><%=t.t("public.ip.limit")%>:</label>
					<input class="text" type="text" name="limits_ip" id="limits_ip" value="-1" />
					<div id="limits_ip_errormsg" class="dialog_formcontent_errormsg" style="display:none;"></div> 
				</li>
				<li>
					<label><%=t.t("disk.volume.limit")%>:</label>
					<input class="text" type="text" name="limits_volume" id="limits_volume" value="-1" />
					<div id="limits_volume_errormsg" class="dialog_formcontent_errormsg" style="display:none;"></div> 
				</li>
				<li>
					<label><%=t.t("snapshot.limit")%>:</label>
					<input class="text" type="text" name="limits_snapshot" id="limits_snapshot" value="-1" />
					<div id="limits_snapshot_errormsg" class="dialog_formcontent_errormsg" style="display:none;"></div> 
				</li>
				<li>
					<label><%=t.t("template.limit")%>:</label>
					<input class="text" type="text" name="limits_template" id="limits_template" value="-1" />
					<div id="limits_template_errormsg" class="dialog_formcontent_errormsg" style="display:none;"></div> 
				</li>
			</ol>
		</form>
	</div>
</div>

<div id="dialog_disable_account" title="Disable account" style="display:none">
    <p>
        <%=t.t("please.confirm.you.want.to.disable.account.that.will.prevent.account.access.to.the.cloud.and.shut.down.all.existing.virtual.machines")%>        
    </p>
</div>

<div id="dialog_lock_account" title="Lock account" style="display:none">
    <p>
        <%=t.t("please.confirm.you.want.to.lock.account.that.will.prevent.account.access.to.the.cloud")%>        
    </p>
</div>

<div id="dialog_enable_account" title="Enable account" style="display:none">
    <p>
        <%=t.t("please.confirm.you.want.to.enable.account")%>        
    </p>
</div>

<!-- Add User Dialog (begin)-->
<div id="dialog_add_user" title="Add New user" style="display: none">   
    <div class="dialog_formcontent">
        <form action="#" method="post" id="form_acquire">
        <ol>
            <li>
                <label for="add_user_username">
                    User name:</label>
                <input class="text" type="text" id="add_user_username" />
                <div id="add_user_username_errormsg" class="dialog_formcontent_errormsg" style="display: none;">
                </div>
            </li>
            <li>
                <label for="add_user_password">
                    Password:</label>
                <input class="text" type="password" id="add_user_password"
                    autocomplete="off" />
                <div id="add_user_password_errormsg" class="dialog_formcontent_errormsg" style="display: none;">
                </div>
            </li>
            <li>
                <label for="add_user_email">
                    Email:</label>
                <input class="text" type="text" id="add_user_email" />
                <div id="add_user_email_errormsg" class="dialog_formcontent_errormsg" style="display: none;">
                </div>
            </li>
            <li>
                <label for="add_user_firstname">
                    First name:</label>
                <input class="text" type="text" id="add_user_firstname" />
                <div id="add_user_firstname_errormsg" class="dialog_formcontent_errormsg" style="display: none;">
                </div>
            </li>
            <li>
                <label for="add_user_lastname">
                    Last name:</label>
                <input class="text" type="text" id="add_user_lastname" />
                <div id="add_user_lastname_errormsg" class="dialog_formcontent_errormsg" style="display: none;">
                </div>
            </li>
            <li>
                <label for="add_user_account">
                    Account:</label>
                <input class="text" type="text" id="add_user_account" />
                <div id="add_user_account_errormsg" class="dialog_formcontent_errormsg" style="display: none;">
                </div>
            </li>
            <li>
                <label for="add_user_account_type">
                    Role:</label>
                <select class="select" id="add_user_account_type">
                    <option value="0">User</option>
                    <option value="1">Admin</option>
                </select>
            </li>
            <li>
                <label for="add_user_domain">
                    Domain:</label>
                <select class="select" id="domain_dropdown">
                </select>
            </li>
            <li>
                <label for="add_user_timezone">
                    Time Zone:</label>
                <select class="select" id="add_user_timezone" style="width: 240px">
                    <option value=""></option>
                    <option value='Etc/GMT+12'>[UTC-12:00] GMT-12:00</option>
                    <option value='Etc/GMT+11'>[UTC-11:00] GMT-11:00</option>
                    <option value='Pacific/Samoa'>[UTC-11:00] Samoa Standard Time</option>
                    <option value='Pacific/Honolulu'>[UTC-10:00] Hawaii Standard Time</option>
                    <option value='US/Alaska'>[UTC-09:00] Alaska Standard Time</option>
                    <option value='America/Los_Angeles'>[UTC-08:00] Pacific Standard Time</option>
                    <option value='Mexico/BajaNorte'>[UTC-08:00] Baja California</option>
                    <option value='US/Arizona'>[UTC-07:00] Arizona</option>
                    <option value='US/Mountain'>[UTC-07:00] Mountain Standard Time</option>
                    <option value='America/Chihuahua'>[UTC-07:00] Chihuahua, La Paz</option>
                    <option value='America/Chicago'>[UTC-06:00] Central Standard Time</option>
                    <option value='America/Costa_Rica'>[UTC-06:00] Central America</option>
                    <option value='America/Mexico_City'>[UTC-06:00] Mexico City, Monterrey</option>
                    <option value='Canada/Saskatchewan'>[UTC-06:00] Saskatchewan</option>
                    <option value='America/Bogota'>[UTC-05:00] Bogota, Lima</option>
                    <option value='America/New_York'>[UTC-05:00] Eastern Standard Time</option>
                    <option value='America/Caracas'>[UTC-04:00] Venezuela Time</option>
                    <option value='America/Asuncion'>[UTC-04:00] Paraguay Time</option>
                    <option value='America/Cuiaba'>[UTC-04:00] Amazon Time</option>
                    <option value='America/Halifax'>[UTC-04:00] Atlantic Standard Time</option>
                    <option value='America/La_Paz'>[UTC-04:00] Bolivia Time</option>
                    <option value='America/Santiago'>[UTC-04:00] Chile Time</option>
                    <option value='America/St_Johns'>[UTC-03:30] Newfoundland Standard Time</option>
                    <option value='America/Araguaina'>[UTC-03:00] Brasilia Time</option>
                    <option value='America/Argentina/Buenos_Aires'>[UTC-03:00] Argentine Time</option>
                    <option value='America/Cayenne'>[UTC-03:00] French Guiana Time</option>
                    <option value='America/Godthab'>[UTC-03:00] Greenland Time</option>
                    <option value='America/Montevideo'>[UTC-03:00] Uruguay Time]</option>
                    <option value='Etc/GMT+2'>[UTC-02:00] GMT-02:00</option>
                    <option value='Atlantic/Azores'>[UTC-01:00] Azores Time</option>
                    <option value='Atlantic/Cape_Verde'>[UTC-01:00] Cape Verde Time</option>
                    <option value='Africa/Casablanca'>[UTC] Casablanca</option>
                    <option value='Etc/UTC'>[UTC] Coordinated Universal Time</option>
                    <option value='Atlantic/Reykjavik'>[UTC] Reykjavik</option>
                    <option value='Europe/London'>[UTC] Western European Time</option>
                    <option value='CET'>[UTC+01:00] Central European Time</option>
                    <option value='Europe/Bucharest'>[UTC+02:00] Eastern European Time</option>
                    <option value='Africa/Johannesburg'>[UTC+02:00] South Africa Standard Time</option>
                    <option value='Asia/Beirut'>[UTC+02:00] Beirut</option>
                    <option value='Africa/Cairo'>[UTC+02:00] Cairo</option>
                    <option value='Asia/Jerusalem'>[UTC+02:00] Israel Standard Time</option>
                    <option value='Europe/Minsk'>[UTC+02:00] Minsk</option>
                    <option value='Europe/Moscow'>[UTC+03:00] Moscow Standard Time</option>
                    <option value='Africa/Nairobi'>[UTC+03:00] Eastern African Time</option>
                    <option value='Asia/Karachi'>[UTC+05:00] Pakistan Time</option>
                    <option value='Asia/Kolkata'>[UTC+05:30] India Standard Time</option>
                    <option value='Asia/Bangkok'>[UTC+05:30] Indochina Time</option>
                    <option value='Asia/Shanghai'>[UTC+08:00] China Standard Time</option>
                    <option value='Asia/Kuala_Lumpur'>[UTC+08:00] Malaysia Time</option>
                    <option value='Australia/Perth'>[UTC+08:00] Western Standard Time (Australia)</option>
                    <option value='Asia/Taipei'>[UTC+08:00] Taiwan</option>
                    <option value='Asia/Tokyo'>[UTC+09:00] Japan Standard Time</option>
                    <option value='Asia/Seoul'>[UTC+09:00] Korea Standard Time</option>
                    <option value='Australia/Adelaide'>[UTC+09:30] Central Standard Time (South Australia)</option>
                    <option value='Australia/Darwin'>[UTC+09:30] Central Standard Time (Northern Territory)</option>
                    <option value='Australia/Brisbane'>[UTC+10:00] Eastern Standard Time (Queensland)</option>
                    <option value='Australia/Canberra'>[UTC+10:00] Eastern Standard Time (New South Wales)</option>
                    <option value='Pacific/Guam'>[UTC+10:00] Chamorro Standard Time</option>
                    <option value='Pacific/Auckland'>[UTC+12:00] New Zealand Standard Time</option>
                </select>
            </li>
        </ol>
        </form>
    </div>
</div>
<!-- Add User Dialog (end)-->

<!-- advanced search template (begin) -->
<div id="advanced_search_template" class="adv_searchpopup" style="display: none;">
    <div class="adv_searchformbox">
        <h3>
            Advance Search</h3>
        <a id="advanced_search_close" href="#">Close </a>
        <form action="#" method="post">
        <ol>
            <li>
                <label>
                    Name:</label>
                <input class="text" type="text" id="adv_search_name" />
            </li>
            <li>
                <label>
                    Role:</label>
                <select class="select" id="adv_search_role">
                    <option value=""></option>                    
                    <option value="0">User</option>
                    <option value="2">Domain-Admin</option>
                    <option value="1">Admin</option>
                </select>
            </li>
        </ol>
        </form>
        <div class="adv_search_actionbox">
            <div class="adv_searchpopup_button" id="adv_search_button">
            </div>
        </div>
    </div>
</div>
<!-- advanced search template (end) -->