<script lang="ts">
  export default {
    name: 'TheCommentTree',
    inheritAttrs: false,
    computed: {
        cssProps() {
            return {
                'margin-left': this.depth == 1 ? 10 : 20 + "px",
            }
        }
    }
  }
</script>
<script setup lang="ts">
defineProps<{
  comment: object;
  depth: number;
}>();
const maximumDepth = 20;
</script>
<template>
    <div class="comment-container" :style="cssProps" v-if="depth<=maximumDepth">
        <p class="comment">{{comment.content}}</p>
        <TheCommentTree v-if="comment.descendents"
        v-for="reply in comment.descendents"
        :key="reply.id" v-bind="{comment: reply, depth:depth+1}">
        </TheCommentTree>
    </div>
    <div v-else-if="comment.descendants">
        <RouterLink
            :key="comment.id"
            :to="{ name: 'comment', params: { id:comment.id } }" >
            <span class="view-more">View more...</span>
        </RouterLink>
    </div>
</template>
<style>
.comment-container{
    border-left: 1px solid #2d3d4f;
}
.comment{
    text-align: left;
    padding-left: 5px;
}
</style>