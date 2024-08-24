<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Transactions</title>
    <link rel="stylesheet" href="../lib/css/index.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container__fw">
        <nav class="navbar sticky-top bg-primary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <img src="../lib/dist/icons/arrow-left-solid.svg" alt="arrow-left-solid" width="18" id="goBackToHome" />
                </a>
                <h6 class="my-auto poppins__regular__fw text-white">Transactions</h6>
                <div class="fw__right"></div>
            </div>
        </nav>
        <nav class="navbar sticky-top bg-white shadow-sm p-2 bg-white rounded">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <p class="mb-0 py-1 poppins__regular__fw" style="font-size: 14px;"><span id="dateAsOf"></span></p>
                </a>
                <img src="../lib/dist/icons/file-lines-regular.svg" alt="file-lines-regular" width="15" id="dateRange" class="cursor__pointer" />
            </div>
        </nav>
        <div class="main__fw2 mt-2">
            <div class="row" id="cashTrans"></div>
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
                    <li class="nav__item">
                        <a href="/pages" class="nav__item-link">
                            <div class="nav__item-icon">
                                <img src="../lib/dist/icons/logo.png" alt="logo" width="40" />
                            </div>
                            <span class="nav__item-text poppins__regular__fw nav__bot__fw">Home</span>
                        </a>
                    </li>
                    <li class="nav__item active">
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
        <div class="modal fade" id="viewModalTrans" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered modal-dialog-sm">
                <div class="modal-content trans__modal">
                    <div class="modal-body">
                        <h6 class="poppins__regular__fw mb-3" style="font-weight: 600;letter-spacing: 0.8px;">Transaction Details</h6>
                        <div class="d-flex justify-content-between my-2 mb-2">
                            <div>
                                <p class="mb-0 text-secondary poppins__regular__fw modal__trans__font">Date & Time</p>
                            </div>
                            <div>
                                <p class="mb-0 text-end poppins__regular__fw text-dark modal__trans__font" id="viewDateTime">-</p>
                            </div>
                        </div>
                        <div class="d-flex justify-content-between my-2">
                            <div>
                                <p class="mb-0 text-secondary poppins__regular__fw modal__trans__font">Amount</p>
                            </div>
                            <div>
                                <p class="mb-0 text-end poppins__regular__fw text-dark modal__trans__font" id="viewAmount">-</p>
                            </div>
                        </div>
                        <div class="d-flex justify-content-between my-2">
                            <div>
                                <p class="mb-0 text-secondary poppins__regular__fw modal__trans__font">Channel</p>
                            </div>
                            <div>
                                <p class="mb-0 text-end poppins__regular__fw text-dark modal__trans__font" id="viewChannel">-</p>
                            </div>
                        </div>
                        <div class="d-flex justify-content-between my-2">
                            <div>
                                <p class="mb-0 text-secondary poppins__regular__fw modal__trans__font">Transaction Type</p>
                            </div>
                            <div>
                                <p class="mb-0 text-end poppins__regular__fw modal__trans__font" id="viewType">-</p>
                            </div>
                        </div>
                        <div class="d-flex justify-content-between my-2">
                            <div>
                                <p class="mb-0 text-secondary poppins__regular__fw modal__trans__font">Status</p>
                            </div>
                            <div>
                                <p class="mb-0 text-end poppins__regular__fw modal__trans__font" id="viewStatus">-</p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer" style="background: #fffdfd;">
                        <button type="button" class="btn btn-primary w-100 poppins__regular__fw py-2 btn__modal__trans" data-bs-dismiss="modal">Okay</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Full screen modal -->
    <div class="modal fade" id="viewModalDate" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content trans__modal2">
                <div class="modal-body">
                    asdsad
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.30.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/4.2.0/crypto-js.min.js"></script>
    <script src="../lib/js/transaction.js"></script>
</body>
</html>