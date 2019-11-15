<template>
    <nav class="wrapper">
        <div class="container">
            <router-link to="/" class="logo">SPA Cats</router-link>
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
            <div class="navbar_info">
                <div class="navbar_info-phone">8 800 762-32-32</div>
                <div class="navbar_info-label">Бесплатный звонок по РФ</div>
            </div>
        </div>
    </nav>
</template>

<script>
import { mapState, mapActions } from "vuex";

export default {
    name: "SiteNav",
    computed: mapState("auth", ["member"]),
    methods: mapActions("auth", ["signOut"])
};
</script>

<style scoped lang="scss">
.wrapper {
    background: transparent;
    background: #F6F7F8;
    position: relative;
    z-index:99;
}

.container {
    
    display: flex;
    flex-direction: column;
    align-items: center;
    padding: 0 2rem;
    @include respond-min($tablet) {
        flex-direction: row;
        justify-content: space-around;
        max-width: $layout-max-width;
        margin: 0 auto;
    }
}

.menu {
    list-style-type: none;
    margin: 0;
    padding: 0;
    
    li {
        display: inline-block;
    }

    &-link {
        display: inline-block;
        background-color: transparent;
        border: 0;
        color: #000;
        padding: 0.5rem 1rem;
        margin: 0.5rem 0;
        text-decoration: none;
        cursor: pointer;
        font-family: Montserrat;
        font-style: normal;
        font-weight: normal;
        font-size: 16px;
        line-height: 20px;
        color: #8B7575;
    }

    @include respond-min($tablet) {

        &-link {
            padding: 0 1rem;
            margin: 0;
            line-height: 60px;
        }
    }
}

.navbar_info {
    &-phone {
        font-family: Playfair Display;
        font-style: normal;
        font-weight: bold;
        font-size: 22px;
        line-height: 29px;
        text-align: right;
        text-transform: uppercase;
        font-feature-settings: 'case' on;
    }

    &-label {
        font-family: Montserrat;
        font-style: normal;
        font-weight: normal;
        font-size: 12px;
        line-height: 15px;
        color: #999999;
        text-align: right;
    }
}

.logo {
    background: url("../assets/logo.png") no-repeat left top;
    background-size: cover;
    display: inline-block;
    width: 108px;
    height: 85px;
    margin-top: 1rem;

    @include hide-text();
    
    @include respond-min($tablet) {
        margin-top: 0;
    }
}
</style>
