<template>
    <div>
        <div style="margin: 0 auto; text-align: center">
            <el-row>
                <h3>视频播放</h3>
            </el-row>
        </div>
        <div style="margin: 0 auto; text-align: center; width: 1000px; height:530px">
            <div id="mse" style="float: left"></div>
            <div style="float: left">
                <el-row>
                    <el-button
                        style="margin-top: 150px; margin-left: 10px"
                        type="primary"
                        icon="el-icon-video-camera"
                        round
                        @click="videoPlay('961243138670723072961243138670723072')"
                        >上一集</el-button
                    >
                    <br/>
                    <el-button
                        style="margin-top: 10px; margin-left: 10px"
                        type="success"
                        round
                        icon="el-icon-video-camera"
                        @click="videoPlay('961243043673931776961243043673931776')"
                        >下一集</el-button
                    >
                </el-row>
            </div>
        </div>
        <div style=" margin: 0 auto; text-align: center; width: 730px;height: 80px; text-align: justify; display: flex; flex-wrap: wrap; justify-content: space-between; overflow: hidden">
            <el-row>
                <el-button type="info" plain @click="videoPlay('961243138670723072961243138670723072')">&nbsp;&nbsp;1集</el-button>
                <el-button type="info" plain @click="videoPlay('961243043673931776961243043673931776')">&nbsp;&nbsp;2集</el-button>
                <el-button type="info" plain @click="videoPlay('961243138670723072961243138670723072')">&nbsp;&nbsp;3集</el-button>
                <el-button type="info" plain @click="videoPlay('961243043673931776961243043673931776')">&nbsp;&nbsp;4集</el-button>
                <el-button type="info" plain @click="videoPlay('961243138670723072961243138670723072')">&nbsp;&nbsp;5集</el-button>
                <el-button type="info" plain @click="videoPlay('961243043673931776961243043673931776')">&nbsp;&nbsp;6集</el-button>
                <el-button type="info" plain @click="videoPlay('961243138670723072961243138670723072')">&nbsp;&nbsp;7集</el-button>
                <el-button type="info" plain @click="videoPlay('961243043673931776961243043673931776')">&nbsp;&nbsp;8集</el-button>
            </el-row>
            <el-row>
                <el-button type="info" plain @click="videoPlay('961243043673931776961243043673931776')">&nbsp;&nbsp;9集</el-button>
                <el-button type="info" plain @click="videoPlay('961243138670723072961243138670723072')">10集</el-button>
                <el-button type="info" plain @click="videoPlay('961243043673931776961243043673931776')">11集</el-button>
                <el-button type="info" plain @click="videoPlay('961243138670723072961243138670723072')">12集</el-button>
                <el-button type="info" plain @click="videoPlay('961243043673931776961243043673931776')">13集</el-button>
                <el-button type="info" plain @click="videoPlay('961243138670723072961243138670723072')">14集</el-button>
                <el-button type="info" plain @click="videoPlay('961243043673931776961243043673931776')">15集</el-button>
                <el-button type="info" plain @click="videoPlay('961243138670723072961243138670723072')">16集</el-button>
            </el-row>
        </div>
    </div>
</template>
 
<style scoped>
.video-btn {
    margin-bottom: 20px;
}
</style>
<script>
import { selectFileDetail } from '@/api/modules/uploadFile';
import { mediaStreamGenerate } from '@/api/modules/mediaStream';
import Player from 'xgplayer';
import HlsJsPlayer from 'xgplayer-hls.js';
export default {
    name: 'App',
    data() {
        return {
            player: null,
            streamToken: null,
            fileData: [],
            url: null,
            fileId: this.$route.query.fileId,
            fileBaseurl: window.location.origin
        };
    },
    components: {},
    created() {
        //this.generateToken();
    },
    methods: {
        videoPlay(fileId) {
            this.$router.push({ name: 'view', query: { fileId: fileId } });
            location.reload();
        }
        /*generateToken() {
            mediaStreamGenerate({}).then((res) => {
                if (res.code == 200) {
                    this.streamToken = res.data.streamToken;
                }
            });
        }*/
    },
    mounted() {
        mediaStreamGenerate({}).then((token) => {
            this.streamToken = token.data.streamToken;
            selectFileDetail(this.fileId).then((res) => {
                this.fileData = res;
                if (res.fileState == 1) {
                    this.url = this.fileBaseurl + '/video' + res.location;
                    this.player = new Player({
                        id: 'mse',
                        url: this.url,
                        playsinline: true,
                        whitelist: [''],
                        playbackRate: [0.5, 1, 1.5, 2],
                        rotate: {
                            clockwise: false,
                            innerRotate: false
                        },
                        screenShot: true,
                        download: true,
                        pip: true,
                        autoplay: true
                    });
                } else {
                    this.url =
                        this.fileBaseurl +
                        process.env.VUE_APP_BASE_API +
                        '/client-api/mediaStream/playlist' +
                        res.m3u8Url +
                        '?streamToken=' +
                        this.streamToken;

                    let arrayPush = [];
                    for (let i = 1; i <= Math.ceil(res.duration / 2 / 100); i++) {
                        arrayPush.push(this.fileBaseurl+'/hls/' + res.identifier + '/thumbnail_' + i + '.jpg');
                    }

                    this.player = new HlsJsPlayer({
                        id: 'mse',
                        url: this.url,
                        height: window.innerHeight,
                        width: window.innerWidth,
                        playsinline: true,
                        width: 900,
                        height: 500,
                        whitelist: [''],
                            "nativeTextTrack": [
                                    {
                                            "src": this.fileBaseurl+'/hls/' + res.identifier +"/textTrack/textTrack-1.vtt",
                                            "label": "字幕1",
                                            "default": true
                                    },
                                    {
                                            "src": this.fileBaseurl+'/hls/' + res.identifier +"/textTrack/textTrack-2.vtt",
                                            "label": "字幕2",
                                            "default": false
                                    }
                            ],
                        playbackRate: [0.5, 1, 1.5, 2],
                        thumbnail: {
                            pic_num: Math.ceil(res.duration / 2),
                            width: 160,
                            height: 90,
                            col: 10,
                            row: 10,
                            urls: arrayPush
                        },
                        rotate: {
                            clockwise: false,
                            innerRotate: false
                        },
                        //screenShot: true,
                        //download: true,
                        // pip: true,
                        autoplay: true
                    });
                    var baseurl = this.url.slice(0, this.url.lastIndexOf('/'));
                    var fileName = this.url.slice(this.url.lastIndexOf('/') + 1, this.url.length);
                    this.player.emit('resourceReady', [
                        { name: '360p', url: baseurl + '/h360/' + fileName },
                        { name: '720p', url: baseurl + '/h720/' + fileName },
                        { name: '1080p', url: baseurl + '/h1080/' + fileName }
                    ]);

                    this.player.play();
                }
            });
        });
    }
};
</script>