<template>
    <div class="paging-block">
                    <div class="page-size-block">
                        <div class="page-size-label">Показывать по:</div>
                        <div class="page-size">30</div>
                        <div><img class="shevron" src="../assets/chevron_down_grey.png" style="vertical-align: middle;margin-top: -3px;"/></div>
                    </div>
                    <div class="page-list">
                        <div> <img class="shevron_page" src="../assets/chevron_left_grey.png"/> </div>
                        <ul class="pages">
                            <li>1</li>
                            <li>2</li>
                            <li>3</li>
                            <li>4</li>
                            <li>5</li>
                            <li>6</li>
                            <li>7</li>
                            <li>8</li>
                        </ul>
                        <div> <img class="shevron_page" src="../assets/chevron_right_grey.png"/> </div>
                    </div>
                    
                </div>
</template>

<script>

export default {
    name: "Paging",
    props: {
        result: Array
    },
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
}

.page-size-block {
    display:flex;
    flex-direction: row;
    width:150px;
    margin-left:4rem;
    align-items: center;
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
