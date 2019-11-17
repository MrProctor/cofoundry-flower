import axios from 'axios'
import axiosHelper from '@/api/axiosHelper'

const BASE_URI = 'http://localhost:58139/api/categories/';

export default {
    searchCategories() {
        return axios
            .get(BASE_URI)
            .then(axiosHelper.handleQueryResponse);
    },

    getCategoryById(id) {
        return axios
            .get(BASE_URI + id)
            .then(axiosHelper.handleQueryResponse);
    }
}