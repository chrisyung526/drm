<template>
    <div>
        <div>
            <el-row>
                <h3>清晰度切换，可点击按钮，也可点击播放器的清晰度切换</h3>
            </el-row>
        </div>
        <div class="video-btn" v-if="showPrise">
            <el-row>
                <el-button type="primary" icon="el-icon-video-camera" round @click="changep('/h360/')">360p</el-button>
                <el-button type="success" round icon="el-icon-video-camera" @click="changep('/h720/')">720p</el-button>
                <el-button type="danger" round icon="el-icon-video-camera" @click="changep('/h1080/')">1080p</el-button>
            </el-row>
        </div>
        <div id="mse"></div>
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
            showPrise: false,
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
        changep(type) {
            var baseurl = this.url.slice(0, this.url.lastIndexOf('/'));
            var fileName = this.url.slice(this.url.lastIndexOf('/') + 1, this.url.length);
            this.player.start(baseurl + type + fileName);
            this.player.reload();
            this.player.play();
        }
        /* generateToken(){
            mediaStreamGenerate({}).then((res) => {
                if(res.code == 200){
                    this.streamToken=res.data.streamToken;
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
                    let arrayPush = [];
                    for(let i=1;i<=Math.ceil(res.duration / 2/100);i++){
                        arrayPush.push('http://j.tcsoft.info:38082/hls/' + res.identifier + '/thumbnail_'+i+'.jpg');
                    }

                    this.url =
                        this.fileBaseurl +
                        process.env.VUE_APP_BASE_API +
                        '/client-api/mediaStream/playlist' +
                        res.m3u8Url +
                        '?streamToken=' +
                        this.streamToken; 
                    this.player = new HlsJsPlayer({
                        id: 'mse',
                        url: this.url,
                        playsinline: true,
                        whitelist: [''],
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
                        screenShot: true,
                        download: true,
                        pip: true,
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
                    //this.showPrise = true;
                }
            });
        });
    }
};
</script>