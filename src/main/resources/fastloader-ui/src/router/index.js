import Vue from 'vue';
import Router from 'vue-router';

Vue.use(Router);

export default new Router({
    routes: [
        {
            path: '/',
            redirect: '/dashboard'
        },
        {
            path: '/view',
            name: 'view',
            component: () => import(/* webpackChunkName: "play" */ '../components/page/view.vue'),
            meta: { title: '演示视频播放器' }
        }, 
        {
            path: '/',
            component: () => import(/* webpackChunkName: "home" */ '../components/common/Home.vue'),
            meta: { title: '首页' },
            children: [
                {
                    path: '/dashboard',
                    component: () => import(/* webpackChunkName: "dashboard" */ '../components/page/Dashboard.vue'),
                    meta: { title: '首页' }
                },
                {
                    path: '/table',
                    component: () => import(/* webpackChunkName: "table" */ '../components/page/BaseTable.vue'),
                    meta: { title: '文件列表' }
                },{
                    path: '/live',
                    component: () => import(/* webpackChunkName: "live" */ '../components/page/live_list.vue'),
                    meta: { title: '直播列表' }
                },
                {
                    path: '/404',
                    component: () => import(/* webpackChunkName: "404" */ '../components/page/404.vue'),
                    meta: { title: '404' }
                }
                ,
                {
                    path: '/play',
                    name: 'play',
                    component: () => import(/* webpackChunkName: "play" */ '../components/page/play.vue'),
                    meta: { title: '视频播放器' }
                },
                {
                    path: '/live_play',
                    name: 'live_play',
                    component: () => import(/* webpackChunkName: "live_play" */ '../components/page/live_play.vue'),
                    meta: { title: '直播间播放器' }
                },
                {
                    path: '/live_rtc',
                    name: 'live_rtc',
                    component: () => import(/* webpackChunkName: "live_rtc" */ '../components/page/live_rtc.vue'),
                    meta: { title: 'webrtc直播间' }
                },
                {
                    path: '/live_rtc_play',
                    name: 'live_rtc_play',
                    component: () => import(/* webpackChunkName: "live_rtc_play" */ '../components/page/live_rtc_play.vue'),
                    meta: { title: 'webrtc播放器' }
                },
                {
                    path: '/live_srs_play',
                    name: 'live_srs_play',
                    component: () => import(/* webpackChunkName: "live_srs_play" */ '../components/page/live_srs_play.vue'),
                    meta: { title: 'srs播放器' }
                }
               
            ]
        },
        {
            path: '*',
            redirect: '/404'
        }
    ]
});
