$(() => {
    if ($(window).width() < 414) {
        $('.container__fw').css('width', `${$(window).width()}px`)
        $('.nav__footer').css('width', `${$(window).width()}px`)
    }
    loadGames('All')
    getBalance()
})

var key = CryptoJS.enc.Utf8.parse('8080808080808080');
var iv = CryptoJS.enc.Utf8.parse('8080808080808080');

// Deposit Button
$('#depositBtn').click(() => {
    $('#depositModal').modal('show')
})

$('.button-amount').on('click', function (e) {
    e.preventDefault()
    var amount = $(this).text()
    amount = amount.replace(",", "")
    $("#txtAmount").val(amount)
    $('#btnBuy_Credits').removeAttr('disabled', 'disabled')
})

$('#closeCashInModal').click(() => {
    $("#txtAmount").val('')
    $('#btnBuy_Credits').attr('disabled', 'disabled')
    $('#depositModal').modal('hide')
})

//const list = document.querySelectorAll(".nav__item");
//list.forEach((item) => {
//    item.addEventListener("click", () => {
//        list.forEach((item) => item.classList.remove("active"));
//        item.classList.add("active");
//    });
//});

const list = document.querySelectorAll(".headers");
list.forEach((item) => {
    item.addEventListener("click", () => {
        list.forEach((item) => item.classList.remove("active"));
        item.classList.add("active");
    });
});

const arrGames = [
    {
        images: 'gp-caleta.png',
        name: 'Caleta',
        playButton: `onclick="play('Caleta')"`,
        category: ['Slot', 'iBingo']
    },
    {
        images: 'gp-maxfair.png',
        name: 'MaxFair',
        playButton: `onclick="play('MaxFair')"`,
        category: ['iBingo']
    },
    {
        images: 'gp-vibra.png',
        name: 'Vibra',
        playButton: `onclick="play('Vibra')"`,
        category: ['Slot']
    },
    {
        images: 'gp-bigtimegaming.png',
        name: 'Evolution',
        playButton: `onclick="play('BigTimeGaming')"`,
        category: ['Slot']
    },
    {
        images: 'gp-netent.png',
        name: 'Evolution',
        playButton: `onclick="play('NetEnt')"`,
        category: ['Slot']
    },
    {
        images: 'gp-nlc.png',
        name: 'Evolution',
        playButton: `onclick="play('NoLimitCity')"`,
        category: ['Slot']
    },
    {
        images: 'gp-aruze.png',
        name: 'Aruze',
        playButton: `onclick="play('Aruze')"`,
        category: ['Slot']
    },
    {
        images: 'gp-bfgames.png',
        name: 'BFGames',
        playButton: `onclick="play('BFGames')"`,
        category: ['Slot']
    },
    {
        images: 'gp-tomhorn.png',
        name: 'TomHorn',
        playButton: `onclick="play('TomHorn')"`,
        category: ['Slot', 'Live', 'Table']
    },
    {
        images: 'gp-rdt.png',
        name: 'Red Thunder',
        playButton: `onclick="play('Red Thunder')"`,
        category: ['Slot']
    },
    {
        images: 'gp-zitro.png',
        name: 'Zitro',
        playButton: `onclick="play('Zitro')"`,
        category: ['iBingo']
    },
    {
        images: 'gp-s.png',
        name: 'SAGaming',
        playButton: `onclick="play('SAGaming')"`,
        category: ['Live']
    },
    {
        images: 'gp-rtg.png',
        name: 'RealTimeGaming',
        playButton: `onclick="play('RealTimeGaming')"`,
        category: ['Slot']
    },
]

const loadGames = (categ) => {
    const games = arrGames.sort((a, b) => a.name.localeCompare(b.name, 'es', { sensitivity: 'base' })).filter((result) => {
        return categ === 'All' ? result : result.category.toString().toLowerCase().includes(categ.toString().toLowerCase())
    }).map((res) => {
        return `<div class="col image__game_col mx-auto" ${res.playButton}>
                    <img src="../lib/dist/games/${res.images}" class="mb-2 image__game" alt="${res.name}" data-provider="${res.name}" />
                </div>`
    })
    $('#game__card').html(games)
}

const play = (gameName) => {
    console.log("Game Name: ", gameName)
}

const getBalance = () => {
    $.ajax({
        type: "POST",
        url: "../ajax/GetBalance.aspx",
        beforeSend: function () {
            
        },
        success: ((response) => {
            var user_bal = parseFloat(response);
            $('#balance').text(parseFloat(user_bal).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,'))
        }),
        error: ((err) => {
            $('#loading').removeClass('is-active')
            console.log(err)
        })
    })
}