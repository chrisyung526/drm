import {requestApi} from '@/utils/request';
import { option } from '@/api/optionParam';

export const mediaStreamGenerate = data => {
    option.isJson = true
    option.data = JSON.stringify(data)
    option.method = 'get'
    option.url = '/client-api/mediaStream/generateToken'
    return requestApi(option)
  }