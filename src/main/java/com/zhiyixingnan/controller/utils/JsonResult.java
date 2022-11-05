package com.zhiyixingnan.controller.utils;

/**
 * @author ZJ Description 通用返回对象 date 2022-11-05 10:35:06 10:35
 * @param
 */
public class JsonResult<T> {
  private long code;
  private String message;
  private T data;

  protected JsonResult() {}

  protected JsonResult(long code, String message, T data) {
    this.code = code;
    this.message = message;
    this.data = data;
  }

  /**
   * 成功返回结果
   *
   * @param data 获取的数据
   */
  public static <T> JsonResult<T> success(T data) {
    return new JsonResult<T>(ResultCode.SUCCESS.getCode(), ResultCode.SUCCESS.getMessage(), data);
  }

  /**
   * 成功返回结果
   *
   * @param data 获取的数据
   * @param message 提示信息
   */
  public static <T> JsonResult<T> success(T data, String message) {
    return new JsonResult<T>(ResultCode.SUCCESS.getCode(), message, data);
  }

  /**
   * 失败返回结果
   *
   * @param errorCode 错误码
   */
  public static <T> JsonResult<T> failed(IErrorCode errorCode) {
    return new JsonResult<T>(errorCode.getCode(), errorCode.getMessage(), null);
  }

  /**
   * 失败返回结果
   *
   * @param message 提示信息
   */
  public static <T> JsonResult<T> failed(String message) {
    return new JsonResult<T>(ResultCode.FAILED.getCode(), message, null);
  }

  /** 失败返回结果 */
  public static <T> JsonResult<T> failed() {
    return failed(ResultCode.FAILED);
  }

  /** 参数验证失败返回结果 */
  public static <T> JsonResult<T> validateFailed() {
    return failed(ResultCode.VALIDATE_FAILED);
  }

  /**
   * 参数验证失败返回结果
   *
   * @param message 提示信息
   */
  public static <T> JsonResult<T> validateFailed(String message) {
    return new JsonResult<T>(ResultCode.VALIDATE_FAILED.getCode(), message, null);
  }

  /** 未登录返回结果 */
  public static <T> JsonResult<T> unauthorized(T data) {
    return new JsonResult<T>(
        ResultCode.UNAUTHORIZED.getCode(), ResultCode.UNAUTHORIZED.getMessage(), data);
  }

  /** 未授权返回结果 */
  public static <T> JsonResult<T> forbidden(T data) {
    return new JsonResult<T>(
        ResultCode.FORBIDDEN.getCode(), ResultCode.FORBIDDEN.getMessage(), data);
  }

  public long getCode() {
    return code;
  }

  public void setCode(long code) {
    this.code = code;
  }

  public String getMessage() {
    return message;
  }

  public void setMessage(String message) {
    this.message = message;
  }

  public T getData() {
    return data;
  }

  public void setData(T data) {
    this.data = data;
  }
}
