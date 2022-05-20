<template>
    <div class="taskPlan">
        <iframe :src="reportUrl" width="100%" height="500" scrolling="no" frameborder="0" id="iframeBox"></iframe>
    </div>
</template>
<script>
export default {
    name: 'livesrsplay',
    data() {
        return {
            reportUrl: 'livewebrtc/srs_player.html?stream=' + this.$route.query.roomId
        };
    }
};
</script>

 