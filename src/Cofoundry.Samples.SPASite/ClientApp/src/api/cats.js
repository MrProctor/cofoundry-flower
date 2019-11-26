import axios from 'axios'
import axiosHelper from '@/api/axiosHelper'

const BASE_URI = 'http://localhost:58139/api/flowers';

export default {
    searchCats(pageSize = 30,  pageNumber = 1) {
        let url = BASE_URI + `?PageNumber=${pageNumber}&PageSize=${pageSize}`
        return axios
            .get(url)
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