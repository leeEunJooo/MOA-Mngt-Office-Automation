<template>

  <div id="app">
    <!-- <DrawerNav></DrawerNav> -->
    <router-view> </router-view>
  </div>
</template>

<script>
// import DrawerNav from './components/DrawerNav.vue';

export default {
  name: 'App',
  components: {
    // DrawerNav,
  },
  methods:{

  },
  created(){
  },

}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}
  ::-webkit-scrollbar-thumb {
    width: 10px;
    background-color: rgb(174, 172, 235);
    border-radius: 10px;
  }
  ::-webkit-scrollbar-track {
    background-color: rgb(232, 232, 232);
    border-radius: 10px;
  }
</style>