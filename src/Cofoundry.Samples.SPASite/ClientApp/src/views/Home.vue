<template>
    <main>
        <div class="circle-background"></div>
        <div class="hero">
            <div class="logo">
                • ЦВЕТОМИР •
            </div>
            <div class="intro">
                <p>Компания “Цветомир” - крупнейший оптовый поставщик цветов в России.
                     Предлагаем выгодные условия для сотрудничества владельцам цветочных бутиков, флористам и тем, кто готов присоединиться к бизнесу.</p>
            </div>
            <button class="catalog_btn">Смотреть каталог</button>
        </div>

        <div class="grid-wrapper">
            <loader :is-loading="loading"/>
            <div class="grid-header">Более 250 наименований цветов</div>
            <cat-grid v-if="searchResult" :result="searchResult"/>
            <button class="catalog_btn-grid">Посмотреть весб каталог</button>
        </div>
    </main>
</template>

<script>
import CatGrid from "@/components/CatGrid";
import catsApi from "@/api/cats";
import Loader from "@/components/Loader";

export default {
    name: "home",
    components: {
        CatGrid,
        Loader
    },
    data() {
        return {
            loading: false,
            searchResult: null
        };
    },
    created() {
        this.loadGrid();
    },
    watch: {
        $route: "loadGrid"
    },
    methods: {
        loadGrid() {
            this.loading = false;

            catsApi.searchCats().then(result => {
                this.loading = false;
                this.searchResult = result;
            }).catch(()=> {

            });
        }
    }
};
</script>

<style scoped lang="scss">
.hero {
    padding: 110px 2rem 2rem 2rem;
    color: #AE9999;
    display: flex;
    flex-direction: column;
    align-items: center;
    font-family: Montserrat;
    font-style: normal;
    font-weight: normal;
    font-size: 16px;
    line-height: 25px;
    text-align: center;
    position: relative;
    z-index:99;
    height: 650px;
    background: url("../assets/hero-background.png") no-repeat,  #F6F7F8;
    background-size: cover;
    @include respond-min($tablet) {
        padding: 110px 2rem 4rem 2rem;
    }
}
        
.logo {
    display: inline-block;
    font-family: Playfair Display;
    font-style: normal;
    font-weight: 900;
    font-size: 50px;
    line-height: 67px;
    color: #000000;
    text-align: center;
    letter-spacing: 0.25em;
    text-transform: uppercase;
}

.intro {
    display: inline-block;
    margin: 1rem 2rem 0 2rem;
    font-size: 1.2rem;
    text-align: center;
    @include respond-min($tablet) {
        max-width: 45rem;
    }
}

.grid-wrapper {
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
