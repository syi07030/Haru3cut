//
//  RegisterCheck.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/16.
//

import Foundation
import SwiftUI

public func emailCheck(email:String) -> String{
//    let pattern = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$"
    if email == "aa" {
      return "ok"
    } else {
      return "유효하지 않은 이메일 형식입니다"
}
}
    
public func passwordCheck(password:String) -> String{
    if password == "aa" {
        return "ok"
    } else {
        return "유효하지 않은 비밀번호 형식입니다"
    }
}

public func passwordDoubleCheck(password:String) -> String{
    if password == "aa" {
        return "ok"
    } else {
        return "비밀번호가 같지 않습니다"
    }
}

public func nicknameCheck(nickName:String) -> String{
    if nickName == "aa" {
        return "ok"
    } else {
        return "이미 있는 닉네임입니다"
    }
}

public func phoneNumberCheck(phoneNumber:String) -> String{
    if phoneNumber == "aa" {
        return "ok"
    } else {
        return "유효하지 않은 전화번호 형식입니다"
    }
}


/*
 interface validateInputInterface {
   nickName: string;
   email: string;
   passWord: string;
   passWordCheck: string;
   phoneNumber: string;
 }
 export const validateInput = (inputForm: validateInputInterface) => {
   const returnForm: validateInputInterface = {
     nickName: ‘’,
     email: ‘’,
     passWord: ‘’,
     passWordCheck: ‘’,
     phoneNumber: ‘’,
   };
   if (inputForm.nickName.length < 4) {
     returnForm.nickName = ‘너무 짧은 이름입니다‘;
   } else if (inputForm.nickName.length > 12) {
     returnForm.nickName = ‘너무 긴 이름입니다’;
   } else {
     returnForm.nickName = ‘ok’;
   }
   if (/^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/.test(inputForm.email)) {
     returnForm.email = ‘ok’;
   } else {
     returnForm.email = ‘유효하지 않은 이메일입니다‘;
   }
   if (inputForm.passWord.length < 7) {
     returnForm.passWord = ‘너무 짧은 암호입니다‘;
   } else if (!/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/.test(inputForm.passWord)) {
     returnForm.passWord = ‘최소 1자리 이상의 숫자와 특수문자가 필요합니다’;
   } else {
     returnForm.passWord = ‘ok’;
   }
   if (inputForm.passWord !== inputForm.passWordCheck) {
     returnForm.passWordCheck = ‘암호가 다릅니다‘;
   } else if (inputForm.passWordCheck.length < 7) {
     returnForm.passWordCheck = ‘너무 짧은 암호입니다‘;
   } else if (!/^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/.test(inputForm.passWordCheck)) {
     returnForm.passWordCheck = ‘최소 1자리 이상의 숫자와 특수문자가 필요합니다’;
   } else {
     returnForm.passWordCheck = ‘ok’;
   }
   if (/^[0-9]{3}[-]+[0-9]{4}[-]+[0-9]{4}$/.test(inputForm.phoneNumber)) {
     returnForm.phoneNumber = ‘ok’;
   } else {
     returnForm.phoneNumber = ‘유효하지 않은 전화번호입니다’;
   }
   return returnForm;
 };
 */
