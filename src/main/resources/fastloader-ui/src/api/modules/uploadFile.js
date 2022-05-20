import {requestApi} from '@/utils/request';
import { option } from '@/api/optionParam';

export const mergeFile = data => {
    option.isJson = true
    option.data = JSON.stringify(data)
    option.method = 'post'
    option.url = '/client-api/file/mergeFile'
    return requestApi(option)
  }

export const selectFileList = query => {
    option.isJson = true
    option.data = query
    option.method = 'post'
    option.url = '/client-api/file/selectFileList'
    return requestApi(option)
};

export const deleteFile = data => {
  option.isJson = true
  option.data = JSON.stringify(data)
  option.method = 'post'
  option.url = '/client-api/file/deleteFile'
  return requestApi(option)
}

export const downloadFile = query => {
  option.isJson = true
  option.data = query
  option.method = 'get'
  option.async = false
  option.url = '/client-api/file/download'
  return requestApi(option)
};

export const selectFileDetail = query => {
  option.isJson = true
  option.method = 'get'
  option.url = '/client-api/file/detail'+query
  return requestApi(option)
};
