<script lang="ts">
import { defineComponent, PropType, ref, watchEffect } from "vue";
import { RouterLink } from "vue-router";

const API_URL = `http://localhost:3000/api/category/`
const posts = ref(null)
export default defineComponent({
  name: "ThePost",
  
  props: {
    categoryId: {
      type: Number,
      required: true
    }
  },

  setup(props) {
    const categoryId = ref(props.categoryId);
    watchEffect(async () => {
    // this effect will run immediately and then
    // re-run whenever currentBranch.value changes
        const url = `${API_URL}`
        posts.value = await (await fetch(url+props.categoryId)).json()
    });
    return { posts };
  }
});

function formatDate(v) {
  return v.replace(/T|Z/g, ' ')
}
</script>
<template>
    <div class="posts">
        <RouterLink
        v-for="{ id, name, content, user } in posts"
        :key="id"
        :to="{ name: 'post', params: { id:id } }" class="post-link" >
            <div class="post-title">{{name}}</div>
            <div class="post-owner">{{user.email}}</div>
            <div class="post-content">{{content.length>223 ? content.substr(0,220)+'...' : content}}</div>
        </RouterLink>
    </div>
</template>
<style lang="scss">
.posts, .posts:visited{
    width:100%;
    float:right;
    display:flex;
    align-items:center;
    justify-content:center;
    flex-wrap:wrap;
    text-decoration:none;
}
.post-link, .post-link:visited {
    width:100%;
    display: inline-block;
    padding: 0 1rem;
    border-left: 1px solid var(--color-border);
    margin:10px;
    text-decoration:none;
    border:1px solid #c9c9c9;
    border-radius:5px;
    box-shadow: 3px 6px 7px 1px #c9c9c9;
}
.post-title, .post-title:visited {
    width:70%;
    text-align:left;
    color: #2d3d4f;
    padding:0px 2px;
}
.post-content, .post-content:visited {
    width:100%;
    font-size: 17px;
    text-decoration:none;
    text-align:left;
    color: #2d3d4f;
    margin-left:15px;
}
.post-owner {
    width:30%;
    color: #778595;
    font-size: 13px;
    text-align:left;
}

</style>