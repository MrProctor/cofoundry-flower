<template>
    <div class="grid">
        <cat-item v-for="flower in flowers" :flower="flower" :key="flower.flowerId"/>
    </div>
</template>

<script>
import CatItem from "@/components/CatItem";

export default {
    name: "CatGrid",
    components: {
        CatItem
    },
    computed: {
        flowers() {
            return this.$store.state.cats.flowers
        }
    }
};
</script>

<style scoped lang="scss">
.grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    grid-auto-rows: minmax(150px, auto);
    grid-gap: 2rem;
    position:relative;
    margin: 2rem;
}
</style>
