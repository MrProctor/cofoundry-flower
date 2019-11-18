import axios from 'axios'
import axiosHelper from '@/api/axiosHelper'

const BASE_URI = 'http://localhost:58139/api/cats?PageNumber=1&PageSize=5';

export default {
    searchCats() {
        return axios
            .get(BASE_URI)
            .then(axiosHelper.handleQueryResponse);
    },

    getCatById(id) {
        return axios
            .get(BASE_URI + id)
            .then(axiosHelper.handleQueryResponse);
    },

    like(id) {
        return axios
            .post(BASE_URI + id + '/likes')
            .catch(axiosHelper.handleCommandError);
    },
    
    unlike(id) {
        return axios
            .delete(BASE_URI + id + '/likes')
            .catch(axiosHelper.handleCommandError);
    }
}