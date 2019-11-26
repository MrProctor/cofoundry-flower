import currentMemberApi from '@/api/currentMember';
import catsApi from '@/api/cats';

export default {
    namespaced: true,
    state: {
        likedCatIds: [],
        pageSize: 30,
        dialogOpen: false,
        flowerInfo: {
            id: null,
            name: null,
            category: null,
            amount: null,
            price: null
        }
    },
    mutations: {
        setLikedCatIds(state, catIds) {
            state.likedCatIds = catIds;
        },
        setCatLiked(state, catId) {
            state.likedCatIds.push(catId);
        },
        setCatUnliked(state, catId) {
            state.likedCatIds = state.likedCatIds.filter(id => id !== catId);
        },
        setPageSize(state, pageSize) {
            state.pageSize = pageSize
        },
        setDialogOpen(state) {
            state.dialogOpen = true
        },
        setDialogClose(state) {
            state.dialogOpen = false
        },
        setFlowerInfo(state, flowerInfo) {
            state.flowerInfo.id = flowerInfo.id
            state.flowerInfo.name = flowerInfo.name
            state.flowerInfo.category = flowerInfo.category
            state.flowerInfo.amount = flowerInfo.amount
            state.flowerInfo.price = flowerInfo.price
        }

    },
    actions: {
        loadSession(context) {
            return currentMemberApi.getLikedCats()
                .then(cats => {
                    const catIds = cats ? cats.map(i => i.catId) : [];
                    context.commit('setLikedCatIds', catIds);
                });
        },

        clearSession(context) {
            context.commit('setLikedCatIds', []);

            return Promise.resolve();
        },

        like(context, catId) {
            if (context.state.likedCatIds.indexOf(catId) !== -1) return Promise.resolve();

            return catsApi.like(catId).then(() => {
                context.commit('setCatLiked', catId);
            });
        },

        unlike(context, catId) {
            if (context.state.likedCatIds.indexOf(catId) === -1) return Promise.resolve();

            return catsApi.unlike(catId).then(() => {
                context.commit('setCatUnliked', catId);
            });
        },

        changePageSize(context, pageSize) {
            context.commit('setPageSize', pageSize)

            return Promise.resolve();
        },

        openDialog(context) {
            context.commit('setDialogOpen')

            return Promise.resolve();
        },

        closeDialog(context) {
            context.commit('setDialogClose')

            return Promise.resolve();
        },

        changeFlowerInfo(context, flowerInfo) {
            context.commit('setFlowerInfo', flowerInfo)

            return Promise.resolve();
        }
    }
}
