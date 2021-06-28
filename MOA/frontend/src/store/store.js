import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';
import router from '../router';
// import moalist from './components/MOAList.vue';

Vue.use(Vuex);

export const store = new Vuex.Store({


    state:{
        host: 'http://127.0.0.1:3000',
        token: '',
        role: '',
        isLogin: false,
        isLoginError: false
    },

    mutations:{
        loginToken:function(state,payload){
            state.isLogin = true
            state.isLoginError = false
            state.token = payload
        },

        logout: function(state){
            state.isLogin = false
            state.isLoginError = false
            state.token = '';
            alert('로그아웃 되었습니다.');
            // if(state.token){
            //     state.token = '';
            //     alert('로그아웃되었습니다.');
            // }
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