<template>
    <main>
        <div class="circle-background"></div>
        <div class="hero">
            <div class="up-block">
                <div class="logo">
                    О компании
                </div>
                <div class="intro">
                    <p>Компания “Цветомир” - крупнейший оптовый поставщик цветов в России. 
                        Предлагаем выгодные условия для сотрудничества владельцам цветочных бутиков, флористам и тем, кто готов присоединиться к бизнесу.</p>
                </div>
            </div>
            <div><img src="../assets/company-hero.png" /></div>
        </div>

        <div class="company-story">
            <div><img src="../assets/flower-heart.png" width="520" hight="400"/></div>
            <div class="company-text">
                <p style="margin-top: 0;">Мы начали работу в 1998 году в Ижевске. Тогда в компании работали всего 4 человека. Это был обычный склад площадью 53 квадратных метра с вывеской.
                     Бизнес развивался стремительно. Перед кризисом 2008 года у нас было 26 торговых точек в Ижевске.</p>
                <p>Пришел кризис. Он сильно потрепал наш бизнес. Наша модель строилась в сотрудничестве с продуктовой компанией «Айкай».
                     В 2008 они обанкротились, а мы потеряли 23 торговые точки.
                     Это был серьёзный удар, но если нести клиентам счастье и позитив, можно пережить любую трудную ситуацию.</p>
                <p>Компания продолжила существование. Было принято решение изменить подход к бизнесу и постепенно вернуть утраченные позиции.
                     Если раньше компания перепродавала цветы, купленные у оптовых поставщиков,
                      то новый формат деятельности предполагал организацию площадей по выращиванию цветов.</p>
            </div>
        </div>
        <div class="info">
            <div class="info-header">
                Крупнейший оптовый поставщик цветов
            </div>
            <div class="info-blocks">
                <div class="block">
                    <div class="block-image"><img style="margin-top: 16px;" src="../assets/flower.png"/></div>
                    <div class="text">
                        Компания “Цветомир” - крупнейший оптовый поставщик цветов в России.
                         Предлагаем выгодные условия для сотрудничества владельцам цветочных бутиков,
                          флористам и тем, кто готов присоединиться к бизнесу.
                    </div>
                </div>
                <div class="block">
                    <div class="block-image"><img style="margin-top: 22px;margin-left: 6px;" src="../assets/truck.png"/></div>
                    <div class="text">
                        Минимальный срок доставки в центральной части России – 1 сутки. В любую другую точку страны – 2 суток.
                         Это максимально короткие сроки, за которые физически можно сформировать,
                          обработать и направить заказчику партию цветов, используя авиасообщение.
                    </div>
                </div>
                <div class="block">
                    <div class="block-image"><img style="margin-top: 19px;margin-left: 6px;" src="../assets/devices.png"/></div>
                    <div class="text">
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
                    <router-link to="/" class="menu-link">Каталог</router-link>
                </li>
                <li>
                    <router-link to="/company" class="menu-link">О компании</router-link>
                </li>
                <li>
                    <router-link to="/login" class="menu-link">Доставка и Оплата</router-link>
                </li>
                <li>
                    <router-link to="/register" class="menu-link">Контакты</router-link>
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
    </main>
</template>

<script>

export default {
    name: "company"
};
</script>

<style scoped lang="scss">
.hero {
    padding: 0 2rem 0 2rem;
    color: #AE9999;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-between;
    position: relative;
    z-index:99;
    background: #F6F7F8;
    height:450px;
    @include respond-min($tablet) {
        padding: 1rem 2rem 0 2rem;
    }
}

.up-block {
        display: flex;
    flex-direction: column;
    align-items: center;
}
        
.logo {
    display: inline-block;
    font-family: 'Playfair Display';
    font-style: normal;
    font-weight: 900;
    font-size: 50px;
    line-height: 67px;

    text-align: center;
    color: #FF7676;
}

.intro {
    display: inline-block;
    margin: 1rem 2rem 0 2rem;
    font-family: TT Norms;
    font-style: normal;
    font-weight: normal;
    font-size: 18px;
    line-height: 25px;

    text-align: center;

    color: #948E8E;
    @include respond-min($tablet) {
        max-width: 45rem;
    }
}

.company-story {
    padding: 80px 0;
    display:flex;
    flex-direction: row;
    justify-content: space-around;
    @include respond-min($tablet) {
        max-width: $layout-max-width;
        margin: 0 auto 0 auto;
    }
}

.company-text {
    width:580px;
    font-family: 'TT Norms';
    font-style: normal;
    font-weight: normal;
    font-size: 18px;
    line-height: 25px;
    color: #948E8E;
}

.grid-header {
    position: relative;
    z-index: 99;
    text-align: center;
    font-family: 'Playfair Display';
    font-style: normal;
    font-weight: 900;
    font-size: 35px;
    line-height: 47px;
    text-align: center;

    color: #323630;
}

.circle-background {
    position:absolute;
    width: 1954px;
    height: 1954px;
    left:-18%;
    top: -1319px;
    z-index:0;
    border-radius: 50%;
    background: linear-gradient(180deg, #FFEEEE 55.05%, #FFD3D3 100%, #FFCCCD 100%) ;
    background-image: url("../assets/circle pic.png") no-repeat cover;
    background-size: cover;
    display: none;
    // @media screen and (max-width:$desktop-medium) {
    //     width: 1954px;
    //     height: 1954px;
    //     left:-8%;
    //     top: -1319px;
    // }
}

.catalog_btn {
    background: #FFFFFF;
    box-shadow: 0px 5px 15px rgba(139, 74, 74, 0.15);
    border-radius: 100px;
    background: #FFFFFF;
    padding:16px 36px;
    border:none;
    font-family: Montserrat;
    font-style: normal;
    font-weight: bold;
    font-size: 14px;
    line-height: 17px;  
    text-align: center;
}

.catalog_btn-grid {
    background: #FFFFFF;
    border-radius: 50px;
    padding:16px 36px;
    font-family: Montserrat;
    font-style: normal;
    font-weight: bold;
    font-size: 16px;
    line-height: 20px; 
    text-align: center;
    width:310px;
    margin:0 auto;
    display:block;
    border: 1px solid #E4E4E4;
    box-sizing: border-box;
    }


.info {
    background: url("../assets/flower-background1.png") no-repeat;
    padding-bottom: 110px;
    background-size: cover;
}

.info-blocks {
    display:flex;
    flex-direction: row;
    flex-grow: 1;
    justify-content: space-around;
}

.info-header {
    padding:60px 0 50px 0;
    font-family: 'Playfair Display';
    font-style: normal;
    font-weight: 900;
    font-size: 40px;
    line-height: 40px;
    text-align: center;
    color: #323630;
    width:450px;
    margin: 0 auto;
}

.block-image {
    border-radius: 100px;
    background: #FE9C9C;
    box-shadow: 0px 5px 15px rgba(139, 74, 74, 0.15);
    border-radius: 100px;
    width: 80px;
    height: 80px;
    text-align: center;
    margin: 0 auto;
}

.block {
    width:320px;
}

.block .text {
    margin-top:20px;
    font-family: Montserrat;
    font-style: normal;
    font-weight: normal;
    font-size: 14px;
    line-height: 25px;
    text-align: center;
    color: #423737;
}

.wrapper {
    background: transparent;
    position: relative;
    z-index:99;
    padding: 15px;
}

.container {
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    max-width: $layout-max-width;
    margin: 0 auto;
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
