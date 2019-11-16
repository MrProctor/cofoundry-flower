import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Catalog from './views/Catalog.vue'

Vue.use(Router)

export default new Router({
    mode: 'history',
    base: process.env.BASE_URL,
    routes: [{
        path: '/',
        name: 'home',
        component: Home
    }, {
        path: '/catalog',
        name: 'catalog',
        component: Catalog
    }, {
        path: '/company',
        name: 'company',
        component: () => import(/* webpackChunkName: "Company" */ './views/Company.vue')
    }, {
        path: '/delivery',
        name: 'delivery',
        component: () => import(/* webpackChunkName: "Company" */ './views/Delivery.vue')
    }, {
        path: '/contacts',
        name: 'contacts',
        component: () => import(/* webpackChunkName: "Company" */ './views/Contacts.vue')
    }, {
        path: '/cat/:id',
        name: 'catDetails',
        component: () => import(/* webpackChunkName: "CatDetails" */ './views/CatDetails.vue')
    }, {
        path: '/login',
        name: 'login',
        component: () => import(/* webpackChunkName: "Login" */ './views/Login.vue')
    }, {
        path: '/register',
        name: 'register',
        component: () => import(/* webpackChunkName: "Register" */ './views/Register.vue')
    }, {
        path: '*',
        name: 'NotFound',
        component: () => import(/* webpackChunkName: "404" */ './views/NotFound.vue')
    } ]
})
