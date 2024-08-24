<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile</title>
    <link rel="stylesheet" href="../lib/css/index.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet" />
</head>
<body>
    <div class="container__fw">
        <nav class="navbar sticky-top bg-primary">
            <div class="container-fluid py-2">
                <a class="navbar-brand poppins-regular" href="#">
                    <%--<img src="../lib/dist/icons/angle-left-solid.svg" alt="back" width="12" />--%>
                    <p></p>
                </a>
                <h6 class="my-auto poppins__regular__fw text-light">Profile</h6>
                <div class="fw__right">
                    <h6 class="my-auto poppins__regular__fw text-light cursor__pointer">Edit</h6>
                </div>
                
            </div>
        </nav>
        <div class="main__fw2 mt-2">
            <div class="profile__form">
                <div class="text-center">
                    <img src="../lib/dist/icons/images.jpg" class="fw___profile__img my-3" alt="profile" />
                    <h5 class="poppins__regular__fw my-2">Juan Dela Cruz</h5>
                    <h6 class="poppins__regular__fw mb-3">6450-8107-4076-0062</h6>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlTextarea1" class="form-label poppins__regular__fw">Address</label>
                    <textarea class="form-control poppins__regular__fw" id="exampleFormControlTextarea1" rows="2" disabled></textarea>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label poppins__regular__fw">Source of Income</label>
                    <select class="form-select" aria-label="Default select example" disabled>
                        <option selected>Select</option>
                        <option value="1">Salary</option>
                        <option value="Business/Self Employment">Business/Self Employment</option>
                        <option value="Pesnsion">Pension</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label poppins__regular__fw">Occupation</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="Occupation" disabled>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label poppins__regular__fw">Primary ID Type</label>
                    <select class="form-select" aria-label="Default select example" disabled>
                        <option selected>Select</option>
                        <option value="1">Salary</option>
                        <option value="Business/Self Employment">Business/Self Employment</option>
                        <option value="Pesnsion">Pension</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="exampleFormControlInput1" class="form-label poppins__regular__fw">Primary ID No.</label>
                    <input type="text" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com" disabled>
                </div>
                <div class="mb-3">
                    <label for="formFile" class="form-label poppins__regular__fw">Primary ID Photo</label>
                    <input class="form-control" type="file" id="formFile" disabled>
                </div>
            </div>
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
                <li class="nav__item">
                    <a href="/pages/transaction.aspx" class="nav__item-link">
                        <div class="nav__item-icon">
                            <img src="../lib/dist/icons/file-check-alt-svgrepo-com.svg" alt="Transactions" width="25" />
                        </div>
                        <span class="nav__item-text poppins__regular__fw nav__bot__fw">Transactions</span>
                    </a>
                </li>
                <li class="nav__item active">
                    <a href="/profile.aspx" class="nav__item-link">
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