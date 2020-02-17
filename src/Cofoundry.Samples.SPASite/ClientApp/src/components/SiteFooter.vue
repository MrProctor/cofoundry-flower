<template>
    <div class="wrapper">
        <div class="info">
            <div class="info-header">
                Крупнейший оптовый поставщик цветов
            </div>
            <div class="info-blocks">
                <div class="block">
                    <div class="block-image"><img style="margin-top: 16px;" src="../assets/flower.png"/></div>
                    <div class="block-text">
                        Компания “Цветомир” - крупнейший оптовый поставщик цветов в России.
                         Предлагаем выгодные условия для сотрудничества владельцам цветочных бутиков,
                          флористам и тем, кто готов присоединиться к бизнесу.
                    </div>
                </div>
                <div class="block">
                    <div class="block-image"><img style="margin-top: 22px;margin-left: 6px;" src="../assets/truck.png"/></div>
                    <div class="block-text">
                        Минимальный срок доставки в центральной части России – 1 сутки. В любую другую точку страны – 2 суток.
                         Это максимально короткие сроки, за которые физически можно сформировать,
                          обработать и направить заказчику партию цветов, используя авиасообщение.
                    </div>
                </div>
                <div class="block">
                    <div class="block-image"><img style="margin-top: 19px;margin-left: 6px;" src="../assets/devices.png"/></div>
                    <div class="block-text">
                        В случае если Ваш банк поддерживает технологию безопасного проведения интернет-платежей
                         Verified By Visa или MasterCard Secure Code для проведения платежа также может потребоваться
                          ввод специального пароля.
                    </div>
                </div>
            </div>
        </div>
        <nav class="wrapper">
            <div class="container">
            <ul class="menu">
                <li>
                    <router-link to="/catalog" class="menu-link" v-bind:class="{colored: $route.path==='/catalog'}" >Каталог</router-link>
                </li>
                <li>
                    <router-link to="/company" class="menu-link" v-bind:class="{colored: $route.path==='/company'}">О компании</router-link>
                </li>
                <li>
                    <router-link to="/delivery" class="menu-link" v-bind:class="{colored: $route.path==='/delivery'}">Доставка и Оплата</router-link>
                </li>
                <li>
                    <router-link to="/contacts" class="menu-link" v-bind:class="{colored: $route.path==='/contacts'}">Контакты</router-link>
                </li>
            </ul>
            <div class="links">
                <a><img class="vk-link" src="../assets/vk.png" /></a>
                <a><img class="instagram-link" src="../assets/instagram.png" /></a>
            </div>
            <div class="navbar_info">
                <div class="navbar_info-phone">8 800 762-32-32</div>
                <div class="navbar_info-label">Бесплатный звонок по РФ</div>
            </div>
            </div>
        </nav>
    </div>
</template>

<script>

export default {
    name: "SiteFooter",
};
</script>

<style lang="scss">
.wrapper {
    background: transparent;
    position: relative;
    z-index:99;
}

.container {
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    max-width: $layout-max-width;
    margin: 0 auto;
}

.colored {
    color: #FF7676 !important;
}

.menu {
    list-style-type: none;
    margin: 0;
    padding: 0;
    
    li {
        display: inline-block;
    }

}

.menu-link {
        display: inline-block;
        background-color: transparent;
        border: 0;
        color: #000;
        text-decoration: none;
        cursor: pointer;
        font-family: Montserrat;
        font-style: normal;
        font-weight: normal;
        font-size: 16px;
        line-height: 20px;
        color: #000000;
        padding: 0 1rem;
        margin: 0;
        line-height: 60px;
    }

.navbar_info {
    margin-top: 5px;
}

.navbar_info-phone {
        font-family: Playfair Display;
        font-style: normal;
        font-weight: bold;
        font-size: 22px;
        line-height: 29px;
        text-align: right;
        text-transform: uppercase;
        font-feature-settings: 'case' on;
    }

.navbar_info-label {
    font-family: Montserrat;
    font-style: normal;
    font-weight: normal;
    font-size: 12px;
    line-height: 15px;
    color: #999999;
    text-align: right;
}

.links {
    margin-top: 10px;
}

.vk-link, .instagram-link {
    padding:0 10px;
    cursor:pointer;
}


</style>
