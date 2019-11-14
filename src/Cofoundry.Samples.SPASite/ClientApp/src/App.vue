<template>
    <div class="site-wrapper">
        <site-nav/>
        <router-view/>
    </div>
</template>

<script>
import SiteNav from "@/components/SiteNav";
import SiteFooter from "@/components/SiteFooter";

export default {
    data() {
        return {
            loading: false
        };
    },
    components: {
        SiteNav,
        SiteFooter
    },
    created() {
        this.loading = true;
        this.$store.dispatch("auth/loadSession");
    }
};
</script>

<style lang="scss">

html {
    font-family: -apple-system, BlinkMacSystemFont, Segoe UI, Helvetica, Arial, sans-serif, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol;
    line-height: 1.6;
    color: $color-text;
    height: 100%;
}
body {
    height: 100%;
    overflow-x: hidden;
}

* {
    box-sizing: border-box;
}

a {
    color: $color-primary;
}

.site-wrapper {
    display: flex;
    flex-direction: column;
    height: 100%;
    max-width: 1440px;
    margin: 0 auto;
    position: relative;
    width: 100%;
}

</style>
