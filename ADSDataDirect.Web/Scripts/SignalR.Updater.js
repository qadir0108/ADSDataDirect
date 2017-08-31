// Crockford's supplant method (poor man's templating)
if (!String.prototype.supplant) {
    String.prototype.supplant = function (o) {
        return this.replace(/{([^{}]*)}/g,
            function (a, b) {
                var r = o[b];
                return typeof r === 'string' || typeof r === 'number' ? r : a;
            }
        );
    };
}

$(function () {

    var hub = $.connection.wFPICTHub;
    var systemLogs = $('#systemLogs');
    var rowTemplate = '<div class="row"><div class="col-md-2">{CreatedAt}</div><div class="col-md-1">{LogType}</div><div class="col-md-1" style="text-align: right;">{OrderNumber}</div><div class="col-md-8">{Message}</div></div>';
    //function init() {
    //    return hub.server.getAllDevTests().done(function (devTests) {
    //        debugger;
    //        tblDevTestsBody.empty();
    //        $.each(devTests, function () {
    //            debugger;
    //            tblDevTestsBody.append(rowTemplate.supplant(this));
    //        });
    //    });
    //}

    $.extend(hub.client, {
        refresh: function (logs) {
            //debugger;
            systemLogs.empty();
            $.each(logs, function () {
                //debugger;
                systemLogs.append(rowTemplate.supplant(this));
            });
            //wfp.showSuccess(message, true, '/Visitor/Index');
        }
    });

    $.connection.hub.start()
        //.then(init)
        .done(function (state) {
            debugger;
            //hub.server.startUpdatingClients();
        });
});