; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!472 () Bool)

(assert start!472)

(declare-fun b!1330 () Bool)

(declare-fun e!804 () Bool)

(declare-datatypes ((array!117 0))(
  ( (array!118 (arr!430 (Array (_ BitVec 32) (_ BitVec 8))) (size!43 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!70 0))(
  ( (BitStream!71 (buf!355 array!117) (currentByte!1295 (_ BitVec 32)) (currentBit!1290 (_ BitVec 32))) )
))
(declare-fun thiss!932 () BitStream!70)

(declare-fun array_inv!40 (array!117) Bool)

(assert (=> b!1330 (= e!804 (array_inv!40 (buf!355 thiss!932)))))

(declare-fun b!1331 () Bool)

(declare-fun e!805 () Bool)

(declare-datatypes ((tuple2!88 0))(
  ( (tuple2!89 (_1!44 BitStream!70) (_2!44 Bool)) )
))
(declare-fun lt!881 () tuple2!88)

(declare-fun lt!876 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!1331 (= e!805 (= (bitIndex!0 (size!43 (buf!355 (_1!44 lt!881))) (currentByte!1295 (_1!44 lt!881)) (currentBit!1290 (_1!44 lt!881))) lt!876))))

(declare-fun res!3390 () Bool)

(declare-fun e!801 () Bool)

(assert (=> start!472 (=> (not res!3390) (not e!801))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!472 (= res!3390 (validate_offset_bit!0 ((_ sign_extend 32) (size!43 (buf!355 thiss!932))) ((_ sign_extend 32) (currentByte!1295 thiss!932)) ((_ sign_extend 32) (currentBit!1290 thiss!932))))))

(assert (=> start!472 e!801))

(declare-fun inv!12 (BitStream!70) Bool)

(assert (=> start!472 (and (inv!12 thiss!932) e!804)))

(declare-fun b!1332 () Bool)

(declare-fun e!800 () Bool)

(assert (=> b!1332 (= e!800 e!805)))

(declare-fun res!3392 () Bool)

(assert (=> b!1332 (=> (not res!3392) (not e!805))))

(declare-datatypes ((Unit!31 0))(
  ( (Unit!32) )
))
(declare-datatypes ((tuple2!90 0))(
  ( (tuple2!91 (_1!45 Unit!31) (_2!45 BitStream!70)) )
))
(declare-fun lt!877 () tuple2!90)

(assert (=> b!1332 (= res!3392 (and (_2!44 lt!881) (= (_1!44 lt!881) (_2!45 lt!877))))))

(declare-fun readBitPure!0 (BitStream!70) tuple2!88)

(declare-fun readerFrom!0 (BitStream!70 (_ BitVec 32) (_ BitVec 32)) BitStream!70)

(assert (=> b!1332 (= lt!881 (readBitPure!0 (readerFrom!0 (_2!45 lt!877) (currentBit!1290 thiss!932) (currentByte!1295 thiss!932))))))

(declare-fun b!1333 () Bool)

(declare-fun e!803 () Bool)

(assert (=> b!1333 (= e!801 (not e!803))))

(declare-fun res!3389 () Bool)

(assert (=> b!1333 (=> res!3389 e!803)))

(assert (=> b!1333 (= res!3389 (not (= (size!43 (buf!355 (_2!45 lt!877))) (size!43 (buf!355 thiss!932)))))))

(declare-fun e!802 () Bool)

(assert (=> b!1333 e!802))

(declare-fun res!3394 () Bool)

(assert (=> b!1333 (=> (not res!3394) (not e!802))))

(assert (=> b!1333 (= res!3394 (= (size!43 (buf!355 thiss!932)) (size!43 (buf!355 (_2!45 lt!877)))))))

(declare-fun appendBit!0 (BitStream!70 Bool) tuple2!90)

(assert (=> b!1333 (= lt!877 (appendBit!0 thiss!932 true))))

(declare-fun b!1334 () Bool)

(declare-fun lt!880 () (_ BitVec 64))

(declare-fun lt!879 () (_ BitVec 64))

(assert (=> b!1334 (= e!803 (or (not (= lt!880 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!880 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!879) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1334 (= lt!880 (bvand lt!879 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1334 (= lt!879 (bitIndex!0 (size!43 (buf!355 thiss!932)) (currentByte!1295 thiss!932) (currentBit!1290 thiss!932)))))

(declare-fun b!1335 () Bool)

(declare-fun res!3393 () Bool)

(assert (=> b!1335 (=> (not res!3393) (not e!800))))

(declare-fun isPrefixOf!0 (BitStream!70 BitStream!70) Bool)

(assert (=> b!1335 (= res!3393 (isPrefixOf!0 thiss!932 (_2!45 lt!877)))))

(declare-fun b!1336 () Bool)

(assert (=> b!1336 (= e!802 e!800)))

(declare-fun res!3391 () Bool)

(assert (=> b!1336 (=> (not res!3391) (not e!800))))

(declare-fun lt!878 () (_ BitVec 64))

(assert (=> b!1336 (= res!3391 (= lt!876 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!878)))))

(assert (=> b!1336 (= lt!876 (bitIndex!0 (size!43 (buf!355 (_2!45 lt!877))) (currentByte!1295 (_2!45 lt!877)) (currentBit!1290 (_2!45 lt!877))))))

(assert (=> b!1336 (= lt!878 (bitIndex!0 (size!43 (buf!355 thiss!932)) (currentByte!1295 thiss!932) (currentBit!1290 thiss!932)))))

(assert (= (and start!472 res!3390) b!1333))

(assert (= (and b!1333 res!3394) b!1336))

(assert (= (and b!1336 res!3391) b!1335))

(assert (= (and b!1335 res!3393) b!1332))

(assert (= (and b!1332 res!3392) b!1331))

(assert (= (and b!1333 (not res!3389)) b!1334))

(assert (= start!472 b!1330))

(declare-fun m!937 () Bool)

(assert (=> start!472 m!937))

(declare-fun m!939 () Bool)

(assert (=> start!472 m!939))

(declare-fun m!941 () Bool)

(assert (=> b!1332 m!941))

(assert (=> b!1332 m!941))

(declare-fun m!943 () Bool)

(assert (=> b!1332 m!943))

(declare-fun m!945 () Bool)

(assert (=> b!1334 m!945))

(declare-fun m!947 () Bool)

(assert (=> b!1330 m!947))

(declare-fun m!949 () Bool)

(assert (=> b!1333 m!949))

(declare-fun m!951 () Bool)

(assert (=> b!1335 m!951))

(declare-fun m!953 () Bool)

(assert (=> b!1331 m!953))

(declare-fun m!955 () Bool)

(assert (=> b!1336 m!955))

(assert (=> b!1336 m!945))

(push 1)

(assert (not start!472))

(assert (not b!1333))

(assert (not b!1332))

(assert (not b!1331))

(assert (not b!1336))

(assert (not b!1335))

(assert (not b!1334))

(assert (not b!1330))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1190 () Bool)

(declare-datatypes ((tuple2!100 0))(
  ( (tuple2!101 (_1!50 Bool) (_2!50 BitStream!70)) )
))
(declare-fun lt!920 () tuple2!100)

(declare-fun readBit!0 (BitStream!70) tuple2!100)

(assert (=> d!1190 (= lt!920 (readBit!0 (readerFrom!0 (_2!45 lt!877) (currentBit!1290 thiss!932) (currentByte!1295 thiss!932))))))

(assert (=> d!1190 (= (readBitPure!0 (readerFrom!0 (_2!45 lt!877) (currentBit!1290 thiss!932) (currentByte!1295 thiss!932))) (tuple2!89 (_2!50 lt!920) (_1!50 lt!920)))))

(declare-fun bs!441 () Bool)

(assert (= bs!441 d!1190))

(assert (=> bs!441 m!941))

(declare-fun m!997 () Bool)

(assert (=> bs!441 m!997))

(assert (=> b!1332 d!1190))

(declare-fun d!1194 () Bool)

(declare-fun e!853 () Bool)

(assert (=> d!1194 e!853))

(declare-fun res!3438 () Bool)

(assert (=> d!1194 (=> (not res!3438) (not e!853))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!1194 (= res!3438 (invariant!0 (currentBit!1290 (_2!45 lt!877)) (currentByte!1295 (_2!45 lt!877)) (size!43 (buf!355 (_2!45 lt!877)))))))

(assert (=> d!1194 (= (readerFrom!0 (_2!45 lt!877) (currentBit!1290 thiss!932) (currentByte!1295 thiss!932)) (BitStream!71 (buf!355 (_2!45 lt!877)) (currentByte!1295 thiss!932) (currentBit!1290 thiss!932)))))

(declare-fun b!1385 () Bool)

(assert (=> b!1385 (= e!853 (invariant!0 (currentBit!1290 thiss!932) (currentByte!1295 thiss!932) (size!43 (buf!355 (_2!45 lt!877)))))))

(assert (= (and d!1194 res!3438) b!1385))

(declare-fun m!1001 () Bool)

(assert (=> d!1194 m!1001))

(declare-fun m!1003 () Bool)

(assert (=> b!1385 m!1003))

(assert (=> b!1332 d!1194))

(declare-fun d!1198 () Bool)

(declare-fun e!867 () Bool)

(assert (=> d!1198 e!867))

(declare-fun res!3461 () Bool)

(assert (=> d!1198 (=> (not res!3461) (not e!867))))

(declare-fun lt!961 () (_ BitVec 64))

(declare-fun lt!965 () (_ BitVec 64))

(declare-fun lt!962 () (_ BitVec 64))

(assert (=> d!1198 (= res!3461 (= lt!961 (bvsub lt!965 lt!962)))))

(assert (=> d!1198 (or (= (bvand lt!965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!962 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!965 lt!962) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1198 (= lt!962 (remainingBits!0 ((_ sign_extend 32) (size!43 (buf!355 (_1!44 lt!881)))) ((_ sign_extend 32) (currentByte!1295 (_1!44 lt!881))) ((_ sign_extend 32) (currentBit!1290 (_1!44 lt!881)))))))

(declare-fun lt!964 () (_ BitVec 64))

(declare-fun lt!960 () (_ BitVec 64))

(assert (=> d!1198 (= lt!965 (bvmul lt!964 lt!960))))

(assert (=> d!1198 (or (= lt!964 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!960 (bvsdiv (bvmul lt!964 lt!960) lt!964)))))

(assert (=> d!1198 (= lt!960 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1198 (= lt!964 ((_ sign_extend 32) (size!43 (buf!355 (_1!44 lt!881)))))))

(assert (=> d!1198 (= lt!961 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1295 (_1!44 lt!881))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1290 (_1!44 lt!881)))))))

(assert (=> d!1198 (invariant!0 (currentBit!1290 (_1!44 lt!881)) (currentByte!1295 (_1!44 lt!881)) (size!43 (buf!355 (_1!44 lt!881))))))

(assert (=> d!1198 (= (bitIndex!0 (size!43 (buf!355 (_1!44 lt!881))) (currentByte!1295 (_1!44 lt!881)) (currentBit!1290 (_1!44 lt!881))) lt!961)))

(declare-fun b!1406 () Bool)

(declare-fun res!3460 () Bool)

(assert (=> b!1406 (=> (not res!3460) (not e!867))))

(assert (=> b!1406 (= res!3460 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!961))))

(declare-fun b!1407 () Bool)

(declare-fun lt!963 () (_ BitVec 64))

(assert (=> b!1407 (= e!867 (bvsle lt!961 (bvmul lt!963 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1407 (or (= lt!963 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!963 #b0000000000000000000000000000000000000000000000000000000000001000) lt!963)))))

(assert (=> b!1407 (= lt!963 ((_ sign_extend 32) (size!43 (buf!355 (_1!44 lt!881)))))))

(assert (= (and d!1198 res!3461) b!1406))

(assert (= (and b!1406 res!3460) b!1407))

(declare-fun m!1019 () Bool)

(assert (=> d!1198 m!1019))

(declare-fun m!1021 () Bool)

(assert (=> d!1198 m!1021))

(assert (=> b!1331 d!1198))

(declare-fun d!1214 () Bool)

(declare-fun e!870 () Bool)

(assert (=> d!1214 e!870))

(declare-fun res!3465 () Bool)

(assert (=> d!1214 (=> (not res!3465) (not e!870))))

(declare-fun lt!978 () (_ BitVec 64))

(declare-fun lt!977 () (_ BitVec 64))

(declare-fun lt!981 () (_ BitVec 64))

(assert (=> d!1214 (= res!3465 (= lt!977 (bvsub lt!981 lt!978)))))

(assert (=> d!1214 (or (= (bvand lt!981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!978 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!981 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!981 lt!978) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1214 (= lt!978 (remainingBits!0 ((_ sign_extend 32) (size!43 (buf!355 (_2!45 lt!877)))) ((_ sign_extend 32) (currentByte!1295 (_2!45 lt!877))) ((_ sign_extend 32) (currentBit!1290 (_2!45 lt!877)))))))

(declare-fun lt!980 () (_ BitVec 64))

(declare-fun lt!976 () (_ BitVec 64))

(assert (=> d!1214 (= lt!981 (bvmul lt!980 lt!976))))

(assert (=> d!1214 (or (= lt!980 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!976 (bvsdiv (bvmul lt!980 lt!976) lt!980)))))

(assert (=> d!1214 (= lt!976 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1214 (= lt!980 ((_ sign_extend 32) (size!43 (buf!355 (_2!45 lt!877)))))))

(assert (=> d!1214 (= lt!977 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1295 (_2!45 lt!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1290 (_2!45 lt!877)))))))

(assert (=> d!1214 (invariant!0 (currentBit!1290 (_2!45 lt!877)) (currentByte!1295 (_2!45 lt!877)) (size!43 (buf!355 (_2!45 lt!877))))))

(assert (=> d!1214 (= (bitIndex!0 (size!43 (buf!355 (_2!45 lt!877))) (currentByte!1295 (_2!45 lt!877)) (currentBit!1290 (_2!45 lt!877))) lt!977)))

(declare-fun b!1408 () Bool)

(declare-fun res!3464 () Bool)

(assert (=> b!1408 (=> (not res!3464) (not e!870))))

(assert (=> b!1408 (= res!3464 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!977))))

(declare-fun b!1409 () Bool)

(declare-fun lt!979 () (_ BitVec 64))

(assert (=> b!1409 (= e!870 (bvsle lt!977 (bvmul lt!979 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1409 (or (= lt!979 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!979 #b0000000000000000000000000000000000000000000000000000000000001000) lt!979)))))

(assert (=> b!1409 (= lt!979 ((_ sign_extend 32) (size!43 (buf!355 (_2!45 lt!877)))))))

(assert (= (and d!1214 res!3465) b!1408))

(assert (= (and b!1408 res!3464) b!1409))

(declare-fun m!1023 () Bool)

(assert (=> d!1214 m!1023))

(assert (=> d!1214 m!1001))

(assert (=> b!1336 d!1214))

(declare-fun d!1216 () Bool)

(declare-fun e!871 () Bool)

(assert (=> d!1216 e!871))

(declare-fun res!3469 () Bool)

(assert (=> d!1216 (=> (not res!3469) (not e!871))))

(declare-fun lt!986 () (_ BitVec 64))

(declare-fun lt!985 () (_ BitVec 64))

(declare-fun lt!989 () (_ BitVec 64))

(assert (=> d!1216 (= res!3469 (= lt!985 (bvsub lt!989 lt!986)))))

(assert (=> d!1216 (or (= (bvand lt!989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!986 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!989 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!989 lt!986) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1216 (= lt!986 (remainingBits!0 ((_ sign_extend 32) (size!43 (buf!355 thiss!932))) ((_ sign_extend 32) (currentByte!1295 thiss!932)) ((_ sign_extend 32) (currentBit!1290 thiss!932))))))

(declare-fun lt!988 () (_ BitVec 64))

(declare-fun lt!984 () (_ BitVec 64))

(assert (=> d!1216 (= lt!989 (bvmul lt!988 lt!984))))

(assert (=> d!1216 (or (= lt!988 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!984 (bvsdiv (bvmul lt!988 lt!984) lt!988)))))

(assert (=> d!1216 (= lt!984 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1216 (= lt!988 ((_ sign_extend 32) (size!43 (buf!355 thiss!932))))))

(assert (=> d!1216 (= lt!985 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1295 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1290 thiss!932))))))

(assert (=> d!1216 (invariant!0 (currentBit!1290 thiss!932) (currentByte!1295 thiss!932) (size!43 (buf!355 thiss!932)))))

(assert (=> d!1216 (= (bitIndex!0 (size!43 (buf!355 thiss!932)) (currentByte!1295 thiss!932) (currentBit!1290 thiss!932)) lt!985)))

(declare-fun b!1414 () Bool)

(declare-fun res!3468 () Bool)

(assert (=> b!1414 (=> (not res!3468) (not e!871))))

(assert (=> b!1414 (= res!3468 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!985))))

(declare-fun b!1415 () Bool)

(declare-fun lt!987 () (_ BitVec 64))

(assert (=> b!1415 (= e!871 (bvsle lt!985 (bvmul lt!987 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1415 (or (= lt!987 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!987 #b0000000000000000000000000000000000000000000000000000000000001000) lt!987)))))

(assert (=> b!1415 (= lt!987 ((_ sign_extend 32) (size!43 (buf!355 thiss!932))))))

(assert (= (and d!1216 res!3469) b!1414))

(assert (= (and b!1414 res!3468) b!1415))

(declare-fun m!1025 () Bool)

(assert (=> d!1216 m!1025))

(declare-fun m!1027 () Bool)

(assert (=> d!1216 m!1027))

(assert (=> b!1336 d!1216))

(declare-fun d!1218 () Bool)

(assert (=> d!1218 (= (array_inv!40 (buf!355 thiss!932)) (bvsge (size!43 (buf!355 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!1330 d!1218))

(declare-fun d!1220 () Bool)

(declare-fun res!3484 () Bool)

(declare-fun e!881 () Bool)

(assert (=> d!1220 (=> (not res!3484) (not e!881))))

(assert (=> d!1220 (= res!3484 (= (size!43 (buf!355 thiss!932)) (size!43 (buf!355 (_2!45 lt!877)))))))

(assert (=> d!1220 (= (isPrefixOf!0 thiss!932 (_2!45 lt!877)) e!881)))

(declare-fun b!1430 () Bool)

(declare-fun res!3485 () Bool)

(assert (=> b!1430 (=> (not res!3485) (not e!881))))

(assert (=> b!1430 (= res!3485 (bvsle (bitIndex!0 (size!43 (buf!355 thiss!932)) (currentByte!1295 thiss!932) (currentBit!1290 thiss!932)) (bitIndex!0 (size!43 (buf!355 (_2!45 lt!877))) (currentByte!1295 (_2!45 lt!877)) (currentBit!1290 (_2!45 lt!877)))))))

(declare-fun b!1431 () Bool)

(declare-fun e!882 () Bool)

(assert (=> b!1431 (= e!881 e!882)))

(declare-fun res!3486 () Bool)

(assert (=> b!1431 (=> res!3486 e!882)))

(assert (=> b!1431 (= res!3486 (= (size!43 (buf!355 thiss!932)) #b00000000000000000000000000000000))))

(declare-fun b!1432 () Bool)

(declare-fun arrayBitRangesEq!0 (array!117 array!117 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1432 (= e!882 (arrayBitRangesEq!0 (buf!355 thiss!932) (buf!355 (_2!45 lt!877)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!43 (buf!355 thiss!932)) (currentByte!1295 thiss!932) (currentBit!1290 thiss!932))))))

(assert (= (and d!1220 res!3484) b!1430))

(assert (= (and b!1430 res!3485) b!1431))

(assert (= (and b!1431 (not res!3486)) b!1432))

(assert (=> b!1430 m!945))

(assert (=> b!1430 m!955))

(assert (=> b!1432 m!945))

(assert (=> b!1432 m!945))

(declare-fun m!1033 () Bool)

(assert (=> b!1432 m!1033))

(assert (=> b!1335 d!1220))

(assert (=> b!1334 d!1216))

(declare-fun d!1224 () Bool)

(declare-fun e!904 () Bool)

(assert (=> d!1224 e!904))

(declare-fun res!3527 () Bool)

(assert (=> d!1224 (=> (not res!3527) (not e!904))))

(declare-fun lt!1047 () tuple2!90)

(assert (=> d!1224 (= res!3527 (= (size!43 (buf!355 thiss!932)) (size!43 (buf!355 (_2!45 lt!1047)))))))

(declare-fun choose!16 (BitStream!70 Bool) tuple2!90)

(assert (=> d!1224 (= lt!1047 (choose!16 thiss!932 true))))

(assert (=> d!1224 (validate_offset_bit!0 ((_ sign_extend 32) (size!43 (buf!355 thiss!932))) ((_ sign_extend 32) (currentByte!1295 thiss!932)) ((_ sign_extend 32) (currentBit!1290 thiss!932)))))

(assert (=> d!1224 (= (appendBit!0 thiss!932 true) lt!1047)))

(declare-fun b!1478 () Bool)

(declare-fun e!905 () Bool)

(declare-fun lt!1045 () tuple2!88)

(assert (=> b!1478 (= e!905 (= (bitIndex!0 (size!43 (buf!355 (_1!44 lt!1045))) (currentByte!1295 (_1!44 lt!1045)) (currentBit!1290 (_1!44 lt!1045))) (bitIndex!0 (size!43 (buf!355 (_2!45 lt!1047))) (currentByte!1295 (_2!45 lt!1047)) (currentBit!1290 (_2!45 lt!1047)))))))

(declare-fun b!1475 () Bool)

(declare-fun res!3528 () Bool)

(assert (=> b!1475 (=> (not res!3528) (not e!904))))

(declare-fun lt!1048 () (_ BitVec 64))

(declare-fun lt!1046 () (_ BitVec 64))

(assert (=> b!1475 (= res!3528 (= (bitIndex!0 (size!43 (buf!355 (_2!45 lt!1047))) (currentByte!1295 (_2!45 lt!1047)) (currentBit!1290 (_2!45 lt!1047))) (bvadd lt!1046 lt!1048)))))

(assert (=> b!1475 (or (not (= (bvand lt!1046 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!1048 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!1046 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!1046 lt!1048) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1475 (= lt!1048 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!1475 (= lt!1046 (bitIndex!0 (size!43 (buf!355 thiss!932)) (currentByte!1295 thiss!932) (currentBit!1290 thiss!932)))))

(declare-fun b!1477 () Bool)

(assert (=> b!1477 (= e!904 e!905)))

(declare-fun res!3529 () Bool)

(assert (=> b!1477 (=> (not res!3529) (not e!905))))

(assert (=> b!1477 (= res!3529 (and (= (_2!44 lt!1045) true) (= (_1!44 lt!1045) (_2!45 lt!1047))))))

(assert (=> b!1477 (= lt!1045 (readBitPure!0 (readerFrom!0 (_2!45 lt!1047) (currentBit!1290 thiss!932) (currentByte!1295 thiss!932))))))

(declare-fun b!1476 () Bool)

(declare-fun res!3530 () Bool)

(assert (=> b!1476 (=> (not res!3530) (not e!904))))

(assert (=> b!1476 (= res!3530 (isPrefixOf!0 thiss!932 (_2!45 lt!1047)))))

(assert (= (and d!1224 res!3527) b!1475))

(assert (= (and b!1475 res!3528) b!1476))

(assert (= (and b!1476 res!3530) b!1477))

(assert (= (and b!1477 res!3529) b!1478))

(declare-fun m!1063 () Bool)

(assert (=> b!1476 m!1063))

(declare-fun m!1065 () Bool)

(assert (=> b!1477 m!1065))

(assert (=> b!1477 m!1065))

(declare-fun m!1067 () Bool)

(assert (=> b!1477 m!1067))

(declare-fun m!1069 () Bool)

(assert (=> b!1475 m!1069))

(assert (=> b!1475 m!945))

(declare-fun m!1071 () Bool)

(assert (=> b!1478 m!1071))

(assert (=> b!1478 m!1069))

(declare-fun m!1073 () Bool)

(assert (=> d!1224 m!1073))

(assert (=> d!1224 m!937))

(assert (=> b!1333 d!1224))

(declare-fun d!1240 () Bool)

(assert (=> d!1240 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!43 (buf!355 thiss!932))) ((_ sign_extend 32) (currentByte!1295 thiss!932)) ((_ sign_extend 32) (currentBit!1290 thiss!932))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!43 (buf!355 thiss!932))) ((_ sign_extend 32) (currentByte!1295 thiss!932)) ((_ sign_extend 32) (currentBit!1290 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!446 () Bool)

(assert (= bs!446 d!1240))

(assert (=> bs!446 m!1025))

(assert (=> start!472 d!1240))

(declare-fun d!1242 () Bool)

(assert (=> d!1242 (= (inv!12 thiss!932) (invariant!0 (currentBit!1290 thiss!932) (currentByte!1295 thiss!932) (size!43 (buf!355 thiss!932))))))

(declare-fun bs!447 () Bool)

(assert (= bs!447 d!1242))

(assert (=> bs!447 m!1027))

(assert (=> start!472 d!1242))

(push 1)

(assert (not b!1432))

(assert (not d!1224))

(assert (not b!1475))

(assert (not d!1214))

(assert (not d!1194))

(assert (not d!1240))

(assert (not b!1476))

(assert (not d!1198))

(assert (not b!1478))

(assert (not b!1430))

(assert (not d!1216))

(assert (not d!1190))

(assert (not b!1385))

(assert (not d!1242))

(assert (not b!1477))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

