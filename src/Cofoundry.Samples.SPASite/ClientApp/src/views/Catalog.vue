<template>
    <main>
        <offer-dialog />
        <div style="margin-top:30px;"><span class="colored-header">Каталог</span> <span class="selected-category">Роза Джумилия: 89</span></div>
        <div class="content">
            <div class="catalog-menu">
                <category-list :result="categoryList"/>
            </div>
            <div class="grid-wrapper">
                <loader :is-loading="loading"/>              
                <paging v-if="info" :pagingInfo="info" @loadFilteredGrid="loadGrid"/>
                <cat-grid />
                <hr style="opacity: 0.3;">
                <paging v-if="info" :pagingInfo="info" @loadFilteredGrid="loadGrid"/>
            </div>
        </div>
    </main>
</template>

<script>
import CatGrid from "@/components/CatGrid";
import CategoryList from "@/components/CategoryList";
import Paging from "@/components/Paging";
import catsApi from "@/api/cats";
import categoriesApi from "@/api/categories";
import Loader from "@/components/Loader";
import OfferDialog from "@/components/OfferDialog";

export default {
    name: "catalog",
    components: {
        CatGrid,
        CategoryList,
        Loader,
        Paging,
        OfferDialog
    },
    data() {
        return {
            loading: false,
            searchResult: null,
            categoryList: null,
            info: {
                pageSize: 30,
                pageNumber: 1,
                pageCount: 1,
                totalItems: 0
            }
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
        loadGrid(pageSize, pageNumber) {
            this.loading = true;
            catsApi.searchCats(pageSize, pageNumber).then(result => {
                this.loading = false;
                this.$store.dispatch('cats/changeFlowersList', result.items)
                this.info = {
                    pageSize: result.pageSize,
                    pageNumber: result.pageNumber,
                    pageCount: result.pageCount,
                    totalItems: result.totalItems
                }
            }).catch(()=> {

            });
        },

        loadCategories() {
            categoriesApi.searchCategories().then(result => {
                this.categoryList = result;
            }).catch(()=> {

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



</style>
