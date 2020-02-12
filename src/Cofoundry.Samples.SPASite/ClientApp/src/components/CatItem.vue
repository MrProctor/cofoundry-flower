<template>
    <div class="container">
        <div class="cat">
            <div class="image">
                <image-asset :image="flower.mainImage" :width="263" :height="263"/>
            </div>
            <div class="details">
                <div class="name">{{ flower.name }}</div>
                <div class="amount">{{flower.count}} шт</div>
                <div class="buy">
                    <div class="count">
                        <button class="minus">-</button>
                        <div class="count_screen">1</div>
                        <button class="plus">+</button>
                    </div>
                    <button class="buy_btn" v-on:click="openPopup()">Купить за {{flower.price}} Р</button>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import ImageAsset from "@/components/ImageAsset";
import LikesCounter from "@/components/LikesCounter";

export default {
    name: "CatItem",
    components: {
        ImageAsset,
        LikesCounter
    },
    props: {
        flower: Object
    },
    methods: {
        openPopup() {
            let flowerInfo = {
                id: this.flower.flowerId,
                name: this.flower.name,
                category: this.flower.category,
                amount: this.flower.count,
                price: this.flower.price
            }
            this.$store.dispatch('cats/changeFlowerInfo', flowerInfo)
            this.$store.dispatch('cats/openDialog')
        }
    }
};
</script>

<style scoped lang="scss">
.container {
    position:relative;
    width:280px;
    height:320px;
    margin:5px;
}

.cat {
    padding:10px;
    background-color: #fff;
    border-radius: 3px;
    text-decoration: none;
    text-align: center;
    position:absolute;
    top:0;
    left:0;
    width:100%;
    .details .buy {
        display: none;
        padding:10px;
    }

    &:hover {
        box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
        border-radius: 30px;
        z-index:99;
        
        .name {
            color: $color-secondary;
        }

        .details .buy {
            display: flex;
        }
    }
    
}

.image {
    width: 100%;
    padding-bottom: 100%;
    overflow: hidden;
    position: relative;
    border-radius: 3px 3px 0 0;

    img {
        position: absolute;
        left: 50%;
        top: 50%;
        width: auto;
        height: 100%;
        transform: translate(-50%, -50%);
        transform-origin: 50% 50%;
        transition: transform 1s linear;
        border-radius:20px;
        width:240px;
        height:240px;
    }
}

.details {
    display: flex;
    flex-direction: column;
    .name {
        font-family: Playfair Display;
        font-style: normal;
        font-weight: bold;
        font-size: 18px;
        line-height: 24px;
        text-align: center;
        flex-grow:1;
        color: #323630;
    }

    .buy {
        justify-content: space-between;

        &_btn {
            width: 130px;
            height: 40px;
            background: #FE9C9C;
            border-radius: 40px;
            border:none;
            font-family: Montserrat;
            font-style: normal;
            font-weight: bold;
            font-size: 11px;
            line-height: 13px;
            text-align: center;
            cursor:pointer;
            color: #FFFFFF;
        }
    }

    .amount {
        color: #999999;
    }

    .likes {
    }

    @include respond-min(992px) {
        .likes {
        }

        .name {
            display: inline-block;
        }
    }

    .count {
        display: flex;
        flex-direction: row;
        width: 100px;
        height: 40px;
        border: 1px solid #E4E4E4;
        box-sizing: border-box;
        border-radius: 50px;
        justify-content: space-between;
        overflow: hidden;
        .minus {
            width:30px;
            border:none;
            background: #FFFFFF;
            border-right:1px solid #E4E4E4;
        }
        .plus {
            width:30px;
            border:none;
            background: #FFFFFF;
            border-left:1px solid #E4E4E4;
        }
        &_screen {
            width:50px;
            font-family: TT Norms;
            font-style: normal;
            font-weight: normal;
            font-size: 14px;
            line-height: 17px;
            text-align: center;
            color: #999999;
            align-self: center;
        }
    }
}
</style>
