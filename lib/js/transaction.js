$(() => {
    var start = moment().hours(6).minutes(0).seconds(0);
    var end = moment().add(1, "days").startOf('hour').hours(5).minutes(59).seconds(59);

    console.log(start.toDate())
    console.log(end.toDate())
    GetList(start.toDate(), end.toDate())
    console.log($(window).width())
})

var key = CryptoJS.enc.Utf8.parse('8080808080808080');
var iv = CryptoJS.enc.Utf8.parse('8080808080808080');

function GetList(df, dt) {
    var encryptedDate = CryptoJS.AES.encrypt(CryptoJS.enc.Utf8.parse(`df=${df.toLocaleString()}&dt=${dt.toLocaleString()}`), key,
        {
            keySize: 128 / 8,
            iv: iv,
            mode: CryptoJS.mode.CBC,
            padding: CryptoJS.pad.Pkcs7
        }
    );

    $.ajax({
        type: "POST",
        url: "../ajax/GetTransactions.aspx",
        beforeSend: (() => {
            $('#loading').addClass('is-active')
        }),
        data: {
            data: encryptedDate.toString()
        },
        success: function (result) {
            $('#loading').removeClass('is-active')
            result = result.split("%");
            var html2 = '';

            if (result.length - 1 <= 0) {
                html2 = `<p class="poppins__regular__fw text-center my-3" style="font-size: 14px;">No available transaction.</p>`
            }
            else {
                for (var i = 0; i < result.length - 1; i++) {
                    var res = result[i].split("$");
                    var NetworkCode = res[0].split("_");
                    NetworkCode = NetworkCode[1];
                    var SupplierName = res[1];
                    var DateCreated = res[2];
                    var TerminalAccount = res[3];
                    var Amount = res[4];
                    var GuestName = res[5];
                    var IsCashIn = res[6];
                    var Status = res[7];
                    var TranSource = res[8];
                    var TranMode = res[9];

                    var badgeColor = ""
                    var badgeColor2 = ""
                    var badgeColor3 = ""

                    if (TranSource == 1) {
                        IsCashIn = "Transfer";
                        badgeColor = "warning";
                    }
                    else {
                        if (IsCashIn == 1) {
                            IsCashIn = "Deposit";
                            badgeColor = "success";
                        }
                        else {
                            IsCashIn = "Withdraw";
                            badgeColor = "danger";
                        }
                    }

                    if (Status == 1) {
                        Status = "Posted";
                        badgeColor2 = "primary";
                    }
                    else {
                        Status = "Unposted";
                        badgeColor2 = "danger";
                    }


                    if (TranMode == 1) {
                        TranMode = "CASH";
                        badgeColor3 = "secondary";
                    }
                    else if (TranMode == 2) {
                        TranMode = "ONLINE PSP-MAYA";
                        badgeColor3 = "info";
                    }
                    else if (TranMode == 3) {
                        TranMode = "Online PSP-FORTUNE PAY";
                        badgeColor3 = "info";
                    }
                    else if (TranMode == 4) {
                        TranMode = "Online PSP-PISOPAY";
                        badgeColor3 = "info";
                    }

                    
                    html2 += `<div class="d-flex justify-content-between my-2">
                        <div>
                            <p class="mb-0 poppins__regular__fw withdraw__text__code__2 withdraw__text_codes">${SupplierName}</p>
                            <p class="mb-0 text-secondary poppins__regular__fw withdraw__text__code">${moment(DateCreated).format("MMMM D YYYY hh:mm A")}</p>
                            <span class="badge text-bg-${badgeColor} poppins__regular__fw" style="font-size: 10px;">${IsCashIn}</span>
                        </div>
                        <div>
                            <span class="mb-0 text-end poppins__regular__fw withdraw__text__code__2 mx-1">${parseFloat(Amount).toFixed(2)}</span>
                            <img src="../lib/dist/icons/ellipsis-solid.svg" class="mx-1" alt="back" width="20" onclick="viewModal('${DateCreated}','${Amount}','${TranMode}', '${Status}', '${badgeColor2}', '${IsCashIn}')">
                        </div>
                    </div>
                    <hr>`
                }
            }
            $('#dateAsOf').text(`Transaction as of ${moment(new Date()).format("MMM DD, YYYY")}`)
            $('#cashTrans').html(html2)
        }
    });
}

function viewModal(date, amount, tranMode, status, colorStatus, type) {
    $('#viewModalTrans').modal('show')
    console.log(date)
    console.log(parseFloat(amount).toFixed(2))
    $('#viewDateTime').text(moment(date).format("MMMM D, YYYY hh:mm A"))
    $('#viewAmount').text(parseFloat(amount).toFixed(2))
    $('#viewChannel').text(tranMode)
    $('#viewStatus').text(status)
    $('#viewStatus').addClass(`text-${colorStatus}`)
    $('#viewType').text(type)
}

$('#dateRange').click(() => {
    $('#viewModalDate').modal('show')
})

$('#goBackToHome').click(() => {
    window.open('/pages', '_self')
})