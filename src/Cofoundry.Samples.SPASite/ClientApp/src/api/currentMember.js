import axios from 'axios'
import axiosHelper from '@/api/axiosHelper'

const BASE_URI = 'http://localhost:58139/api/members/current/';

export default {



    getLikedCats() {
        return axios
            .get(BASE_URI + 'cats/liked')
            .then(axiosHelper.handleQueryResponse);
    }
}