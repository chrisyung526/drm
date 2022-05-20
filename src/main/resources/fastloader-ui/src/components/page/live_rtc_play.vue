<template>
    <div class="taskPlan">
        <iframe :src="reportUrl" width="100%" height="500" scrolling="no" frameborder="0" id="iframeBox"></iframe>
    </div>
</template>
<script>
export default {
    name: 'liveplayrtc',
    data() {
        return {
            reportUrl: 'livewebrtc/rtc_player.html?stream=' + this.$route.query.roomId
        };
    }
};
</script>

 