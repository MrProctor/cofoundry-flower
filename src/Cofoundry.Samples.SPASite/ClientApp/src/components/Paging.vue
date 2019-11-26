<template>
    <div class="paging-block">
                    <div class="page-size-block" v-on:click="toggleDropdown()">
                        <div class="page-size-label">Показывать по:</div>
                        <div class="page-size">
                            <span>{{pageSize}}</span>
                            <div class="dropdown-block" v-show="isShow">
                                <ul class="dropdown">
                                    <li v-on:click="changePageSize(5)">5</li>
                                    <li v-on:click="changePageSize(10)">10</li>
                                    <li v-on:click="changePageSize(20)">20</li>
                                    <li v-on:click="changePageSize(30)">30</li>
                                    <li v-on:click="changePageSize(50)">50</li>
                                </ul>
                            </div>
                        </div>
                        <div><img class="shevron" src="../assets/chevron_down_grey.png" style="vertical-align: middle;margin-top: -3px;"/></div>
                    </div>
                    <div class="page-list">
                        <div v-on:click="loadPagingGrid"> <img class="shevron_page" src="../assets/chevron_left_grey.png" v-on:click="loadPagingGrid(pageSize, pagingInfo.pageNumber-1)"/> </div>
                        <ul class="pages">
                            <li v-for="index in pagingInfo.pageCount" :key="index" v-bind:class="{colored: index===pagingInfo.pageNumber}" v-on:click="loadPagingGrid(pageSize, index)">{{index}}</li>
                        </ul>
                        <div v-on:click="loadPagingGrid(pageSize, pagingInfo.pageNumber+1)"> <img class="shevron_page" src="../assets/chevron_right_grey.png"/> </div>
                    </div>
                    
                </div>
</template>

<script>

export default {
    name: "Paging",
    props: {
        pagingInfo: Object,
    },
    data() {
        return {
            isShow: false
        }
    },
    computed: {
        pageSize() {
            return this.$store.state.cats.pageSize
        }
    },
    methods: {
        loadPagingGrid(pageSize, pageNumber) {
            if (pageSize < 1 || pageNumber < 1 || pageNumber > this.pagingInfo.pageCount) {
                return;
            }
            this.$emit('loadFilteredGrid', pageSize, pageNumber)
        },
        toggleDropdown() {
            this.isShow = !this.isShow
        },
        changePageSize(pageSize) {
            this.loadPagingGrid(pageSize, 1)
            this.$store.dispatch('cats/changePageSize', pageSize)
        }
    }
};
</script>

<style scoped lang="scss">

.paging-block {
    display:flex;
    flex-direction: row;
    justify-content: space-between;
}

.page-size {
    width:20px;
    margin-right:5px;
    position:relative;
}

.page-size-block {
    display:flex;
    flex-direction: row;
    width:150px;
    margin-left:4rem;
    align-items: center;
    cursor:pointer;
}

.colored {
    color:  #FF7676 !important;
}

.dropdown-block {
    position:absolute;
    top:25px;
    left: -6px;
    border: 1px solid #ccc;
    border-top: none;
    background:#fff;
    z-index:200;
}

.dropdown {
    list-style: none;
    padding:0;
    margin:5px;
}

.dropdown li {
    text-align: center;
}

.page-size-label {
    font-family: TT Norms;
font-style: normal;
font-weight: normal;
font-size: 14px;
line-height: 17px;
width:100px;
color: #999999;
padding-top: 2px;
}

.page-list {
    display:flex;
    margin-right:3rem;
}

.pages li {
    display:inline-block;
    width:25px;
    cursor:pointer;

    font-family: TT Norms;
font-style: normal;
font-weight: normal;
font-size: 14px;
line-height: 17px;
text-align: center;

color: #999999;
}

.pages {
    margin:0 14px;
    padding:0;
}

.shevron {
    cursor:pointer;
    width:8px;
    height: 5px;
}
.shevron_page {
    cursor:pointer;

    width:5px;
    height: 8px;
}
</style>
