import {requestApi} from '@/utils/request';
import { option } from '@/api/optionParam';

 

export const selectLiveList = query => {
    option.isJson = true
    option.method = 'get'
    option.url = '/client-api/live'
    return requestApi(option)
};

export const addLive = data => {
  option.isJson = true
  option.data = JSON.stringify(data)
  option.method = 'post'
  option.url = '/client-api/live'
  return requestApi(option)
}

export const liveInfoToRoomId = query => {
  option.isJson = true
  option.method = 'get'
  option.url = '/client-api/live/'+query
  return requestApi(option)
}; 

export const getLiveToken =data=>{
  option.isJson = true
  option.data = JSON.stringify(data)
  option.method = 'get'
  option.url = '/client-api/mediaStream/generateToken'
  return requestApi(option)
}