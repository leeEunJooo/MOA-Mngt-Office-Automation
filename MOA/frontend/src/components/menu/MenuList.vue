<template>
    <div>
        <ul class="menu-list">
            <li>
                <img src="../../assets/img/menu1.png" class="menu1_img"/>
                &nbsp;&nbsp;
                <router-link to="/dashboard">
                  <span class="dashboard_menu">DashBoard</span>
                </router-link>
            </li>
            <li>
                <img src="../../assets/img/menu2.png" class="menu1_img"/>
                &nbsp;&nbsp;
                <router-link to="/moalist">
                    <!-- <span>MOAList</span> -->
                    <a @click="moalist" style="cursor: pointer;"><span class="moalist_menu">MOAList</span></a>
                </router-link>
            </li>
        </ul>
        
    </div>
</template>

<script>
export default {
    methods:{
        moalist:function(){
            // console.log(window.location.href);
            if(window.location.href.includes("/moalist")){
                window.location.reload();
            }else{
                this.$router.push("/moalist");
            }
        },
    },


}
</script>

<style>
    .menu1_img{
        width: 20px;
        height: 20px;
    }
    
    
    .v-application ul,
    .v-application ol,
    ul > li,
    ul{
        list-style:none;
        margin:0;
        padding:0 !important;
    }
    .menu-list ul> li{
        font-family: GmarketSansBold;
        font-size: 20px;
        color:#5244f5;
    }
    .menu-list li > span{
        padding-left:30px;
    }
    .menu-list li:last-child{
        margin-top:30px;
    }
    .menu-list li a{
        font-family: GmarketSansBold;
        font-size: 20px;
        color:#5244f5;
        text-decoration: none;
    }
</style>