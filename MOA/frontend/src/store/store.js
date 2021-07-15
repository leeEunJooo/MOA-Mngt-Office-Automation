import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';
import router from '../router';
import createPersistedState from 'vuex-persistedstate';
// import moalist from './components/MOAList.vue';

Vue.use(Vuex);

export const store = new Vuex.Store({
    plugins: [
        createPersistedState()
    ],
    state:{
        host: 'http://127.0.0.1:3000',
        token: '',
        role: '',
        username:'',
        isLogin: false,
        isLoginError: false
    },

    mutations:{
        loginToken:function(state,payload){
            state.isLogin = true
            state.isLoginError = false
            state.token = payload.token
            state.username = payload.user_nm
        },

        logout: function(state){
            state.isLogin = false
            state.isLoginError = false
            state.token = '';
            state.username = ''
            alert('로그아웃 되었습니다.');
        },
        init: function(state){
            state.isLogin = false
            state.isLoginError = false
            state.token = '';
            state.username = ''
        },
        loginCheck:function(state){
            axios.get(`${state.host}/auth/check`,{
                header:{
                    "x-access-token": state.token
                }
            })
            .then(
                res => {
                    console.log(res);
                    state.role = res.data.token.role;
                },
                () => {
                    console.log('로그인 정보가 없음');
                    router.push('/login');
                }
            )
        },

        // logout({commit}) {
        //     commit("logout")
        //     router.push("/");
        // }
    }
})