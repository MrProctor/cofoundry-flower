<template>
    <div class="overlay" v-if="isOpened">
        <div class="modal-container" v-click-outside="closePopup">
            <!-- <span class="close" v-on:click="closePopup">&times;</span> -->
            <div class="content">
              <div class="header">Оформление заявки</div>
              <div class="subheader">Для того чтобы оформить заявку - заполните поля ниже.</div>
              <div class="form">
                  <input class="input-block" placeholder="ФИО"/>
                  <input class="input-block" placeholder="Электронная почта"/>
                  <input class="input-block" placeholder="Телефон"/>
                  <button class="submit">Отправить заявку</button>
              </div>
              
            </div>
            <div class="modal-footer">
                  <div class="block-image"><img style="margin-top: 15px;" src="../assets/sheet.png"/></div>
                  <div class="text">После отправки заявки мы отправим вам на электронную почту <b>полный каталог</b>,
                     а также наш менеджер свяжется с вами для уточнения заказа</div>
              </div>
        </div>
    </div>
</template>

<script>

export default {
    name: "OfferDialog",
    data() {
      return {
        info: this.$store.state.cats.dialogOpen
      }
    },
    computed: {
      isOpened() {
        return this.$store.state.cats.dialogOpen
      }
    },
    methods: {
      closePopup() {
        console.log(this.info)
          this.$store.dispatch('cats/closeDialog')
      }
    },
    directives: {
    'click-outside': {
      bind: function(el, binding, vNode) {
        // Provided expression must evaluate to a function.
        if (typeof binding.value !== 'function') {
        	const compName = vNode.context.name
          let warn = `[Vue-click-outside:] provided expression '${binding.expression}' is not a function, but has to be`
          if (compName) { warn += `Found in component '${compName}'` }
          
          console.warn(warn)
        }
        // Define Handler and cache it on the element
        const bubble = binding.modifiers.bubble
        const handler = (e) => {
          if (bubble || (!el.contains(e.target) && el !== e.target)) {
          	binding.value(e)
          }
        }
        el.__vueClickOutside__ = handler

        // add Event Listeners
        document.addEventListener('click', handler)
			},
      
      unbind: function(el, binding) {
        // Remove Event Listeners
        document.removeEventListener('click', el.__vueClickOutside__)
        el.__vueClickOutside__ = null

      }
    }
  }
};
</script>

<style scoped lang="scss">
.overlay {
  position: fixed; /* Stay in place */
  z-index: 300; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

.modal-container {
  background-color: #fefefe;
  margin: 50px auto; /* 15% from the top and centered */
  border: 1px solid #888;
  width: 500px; /* Could be more or less, depending on screen size */
  height:560px;
}

.content {
  display:flex;
  flex-direction: column;
  align-items: center;
    padding: 20px;
}

.header {
  font-family: Playfair Display;
  font-style: normal;
  font-weight: 900;
  font-size: 30px;
  line-height: 40px;
  /* identical to box height, or 133% */

  text-align: center;

  color: #353131;
}

.subheader {
  font-family: TT Norms;
  font-style: normal;
  font-weight: normal;
  font-size: 18px;
  line-height: 25px;
  /* or 139% */

  text-align: center;
  margin:13px 0 14px 0;
  color: #948E8E;
  width:340px;
}

.form {
  width:300px;
  display: flex;
  flex-direction: column;
  align-items: center;
}

.submit {
  width:80%;
  background: #FF9393;
  box-shadow: 0px 3px 7px rgba(254, 156, 156, 0.3);
  border-radius: 40px;
  border:none;
  color: #FFFFFF;
  padding:12px 0 13px 0;
}

.input-block {
  display:block;
  background: #FFFFFF;
  border: 1px solid #E4E4E4;
  box-sizing: border-box;
  border-radius: 50px;
  padding:14px;
  width:100%;
  margin-bottom:25px;
  text-align: center;
  outline: none;
}

.modal-footer {
  padding:20px 0 6px;
  display:flex;
  flex-direction: row;
  width:100%;
  background: #F6F7F9;
  height:120px;
  justify-content: center;
  margin-top: 20px;
}

.text {
  width:280px;
  font-family: TT Norms;
  font-style: normal;
  font-weight: normal;
  font-size: 14px;
  line-height: 20px;
  /* or 143% */
  margin-left: 20px;

  color: #948E8E;
}

/* The Close Button */
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

.hidden {
  display:none;
}

.block-image {
    border-radius: 100px;
    background: #FE9C9C;
    box-shadow: 0px 5px 15px rgba(139, 74, 74, 0.15);
    border-radius: 100px;
    width: 60px;
    height: 60px;
    text-align: center;
}

::-webkit-input-placeholder {
   text-align: center;
}

:-moz-placeholder { /* Firefox 18- */
   text-align: center;  
}

::-moz-placeholder {  /* Firefox 19+ */
   text-align: center;  
}

:-ms-input-placeholder {  
   text-align: center; 
}
</style>
