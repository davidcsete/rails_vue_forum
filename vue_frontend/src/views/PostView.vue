<script lang="ts">
import { ref, watchEffect } from "vue";
import { useRoute } from "vue-router";
import ThePostTitle from "@/components/ThePostTitle.vue";
import ThePostContent from "@/components/ThePostContent.vue";
import TheCommentTree from "@/components/TheCommentTree.vue";

const API_URL = `http://localhost:3000/api/post/`
const post = ref(null)
export default {
  name: "PostView",
    components: {
    ThePostTitle,
    ThePostContent,
    TheCommentTree
  },
  setup() {
    const route = useRoute();
    watchEffect(async () => {
    // this effect will run immediately and then
    // re-run whenever currentBranch.value changes
        const url = `${API_URL}`;
        post.value =  await (await fetch(url+route.params.id)).json();
        
    });
    return { post };
  },
  props: {
    id: { type: Number, required: true },
  },
};
console.log(post.value);
</script>
<template>
    <main>
        <div class="post-view" v-if="post!=null">
            <ThePostTitle v-bind="{title: post.name}"/>
            <ThePostContent v-bind="{content: post.content}"/>
            <div v-if="post.get_comments_json">
                <div v-for="comment in post.get_comments_json">
                    <TheCommentTree
                        :key="comment.id"
                        v-bind="{comment: comment, depth:1}">
                    </TheCommentTree>
                </div>
            </div>
            
        </div>
    </main>
</template>