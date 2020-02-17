<template>
    <main>
        <div class="circle-background"></div>
        <div class="hero">
            <div class="logo">
                Доставка и оплата
            </div>
            <div class="intro">
                <p>Компания “Цветомир” - крупнейший оптовый поставщик цветов в России. 
                    Предлагаем выгодные условия для сотрудничества владельцам цветочных бутиков, флористам и тем, кто готов присоединиться к бизнесу.</p>
            </div>
        </div>

        <div class="delivery">
            <div class="info-header">
                Способы доставки
            </div>
            <div class="info-blocks">
                <div class="block">
                    <div class="block-image"><img style="margin-top: 22px;margin-left: 6px;" src="../assets/truck.png"/></div>
                    <div class="block-header">
                        Доставка транспортной компанией по РФ
                    </div>
                    <div class="block-text">
                        Минимальный срок доставки в центральной части России – 1 сутки. В любую другую точку страны – 2 суток.
                         Это максимально короткие сроки, за которые физически можно сформировать, обработать и направить заказчику партию цветов, используя авиасообщение.
                    </div>
                </div>
                <div class="block">
                    <div class="block-image" ><img style="margin-top: 11px;" src="../assets/deliver.png"/></div>
                    <div class="block-header">
                        Доставка курьером по городу
                    </div>
                    <div class="block-text">
                        Минимальный срок доставки в центральной части России – 1 сутки. В любую другую точку страны – 2 суток.
                         Это максимально короткие сроки, за которые физически можно сформировать, обработать и направить заказчику партию цветов, используя авиасообщение.
                    </div>
                </div>
                <div class="block">
                    <div style="width:80px;height:80px;margin:0 auto;"><img style="margin-top: -5px;" src="../assets/target.png"/></div>
                    <div class="block-header">
                        Список городов для доставки
                    </div>
                    <div class="block-text">
                        Москва, Санкт Петербург, Казань, Пермь, Ижевск, Березники, Сыктывкар, Киров, Нижнекамск, Кудымкар 
                    </div>
                </div>
            </div>
        </div>

        <div class="payment">
            <div class="info-header">
                Способы оплаты
            </div>
            <div class="info-blocks">
                <div class="block">
                    <div class="block-image"><img style="margin-top: 26px;" src="../assets/credit-card.png"/></div>
                    <div class="block-header">
                        Банковской картой
                    </div>
                    <div class="block-text">
                        При выборе формы оплаты с помощью пластиковой карты проведение платежа по заказу производится непосредственно после его оформления.
                    </div>
                </div>
                <div class="block">
                    <div class="block-image"><img style="margin-top: 10px;" src="../assets/money.png"/></div>
                    <div class="block-header">
                        Наличными
                    </div>
                    <div class="block-text">
                        При выборе формы оплаты с помощью пластиковой карты проведение платежа по заказу производится непосредственно после его оформления.
                    </div>
                </div>
                <div class="block">
                    <div class="block-image"><img style="margin-top: 17px;" src="../assets/bank.png"/></div>
                    <div class="block-header">
                        Банковским переводом
                    </div>
                    <div class="block-text">
                        При выборе формы оплаты с помощью пластиковой карты проведение платежа по заказу производится непосредственно после его оформления. 
                    </div>
                </div>
                <div class="block">
                    <div style="width:80px;height:80px;margin:0 auto;"><img style="margin-top: -5px;margin-left: -5px;" src="../assets/cancel.png"/></div>
                    <div class="block-header">
                        Отмена заказа
                    </div>
                    <div class="block-text">
                        При удалении товаров из оплаченного заказа или при аннулировании заказа целиком 
                        Вы можете заказать другой товар на такую же сумму, либо полностью вернуть всю сумму на карту с помощью Вашего менеджера.
                    </div>
                </div>
            </div>
        </div>
    </main>
</template>

<script>

export default {
    name: "delivery"
};
</script>

<style scoped lang="scss">
.delivery {
    height: 540px;
    background: #F6F7F9;
}

.payment {
    height: 500px;
}

.hero {
    padding: 0 2rem 0 2rem;
    color: #AE9999;
    display: flex;
    flex-direction: column;
    align-items: center;
    position: relative;
    z-index:99;
    background:url("../assets/delivery-hero.png"), #F6F7F8;
    background-size:contain;
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
