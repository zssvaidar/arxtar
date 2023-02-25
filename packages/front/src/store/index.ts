import { createStore, mapState } from 'vuex'

const moduleB = {
  namespaced: true,
  state: () => ({
    ab: 5
  }),
  mutations: {},
  actions: {
    makeTheCall: () => {
      console.log(123)
    }
  },
  getters: {
    vals2: (state: any, getters: any) => {
      console.log(333)
      return state.ab + 2
    }
  }
  // computed: {
  //   count(): number {
  //     return this.$state.ab
  //   }
  // }
}

const store = createStore({
  state: {
    aa: 5
  },
  getters: {
    vals1: (state: any, getters: any) => {
      console.log(333)
      return state.aa + 4
    }
  },
  mutations: {},
  actions: {},
  modules: {
    b: moduleB
  }
})

store.registerModule('auth', {
  state: () => ({
    vals: 5,
    loggedIn: false
  }),
  mutations: {
    logIn: (state) => {
      state.loggedIn = true
    },
    logOut: (state) => {
      state.loggedIn = false
    }
  },
  actions: {
    logIn: (context) => {
      context.commit('logIn')
    },
    logOut: (context) => {
      context.commit('logOut')
    }
  },
  getters: {},
  namespaced: true
})

// register a nested module `nested/myModule`
// store.registerModule(['nested', 'myModule'], {
//   state: () => ({}),
//   mutations: {},
//   actions: {}
// })

export default store
