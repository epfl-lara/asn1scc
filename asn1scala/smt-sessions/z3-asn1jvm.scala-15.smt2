; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!474 () Bool)

(assert start!474)

(declare-fun b!1351 () Bool)

(declare-fun e!826 () Bool)

(declare-fun e!822 () Bool)

(assert (=> b!1351 (= e!826 e!822)))

(declare-fun res!3409 () Bool)

(assert (=> b!1351 (=> (not res!3409) (not e!822))))

(declare-datatypes ((array!119 0))(
  ( (array!120 (arr!431 (Array (_ BitVec 32) (_ BitVec 8))) (size!44 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!72 0))(
  ( (BitStream!73 (buf!356 array!119) (currentByte!1296 (_ BitVec 32)) (currentBit!1291 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!92 0))(
  ( (tuple2!93 (_1!46 BitStream!72) (_2!46 Bool)) )
))
(declare-fun lt!896 () tuple2!92)

(declare-datatypes ((Unit!33 0))(
  ( (Unit!34) )
))
(declare-datatypes ((tuple2!94 0))(
  ( (tuple2!95 (_1!47 Unit!33) (_2!47 BitStream!72)) )
))
(declare-fun lt!898 () tuple2!94)

(assert (=> b!1351 (= res!3409 (and (_2!46 lt!896) (= (_1!46 lt!896) (_2!47 lt!898))))))

(declare-fun thiss!932 () BitStream!72)

(declare-fun readBitPure!0 (BitStream!72) tuple2!92)

(declare-fun readerFrom!0 (BitStream!72 (_ BitVec 32) (_ BitVec 32)) BitStream!72)

(assert (=> b!1351 (= lt!896 (readBitPure!0 (readerFrom!0 (_2!47 lt!898) (currentBit!1291 thiss!932) (currentByte!1296 thiss!932))))))

(declare-fun b!1352 () Bool)

(declare-fun e!824 () Bool)

(declare-fun e!825 () Bool)

(assert (=> b!1352 (= e!824 (not e!825))))

(declare-fun res!3412 () Bool)

(assert (=> b!1352 (=> res!3412 e!825)))

(assert (=> b!1352 (= res!3412 (not (= (size!44 (buf!356 (_2!47 lt!898))) (size!44 (buf!356 thiss!932)))))))

(declare-fun e!823 () Bool)

(assert (=> b!1352 e!823))

(declare-fun res!3410 () Bool)

(assert (=> b!1352 (=> (not res!3410) (not e!823))))

(assert (=> b!1352 (= res!3410 (= (size!44 (buf!356 thiss!932)) (size!44 (buf!356 (_2!47 lt!898)))))))

(declare-fun appendBit!0 (BitStream!72 Bool) tuple2!94)

(assert (=> b!1352 (= lt!898 (appendBit!0 thiss!932 true))))

(declare-fun res!3411 () Bool)

(assert (=> start!474 (=> (not res!3411) (not e!824))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!474 (= res!3411 (validate_offset_bit!0 ((_ sign_extend 32) (size!44 (buf!356 thiss!932))) ((_ sign_extend 32) (currentByte!1296 thiss!932)) ((_ sign_extend 32) (currentBit!1291 thiss!932))))))

(assert (=> start!474 e!824))

(declare-fun e!821 () Bool)

(declare-fun inv!12 (BitStream!72) Bool)

(assert (=> start!474 (and (inv!12 thiss!932) e!821)))

(declare-fun b!1353 () Bool)

(declare-fun res!3408 () Bool)

(assert (=> b!1353 (=> (not res!3408) (not e!826))))

(declare-fun isPrefixOf!0 (BitStream!72 BitStream!72) Bool)

(assert (=> b!1353 (= res!3408 (isPrefixOf!0 thiss!932 (_2!47 lt!898)))))

(declare-fun b!1354 () Bool)

(declare-fun lt!899 () (_ BitVec 64))

(declare-fun lt!894 () (_ BitVec 64))

(assert (=> b!1354 (= e!825 (or (not (= lt!899 #b0000000000000000000000000000000000000000000000000000000000000000)) (= lt!899 (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!894) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1354 (= lt!899 (bvand lt!894 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!1354 (= lt!894 (bitIndex!0 (size!44 (buf!356 thiss!932)) (currentByte!1296 thiss!932) (currentBit!1291 thiss!932)))))

(declare-fun b!1355 () Bool)

(declare-fun array_inv!41 (array!119) Bool)

(assert (=> b!1355 (= e!821 (array_inv!41 (buf!356 thiss!932)))))

(declare-fun b!1356 () Bool)

(declare-fun lt!897 () (_ BitVec 64))

(assert (=> b!1356 (= e!822 (= (bitIndex!0 (size!44 (buf!356 (_1!46 lt!896))) (currentByte!1296 (_1!46 lt!896)) (currentBit!1291 (_1!46 lt!896))) lt!897))))

(declare-fun b!1357 () Bool)

(assert (=> b!1357 (= e!823 e!826)))

(declare-fun res!3407 () Bool)

(assert (=> b!1357 (=> (not res!3407) (not e!826))))

(declare-fun lt!895 () (_ BitVec 64))

(assert (=> b!1357 (= res!3407 (= lt!897 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!895)))))

(assert (=> b!1357 (= lt!897 (bitIndex!0 (size!44 (buf!356 (_2!47 lt!898))) (currentByte!1296 (_2!47 lt!898)) (currentBit!1291 (_2!47 lt!898))))))

(assert (=> b!1357 (= lt!895 (bitIndex!0 (size!44 (buf!356 thiss!932)) (currentByte!1296 thiss!932) (currentBit!1291 thiss!932)))))

(assert (= (and start!474 res!3411) b!1352))

(assert (= (and b!1352 res!3410) b!1357))

(assert (= (and b!1357 res!3407) b!1353))

(assert (= (and b!1353 res!3408) b!1351))

(assert (= (and b!1351 res!3409) b!1356))

(assert (= (and b!1352 (not res!3412)) b!1354))

(assert (= start!474 b!1355))

(declare-fun m!957 () Bool)

(assert (=> b!1357 m!957))

(declare-fun m!959 () Bool)

(assert (=> b!1357 m!959))

(assert (=> b!1354 m!959))

(declare-fun m!961 () Bool)

(assert (=> b!1353 m!961))

(declare-fun m!963 () Bool)

(assert (=> b!1356 m!963))

(declare-fun m!965 () Bool)

(assert (=> b!1352 m!965))

(declare-fun m!967 () Bool)

(assert (=> start!474 m!967))

(declare-fun m!969 () Bool)

(assert (=> start!474 m!969))

(declare-fun m!971 () Bool)

(assert (=> b!1355 m!971))

(declare-fun m!973 () Bool)

(assert (=> b!1351 m!973))

(assert (=> b!1351 m!973))

(declare-fun m!975 () Bool)

(assert (=> b!1351 m!975))

(check-sat (not b!1353) (not b!1357) (not start!474) (not b!1351) (not b!1354) (not b!1356) (not b!1355) (not b!1352))
(check-sat)
(get-model)

(declare-fun d!1188 () Bool)

(declare-fun e!854 () Bool)

(assert (=> d!1188 e!854))

(declare-fun res!3440 () Bool)

(assert (=> d!1188 (=> (not res!3440) (not e!854))))

(declare-fun lt!937 () (_ BitVec 64))

(declare-fun lt!936 () (_ BitVec 64))

(declare-fun lt!940 () (_ BitVec 64))

(assert (=> d!1188 (= res!3440 (= lt!940 (bvsub lt!937 lt!936)))))

(assert (=> d!1188 (or (= (bvand lt!937 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!936 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!937 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!937 lt!936) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!1188 (= lt!936 (remainingBits!0 ((_ sign_extend 32) (size!44 (buf!356 (_1!46 lt!896)))) ((_ sign_extend 32) (currentByte!1296 (_1!46 lt!896))) ((_ sign_extend 32) (currentBit!1291 (_1!46 lt!896)))))))

(declare-fun lt!941 () (_ BitVec 64))

(declare-fun lt!939 () (_ BitVec 64))

(assert (=> d!1188 (= lt!937 (bvmul lt!941 lt!939))))

(assert (=> d!1188 (or (= lt!941 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!939 (bvsdiv (bvmul lt!941 lt!939) lt!941)))))

(assert (=> d!1188 (= lt!939 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1188 (= lt!941 ((_ sign_extend 32) (size!44 (buf!356 (_1!46 lt!896)))))))

(assert (=> d!1188 (= lt!940 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1296 (_1!46 lt!896))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1291 (_1!46 lt!896)))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!1188 (invariant!0 (currentBit!1291 (_1!46 lt!896)) (currentByte!1296 (_1!46 lt!896)) (size!44 (buf!356 (_1!46 lt!896))))))

(assert (=> d!1188 (= (bitIndex!0 (size!44 (buf!356 (_1!46 lt!896))) (currentByte!1296 (_1!46 lt!896)) (currentBit!1291 (_1!46 lt!896))) lt!940)))

(declare-fun b!1386 () Bool)

(declare-fun res!3441 () Bool)

(assert (=> b!1386 (=> (not res!3441) (not e!854))))

(assert (=> b!1386 (= res!3441 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!940))))

(declare-fun b!1387 () Bool)

(declare-fun lt!938 () (_ BitVec 64))

(assert (=> b!1387 (= e!854 (bvsle lt!940 (bvmul lt!938 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1387 (or (= lt!938 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!938 #b0000000000000000000000000000000000000000000000000000000000001000) lt!938)))))

(assert (=> b!1387 (= lt!938 ((_ sign_extend 32) (size!44 (buf!356 (_1!46 lt!896)))))))

(assert (= (and d!1188 res!3440) b!1386))

(assert (= (and b!1386 res!3441) b!1387))

(declare-fun m!1005 () Bool)

(assert (=> d!1188 m!1005))

(declare-fun m!1007 () Bool)

(assert (=> d!1188 m!1007))

(assert (=> b!1356 d!1188))

(declare-fun d!1200 () Bool)

(assert (=> d!1200 (= (array_inv!41 (buf!356 thiss!932)) (bvsge (size!44 (buf!356 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!1355 d!1200))

(declare-fun d!1202 () Bool)

(declare-fun e!857 () Bool)

(assert (=> d!1202 e!857))

(declare-fun res!3444 () Bool)

(assert (=> d!1202 (=> (not res!3444) (not e!857))))

(declare-fun lt!946 () (_ BitVec 64))

(declare-fun lt!943 () (_ BitVec 64))

(declare-fun lt!942 () (_ BitVec 64))

(assert (=> d!1202 (= res!3444 (= lt!946 (bvsub lt!943 lt!942)))))

(assert (=> d!1202 (or (= (bvand lt!943 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!942 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!943 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!943 lt!942) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1202 (= lt!942 (remainingBits!0 ((_ sign_extend 32) (size!44 (buf!356 thiss!932))) ((_ sign_extend 32) (currentByte!1296 thiss!932)) ((_ sign_extend 32) (currentBit!1291 thiss!932))))))

(declare-fun lt!947 () (_ BitVec 64))

(declare-fun lt!945 () (_ BitVec 64))

(assert (=> d!1202 (= lt!943 (bvmul lt!947 lt!945))))

(assert (=> d!1202 (or (= lt!947 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!945 (bvsdiv (bvmul lt!947 lt!945) lt!947)))))

(assert (=> d!1202 (= lt!945 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1202 (= lt!947 ((_ sign_extend 32) (size!44 (buf!356 thiss!932))))))

(assert (=> d!1202 (= lt!946 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1296 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1291 thiss!932))))))

(assert (=> d!1202 (invariant!0 (currentBit!1291 thiss!932) (currentByte!1296 thiss!932) (size!44 (buf!356 thiss!932)))))

(assert (=> d!1202 (= (bitIndex!0 (size!44 (buf!356 thiss!932)) (currentByte!1296 thiss!932) (currentBit!1291 thiss!932)) lt!946)))

(declare-fun b!1390 () Bool)

(declare-fun res!3445 () Bool)

(assert (=> b!1390 (=> (not res!3445) (not e!857))))

(assert (=> b!1390 (= res!3445 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!946))))

(declare-fun b!1391 () Bool)

(declare-fun lt!944 () (_ BitVec 64))

(assert (=> b!1391 (= e!857 (bvsle lt!946 (bvmul lt!944 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1391 (or (= lt!944 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!944 #b0000000000000000000000000000000000000000000000000000000000001000) lt!944)))))

(assert (=> b!1391 (= lt!944 ((_ sign_extend 32) (size!44 (buf!356 thiss!932))))))

(assert (= (and d!1202 res!3444) b!1390))

(assert (= (and b!1390 res!3445) b!1391))

(declare-fun m!1009 () Bool)

(assert (=> d!1202 m!1009))

(declare-fun m!1011 () Bool)

(assert (=> d!1202 m!1011))

(assert (=> b!1354 d!1202))

(declare-fun d!1204 () Bool)

(assert (=> d!1204 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!44 (buf!356 thiss!932))) ((_ sign_extend 32) (currentByte!1296 thiss!932)) ((_ sign_extend 32) (currentBit!1291 thiss!932))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!44 (buf!356 thiss!932))) ((_ sign_extend 32) (currentByte!1296 thiss!932)) ((_ sign_extend 32) (currentBit!1291 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!443 () Bool)

(assert (= bs!443 d!1204))

(assert (=> bs!443 m!1009))

(assert (=> start!474 d!1204))

(declare-fun d!1208 () Bool)

(assert (=> d!1208 (= (inv!12 thiss!932) (invariant!0 (currentBit!1291 thiss!932) (currentByte!1296 thiss!932) (size!44 (buf!356 thiss!932))))))

(declare-fun bs!444 () Bool)

(assert (= bs!444 d!1208))

(assert (=> bs!444 m!1011))

(assert (=> start!474 d!1208))

(declare-fun d!1210 () Bool)

(declare-fun res!3458 () Bool)

(declare-fun e!865 () Bool)

(assert (=> d!1210 (=> (not res!3458) (not e!865))))

(assert (=> d!1210 (= res!3458 (= (size!44 (buf!356 thiss!932)) (size!44 (buf!356 (_2!47 lt!898)))))))

(assert (=> d!1210 (= (isPrefixOf!0 thiss!932 (_2!47 lt!898)) e!865)))

(declare-fun b!1403 () Bool)

(declare-fun res!3457 () Bool)

(assert (=> b!1403 (=> (not res!3457) (not e!865))))

(assert (=> b!1403 (= res!3457 (bvsle (bitIndex!0 (size!44 (buf!356 thiss!932)) (currentByte!1296 thiss!932) (currentBit!1291 thiss!932)) (bitIndex!0 (size!44 (buf!356 (_2!47 lt!898))) (currentByte!1296 (_2!47 lt!898)) (currentBit!1291 (_2!47 lt!898)))))))

(declare-fun b!1404 () Bool)

(declare-fun e!866 () Bool)

(assert (=> b!1404 (= e!865 e!866)))

(declare-fun res!3459 () Bool)

(assert (=> b!1404 (=> res!3459 e!866)))

(assert (=> b!1404 (= res!3459 (= (size!44 (buf!356 thiss!932)) #b00000000000000000000000000000000))))

(declare-fun b!1405 () Bool)

(declare-fun arrayBitRangesEq!0 (array!119 array!119 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!1405 (= e!866 (arrayBitRangesEq!0 (buf!356 thiss!932) (buf!356 (_2!47 lt!898)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!44 (buf!356 thiss!932)) (currentByte!1296 thiss!932) (currentBit!1291 thiss!932))))))

(assert (= (and d!1210 res!3458) b!1403))

(assert (= (and b!1403 res!3457) b!1404))

(assert (= (and b!1404 (not res!3459)) b!1405))

(assert (=> b!1403 m!959))

(assert (=> b!1403 m!957))

(assert (=> b!1405 m!959))

(assert (=> b!1405 m!959))

(declare-fun m!1017 () Bool)

(assert (=> b!1405 m!1017))

(assert (=> b!1353 d!1210))

(declare-fun b!1451 () Bool)

(declare-fun e!891 () Bool)

(declare-fun e!892 () Bool)

(assert (=> b!1451 (= e!891 e!892)))

(declare-fun res!3504 () Bool)

(assert (=> b!1451 (=> (not res!3504) (not e!892))))

(declare-fun lt!1017 () tuple2!92)

(declare-fun lt!1016 () tuple2!94)

(assert (=> b!1451 (= res!3504 (and (= (_2!46 lt!1017) true) (= (_1!46 lt!1017) (_2!47 lt!1016))))))

(assert (=> b!1451 (= lt!1017 (readBitPure!0 (readerFrom!0 (_2!47 lt!1016) (currentBit!1291 thiss!932) (currentByte!1296 thiss!932))))))

(declare-fun b!1450 () Bool)

(declare-fun res!3503 () Bool)

(assert (=> b!1450 (=> (not res!3503) (not e!891))))

(assert (=> b!1450 (= res!3503 (isPrefixOf!0 thiss!932 (_2!47 lt!1016)))))

(declare-fun b!1449 () Bool)

(declare-fun res!3505 () Bool)

(assert (=> b!1449 (=> (not res!3505) (not e!891))))

(declare-fun lt!1019 () (_ BitVec 64))

(declare-fun lt!1018 () (_ BitVec 64))

(assert (=> b!1449 (= res!3505 (= (bitIndex!0 (size!44 (buf!356 (_2!47 lt!1016))) (currentByte!1296 (_2!47 lt!1016)) (currentBit!1291 (_2!47 lt!1016))) (bvadd lt!1019 lt!1018)))))

(assert (=> b!1449 (or (not (= (bvand lt!1019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!1018 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!1019 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!1019 lt!1018) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!1449 (= lt!1018 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!1449 (= lt!1019 (bitIndex!0 (size!44 (buf!356 thiss!932)) (currentByte!1296 thiss!932) (currentBit!1291 thiss!932)))))

(declare-fun b!1452 () Bool)

(assert (=> b!1452 (= e!892 (= (bitIndex!0 (size!44 (buf!356 (_1!46 lt!1017))) (currentByte!1296 (_1!46 lt!1017)) (currentBit!1291 (_1!46 lt!1017))) (bitIndex!0 (size!44 (buf!356 (_2!47 lt!1016))) (currentByte!1296 (_2!47 lt!1016)) (currentBit!1291 (_2!47 lt!1016)))))))

(declare-fun d!1212 () Bool)

(assert (=> d!1212 e!891))

(declare-fun res!3502 () Bool)

(assert (=> d!1212 (=> (not res!3502) (not e!891))))

(assert (=> d!1212 (= res!3502 (= (size!44 (buf!356 thiss!932)) (size!44 (buf!356 (_2!47 lt!1016)))))))

(declare-fun choose!16 (BitStream!72 Bool) tuple2!94)

(assert (=> d!1212 (= lt!1016 (choose!16 thiss!932 true))))

(assert (=> d!1212 (validate_offset_bit!0 ((_ sign_extend 32) (size!44 (buf!356 thiss!932))) ((_ sign_extend 32) (currentByte!1296 thiss!932)) ((_ sign_extend 32) (currentBit!1291 thiss!932)))))

(assert (=> d!1212 (= (appendBit!0 thiss!932 true) lt!1016)))

(assert (= (and d!1212 res!3502) b!1449))

(assert (= (and b!1449 res!3505) b!1450))

(assert (= (and b!1450 res!3503) b!1451))

(assert (= (and b!1451 res!3504) b!1452))

(declare-fun m!1043 () Bool)

(assert (=> b!1452 m!1043))

(declare-fun m!1045 () Bool)

(assert (=> b!1452 m!1045))

(declare-fun m!1047 () Bool)

(assert (=> d!1212 m!1047))

(assert (=> d!1212 m!967))

(declare-fun m!1049 () Bool)

(assert (=> b!1450 m!1049))

(declare-fun m!1051 () Bool)

(assert (=> b!1451 m!1051))

(assert (=> b!1451 m!1051))

(declare-fun m!1053 () Bool)

(assert (=> b!1451 m!1053))

(assert (=> b!1449 m!1045))

(assert (=> b!1449 m!959))

(assert (=> b!1352 d!1212))

(declare-fun d!1234 () Bool)

(declare-fun e!893 () Bool)

(assert (=> d!1234 e!893))

(declare-fun res!3506 () Bool)

(assert (=> d!1234 (=> (not res!3506) (not e!893))))

(declare-fun lt!1021 () (_ BitVec 64))

(declare-fun lt!1024 () (_ BitVec 64))

(declare-fun lt!1020 () (_ BitVec 64))

(assert (=> d!1234 (= res!3506 (= lt!1024 (bvsub lt!1021 lt!1020)))))

(assert (=> d!1234 (or (= (bvand lt!1021 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!1020 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!1021 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!1021 lt!1020) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1234 (= lt!1020 (remainingBits!0 ((_ sign_extend 32) (size!44 (buf!356 (_2!47 lt!898)))) ((_ sign_extend 32) (currentByte!1296 (_2!47 lt!898))) ((_ sign_extend 32) (currentBit!1291 (_2!47 lt!898)))))))

(declare-fun lt!1025 () (_ BitVec 64))

(declare-fun lt!1023 () (_ BitVec 64))

(assert (=> d!1234 (= lt!1021 (bvmul lt!1025 lt!1023))))

(assert (=> d!1234 (or (= lt!1025 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!1023 (bvsdiv (bvmul lt!1025 lt!1023) lt!1025)))))

(assert (=> d!1234 (= lt!1023 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1234 (= lt!1025 ((_ sign_extend 32) (size!44 (buf!356 (_2!47 lt!898)))))))

(assert (=> d!1234 (= lt!1024 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1296 (_2!47 lt!898))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1291 (_2!47 lt!898)))))))

(assert (=> d!1234 (invariant!0 (currentBit!1291 (_2!47 lt!898)) (currentByte!1296 (_2!47 lt!898)) (size!44 (buf!356 (_2!47 lt!898))))))

(assert (=> d!1234 (= (bitIndex!0 (size!44 (buf!356 (_2!47 lt!898))) (currentByte!1296 (_2!47 lt!898)) (currentBit!1291 (_2!47 lt!898))) lt!1024)))

(declare-fun b!1453 () Bool)

(declare-fun res!3507 () Bool)

(assert (=> b!1453 (=> (not res!3507) (not e!893))))

(assert (=> b!1453 (= res!3507 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!1024))))

(declare-fun b!1454 () Bool)

(declare-fun lt!1022 () (_ BitVec 64))

(assert (=> b!1454 (= e!893 (bvsle lt!1024 (bvmul lt!1022 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!1454 (or (= lt!1022 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!1022 #b0000000000000000000000000000000000000000000000000000000000001000) lt!1022)))))

(assert (=> b!1454 (= lt!1022 ((_ sign_extend 32) (size!44 (buf!356 (_2!47 lt!898)))))))

(assert (= (and d!1234 res!3506) b!1453))

(assert (= (and b!1453 res!3507) b!1454))

(declare-fun m!1055 () Bool)

(assert (=> d!1234 m!1055))

(declare-fun m!1057 () Bool)

(assert (=> d!1234 m!1057))

(assert (=> b!1357 d!1234))

(assert (=> b!1357 d!1202))

(declare-fun d!1236 () Bool)

(declare-datatypes ((tuple2!104 0))(
  ( (tuple2!105 (_1!52 Bool) (_2!52 BitStream!72)) )
))
(declare-fun lt!1030 () tuple2!104)

(declare-fun readBit!0 (BitStream!72) tuple2!104)

(assert (=> d!1236 (= lt!1030 (readBit!0 (readerFrom!0 (_2!47 lt!898) (currentBit!1291 thiss!932) (currentByte!1296 thiss!932))))))

(assert (=> d!1236 (= (readBitPure!0 (readerFrom!0 (_2!47 lt!898) (currentBit!1291 thiss!932) (currentByte!1296 thiss!932))) (tuple2!93 (_2!52 lt!1030) (_1!52 lt!1030)))))

(declare-fun bs!445 () Bool)

(assert (= bs!445 d!1236))

(assert (=> bs!445 m!973))

(declare-fun m!1059 () Bool)

(assert (=> bs!445 m!1059))

(assert (=> b!1351 d!1236))

(declare-fun d!1238 () Bool)

(declare-fun e!906 () Bool)

(assert (=> d!1238 e!906))

(declare-fun res!3531 () Bool)

(assert (=> d!1238 (=> (not res!3531) (not e!906))))

(assert (=> d!1238 (= res!3531 (invariant!0 (currentBit!1291 (_2!47 lt!898)) (currentByte!1296 (_2!47 lt!898)) (size!44 (buf!356 (_2!47 lt!898)))))))

(assert (=> d!1238 (= (readerFrom!0 (_2!47 lt!898) (currentBit!1291 thiss!932) (currentByte!1296 thiss!932)) (BitStream!73 (buf!356 (_2!47 lt!898)) (currentByte!1296 thiss!932) (currentBit!1291 thiss!932)))))

(declare-fun b!1479 () Bool)

(assert (=> b!1479 (= e!906 (invariant!0 (currentBit!1291 thiss!932) (currentByte!1296 thiss!932) (size!44 (buf!356 (_2!47 lt!898)))))))

(assert (= (and d!1238 res!3531) b!1479))

(assert (=> d!1238 m!1057))

(declare-fun m!1061 () Bool)

(assert (=> b!1479 m!1061))

(assert (=> b!1351 d!1238))

(check-sat (not d!1202) (not b!1450) (not b!1452) (not d!1188) (not b!1405) (not d!1234) (not b!1479) (not b!1451) (not b!1403) (not d!1204) (not b!1449) (not d!1212) (not d!1236) (not d!1238) (not d!1208))
