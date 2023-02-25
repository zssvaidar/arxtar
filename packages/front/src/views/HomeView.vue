<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <!-- <HelloWorld msg="Welcome to Your Vue.js + TypeScript App" /> -->

    * {{ this['b/vals2'] }}*<br />
    * {{ vals1 }}*<br />
    * {{ loggedIn }}*
    <button v-on:click="login1()">dsds</button>
    <button v-on:click="logOut()">dsds</button>
  </div>
</template>

<script lang="ts">
import { Options, Vue } from 'vue-class-component'
import HelloWorld from '@/components/HelloWorld.vue' // @ is an alias to /src
import { mapActions, mapGetters, mapState } from 'vuex'

@Options({
  components: {
    HelloWorld
  },
  // ...mapState
  // },
  computed: {
    ...mapState('auth', {
      loggedIn: (state: any) => state.loggedIn
    }),
    val(): number {
      return this.$store.getters['b/vals']
    },
    ...mapGetters(['b/vals2', 'vals1'])
  },
  methods: {
    ...mapActions('auth', { login1: 'logIn', logOut: 'logOut' })
  }
})
export default class HomeView extends Vue {
  mounted(): void {
    // this.logIn()
    // setTimeout(() => {
    //   this.$store.dispatch('auth/logIn')
    // }, 2000)
    // // this.$store.dispatch('')
    // this.$store.dispatch('b/makeTheCall')
  }
}
</script>
