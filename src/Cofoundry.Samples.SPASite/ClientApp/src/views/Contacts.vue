<template>
    <main>
        <div class="circle-background"></div>
        <div class="hero">
            <div class="up-block">
                <div class="logo">
                    Контакты
                </div>
                <div class="intro">
                    <p>Компания “Цветомир” - крупнейший оптовый поставщик цветов в России. 
                        Предлагаем выгодные условия для сотрудничества владельцам цветочных бутиков, флористам и тем, кто готов присоединиться к бизнесу.</p>
                </div>
            </div>
            <div class="info-blocks contacts">
                <div class="block">
                    <div class="block-image"><img style="margin-top: 21px;" src="../assets/phone.png"/></div>
                    <div class="block-header">
                        Позвонить нам
                    </div>
                    <div class="block-text">
                        Вы можете позвонить нам по номеру: <strong>8 (937) 625-46-94</strong>
                    </div>
                </div>
                <div class="block">
                    <div class="block-image"><img style="margin-top: 27px;margin-left: -8px;" src="../assets/message.png"/></div>
                    <div class="block-header">
                        Написать нам
                    </div>
                    <div class="block-text">
                        Связаться с нами по электронной почте: <strong>info@cvetomir.ru</strong>
                    </div>
                </div>
                <div class="block">
                    <div style="width:80px;height:80px;margin:0 auto;"><img style="margin-top: -5px;" src="../assets/target.png"/></div>
                    <div class="block-header">
                        Головной офис
                    </div>
                    <div class="block-text">
                        Головной офис в городе Ижевске находится по адресу: <strong>Ижевск, ул. Новоажимова, 13</strong> 
                        <p>Схема проезда</p>
                    </div>
                </div>
            </div>
            <div style="background:#F6F7F8;margin-top: -50px;"><img src="../assets/hero-contacts.png" /></div>
        </div>

        <div class="company-story">
            <div class="grid-header">Как нас найти</div>
            <div style="width:100%">
                <iframe style="border: none;width:100%;margin-top:30px;"  src="https://yandex.ru/map-widget/v1/-/CGTHuAkM" width="960" height="450" frameborder="1" allowfullscreen="true"></iframe>
            </div>
        </div>
    </main>
</template>

<script>

export default {
    name: "contacts"
};
</script>

<style scoped lang="scss">

.contacts {
    margin-top:40px;
}

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
    flex-direction: column;
    justify-content: center;
    align-items: center;
    @include respond-min($tablet) {
        max-width: $layout-max-width;
        margin: 100px auto 0 auto;
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
</style>
