<!DOCTYPE html>
<html>
<head>
    <title>Page Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/resources/jquery/jquery.mobile-1.4.5.min.css" />
    <script src="/resources/jquery/jquery-1.11.1.min.js"></script>
    <script src="/resources/jquery/jquery.mobile-1.4.5.min.js"></script>
</head>

<body>
<div data-role="page">
    <div data-role="header">
        <h1>Welcome To My Homepage</h1>
    </div>

    <div data-role="main" class="ui-content">
        <a href="#myPopup" data-rel="popup" class="ui-btn ui-btn-inline ui-corner-all ui-icon-check ui-btn-icon-left">Popup Selection Menu</a>

        <div data-role="popup" id="myPopup" class="ui-content" style="min-width:350px;">
            <form method="post" action="demoform.asp">
                <fieldset class="ui-field-contain">
                    <label for="day">Select Day</label>
                    <select name="day" id="day">
                        <option value="mon">Monday</option>
                        <option value="tue">Tuesday</option>
                        <option value="wed">Wednesday</option>
                        <option value="thu">Thursday</option>
                        <option value="fri">Friday</option>
                        <option value="sat">Saturday</option>
                        <option value="sun">Sunday</option>
                    </select>
                </fieldset>
                <input type="submit" data-inline="true" value="Submit">
            </form>
        </div>
    </div>

    <div data-role="footer">
        <h1>Footer Text</h1>
    </div>
</div>
</body>
</html>