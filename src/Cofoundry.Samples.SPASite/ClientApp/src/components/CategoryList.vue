<template>
    <div class="wrapper" v-if="result">
        <div v-for="root in result" :key="root.Name" 
        v-on:click="toggleCategory(root)">
            <div class="root-cat">
                <img class="shevron" src="../assets/chevron_right.png"/><span class="root-name">{{root.name}}</span>
            </div>
            <div v-show="root.isShow" v-for="cat in root.categories" :key="cat.categoryId">
                <div class="cat-name">{{cat.name}}</div>
            </div>
        </div>
    </div>
</template>

<script>

export default {
    name: "CategoryList",
    data: ()=> {
        return {isHidden:true}
    },
    props: {
        result: Array
    },
    methods: {
        toggleCategory: function(root){
            root.isShow = root.isShow ? false : true;
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
    width:5px;
    height: 5px;
}

.hidden {
    display:none;
}
</style>
