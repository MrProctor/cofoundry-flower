<template>
    <div class="wrapper" v-if="result">
        <div v-for="root in result" :key="root.Name" 
        v-on:click="toggleCategory(root)">
            <div class="root-cat">
                <img class="shevron" src="../assets/chevron_down_grey.png" v-if="!root.isShow"/>
                <img class="shevron" src="../assets/chevron_up_pink.png" v-if="root.isShow"/>
                <span class="root-name">{{root.name}}</span>
            </div>
            <div v-show="root.isShow" v-for="cat in root.categories" :key="cat.categoryId" v-on:click.stop="toggleCategory">
                <div class="cat-name" v-on:click="loadGrid(pageSize, 1, cat.categoryId)">{{cat.name}}</div>
            </div>
        </div>
    </div>
</template>

<script>
import catsApi from "@/api/cats";

export default {
    name: "CategoryList",
    data() {
        return {
            pageSize: this.$store.state.cats.pageSize
            }
    },
    props: {
        result: Array
    },
    methods: {
        toggleCategory: function(root){
            root.isShow = root.isShow ? false : true;
        },
        loadGrid(pageSize, pageNumber, categoryId) {
            this.loading = true;
            catsApi.searchCats(pageSize, pageNumber, categoryId).then(result => {
                this.loading = false;
                this.$store.dispatch('cats/changeFlowersList', result.items)
                this.info = {
                    pageSize: result.pageSize,
                    pageNumber: result.pageNumber,
                    pageCount: result.pageCount,
                    totalItems: result.totalItems
                }
            }).catch(x=> {
                console.log(x)
            });
        }
      }
};
</script>

<style scoped lang="scss">
.root-cat {
    font-family: 'TT Norms';
    font-style: normal;
    font-weight: bold;
    font-size: 18px;
    line-height: 21px;

    color: #FF7676;
    display: flex;
    align-items: center;
    cursor:pointer;
}

.cat-name {
    font-family: 'TT Norms';
font-style: normal;
font-weight: 500;
font-size: 14px;
line-height: 25px;
/* or 179% */
cursor:pointer;

color: #323630;
}

.root-name {
    margin-left:10px;
}

.shevron {
    width:8px;
    height: 5px;
}

.hidden {
    display:none;
}
</style>
