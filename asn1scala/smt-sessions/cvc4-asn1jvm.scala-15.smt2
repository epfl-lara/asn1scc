; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!476 () Bool)

(assert start!476)

(declare-fun b!1372 () Bool)

(declare-fun e!845 () Bool)

(declare-fun e!846 () Bool)

(assert (=> b!1372 (= e!845 e!846)))

(declare-fun res!3430 () Bool)

(assert (=> b!1372 (=> (not res!3430) (not e!846))))

(declare-fun lt!914 () (_ BitVec 64))

(declare-fun lt!916 () (_ BitVec 64))

(assert (=> b!1372 (= res!3430 (= lt!914 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!916)))))

(declare-datatypes ((array!121 0))(
  ( (array!122 (arr!432 (Array (_ BitVec 32) (_ BitVec 8))) (size!45 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!74 0))(
  ( (BitStream!75 (buf!357 array!121) (currentByte!1297 (_ BitVec 32)) (currentBit!1292 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!35 0))(
  ( (Unit!36) )
))
(declare-datatypes ((tuple2!96 0))(
  ( (tuple2!97 (_1!48 Unit!35) (_2!48 BitStream!74)) )
))
(declare-fun lt!917 () tuple2!96)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!1372 (= lt!914 (bitIndex!0 (size!45 (buf!357 (_2!48 lt!917))) (currentByte!1297 (_2!48 lt!917)) (currentBit!1292 (_2!48 lt!917))))))

(declare-fun thiss!932 () BitStream!74)

(assert (=> b!1372 (= lt!916 (bitIndex!0 (size!45 (buf!357 thiss!932)) (currentByte!1297 thiss!932) (currentBit!1292 thiss!932)))))

(declare-fun b!1373 () Bool)

(declare-fun e!844 () Bool)

(declare-datatypes ((tuple2!98 0))(
  ( (tuple2!99 (_1!49 BitStream!74) (_2!49 Bool)) )
))
(declare-fun lt!913 () tuple2!98)

(assert (=> b!1373 (= e!844 (= (bitIndex!0 (size!45 (buf!357 (_1!49 lt!913))) (currentByte!1297 (_1!49 lt!913)) (currentBit!1292 (_1!49 lt!913))) lt!914))))

(declare-fun b!1374 () Bool)

(assert (=> b!1374 (= e!846 e!844)))

(declare-fun res!3425 () Bool)

(assert (=> b!1374 (=> (not res!3425) (not e!844))))

(assert (=> b!1374 (= res!3425 (and (_2!49 lt!913) (= (_1!49 lt!913) (_2!48 lt!917))))))

(declare-fun readBitPure!0 (BitStream!74) tuple2!98)

(declare-fun readerFrom!0 (BitStream!74 (_ BitVec 32) (_ BitVec 32)) BitStream!74)

(assert (=> b!1374 (= lt!913 (readBitPure!0 (readerFrom!0 (_2!48 lt!917) (currentBit!1292 thiss!932) (currentByte!1297 thiss!932))))))

(declare-fun b!1375 () Bool)

(declare-fun e!848 () Bool)

(declare-fun e!847 () Bool)

(assert (=> b!1375 (= e!848 (not e!847))))

(declare-fun res!3426 () Bool)

(assert (=> b!1375 (=> res!3426 e!847)))

(assert (=> b!1375 (= res!3426 (not (= (size!45 (buf!357 (_2!48 lt!917))) (size!45 (buf!357 thiss!932)))))))

(assert (=> b!1375 e!845))

(declare-fun res!3427 () Bool)

(assert (=> b!1375 (=> (not res!3427) (not e!845))))

(assert (=> b!1375 (= res!3427 (= (size!45 (buf!357 thiss!932)) (size!45 (buf!357 (_2!48 lt!917)))))))

(declare-fun appendBit!0 (BitStream!74 Bool) tuple2!96)

(assert (=> b!1375 (= lt!917 (appendBit!0 thiss!932 true))))

(declare-fun b!1376 () Bool)

(declare-fun e!843 () Bool)

(declare-fun array_inv!42 (array!121) Bool)

(assert (=> b!1376 (= e!843 (array_inv!42 (buf!357 thiss!932)))))

(declare-fun b!1377 () Bool)

(declare-fun lt!912 () (_ BitVec 64))

(declare-fun lt!915 () (_ BitVec 64))

(assert (=> b!1377 (= e!847 (or (not (= lt!912 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!912 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!915) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1377 (= lt!912 (bvand lt!915 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1377 (= lt!915 (bitIndex!0 (size!45 (buf!357 thiss!932)) (currentByte!1297 thiss!932) (currentBit!1292 thiss!932)))))

(declare-fun res!3428 () Bool)

(assert (=> start!476 (=> (not res!3428) (not e!848))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!476 (= res!3428 (validate_offset_bit!0 ((_ sign_extend 32) (size!45 (buf!357 thiss!932))) ((_ sign_extend 32) (currentByte!1297 thiss!932)) ((_ sign_extend 32) (currentBit!1292 thiss!932))))))

(assert (=> start!476 e!848))

(declare-fun inv!12 (BitStream!74) Bool)

(assert (=> start!476 (and (inv!12 thiss!932) e!843)))

(declare-fun b!1378 () Bool)

(declare-fun res!3429 () Bool)

(assert (=> b!1378 (=> (not res!3429) (not e!846))))

(declare-fun isPrefixOf!0 (BitStream!74 BitStream!74) Bool)

(assert (=> b!1378 (= res!3429 (isPrefixOf!0 thiss!932 (_2!48 lt!917)))))

(assert (= (and start!476 res!3428) b!1375))

(assert (= (and b!1375 res!3427) b!1372))

(assert (= (and b!1372 res!3430) b!1378))

(assert (= (and b!1378 res!3429) b!1374))

(assert (= (and b!1374 res!3425) b!1373))

(assert (= (and b!1375 (not res!3426)) b!1377))

(assert (= start!476 b!1376))

(declare-fun m!977 () Bool)

(assert (=> start!476 m!977))

(declare-fun m!979 () Bool)

(assert (=> start!476 m!979))

(declare-fun m!981 () Bool)

(assert (=> b!1373 m!981))

(declare-fun m!983 () Bool)

(assert (=> b!1374 m!983))

(assert (=> b!1374 m!983))

(declare-fun m!985 () Bool)

(assert (=> b!1374 m!985))

(declare-fun m!987 () Bool)

(assert (=> b!1372 m!987))

(declare-fun m!989 () Bool)

(assert (=> b!1372 m!989))

(declare-fun m!991 () Bool)

(assert (=> b!1376 m!991))

(declare-fun m!993 () Bool)

(assert (=> b!1378 m!993))

(assert (=> b!1377 m!989))

(declare-fun m!995 () Bool)

(assert (=> b!1375 m!995))

(push 1)

(assert (not b!1377))

(assert (not b!1375))

(assert (not start!476))

(assert (not b!1372))

(assert (not b!1374))

(assert (not b!1373))

(assert (not b!1376))

(assert (not b!1378))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!1192 () Bool)

(declare-datatypes ((tuple2!102 0))(
  ( (tuple2!103 (_1!51 Bool) (_2!51 BitStream!74)) )
))
(declare-fun lt!935 () tuple2!102)

(declare-fun readBit!0 (BitStream!74) tuple2!102)

(assert (=> d!1192 (= lt!935 (readBit!0 (readerFrom!0 (_2!48 lt!917) (currentBit!1292 thiss!932) (currentByte!1297 thiss!932))))))

(assert (=> d!1192 (= (readBitPure!0 (readerFrom!0 (_2!48 lt!917) (currentBit!1292 thiss!932) (currentByte!1297 thiss!932))) (tuple2!99 (_2!51 lt!935) (_1!51 lt!935)))))

(declare-fun bs!442 () Bool)

(assert (= bs!442 d!1192))

(assert (=> bs!442 m!983))

(declare-fun m!999 () Bool)

(assert (=> bs!442 m!999))

(assert (=> b!1374 d!1192))

(declare-fun d!1196 () Bool)

(declare-fun e!858 () Bool)

(assert (=> d!1196 e!858))

(declare-fun res!3446 () Bool)

(assert (=> d!1196 (=> (not res!3446) (not e!858))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!1196 (= res!3446 (invariant!0 (currentBit!1292 (_2!48 lt!917)) (currentByte!1297 (_2!48 lt!917)) (size!45 (buf!357 (_2!48 lt!917)))))))

(assert (=> d!1196 (= (readerFrom!0 (_2!48 lt!917) (currentBit!1292 thiss!932) (currentByte!1297 thiss!932)) (BitStream!75 (buf!357 (_2!48 lt!917)) (currentByte!1297 thiss!932) (currentBit!1292 thiss!932)))))

(declare-fun b!1392 () Bool)

(assert (=> b!1392 (= e!858 (invariant!0 (currentBit!1292 thiss!932) (currentByte!1297 thiss!932) (size!45 (buf!357 (_2!48 lt!917)))))))

(assert (= (and d!1196 res!3446) b!1392))

(declare-fun m!1013 () Bool)

(assert (=> d!1196 m!1013))

(declare-fun m!1015 () Bool)

(assert (=> b!1392 m!1015))

(assert (=> b!1374 d!1196))

(declare-fun d!1206 () Bool)

(declare-fun e!872 () Bool)

(assert (=> d!1206 e!872))

(declare-fun res!3471 () Bool)

(assert (=> d!1206 (=> (not res!3471) (not e!872))))

(declare-fun lt!991 () (_ BitVec 64))

(declare-fun lt!994 () (_ BitVec 64))

(declare-fun lt!990 () (_ BitVec 64))

(assert (=> d!1206 (= res!3471 (= lt!991 (bvsub lt!994 lt!990)))))

(assert (=> d!1206 (or (= (bvand lt!994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!990 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!994 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!994 lt!990) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1206 (= lt!990 (remainingBits!0 ((_ sign_extend 32) (size!45 (buf!357 (_1!49 lt!913)))) ((_ sign_extend 32) (currentByte!1297 (_1!49 lt!913))) ((_ sign_extend 32) (currentBit!1292 (_1!49 lt!913)))))))

(declare-fun lt!992 () (_ BitVec 64))

(declare-fun lt!995 () (_ BitVec 64))

(assert (=> d!1206 (= lt!994 (bvmul lt!992 lt!995))))

(assert (=> d!1206 (or (= lt!992 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!995 (bvsdiv (bvmul lt!992 lt!995) lt!992)))))

(assert (=> d!1206 (= lt!995 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1206 (= lt!992 ((_ sign_extend 32) (size!45 (buf!357 (_1!49 lt!913)))))))

(assert (=> d!1206 (= lt!991 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1297 (_1!49 lt!913))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1292 (_1!49 lt!913)))))))

(assert (=> d!1206 (invariant!0 (currentBit!1292 (_1!49 lt!913)) (currentByte!1297 (_1!49 lt!913)) (size!45 (buf!357 (_1!49 lt!913))))))

(assert (=> d!1206 (= (bitIndex!0 (size!45 (buf!357 (_1!49 lt!913))) (currentByte!1297 (_1!49 lt!913)) (currentBit!1292 (_1!49 lt!913))) lt!991)))

(declare-fun b!1416 () Bool)

(declare-fun res!3470 () Bool)

(assert (=> b!1416 (=> (not res!3470) (not e!872))))

(assert (=> b!1416 (= res!3470 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!991))))

(declare-fun b!1417 () Bool)

(declare-fun lt!993 () (_ BitVec 64))

(assert (=> b!1417 (= e!872 (bvsle lt!991 (bvmul lt!993 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1417 (or (= lt!993 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!993 #b0000000000000000000000000000000000000000000000000000000000001000) lt!993)))))

(assert (=> b!1417 (= lt!993 ((_ sign_extend 32) (size!45 (buf!357 (_1!49 lt!913)))))))

(assert (= (and d!1206 res!3471) b!1416))

(assert (= (and b!1416 res!3470) b!1417))

(declare-fun m!1029 () Bool)

(assert (=> d!1206 m!1029))

(declare-fun m!1031 () Bool)

(assert (=> d!1206 m!1031))

(assert (=> b!1373 d!1206))

(declare-fun d!1222 () Bool)

(declare-fun res!3487 () Bool)

(declare-fun e!883 () Bool)

(assert (=> d!1222 (=> (not res!3487) (not e!883))))

(assert (=> d!1222 (= res!3487 (= (size!45 (buf!357 thiss!932)) (size!45 (buf!357 (_2!48 lt!917)))))))

(assert (=> d!1222 (= (isPrefixOf!0 thiss!932 (_2!48 lt!917)) e!883)))

(declare-fun b!1433 () Bool)

(declare-fun res!3488 () Bool)

(assert (=> b!1433 (=> (not res!3488) (not e!883))))

(assert (=> b!1433 (= res!3488 (bvsle (bitIndex!0 (size!45 (buf!357 thiss!932)) (currentByte!1297 thiss!932) (currentBit!1292 thiss!932)) (bitIndex!0 (size!45 (buf!357 (_2!48 lt!917))) (currentByte!1297 (_2!48 lt!917)) (currentBit!1292 (_2!48 lt!917)))))))

(declare-fun b!1434 () Bool)

(declare-fun e!884 () Bool)

(assert (=> b!1434 (= e!883 e!884)))

(declare-fun res!3489 () Bool)

(assert (=> b!1434 (=> res!3489 e!884)))

(assert (=> b!1434 (= res!3489 (= (size!45 (buf!357 thiss!932)) #b00000000000000000000000000000000))))

(declare-fun b!1435 () Bool)

(declare-fun arrayBitRangesEq!0 (array!121 array!121 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1435 (= e!884 (arrayBitRangesEq!0 (buf!357 thiss!932) (buf!357 (_2!48 lt!917)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!45 (buf!357 thiss!932)) (currentByte!1297 thiss!932) (currentBit!1292 thiss!932))))))

(assert (= (and d!1222 res!3487) b!1433))

(assert (= (and b!1433 res!3488) b!1434))

(assert (= (and b!1434 (not res!3489)) b!1435))

(assert (=> b!1433 m!989))

(assert (=> b!1433 m!987))

(assert (=> b!1435 m!989))

(assert (=> b!1435 m!989))

(declare-fun m!1035 () Bool)

(assert (=> b!1435 m!1035))

(assert (=> b!1378 d!1222))

(declare-fun d!1226 () Bool)

(declare-fun e!885 () Bool)

(assert (=> d!1226 e!885))

(declare-fun res!3491 () Bool)

(assert (=> d!1226 (=> (not res!3491) (not e!885))))

(declare-fun lt!997 () (_ BitVec 64))

(declare-fun lt!996 () (_ BitVec 64))

(declare-fun lt!1000 () (_ BitVec 64))

(assert (=> d!1226 (= res!3491 (= lt!997 (bvsub lt!1000 lt!996)))))

(assert (=> d!1226 (or (= (bvand lt!1000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!996 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!1000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!1000 lt!996) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1226 (= lt!996 (remainingBits!0 ((_ sign_extend 32) (size!45 (buf!357 (_2!48 lt!917)))) ((_ sign_extend 32) (currentByte!1297 (_2!48 lt!917))) ((_ sign_extend 32) (currentBit!1292 (_2!48 lt!917)))))))

(declare-fun lt!998 () (_ BitVec 64))

(declare-fun lt!1001 () (_ BitVec 64))

(assert (=> d!1226 (= lt!1000 (bvmul lt!998 lt!1001))))

(assert (=> d!1226 (or (= lt!998 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!1001 (bvsdiv (bvmul lt!998 lt!1001) lt!998)))))

(assert (=> d!1226 (= lt!1001 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1226 (= lt!998 ((_ sign_extend 32) (size!45 (buf!357 (_2!48 lt!917)))))))

(assert (=> d!1226 (= lt!997 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1297 (_2!48 lt!917))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1292 (_2!48 lt!917)))))))

(assert (=> d!1226 (invariant!0 (currentBit!1292 (_2!48 lt!917)) (currentByte!1297 (_2!48 lt!917)) (size!45 (buf!357 (_2!48 lt!917))))))

(assert (=> d!1226 (= (bitIndex!0 (size!45 (buf!357 (_2!48 lt!917))) (currentByte!1297 (_2!48 lt!917)) (currentBit!1292 (_2!48 lt!917))) lt!997)))

(declare-fun b!1436 () Bool)

(declare-fun res!3490 () Bool)

(assert (=> b!1436 (=> (not res!3490) (not e!885))))

(assert (=> b!1436 (= res!3490 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!997))))

(declare-fun b!1437 () Bool)

(declare-fun lt!999 () (_ BitVec 64))

(assert (=> b!1437 (= e!885 (bvsle lt!997 (bvmul lt!999 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1437 (or (= lt!999 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!999 #b0000000000000000000000000000000000000000000000000000000000001000) lt!999)))))

(assert (=> b!1437 (= lt!999 ((_ sign_extend 32) (size!45 (buf!357 (_2!48 lt!917)))))))

(assert (= (and d!1226 res!3491) b!1436))

(assert (= (and b!1436 res!3490) b!1437))

(declare-fun m!1037 () Bool)

(assert (=> d!1226 m!1037))

(assert (=> d!1226 m!1013))

(assert (=> b!1372 d!1226))

(declare-fun d!1228 () Bool)

(declare-fun e!886 () Bool)

(assert (=> d!1228 e!886))

(declare-fun res!3493 () Bool)

(assert (=> d!1228 (=> (not res!3493) (not e!886))))

(declare-fun lt!1003 () (_ BitVec 64))

(declare-fun lt!1006 () (_ BitVec 64))

(declare-fun lt!1002 () (_ BitVec 64))

(assert (=> d!1228 (= res!3493 (= lt!1003 (bvsub lt!1006 lt!1002)))))

(assert (=> d!1228 (or (= (bvand lt!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!1002 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!1006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!1006 lt!1002) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1228 (= lt!1002 (remainingBits!0 ((_ sign_extend 32) (size!45 (buf!357 thiss!932))) ((_ sign_extend 32) (currentByte!1297 thiss!932)) ((_ sign_extend 32) (currentBit!1292 thiss!932))))))

(declare-fun lt!1004 () (_ BitVec 64))

(declare-fun lt!1007 () (_ BitVec 64))

(assert (=> d!1228 (= lt!1006 (bvmul lt!1004 lt!1007))))

(assert (=> d!1228 (or (= lt!1004 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!1007 (bvsdiv (bvmul lt!1004 lt!1007) lt!1004)))))

(assert (=> d!1228 (= lt!1007 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1228 (= lt!1004 ((_ sign_extend 32) (size!45 (buf!357 thiss!932))))))

(assert (=> d!1228 (= lt!1003 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1297 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1292 thiss!932))))))

(assert (=> d!1228 (invariant!0 (currentBit!1292 thiss!932) (currentByte!1297 thiss!932) (size!45 (buf!357 thiss!932)))))

(assert (=> d!1228 (= (bitIndex!0 (size!45 (buf!357 thiss!932)) (currentByte!1297 thiss!932) (currentBit!1292 thiss!932)) lt!1003)))

(declare-fun b!1438 () Bool)

(declare-fun res!3492 () Bool)

(assert (=> b!1438 (=> (not res!3492) (not e!886))))

(assert (=> b!1438 (= res!3492 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!1003))))

(declare-fun b!1439 () Bool)

(declare-fun lt!1005 () (_ BitVec 64))

(assert (=> b!1439 (= e!886 (bvsle lt!1003 (bvmul lt!1005 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1439 (or (= lt!1005 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!1005 #b0000000000000000000000000000000000000000000000000000000000001000) lt!1005)))))

(assert (=> b!1439 (= lt!1005 ((_ sign_extend 32) (size!45 (buf!357 thiss!932))))))

(assert (= (and d!1228 res!3493) b!1438))

(assert (= (and b!1438 res!3492) b!1439))

(declare-fun m!1039 () Bool)

(assert (=> d!1228 m!1039))

(declare-fun m!1041 () Bool)

(assert (=> d!1228 m!1041))

(assert (=> b!1372 d!1228))

(assert (=> b!1377 d!1228))

(declare-fun d!1230 () Bool)

(assert (=> d!1230 (= (array_inv!42 (buf!357 thiss!932)) (bvsge (size!45 (buf!357 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!1376 d!1230))

(declare-fun d!1232 () Bool)

(declare-fun e!907 () Bool)

(assert (=> d!1232 e!907))

(declare-fun res!3535 () Bool)

(assert (=> d!1232 (=> (not res!3535) (not e!907))))

(declare-fun lt!1049 () tuple2!96)

(assert (=> d!1232 (= res!3535 (= (size!45 (buf!357 thiss!932)) (size!45 (buf!357 (_2!48 lt!1049)))))))

(declare-fun choose!16 (BitStream!74 Bool) tuple2!96)

(assert (=> d!1232 (= lt!1049 (choose!16 thiss!932 true))))

(assert (=> d!1232 (validate_offset_bit!0 ((_ sign_extend 32) (size!45 (buf!357 thiss!932))) ((_ sign_extend 32) (currentByte!1297 thiss!932)) ((_ sign_extend 32) (currentBit!1292 thiss!932)))))

(assert (=> d!1232 (= (appendBit!0 thiss!932 true) lt!1049)))

(declare-fun b!1483 () Bool)

(declare-fun e!908 () Bool)

(declare-fun lt!1052 () tuple2!98)

(assert (=> b!1483 (= e!908 (= (bitIndex!0 (size!45 (buf!357 (_1!49 lt!1052))) (currentByte!1297 (_1!49 lt!1052)) (currentBit!1292 (_1!49 lt!1052))) (bitIndex!0 (size!45 (buf!357 (_2!48 lt!1049))) (currentByte!1297 (_2!48 lt!1049)) (currentBit!1292 (_2!48 lt!1049)))))))

(declare-fun b!1481 () Bool)

(declare-fun res!3532 () Bool)

(assert (=> b!1481 (=> (not res!3532) (not e!907))))

(assert (=> b!1481 (= res!3532 (isPrefixOf!0 thiss!932 (_2!48 lt!1049)))))

(declare-fun b!1482 () Bool)

(assert (=> b!1482 (= e!907 e!908)))

(declare-fun res!3533 () Bool)

(assert (=> b!1482 (=> (not res!3533) (not e!908))))

(assert (=> b!1482 (= res!3533 (and (= (_2!49 lt!1052) true) (= (_1!49 lt!1052) (_2!48 lt!1049))))))

(assert (=> b!1482 (= lt!1052 (readBitPure!0 (readerFrom!0 (_2!48 lt!1049) (currentBit!1292 thiss!932) (currentByte!1297 thiss!932))))))

(declare-fun b!1480 () Bool)

(declare-fun res!3534 () Bool)

(assert (=> b!1480 (=> (not res!3534) (not e!907))))

(declare-fun lt!1050 () (_ BitVec 64))

(declare-fun lt!1051 () (_ BitVec 64))

(assert (=> b!1480 (= res!3534 (= (bitIndex!0 (size!45 (buf!357 (_2!48 lt!1049))) (currentByte!1297 (_2!48 lt!1049)) (currentBit!1292 (_2!48 lt!1049))) (bvadd lt!1051 lt!1050)))))

(assert (=> b!1480 (or (not (= (bvand lt!1051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!1050 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!1051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!1051 lt!1050) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1480 (= lt!1050 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!1480 (= lt!1051 (bitIndex!0 (size!45 (buf!357 thiss!932)) (currentByte!1297 thiss!932) (currentBit!1292 thiss!932)))))

(assert (= (and d!1232 res!3535) b!1480))

(assert (= (and b!1480 res!3534) b!1481))

(assert (= (and b!1481 res!3532) b!1482))

(assert (= (and b!1482 res!3533) b!1483))

(declare-fun m!1075 () Bool)

(assert (=> b!1482 m!1075))

(assert (=> b!1482 m!1075))

(declare-fun m!1077 () Bool)

(assert (=> b!1482 m!1077))

(declare-fun m!1079 () Bool)

(assert (=> b!1480 m!1079))

(assert (=> b!1480 m!989))

(declare-fun m!1081 () Bool)

(assert (=> b!1481 m!1081))

(declare-fun m!1083 () Bool)

(assert (=> d!1232 m!1083))

(assert (=> d!1232 m!977))

(declare-fun m!1085 () Bool)

(assert (=> b!1483 m!1085))

(assert (=> b!1483 m!1079))

(assert (=> b!1375 d!1232))

(declare-fun d!1244 () Bool)

(assert (=> d!1244 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!45 (buf!357 thiss!932))) ((_ sign_extend 32) (currentByte!1297 thiss!932)) ((_ sign_extend 32) (currentBit!1292 thiss!932))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!45 (buf!357 thiss!932))) ((_ sign_extend 32) (currentByte!1297 thiss!932)) ((_ sign_extend 32) (currentBit!1292 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!448 () Bool)

(assert (= bs!448 d!1244))

(assert (=> bs!448 m!1039))

(assert (=> start!476 d!1244))

(declare-fun d!1246 () Bool)

(assert (=> d!1246 (= (inv!12 thiss!932) (invariant!0 (currentBit!1292 thiss!932) (currentByte!1297 thiss!932) (size!45 (buf!357 thiss!932))))))

(declare-fun bs!449 () Bool)

(assert (= bs!449 d!1246))

(assert (=> bs!449 m!1041))

(assert (=> start!476 d!1246))

(push 1)

(assert (not d!1226))

(assert (not b!1392))

(assert (not b!1482))

(assert (not d!1244))

(assert (not b!1435))

(assert (not d!1232))

(assert (not d!1228))

(assert (not b!1483))

(assert (not d!1206))

(assert (not b!1480))

(assert (not b!1433))

(assert (not d!1196))

(assert (not d!1192))

(assert (not d!1246))

(assert (not b!1481))

(check-sat)

(pop 1)

(push 1)

(check-sat)

