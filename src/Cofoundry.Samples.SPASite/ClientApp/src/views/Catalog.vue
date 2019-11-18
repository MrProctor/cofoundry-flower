<template>
    <main>

        <div style="margin-top:30px;"><span class="colored-header">Каталог</span> <span class="selected-category">Роза Джумилия: 89</span></div>
        <div class="content">
            <div class="catalog-menu">
                <category-list v-if="searchResult" :result="categoryList"/>
            </div>
            <div class="grid-wrapper">
                <loader :is-loading="loading"/>              
                <paging />
                <cat-grid v-if="searchResult" :result="searchResult"/>
                <hr style="opacity: 0.3;">
                <paging />
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
                    <router-link to="/catalog" class="menu-link">Каталог</router-link>
                </li>
                <li>
                    <router-link to="/company" class="menu-link">О компании</router-link>
                </li>
                <li>
                    <router-link to="/delivery" class="menu-link">Доставка и Оплата</router-link>
                </li>
                <li>
                    <router-link to="/contacts" class="menu-link">Контакты</router-link>
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
import CatGrid from "@/components/CatGrid";
import CategoryList from "@/components/CategoryList";
import Paging from "@/components/Paging";
import catsApi from "@/api/cats";
import categoriesApi from "@/api/categories";
import Loader from "@/components/Loader";

export default {
    name: "catalog",
    components: {
        CatGrid,
        CategoryList,
        Loader,
        Paging
    },
    data() {
        return {
            loading: false,
            searchResult: null,
            categoryList: null
        };
    },
    created() {
        this.loadGrid();
        this.loadCategories();
    },
    watch: {
        $route: "loadGrid"
    },
    methods: {
        loadGrid() {
            this.loading = true;

            catsApi.searchCats().then(result => {
                this.loading = false;
                this.searchResult = result;
            }).catch(x=> {

            });
        },

        loadCategories() {
            categoriesApi.searchCategories().then(result => {
                this.categoryList = result;
            }).catch(x=> {

            });
        }
    }
};
</script>

<style scoped lang="scss">
.colored-header {
    font-family: Playfair Display;
    font-style: normal;
    font-weight: 900;
    font-size: 50px;
    line-height: 67px;
    /* identical to box height */

    color: #FF7676;
}
.selected-category {
    font-family: 'Playfair Display';
    font-style: normal;
    font-weight: normal;
    font-size: 50px;
    line-height: 67px;
    /* identical to box height */

    font-feature-settings: 'pnum' on, 'lnum' on;
    margin-left:30px;
    color: #E2E7EC;
}

.content {
    display:flex;
    flex-direction: row;
}

.catalog-menu {
    width:240px;
}

.grid-wrapper {
    width:100%;
    margin-top: 70px;
    padding-bottom: 50px;
    @include respond-min($tablet) {
        max-width: $layout-max-width;
        margin: 70px auto 0 auto;
    }
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
