<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HOME</title>
    <link rel="stylesheet" href="../lib/css/index.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container__fw">
        <nav class="navbar sticky-top navigation">
            <div class="container-fluid">
                <a class="navbar-brand poppins__regular__fw" href="#">
                    <img src="../lib/dist/icons/logo.png" class="mx-2" alt="logo" width="80" />
                </a>
                <div class="fw__right">
                    <span class="badge rounded-pill fw__right__bal">
                        <div class="d-flex justify-content-between">
                            <div class="fw__peso">
                                <img src="../lib/dist/icons/peso.png" width="20" alt="peso" />
                            </div>
                            <div class="my-auto">
                                <span class="poppins__regular__fw mx-2" id="balance">0.00</span>
                            </div>
                        </div>
                    </span>
                    <img src="../lib/dist/icons/wallet.png" class="mx-2" alt="wallet" width="30" id="depositBtn" />
                </div>
            </div>
        </nav>
        <div class="main__fw">
            <!-- Swiper -->
            <swiper-container class="mySwiper" pagination="true" pagination-clickable="false" navigation="false" space-between="30"
            centered-slides="true" autoplay-delay="3000" autoplay-disable-on-interaction="false">
                <swiper-slide>
                    <img src="../lib/dist/banners/MiniApp-RealtimeGaming.png" class="img-fluid rounded"/>
                </swiper-slide>
                <swiper-slide>
                    <img src="../lib/dist/banners/MiniApp-Evolution_1.png" class="img-fluid rounded"/>
                </swiper-slide>
                <swiper-slide>
                    <img src="../lib/dist/banners/MiniApp-BFGames.png" class="img-fluid rounded"/>
                </swiper-slide>
            </swiper-container>
            <div class="fw__marquee my-2">
                <span class="badge w-100 fw__marquee_badge">
                    <img src="../lib/dist/icons/megaphone.png" width="20" alt="megaphone"/>
                    <marquee width="95%" direction="left" class="text-dark poppins__regular__fw my-auto">
                        This is a sample scrolling text that has scrolls in the upper direction.
                    </marquee>
                </span>
            </div>
            <h6 class="title poppins__regular__fw py-2">Game Category</h6>
            <header class="header poppins__regular__fw">
                <ul class="pills">
                  <li class="pill poppins__regular__fw headers active" onclick="loadGames('All')">All</li>
                  <li class="pill poppins__regular__fw headers" onclick="loadGames('iBingo')">iBingo</li>
                  <li class="pill poppins__regular__fw headers" onclick="loadGames('Live')">Live</li>
                  <li class="pill poppins__regular__fw headers" onclick="loadGames('Slot')">Slot</li>
                  <li class="pill poppins__regular__fw headers" onclick="loadGames('Table')">Table</li>
                </ul>
            </header>
            <div class="row game__card" id="game__card"></div>
        </div>
        <nav>
            <div class="nav-box">
                <ul class="nav-container">
                    <li class="nav__item">
                        <a href="/pages/promo.aspx" class="nav__item-link">
                            <div class="nav__item-icon">
                                <img src="../lib/dist/icons/gift-svgrepo-com.svg" alt="Promo" width="25" />
                            </div>
                            <span class="nav__item-text poppins__regular__fw nav__bot__fw">Promo</span>
                        </a>
                    </li>
                    <li class="nav__item">
                        <a href="/pages/faq.aspx" class="nav__item-link">
                            <div class="nav__item-icon">
                                <img src="../lib/dist/icons/faq-svgrepo-com.svg" alt="Faq" width="25" />
                            </div>
                            <span class="nav__item-text poppins__regular__fw nav__bot__fw">Faq</span>
                        </a>
                    </li>
                    <li class="nav__item active">
                        <a href="/pages" class="nav__item-link">
                            <div class="nav__item-icon">
                                <img src="../lib/dist/icons/logo.png" alt="logo" width="40" />
                            </div>
                            <span class="nav__item-text poppins__regular__fw nav__bot__fw">Home</span>
                        </a>
                    </li>
                    <li class="nav__item">
                        <a href="/pages/transaction.aspx" class="nav__item-link">
                            <div class="nav__item-icon">
                                <img src="../lib/dist/icons/file-check-alt-svgrepo-com.svg" alt="Transactions" width="25" />
                            </div>
                            <span class="nav__item-text poppins__regular__fw nav__bot__fw">Transactions</span>
                        </a>
                    </li>
                    <li class="nav__item">
                        <a href="/pages/profile.aspx" class="nav__item-link">
                            <div class="nav__item-icon">
                                <img src="../lib/dist/icons/user-svgrepo-com.svg" alt="Profile" width="25" />
                            </div>
                            <span class="nav__item-text poppins__regular__fw nav__bot__fw">Profile</span>
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        <!-- Modal -->
        <div class="modal fade" id="depositModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-fullscreen-sm-down">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="container">
                            <div class="d-flex justify-content-between">
                                <h1 class="modal-title fs-5 poppins__regular__fw fw__cash__in">Cash in</h1>
                                <button type="button" class="btn-close" id="closeCashInModal" aria-label="Close"></button>
                            </div>
                            <h1 class="modal-title poppins__regular__fw fw__cash__in3 mt-4">Amount</h1>
                            <div class="form-floating">
                                <input type="text" class="form-control poppins__regular__fw fs-5" id="txtAmount" placeholder="Amount" disabled autofocus />
                                <label for="floatingInput" class="mb-1 poppins__regular__fw">Amount</label>
                            </div>
                            <h1 class="modal-title poppins-regular fw__cash__in2 mt-4 mb-2">Choose from the amounts below (PHP)</h1>
                            <div class="row d-flex justify-content-center text-center">
                                <div class="col">
                                    <button type="button" class="btn btn-light btn-md button-amount mb-2 px-4 py-3 poppins__regular__fw fw__cash__in__amount">100</button>
                                </div>
                                <div class="col">
                                    <button type="button" class="btn btn-light btn-md button-amount mb-2 px-4 py-3 poppins__regular__fw fw__cash__in__amount">500</button>
                                </div>
                                <div class="col">
                                    <button type="button" class="btn btn-light btn-md button-amount mb-2 px-4 py-3 poppins__regular__fw fw__cash__in__amount">1,000</button>
                                </div>                            
                            </div>
                            <div class="row d-flex justify-content-center text-center">
                                <div class="col p-0">
                                    <button type="button" class="btn btn-light btn-md button-amount mb-2 px-4 py-3 poppins__regular__fw fw__cash__in__amount">2,000</button>
                                </div>
                                <div class="col p-0">
                                    <button type="button" class="btn btn-light btn-md button-amount mb-2 px-4 py-3 poppins__regular__fw fw__cash__in__amount">3,000</button>
                                </div>
                                <div class="col p-0">
                                    <button type="button" class="btn btn-light btn-md button-amount mb-2 px-4 py-3 poppins__regular__fw fw__cash__in__amount">5,000</button>
                                </div>
                            </div>
                            <div class="row d-flex justify-content-center text-center">
                                <div class="col p-0">
                                    <button type="button" class="btn btn-light btn-md button-amount mb-2 px-4 py-3 poppins__regular__fw fw__cash__in__amount">10,000</button>
                                </div>
                                <div class="col p-0">
                                    <button type="button" class="btn btn-light btn-md button-amount mb-2 px-4 py-3 poppins__regular__fw fw__cash__in__amount">30,000</button>
                                </div>
                                <div class="col p-0">
                                    <button type="button" class="btn btn-light btn-md button-amount mb-2 px-4 py-3 poppins__regular__fw fw__cash__in__amount">50,000</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button class="btn btn-lg btn-success m-3 poppins__regular__fw p-3 fw__cashin__btn" id="btnBuy_Credits" disabled="disabled">Continue</button>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.2.0/crypto-js.min.js"></script>
    <script src="../lib/js/lobby.js"></script>
</body>
</html>
