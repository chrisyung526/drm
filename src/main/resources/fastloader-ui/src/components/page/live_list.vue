<template>
    <div>
        <div class="container">
            <!--操作栏 begin-->
            <div class="handle-box">
                <!--<span
                    >1.直播服务器支持rtmp直播推流和rtmp直播拉流播放，rtmp直播推流请使用<span style="color: red"> obs或者摄像头设备</span
                    >，观看直播选择相对应按钮</span
                >
                <br />
                <span
                    >2.直播服务器支持webrtc直播推流和webrtc直播拉流播放，webrtc直播推流请使用列表按钮<span style="color: red">
                        开始直播(webrtc)</span
                    >，观看直播选择相对应按钮</span
                >
                <br />-->
                <el-button type="primary" icon="el-icon-upload" class="mr10" @click="addLiveVisible = true">直播新增</el-button>
            </div>
            <!--操作栏 end-->

            <!-- table主要区域 begin -->
            <el-table :data="tableData" stripe border class="table" ref="multipleTable" header-cell-class-name="table-header">
                <el-table-column prop="id" label="ID" align="center"></el-table-column>
                <el-table-column prop="roomId" label="房间ID" show-overflow-tooltip></el-table-column>
                <el-table-column prop="liveTitle" label="直播标题"></el-table-column>
                <el-table-column label="开播时间">
                    <template slot-scope="scope">{{ scope.row.startTime | dateFormat }}</template>
                </el-table-column>
                <el-table-column label="结束时间">
                    <template slot-scope="scope">{{ scope.row.endTime | dateFormat }}</template>
                </el-table-column>
                <el-table-column prop="duration" label="时长"></el-table-column>

                <el-table-column label="状态">
                    <template slot-scope="scope">
                        <span v-if="scope.row.status === 0">未开始</span>
                        <span v-else-if="scope.row.status === 1">直播中</span>
                        <span v-if="scope.row.status === 2">已结束</span>
                        <span v-else-if="scope.row.status === 3">已取消</span>
                    </template>
                </el-table-column>

                <el-table-column label="操作" align="center" width="400">
                    <template slot-scope="scope">
                        <el-button
                            type="text"
                            icon="el-icon-video-play"
                            v-if="scope.row.status === 0"
                            class="blue"
                            @click="handleView(scope.$index, scope.row)"
                            >直播地址</el-button
                        >
                        <!--<el-button
                            type="text"
                            icon="el-icon-video-play"
                            v-if="scope.row.status === 0"
                            class="blue"
                            @click="handleRtcLive(scope.$index, scope.row)"
                            >开始直播(rtc)</el-button
                        >
                       <el-button
                            type="text"
                            icon="el-icon-video-play"
                            v-if="scope.row.status === 1"
                            class="blue"
                            @click="handleSrsPlayLive(scope.$index, scope.row)"
                            >观看直播(srs)</el-button
                        >-->
                        <el-button
                            type="text"
                            icon="el-icon-video-play"
                            v-if="scope.row.status === 1"
                            class="blue"
                            @click="handleViewLive(scope.$index, scope.row)"
                            >观看直播(flv)</el-button
                        >
                        <!--<el-button
                            type="text"
                            icon="el-icon-video-play"
                            v-if="scope.row.status === 1"
                            class="blue"
                            @click="handleRtcPlayLive(scope.$index, scope.row)"
                            >观看直播(webrtc)</el-button>-->
                        
                        <el-button
                            type="text"
                            icon="el-icon-video-play"
                            v-if="scope.row.status === 2"
                            class="blue"
                            @click="handlePlayLive(scope.$index, scope.row)"
                            >回放</el-button
                        >
                    </template>
                </el-table-column>
            </el-table>
        </div>

        <el-dialog v-dialogDrag title="新增直播" center :visible.sync="addLiveVisible" width="40%" @close="handlerClose">
            <el-form ref="form" :model="live" label-width="80px">
                <el-form-item label="标题">
                    <el-input v-model="live.liveTitle"></el-input>
                </el-form-item>
            </el-form>
            <span slot="footer" class="dialog-footer">
                <el-button @click="dialogVisible = false">取 消</el-button>
                <el-button type="primary" @click="saveLive">确 定</el-button>
            </span>
        </el-dialog>

        <el-dialog v-dialogDrag title="直播地址" center :visible.sync="urlVisible" width="40%" @close="handlerClose">
            <div>
                <h3>房间号/串流密钥：{{ roomId }}</h3>
                <br />
                <h3>推流地址</h3>
                <br />
                <h4>rtmp://{{ hostname }}/live/{{ roomId }}</h4>
                <br />
                <h3>拉流地址</h3>
                <br />
                <h4>RTMP (by VLC): rtmp://{{ hostname }}/live/{{ roomId }}</h4>
                <br />
                <h4>H5(HTTP-FLV): http://{{ domain }}/flv/live/{{ roomId }}.flv</h4>
                <!--<br />
                <h4>H5(WebRTC): webrtc://{{ domain }}/rtc/live/{{ roomId }}</h4>-->
                <!-- <br/>
                <h4>H5(HLS): http://{{ domain }}:8080/live/{{ roomId }}.m3u8</h4>-->
            </div>
        </el-dialog>
    </div>
</template>

<script>
import { selectLiveList, addLive, liveInfoToRoomId } from '@/api/modules/live';

export default {
    name: 'livelisttable',
    data() {
        return {
            tableData: [],
            addLiveVisible: false,
            urlVisible: false,
            domain: window.location.host,
            hostname: window.location.hostname,
            roomId: '',
            live: {
                roomId: '',
                liveTitle: ''
            }
        };
    },
    created() {
        this.getData();
    },
    methods: {
        getData() {
            selectLiveList().then((res) => {
                this.tableData = res.data;
            });
        },
        saveLive() {
            addLive(this.live).then((res) => {
                this.roomId = res.data.roomId;
                this.addLiveVisible = false;
                this.urlVisible = true;
                this.getData();
            });
        },
        handlerClose() {
            this.getData();
        },
        handlePlayLive(index, row) {
            liveInfoToRoomId(row.roomId).then((res) => {
                this.$router.push({ name: 'play', query: { fileId: res.data.id } });
            });
        },
        handleViewLive(index, row) {
            this.$router.push({ name: 'live_play', query: { roomId: row.roomId } });
        },
        handleView(index, row) {
            this.roomId = row.roomId;
            this.urlVisible = true;
        },
        handleRtcLive(index,row){
            this.$router.push({ name: 'live_rtc', query: { roomId: row.roomId } });
        },
        handleRtcPlayLive(index,row){
            this.$router.push({ name: 'live_rtc_play', query: { roomId: row.roomId } });
        },
        handleSrsPlayLive(index,row){
            this.$router.push({ name: 'live_srs_play', query: { roomId: row.roomId } });
        },
         
    },
    components: {}
};
</script>

<style scoped>
.handle-box {
    margin-bottom: 20px;
}

.handle-select {
    width: 120px;
}

.handle-input {
    width: 300px;
    display: inline-block;
}
.table {
    width: 1200;
    font-size: 14px;
}
.red {
    color: #ff0000;
}
.mr10 {
    margin-right: 10px;
}
.table-td-thumb {
    display: block;
    margin: auto;
    width: 40px;
    height: 40px;
}
.liveSlot {
    margin: -10px 10px 10px 30px;
}
</style>
