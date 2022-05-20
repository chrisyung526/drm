<template>
    <div id="mse"></div>
</template>
 
<style scoped>
.video-btn {
    margin-bottom: 20px;
}
</style>
<script>
import { getLiveToken } from '@/api/modules/live';
import Player from 'xgplayer';
import FlvPlayer from 'xgplayer-flv.js';
export default {
    name: 'livePlay',
    data() {
        return {
            player: null,
            streamToken: null,
            domain: window.location.host,
            roomId: this.$route.query.roomId
        };
    },
    components: {},
    created() {
    },
    methods: {
    },
    mounted() {
        getLiveToken({}).then((res) => {
            if (res.code == 200) {
                this.streamToken = res.data.streamToken;
                this.url = 'http://' + this.domain + '/flv/live/' + this.roomId + '.flv?streamToken=' + this.streamToken;
                this.player = new FlvPlayer({
                    id: 'mse',
                    url: this.url,
                    width: '100%',
                    height: '100%',
                    volume: 0.6, // 初始音量
                    autoplay: true, // 自动播放
                    playsinline: true,
                    isLive: true,
                    cors: true
                });
            }
        });
    }
};
</script>

