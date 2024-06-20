; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!300 () Bool)

(assert start!300)

(declare-fun b!794 () Bool)

(declare-fun e!455 () Bool)

(declare-datatypes ((array!92 0))(
  ( (array!93 (arr!422 (Array (_ BitVec 32) (_ BitVec 8))) (size!35 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!54 0))(
  ( (BitStream!55 (buf!347 array!92) (currentByte!1263 (_ BitVec 32)) (currentBit!1258 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!15 0))(
  ( (Unit!16) )
))
(declare-datatypes ((tuple2!38 0))(
  ( (tuple2!39 (_1!19 Unit!15) (_2!19 BitStream!54)) )
))
(declare-fun lt!362 () tuple2!38)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!794 (= e!455 (invariant!0 (currentBit!1258 (_2!19 lt!362)) (currentByte!1263 (_2!19 lt!362)) (size!35 (buf!347 (_2!19 lt!362)))))))

(declare-fun b!795 () Bool)

(declare-fun e!453 () Bool)

(declare-fun e!452 () Bool)

(assert (=> b!795 (= e!453 e!452)))

(declare-fun res!2884 () Bool)

(assert (=> b!795 (=> (not res!2884) (not e!452))))

(declare-fun lt!364 () (_ BitVec 64))

(declare-fun lt!365 () (_ BitVec 64))

(assert (=> b!795 (= res!2884 (= lt!364 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!365)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!795 (= lt!364 (bitIndex!0 (size!35 (buf!347 (_2!19 lt!362))) (currentByte!1263 (_2!19 lt!362)) (currentBit!1258 (_2!19 lt!362))))))

(declare-fun thiss!932 () BitStream!54)

(assert (=> b!795 (= lt!365 (bitIndex!0 (size!35 (buf!347 thiss!932)) (currentByte!1263 thiss!932) (currentBit!1258 thiss!932)))))

(declare-fun b!796 () Bool)

(declare-fun res!2878 () Bool)

(assert (=> b!796 (=> res!2878 e!455)))

(assert (=> b!796 (= res!2878 (not (= (bitIndex!0 (size!35 (buf!347 (_2!19 lt!362))) (currentByte!1263 (_2!19 lt!362)) (currentBit!1258 (_2!19 lt!362))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!35 (buf!347 thiss!932)) (currentByte!1263 thiss!932) (currentBit!1258 thiss!932))))))))

(declare-fun b!797 () Bool)

(declare-fun e!458 () Bool)

(assert (=> b!797 (= e!458 (not e!455))))

(declare-fun res!2879 () Bool)

(assert (=> b!797 (=> res!2879 e!455)))

(assert (=> b!797 (= res!2879 (not (= (size!35 (buf!347 (_2!19 lt!362))) (size!35 (buf!347 thiss!932)))))))

(assert (=> b!797 e!453))

(declare-fun res!2882 () Bool)

(assert (=> b!797 (=> (not res!2882) (not e!453))))

(assert (=> b!797 (= res!2882 (= (size!35 (buf!347 thiss!932)) (size!35 (buf!347 (_2!19 lt!362)))))))

(declare-fun appendBit!0 (BitStream!54 Bool) tuple2!38)

(assert (=> b!797 (= lt!362 (appendBit!0 thiss!932 true))))

(declare-fun b!799 () Bool)

(declare-fun e!457 () Bool)

(declare-fun array_inv!32 (array!92) Bool)

(assert (=> b!799 (= e!457 (array_inv!32 (buf!347 thiss!932)))))

(declare-fun b!800 () Bool)

(declare-fun res!2881 () Bool)

(assert (=> b!800 (=> res!2881 e!455)))

(declare-fun isPrefixOf!0 (BitStream!54 BitStream!54) Bool)

(assert (=> b!800 (= res!2881 (not (isPrefixOf!0 thiss!932 (_2!19 lt!362))))))

(declare-fun res!2880 () Bool)

(assert (=> start!300 (=> (not res!2880) (not e!458))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!300 (= res!2880 (validate_offset_bit!0 ((_ sign_extend 32) (size!35 (buf!347 thiss!932))) ((_ sign_extend 32) (currentByte!1263 thiss!932)) ((_ sign_extend 32) (currentBit!1258 thiss!932))))))

(assert (=> start!300 e!458))

(declare-fun inv!12 (BitStream!54) Bool)

(assert (=> start!300 (and (inv!12 thiss!932) e!457)))

(declare-fun b!798 () Bool)

(declare-fun e!454 () Bool)

(assert (=> b!798 (= e!452 e!454)))

(declare-fun res!2877 () Bool)

(assert (=> b!798 (=> (not res!2877) (not e!454))))

(declare-datatypes ((tuple2!40 0))(
  ( (tuple2!41 (_1!20 BitStream!54) (_2!20 Bool)) )
))
(declare-fun lt!363 () tuple2!40)

(assert (=> b!798 (= res!2877 (and (_2!20 lt!363) (= (_1!20 lt!363) (_2!19 lt!362))))))

(declare-fun readBitPure!0 (BitStream!54) tuple2!40)

(declare-fun readerFrom!0 (BitStream!54 (_ BitVec 32) (_ BitVec 32)) BitStream!54)

(assert (=> b!798 (= lt!363 (readBitPure!0 (readerFrom!0 (_2!19 lt!362) (currentBit!1258 thiss!932) (currentByte!1263 thiss!932))))))

(declare-fun b!801 () Bool)

(assert (=> b!801 (= e!454 (= (bitIndex!0 (size!35 (buf!347 (_1!20 lt!363))) (currentByte!1263 (_1!20 lt!363)) (currentBit!1258 (_1!20 lt!363))) lt!364))))

(declare-fun b!802 () Bool)

(declare-fun res!2883 () Bool)

(assert (=> b!802 (=> (not res!2883) (not e!452))))

(assert (=> b!802 (= res!2883 (isPrefixOf!0 thiss!932 (_2!19 lt!362)))))

(assert (= (and start!300 res!2880) b!797))

(assert (= (and b!797 res!2882) b!795))

(assert (= (and b!795 res!2884) b!802))

(assert (= (and b!802 res!2883) b!798))

(assert (= (and b!798 res!2877) b!801))

(assert (= (and b!797 (not res!2879)) b!796))

(assert (= (and b!796 (not res!2878)) b!800))

(assert (= (and b!800 (not res!2881)) b!794))

(assert (= start!300 b!799))

(declare-fun m!497 () Bool)

(assert (=> start!300 m!497))

(declare-fun m!499 () Bool)

(assert (=> start!300 m!499))

(declare-fun m!501 () Bool)

(assert (=> b!799 m!501))

(declare-fun m!503 () Bool)

(assert (=> b!797 m!503))

(declare-fun m!505 () Bool)

(assert (=> b!798 m!505))

(assert (=> b!798 m!505))

(declare-fun m!507 () Bool)

(assert (=> b!798 m!507))

(declare-fun m!509 () Bool)

(assert (=> b!802 m!509))

(declare-fun m!511 () Bool)

(assert (=> b!794 m!511))

(declare-fun m!513 () Bool)

(assert (=> b!801 m!513))

(declare-fun m!515 () Bool)

(assert (=> b!796 m!515))

(declare-fun m!517 () Bool)

(assert (=> b!796 m!517))

(assert (=> b!795 m!515))

(assert (=> b!795 m!517))

(assert (=> b!800 m!509))

(check-sat (not b!798) (not b!796) (not b!794) (not start!300) (not b!802) (not b!800) (not b!801) (not b!797) (not b!795) (not b!799))
(check-sat)
(get-model)

(declare-fun d!978 () Bool)

(declare-fun e!488 () Bool)

(assert (=> d!978 e!488))

(declare-fun res!2922 () Bool)

(assert (=> d!978 (=> (not res!2922) (not e!488))))

(declare-fun lt!398 () (_ BitVec 64))

(declare-fun lt!401 () (_ BitVec 64))

(declare-fun lt!396 () (_ BitVec 64))

(assert (=> d!978 (= res!2922 (= lt!398 (bvsub lt!396 lt!401)))))

(assert (=> d!978 (or (= (bvand lt!396 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!401 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!396 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!396 lt!401) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!978 (= lt!401 (remainingBits!0 ((_ sign_extend 32) (size!35 (buf!347 (_1!20 lt!363)))) ((_ sign_extend 32) (currentByte!1263 (_1!20 lt!363))) ((_ sign_extend 32) (currentBit!1258 (_1!20 lt!363)))))))

(declare-fun lt!397 () (_ BitVec 64))

(declare-fun lt!400 () (_ BitVec 64))

(assert (=> d!978 (= lt!396 (bvmul lt!397 lt!400))))

(assert (=> d!978 (or (= lt!397 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400 (bvsdiv (bvmul lt!397 lt!400) lt!397)))))

(assert (=> d!978 (= lt!400 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!978 (= lt!397 ((_ sign_extend 32) (size!35 (buf!347 (_1!20 lt!363)))))))

(assert (=> d!978 (= lt!398 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1263 (_1!20 lt!363))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1258 (_1!20 lt!363)))))))

(assert (=> d!978 (invariant!0 (currentBit!1258 (_1!20 lt!363)) (currentByte!1263 (_1!20 lt!363)) (size!35 (buf!347 (_1!20 lt!363))))))

(assert (=> d!978 (= (bitIndex!0 (size!35 (buf!347 (_1!20 lt!363))) (currentByte!1263 (_1!20 lt!363)) (currentBit!1258 (_1!20 lt!363))) lt!398)))

(declare-fun b!840 () Bool)

(declare-fun res!2921 () Bool)

(assert (=> b!840 (=> (not res!2921) (not e!488))))

(assert (=> b!840 (= res!2921 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!398))))

(declare-fun b!841 () Bool)

(declare-fun lt!399 () (_ BitVec 64))

(assert (=> b!841 (= e!488 (bvsle lt!398 (bvmul lt!399 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!841 (or (= lt!399 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!399 #b0000000000000000000000000000000000000000000000000000000000001000) lt!399)))))

(assert (=> b!841 (= lt!399 ((_ sign_extend 32) (size!35 (buf!347 (_1!20 lt!363)))))))

(assert (= (and d!978 res!2922) b!840))

(assert (= (and b!840 res!2921) b!841))

(declare-fun m!549 () Bool)

(assert (=> d!978 m!549))

(declare-fun m!551 () Bool)

(assert (=> d!978 m!551))

(assert (=> b!801 d!978))

(declare-fun d!996 () Bool)

(declare-fun res!2949 () Bool)

(declare-fun e!505 () Bool)

(assert (=> d!996 (=> (not res!2949) (not e!505))))

(assert (=> d!996 (= res!2949 (= (size!35 (buf!347 thiss!932)) (size!35 (buf!347 (_2!19 lt!362)))))))

(assert (=> d!996 (= (isPrefixOf!0 thiss!932 (_2!19 lt!362)) e!505)))

(declare-fun b!866 () Bool)

(declare-fun res!2948 () Bool)

(assert (=> b!866 (=> (not res!2948) (not e!505))))

(assert (=> b!866 (= res!2948 (bvsle (bitIndex!0 (size!35 (buf!347 thiss!932)) (currentByte!1263 thiss!932) (currentBit!1258 thiss!932)) (bitIndex!0 (size!35 (buf!347 (_2!19 lt!362))) (currentByte!1263 (_2!19 lt!362)) (currentBit!1258 (_2!19 lt!362)))))))

(declare-fun b!867 () Bool)

(declare-fun e!506 () Bool)

(assert (=> b!867 (= e!505 e!506)))

(declare-fun res!2947 () Bool)

(assert (=> b!867 (=> res!2947 e!506)))

(assert (=> b!867 (= res!2947 (= (size!35 (buf!347 thiss!932)) #b00000000000000000000000000000000))))

(declare-fun b!868 () Bool)

(declare-fun arrayBitRangesEq!0 (array!92 array!92 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!868 (= e!506 (arrayBitRangesEq!0 (buf!347 thiss!932) (buf!347 (_2!19 lt!362)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!35 (buf!347 thiss!932)) (currentByte!1263 thiss!932) (currentBit!1258 thiss!932))))))

(assert (= (and d!996 res!2949) b!866))

(assert (= (and b!866 res!2948) b!867))

(assert (= (and b!867 (not res!2947)) b!868))

(assert (=> b!866 m!517))

(assert (=> b!866 m!515))

(assert (=> b!868 m!517))

(assert (=> b!868 m!517))

(declare-fun m!557 () Bool)

(assert (=> b!868 m!557))

(assert (=> b!800 d!996))

(declare-fun d!1002 () Bool)

(declare-fun e!507 () Bool)

(assert (=> d!1002 e!507))

(declare-fun res!2951 () Bool)

(assert (=> d!1002 (=> (not res!2951) (not e!507))))

(declare-fun lt!402 () (_ BitVec 64))

(declare-fun lt!404 () (_ BitVec 64))

(declare-fun lt!407 () (_ BitVec 64))

(assert (=> d!1002 (= res!2951 (= lt!404 (bvsub lt!402 lt!407)))))

(assert (=> d!1002 (or (= (bvand lt!402 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!407 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!402 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!402 lt!407) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1002 (= lt!407 (remainingBits!0 ((_ sign_extend 32) (size!35 (buf!347 (_2!19 lt!362)))) ((_ sign_extend 32) (currentByte!1263 (_2!19 lt!362))) ((_ sign_extend 32) (currentBit!1258 (_2!19 lt!362)))))))

(declare-fun lt!403 () (_ BitVec 64))

(declare-fun lt!406 () (_ BitVec 64))

(assert (=> d!1002 (= lt!402 (bvmul lt!403 lt!406))))

(assert (=> d!1002 (or (= lt!403 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!406 (bvsdiv (bvmul lt!403 lt!406) lt!403)))))

(assert (=> d!1002 (= lt!406 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1002 (= lt!403 ((_ sign_extend 32) (size!35 (buf!347 (_2!19 lt!362)))))))

(assert (=> d!1002 (= lt!404 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1263 (_2!19 lt!362))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1258 (_2!19 lt!362)))))))

(assert (=> d!1002 (invariant!0 (currentBit!1258 (_2!19 lt!362)) (currentByte!1263 (_2!19 lt!362)) (size!35 (buf!347 (_2!19 lt!362))))))

(assert (=> d!1002 (= (bitIndex!0 (size!35 (buf!347 (_2!19 lt!362))) (currentByte!1263 (_2!19 lt!362)) (currentBit!1258 (_2!19 lt!362))) lt!404)))

(declare-fun b!869 () Bool)

(declare-fun res!2950 () Bool)

(assert (=> b!869 (=> (not res!2950) (not e!507))))

(assert (=> b!869 (= res!2950 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404))))

(declare-fun b!870 () Bool)

(declare-fun lt!405 () (_ BitVec 64))

(assert (=> b!870 (= e!507 (bvsle lt!404 (bvmul lt!405 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!870 (or (= lt!405 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!405 #b0000000000000000000000000000000000000000000000000000000000001000) lt!405)))))

(assert (=> b!870 (= lt!405 ((_ sign_extend 32) (size!35 (buf!347 (_2!19 lt!362)))))))

(assert (= (and d!1002 res!2951) b!869))

(assert (= (and b!869 res!2950) b!870))

(declare-fun m!559 () Bool)

(assert (=> d!1002 m!559))

(assert (=> d!1002 m!511))

(assert (=> b!795 d!1002))

(declare-fun d!1004 () Bool)

(declare-fun e!508 () Bool)

(assert (=> d!1004 e!508))

(declare-fun res!2953 () Bool)

(assert (=> d!1004 (=> (not res!2953) (not e!508))))

(declare-fun lt!408 () (_ BitVec 64))

(declare-fun lt!413 () (_ BitVec 64))

(declare-fun lt!410 () (_ BitVec 64))

(assert (=> d!1004 (= res!2953 (= lt!410 (bvsub lt!408 lt!413)))))

(assert (=> d!1004 (or (= (bvand lt!408 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!413 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!408 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!408 lt!413) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!1004 (= lt!413 (remainingBits!0 ((_ sign_extend 32) (size!35 (buf!347 thiss!932))) ((_ sign_extend 32) (currentByte!1263 thiss!932)) ((_ sign_extend 32) (currentBit!1258 thiss!932))))))

(declare-fun lt!409 () (_ BitVec 64))

(declare-fun lt!412 () (_ BitVec 64))

(assert (=> d!1004 (= lt!408 (bvmul lt!409 lt!412))))

(assert (=> d!1004 (or (= lt!409 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!412 (bvsdiv (bvmul lt!409 lt!412) lt!409)))))

(assert (=> d!1004 (= lt!412 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!1004 (= lt!409 ((_ sign_extend 32) (size!35 (buf!347 thiss!932))))))

(assert (=> d!1004 (= lt!410 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1263 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1258 thiss!932))))))

(assert (=> d!1004 (invariant!0 (currentBit!1258 thiss!932) (currentByte!1263 thiss!932) (size!35 (buf!347 thiss!932)))))

(assert (=> d!1004 (= (bitIndex!0 (size!35 (buf!347 thiss!932)) (currentByte!1263 thiss!932) (currentBit!1258 thiss!932)) lt!410)))

(declare-fun b!871 () Bool)

(declare-fun res!2952 () Bool)

(assert (=> b!871 (=> (not res!2952) (not e!508))))

(assert (=> b!871 (= res!2952 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!410))))

(declare-fun b!872 () Bool)

(declare-fun lt!411 () (_ BitVec 64))

(assert (=> b!872 (= e!508 (bvsle lt!410 (bvmul lt!411 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!872 (or (= lt!411 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!411 #b0000000000000000000000000000000000000000000000000000000000001000) lt!411)))))

(assert (=> b!872 (= lt!411 ((_ sign_extend 32) (size!35 (buf!347 thiss!932))))))

(assert (= (and d!1004 res!2953) b!871))

(assert (= (and b!871 res!2952) b!872))

(declare-fun m!561 () Bool)

(assert (=> d!1004 m!561))

(declare-fun m!563 () Bool)

(assert (=> d!1004 m!563))

(assert (=> b!795 d!1004))

(assert (=> b!802 d!996))

(declare-fun b!905 () Bool)

(declare-fun res!2984 () Bool)

(declare-fun e!524 () Bool)

(assert (=> b!905 (=> (not res!2984) (not e!524))))

(declare-fun lt!467 () (_ BitVec 64))

(declare-fun lt!466 () (_ BitVec 64))

(declare-fun lt!464 () tuple2!38)

(assert (=> b!905 (= res!2984 (= (bitIndex!0 (size!35 (buf!347 (_2!19 lt!464))) (currentByte!1263 (_2!19 lt!464)) (currentBit!1258 (_2!19 lt!464))) (bvadd lt!467 lt!466)))))

(assert (=> b!905 (or (not (= (bvand lt!467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!466 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!467 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!467 lt!466) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!905 (= lt!466 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!905 (= lt!467 (bitIndex!0 (size!35 (buf!347 thiss!932)) (currentByte!1263 thiss!932) (currentBit!1258 thiss!932)))))

(declare-fun b!908 () Bool)

(declare-fun e!525 () Bool)

(declare-fun lt!465 () tuple2!40)

(assert (=> b!908 (= e!525 (= (bitIndex!0 (size!35 (buf!347 (_1!20 lt!465))) (currentByte!1263 (_1!20 lt!465)) (currentBit!1258 (_1!20 lt!465))) (bitIndex!0 (size!35 (buf!347 (_2!19 lt!464))) (currentByte!1263 (_2!19 lt!464)) (currentBit!1258 (_2!19 lt!464)))))))

(declare-fun b!907 () Bool)

(assert (=> b!907 (= e!524 e!525)))

(declare-fun res!2986 () Bool)

(assert (=> b!907 (=> (not res!2986) (not e!525))))

(assert (=> b!907 (= res!2986 (and (= (_2!20 lt!465) true) (= (_1!20 lt!465) (_2!19 lt!464))))))

(assert (=> b!907 (= lt!465 (readBitPure!0 (readerFrom!0 (_2!19 lt!464) (currentBit!1258 thiss!932) (currentByte!1263 thiss!932))))))

(declare-fun b!906 () Bool)

(declare-fun res!2985 () Bool)

(assert (=> b!906 (=> (not res!2985) (not e!524))))

(assert (=> b!906 (= res!2985 (isPrefixOf!0 thiss!932 (_2!19 lt!464)))))

(declare-fun d!1006 () Bool)

(assert (=> d!1006 e!524))

(declare-fun res!2987 () Bool)

(assert (=> d!1006 (=> (not res!2987) (not e!524))))

(assert (=> d!1006 (= res!2987 (= (size!35 (buf!347 thiss!932)) (size!35 (buf!347 (_2!19 lt!464)))))))

(declare-fun choose!16 (BitStream!54 Bool) tuple2!38)

(assert (=> d!1006 (= lt!464 (choose!16 thiss!932 true))))

(assert (=> d!1006 (validate_offset_bit!0 ((_ sign_extend 32) (size!35 (buf!347 thiss!932))) ((_ sign_extend 32) (currentByte!1263 thiss!932)) ((_ sign_extend 32) (currentBit!1258 thiss!932)))))

(assert (=> d!1006 (= (appendBit!0 thiss!932 true) lt!464)))

(assert (= (and d!1006 res!2987) b!905))

(assert (= (and b!905 res!2984) b!906))

(assert (= (and b!906 res!2985) b!907))

(assert (= (and b!907 res!2986) b!908))

(declare-fun m!587 () Bool)

(assert (=> b!906 m!587))

(declare-fun m!589 () Bool)

(assert (=> b!907 m!589))

(assert (=> b!907 m!589))

(declare-fun m!591 () Bool)

(assert (=> b!907 m!591))

(declare-fun m!593 () Bool)

(assert (=> d!1006 m!593))

(assert (=> d!1006 m!497))

(declare-fun m!595 () Bool)

(assert (=> b!905 m!595))

(assert (=> b!905 m!517))

(declare-fun m!597 () Bool)

(assert (=> b!908 m!597))

(assert (=> b!908 m!595))

(assert (=> b!797 d!1006))

(assert (=> b!796 d!1002))

(assert (=> b!796 d!1004))

(declare-fun d!1016 () Bool)

(declare-datatypes ((tuple2!50 0))(
  ( (tuple2!51 (_1!25 Bool) (_2!25 BitStream!54)) )
))
(declare-fun lt!470 () tuple2!50)

(declare-fun readBit!0 (BitStream!54) tuple2!50)

(assert (=> d!1016 (= lt!470 (readBit!0 (readerFrom!0 (_2!19 lt!362) (currentBit!1258 thiss!932) (currentByte!1263 thiss!932))))))

(assert (=> d!1016 (= (readBitPure!0 (readerFrom!0 (_2!19 lt!362) (currentBit!1258 thiss!932) (currentByte!1263 thiss!932))) (tuple2!41 (_2!25 lt!470) (_1!25 lt!470)))))

(declare-fun bs!404 () Bool)

(assert (= bs!404 d!1016))

(assert (=> bs!404 m!505))

(declare-fun m!599 () Bool)

(assert (=> bs!404 m!599))

(assert (=> b!798 d!1016))

(declare-fun d!1018 () Bool)

(declare-fun e!532 () Bool)

(assert (=> d!1018 e!532))

(declare-fun res!2999 () Bool)

(assert (=> d!1018 (=> (not res!2999) (not e!532))))

(assert (=> d!1018 (= res!2999 (invariant!0 (currentBit!1258 (_2!19 lt!362)) (currentByte!1263 (_2!19 lt!362)) (size!35 (buf!347 (_2!19 lt!362)))))))

(assert (=> d!1018 (= (readerFrom!0 (_2!19 lt!362) (currentBit!1258 thiss!932) (currentByte!1263 thiss!932)) (BitStream!55 (buf!347 (_2!19 lt!362)) (currentByte!1263 thiss!932) (currentBit!1258 thiss!932)))))

(declare-fun b!920 () Bool)

(assert (=> b!920 (= e!532 (invariant!0 (currentBit!1258 thiss!932) (currentByte!1263 thiss!932) (size!35 (buf!347 (_2!19 lt!362)))))))

(assert (= (and d!1018 res!2999) b!920))

(assert (=> d!1018 m!511))

(declare-fun m!601 () Bool)

(assert (=> b!920 m!601))

(assert (=> b!798 d!1018))

(declare-fun d!1020 () Bool)

(assert (=> d!1020 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!35 (buf!347 thiss!932))) ((_ sign_extend 32) (currentByte!1263 thiss!932)) ((_ sign_extend 32) (currentBit!1258 thiss!932))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!35 (buf!347 thiss!932))) ((_ sign_extend 32) (currentByte!1263 thiss!932)) ((_ sign_extend 32) (currentBit!1258 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!405 () Bool)

(assert (= bs!405 d!1020))

(assert (=> bs!405 m!561))

(assert (=> start!300 d!1020))

(declare-fun d!1022 () Bool)

(assert (=> d!1022 (= (inv!12 thiss!932) (invariant!0 (currentBit!1258 thiss!932) (currentByte!1263 thiss!932) (size!35 (buf!347 thiss!932))))))

(declare-fun bs!406 () Bool)

(assert (= bs!406 d!1022))

(assert (=> bs!406 m!563))

(assert (=> start!300 d!1022))

(declare-fun d!1024 () Bool)

(assert (=> d!1024 (= (invariant!0 (currentBit!1258 (_2!19 lt!362)) (currentByte!1263 (_2!19 lt!362)) (size!35 (buf!347 (_2!19 lt!362)))) (and (bvsge (currentBit!1258 (_2!19 lt!362)) #b00000000000000000000000000000000) (bvslt (currentBit!1258 (_2!19 lt!362)) #b00000000000000000000000000001000) (bvsge (currentByte!1263 (_2!19 lt!362)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1263 (_2!19 lt!362)) (size!35 (buf!347 (_2!19 lt!362)))) (and (= (currentBit!1258 (_2!19 lt!362)) #b00000000000000000000000000000000) (= (currentByte!1263 (_2!19 lt!362)) (size!35 (buf!347 (_2!19 lt!362))))))))))

(assert (=> b!794 d!1024))

(declare-fun d!1032 () Bool)

(assert (=> d!1032 (= (array_inv!32 (buf!347 thiss!932)) (bvsge (size!35 (buf!347 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!799 d!1032))

(check-sat (not b!868) (not d!978) (not d!1022) (not d!1020) (not d!1016) (not b!905) (not b!866) (not d!1018) (not d!1006) (not d!1004) (not b!907) (not d!1002) (not b!908) (not b!920) (not b!906))
