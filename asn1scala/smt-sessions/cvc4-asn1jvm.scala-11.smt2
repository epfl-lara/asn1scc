; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!242 () Bool)

(assert start!242)

(declare-fun b!637 () Bool)

(declare-fun e!356 () Bool)

(declare-fun e!354 () Bool)

(assert (=> b!637 (= e!356 (not e!354))))

(declare-fun res!2727 () Bool)

(assert (=> b!637 (=> res!2727 e!354)))

(declare-datatypes ((array!85 0))(
  ( (array!86 (arr!420 (Array (_ BitVec 32) (_ BitVec 8))) (size!33 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!50 0))(
  ( (BitStream!51 (buf!345 array!85) (currentByte!1252 (_ BitVec 32)) (currentBit!1247 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!11 0))(
  ( (Unit!12) )
))
(declare-datatypes ((tuple2!24 0))(
  ( (tuple2!25 (_1!12 Unit!11) (_2!12 BitStream!50)) )
))
(declare-fun lt!203 () tuple2!24)

(declare-fun thiss!932 () BitStream!50)

(assert (=> b!637 (= res!2727 (not (= (size!33 (buf!345 (_2!12 lt!203))) (size!33 (buf!345 thiss!932)))))))

(declare-fun e!353 () Bool)

(assert (=> b!637 e!353))

(declare-fun res!2726 () Bool)

(assert (=> b!637 (=> (not res!2726) (not e!353))))

(assert (=> b!637 (= res!2726 (= (size!33 (buf!345 thiss!932)) (size!33 (buf!345 (_2!12 lt!203)))))))

(declare-fun appendBit!0 (BitStream!50 Bool) tuple2!24)

(assert (=> b!637 (= lt!203 (appendBit!0 thiss!932 true))))

(declare-fun b!638 () Bool)

(declare-fun e!352 () Bool)

(assert (=> b!638 (= e!353 e!352)))

(declare-fun res!2730 () Bool)

(assert (=> b!638 (=> (not res!2730) (not e!352))))

(declare-fun lt!205 () (_ BitVec 64))

(declare-fun lt!206 () (_ BitVec 64))

(assert (=> b!638 (= res!2730 (= lt!205 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!206)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!638 (= lt!205 (bitIndex!0 (size!33 (buf!345 (_2!12 lt!203))) (currentByte!1252 (_2!12 lt!203)) (currentBit!1247 (_2!12 lt!203))))))

(assert (=> b!638 (= lt!206 (bitIndex!0 (size!33 (buf!345 thiss!932)) (currentByte!1252 thiss!932) (currentBit!1247 thiss!932)))))

(declare-fun res!2728 () Bool)

(assert (=> start!242 (=> (not res!2728) (not e!356))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!242 (= res!2728 (validate_offset_bit!0 ((_ sign_extend 32) (size!33 (buf!345 thiss!932))) ((_ sign_extend 32) (currentByte!1252 thiss!932)) ((_ sign_extend 32) (currentBit!1247 thiss!932))))))

(assert (=> start!242 e!356))

(declare-fun e!350 () Bool)

(declare-fun inv!12 (BitStream!50) Bool)

(assert (=> start!242 (and (inv!12 thiss!932) e!350)))

(declare-fun b!639 () Bool)

(declare-fun e!351 () Bool)

(declare-datatypes ((tuple2!26 0))(
  ( (tuple2!27 (_1!13 BitStream!50) (_2!13 Bool)) )
))
(declare-fun lt!204 () tuple2!26)

(assert (=> b!639 (= e!351 (= (bitIndex!0 (size!33 (buf!345 (_1!13 lt!204))) (currentByte!1252 (_1!13 lt!204)) (currentBit!1247 (_1!13 lt!204))) lt!205))))

(declare-fun b!640 () Bool)

(declare-fun array_inv!30 (array!85) Bool)

(assert (=> b!640 (= e!350 (array_inv!30 (buf!345 thiss!932)))))

(declare-fun b!641 () Bool)

(declare-fun res!2731 () Bool)

(assert (=> b!641 (=> (not res!2731) (not e!352))))

(declare-fun isPrefixOf!0 (BitStream!50 BitStream!50) Bool)

(assert (=> b!641 (= res!2731 (isPrefixOf!0 thiss!932 (_2!12 lt!203)))))

(declare-fun b!642 () Bool)

(assert (=> b!642 (= e!352 e!351)))

(declare-fun res!2729 () Bool)

(assert (=> b!642 (=> (not res!2729) (not e!351))))

(assert (=> b!642 (= res!2729 (and (_2!13 lt!204) (= (_1!13 lt!204) (_2!12 lt!203))))))

(declare-fun readBitPure!0 (BitStream!50) tuple2!26)

(declare-fun readerFrom!0 (BitStream!50 (_ BitVec 32) (_ BitVec 32)) BitStream!50)

(assert (=> b!642 (= lt!204 (readBitPure!0 (readerFrom!0 (_2!12 lt!203) (currentBit!1247 thiss!932) (currentByte!1252 thiss!932))))))

(declare-fun b!643 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!643 (= e!354 (invariant!0 (currentBit!1247 thiss!932) (currentByte!1252 thiss!932) (size!33 (buf!345 thiss!932))))))

(assert (= (and start!242 res!2728) b!637))

(assert (= (and b!637 res!2726) b!638))

(assert (= (and b!638 res!2730) b!641))

(assert (= (and b!641 res!2731) b!642))

(assert (= (and b!642 res!2729) b!639))

(assert (= (and b!637 (not res!2727)) b!643))

(assert (= start!242 b!640))

(declare-fun m!369 () Bool)

(assert (=> b!641 m!369))

(declare-fun m!371 () Bool)

(assert (=> b!642 m!371))

(assert (=> b!642 m!371))

(declare-fun m!373 () Bool)

(assert (=> b!642 m!373))

(declare-fun m!375 () Bool)

(assert (=> b!639 m!375))

(declare-fun m!377 () Bool)

(assert (=> b!638 m!377))

(declare-fun m!379 () Bool)

(assert (=> b!638 m!379))

(declare-fun m!381 () Bool)

(assert (=> b!640 m!381))

(declare-fun m!383 () Bool)

(assert (=> b!643 m!383))

(declare-fun m!385 () Bool)

(assert (=> b!637 m!385))

(declare-fun m!387 () Bool)

(assert (=> start!242 m!387))

(declare-fun m!389 () Bool)

(assert (=> start!242 m!389))

(push 1)

(assert (not b!638))

(assert (not b!642))

(assert (not b!641))

(assert (not b!637))

(assert (not b!640))

(assert (not b!643))

(assert (not b!639))

(assert (not start!242))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!916 () Bool)

(declare-fun res!2749 () Bool)

(declare-fun e!368 () Bool)

(assert (=> d!916 (=> (not res!2749) (not e!368))))

(assert (=> d!916 (= res!2749 (= (size!33 (buf!345 thiss!932)) (size!33 (buf!345 (_2!12 lt!203)))))))

(assert (=> d!916 (= (isPrefixOf!0 thiss!932 (_2!12 lt!203)) e!368)))

(declare-fun b!659 () Bool)

(declare-fun res!2747 () Bool)

(assert (=> b!659 (=> (not res!2747) (not e!368))))

(assert (=> b!659 (= res!2747 (bvsle (bitIndex!0 (size!33 (buf!345 thiss!932)) (currentByte!1252 thiss!932) (currentBit!1247 thiss!932)) (bitIndex!0 (size!33 (buf!345 (_2!12 lt!203))) (currentByte!1252 (_2!12 lt!203)) (currentBit!1247 (_2!12 lt!203)))))))

(declare-fun b!660 () Bool)

(declare-fun e!367 () Bool)

(assert (=> b!660 (= e!368 e!367)))

(declare-fun res!2748 () Bool)

(assert (=> b!660 (=> res!2748 e!367)))

(assert (=> b!660 (= res!2748 (= (size!33 (buf!345 thiss!932)) #b00000000000000000000000000000000))))

(declare-fun b!661 () Bool)

(declare-fun arrayBitRangesEq!0 (array!85 array!85 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!661 (= e!367 (arrayBitRangesEq!0 (buf!345 thiss!932) (buf!345 (_2!12 lt!203)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!33 (buf!345 thiss!932)) (currentByte!1252 thiss!932) (currentBit!1247 thiss!932))))))

(assert (= (and d!916 res!2749) b!659))

(assert (= (and b!659 res!2747) b!660))

(assert (= (and b!660 (not res!2748)) b!661))

(assert (=> b!659 m!379))

(assert (=> b!659 m!377))

(assert (=> b!661 m!379))

(assert (=> b!661 m!379))

(declare-fun m!393 () Bool)

(assert (=> b!661 m!393))

(assert (=> b!641 d!916))

(declare-fun d!918 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!918 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!33 (buf!345 thiss!932))) ((_ sign_extend 32) (currentByte!1252 thiss!932)) ((_ sign_extend 32) (currentBit!1247 thiss!932))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!33 (buf!345 thiss!932))) ((_ sign_extend 32) (currentByte!1252 thiss!932)) ((_ sign_extend 32) (currentBit!1247 thiss!932))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!390 () Bool)

(assert (= bs!390 d!918))

(declare-fun m!395 () Bool)

(assert (=> bs!390 m!395))

(assert (=> start!242 d!918))

(declare-fun d!920 () Bool)

(assert (=> d!920 (= (inv!12 thiss!932) (invariant!0 (currentBit!1247 thiss!932) (currentByte!1252 thiss!932) (size!33 (buf!345 thiss!932))))))

(declare-fun bs!391 () Bool)

(assert (= bs!391 d!920))

(assert (=> bs!391 m!383))

(assert (=> start!242 d!920))

(declare-fun d!922 () Bool)

(declare-fun e!385 () Bool)

(assert (=> d!922 e!385))

(declare-fun res!2783 () Bool)

(assert (=> d!922 (=> (not res!2783) (not e!385))))

(declare-fun lt!272 () tuple2!24)

(assert (=> d!922 (= res!2783 (= (size!33 (buf!345 thiss!932)) (size!33 (buf!345 (_2!12 lt!272)))))))

(declare-fun choose!16 (BitStream!50 Bool) tuple2!24)

(assert (=> d!922 (= lt!272 (choose!16 thiss!932 true))))

(assert (=> d!922 (validate_offset_bit!0 ((_ sign_extend 32) (size!33 (buf!345 thiss!932))) ((_ sign_extend 32) (currentByte!1252 thiss!932)) ((_ sign_extend 32) (currentBit!1247 thiss!932)))))

(assert (=> d!922 (= (appendBit!0 thiss!932 true) lt!272)))

(declare-fun b!696 () Bool)

(declare-fun res!2785 () Bool)

(assert (=> b!696 (=> (not res!2785) (not e!385))))

(declare-fun lt!271 () (_ BitVec 64))

(declare-fun lt!273 () (_ BitVec 64))

(assert (=> b!696 (= res!2785 (= (bitIndex!0 (size!33 (buf!345 (_2!12 lt!272))) (currentByte!1252 (_2!12 lt!272)) (currentBit!1247 (_2!12 lt!272))) (bvadd lt!271 lt!273)))))

(assert (=> b!696 (or (not (= (bvand lt!271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!273 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!271 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!271 lt!273) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!696 (= lt!273 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!696 (= lt!271 (bitIndex!0 (size!33 (buf!345 thiss!932)) (currentByte!1252 thiss!932) (currentBit!1247 thiss!932)))))

(declare-fun b!699 () Bool)

(declare-fun e!386 () Bool)

(declare-fun lt!274 () tuple2!26)

(assert (=> b!699 (= e!386 (= (bitIndex!0 (size!33 (buf!345 (_1!13 lt!274))) (currentByte!1252 (_1!13 lt!274)) (currentBit!1247 (_1!13 lt!274))) (bitIndex!0 (size!33 (buf!345 (_2!12 lt!272))) (currentByte!1252 (_2!12 lt!272)) (currentBit!1247 (_2!12 lt!272)))))))

(declare-fun b!697 () Bool)

(declare-fun res!2784 () Bool)

(assert (=> b!697 (=> (not res!2784) (not e!385))))

(assert (=> b!697 (= res!2784 (isPrefixOf!0 thiss!932 (_2!12 lt!272)))))

(declare-fun b!698 () Bool)

(assert (=> b!698 (= e!385 e!386)))

(declare-fun res!2782 () Bool)

(assert (=> b!698 (=> (not res!2782) (not e!386))))

(assert (=> b!698 (= res!2782 (and (= (_2!13 lt!274) true) (= (_1!13 lt!274) (_2!12 lt!272))))))

(assert (=> b!698 (= lt!274 (readBitPure!0 (readerFrom!0 (_2!12 lt!272) (currentBit!1247 thiss!932) (currentByte!1252 thiss!932))))))

(assert (= (and d!922 res!2783) b!696))

(assert (= (and b!696 res!2785) b!697))

(assert (= (and b!697 res!2784) b!698))

(assert (= (and b!698 res!2782) b!699))

(declare-fun m!411 () Bool)

(assert (=> b!699 m!411))

(declare-fun m!413 () Bool)

(assert (=> b!699 m!413))

(assert (=> b!696 m!413))

(assert (=> b!696 m!379))

(declare-fun m!415 () Bool)

(assert (=> b!698 m!415))

(assert (=> b!698 m!415))

(declare-fun m!417 () Bool)

(assert (=> b!698 m!417))

(declare-fun m!419 () Bool)

(assert (=> b!697 m!419))

(declare-fun m!421 () Bool)

(assert (=> d!922 m!421))

(assert (=> d!922 m!387))

(assert (=> b!637 d!922))

(declare-fun d!938 () Bool)

(declare-datatypes ((tuple2!28 0))(
  ( (tuple2!29 (_1!14 Bool) (_2!14 BitStream!50)) )
))
(declare-fun lt!295 () tuple2!28)

(declare-fun readBit!0 (BitStream!50) tuple2!28)

(assert (=> d!938 (= lt!295 (readBit!0 (readerFrom!0 (_2!12 lt!203) (currentBit!1247 thiss!932) (currentByte!1252 thiss!932))))))

(assert (=> d!938 (= (readBitPure!0 (readerFrom!0 (_2!12 lt!203) (currentBit!1247 thiss!932) (currentByte!1252 thiss!932))) (tuple2!27 (_2!14 lt!295) (_1!14 lt!295)))))

(declare-fun bs!394 () Bool)

(assert (= bs!394 d!938))

(assert (=> bs!394 m!371))

(declare-fun m!437 () Bool)

(assert (=> bs!394 m!437))

(assert (=> b!642 d!938))

(declare-fun d!942 () Bool)

(declare-fun e!399 () Bool)

(assert (=> d!942 e!399))

(declare-fun res!2809 () Bool)

(assert (=> d!942 (=> (not res!2809) (not e!399))))

(assert (=> d!942 (= res!2809 (invariant!0 (currentBit!1247 (_2!12 lt!203)) (currentByte!1252 (_2!12 lt!203)) (size!33 (buf!345 (_2!12 lt!203)))))))

(assert (=> d!942 (= (readerFrom!0 (_2!12 lt!203) (currentBit!1247 thiss!932) (currentByte!1252 thiss!932)) (BitStream!51 (buf!345 (_2!12 lt!203)) (currentByte!1252 thiss!932) (currentBit!1247 thiss!932)))))

(declare-fun b!723 () Bool)

(assert (=> b!723 (= e!399 (invariant!0 (currentBit!1247 thiss!932) (currentByte!1252 thiss!932) (size!33 (buf!345 (_2!12 lt!203)))))))

(assert (= (and d!942 res!2809) b!723))

(declare-fun m!455 () Bool)

(assert (=> d!942 m!455))

(declare-fun m!457 () Bool)

(assert (=> b!723 m!457))

(assert (=> b!642 d!942))

(declare-fun d!950 () Bool)

(declare-fun e!413 () Bool)

(assert (=> d!950 e!413))

(declare-fun res!2831 () Bool)

(assert (=> d!950 (=> (not res!2831) (not e!413))))

(declare-fun lt!328 () (_ BitVec 64))

(declare-fun lt!329 () (_ BitVec 64))

(declare-fun lt!324 () (_ BitVec 64))

(assert (=> d!950 (= res!2831 (= lt!324 (bvsub lt!329 lt!328)))))

(assert (=> d!950 (or (= (bvand lt!329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!328 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!329 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!329 lt!328) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!950 (= lt!328 (remainingBits!0 ((_ sign_extend 32) (size!33 (buf!345 (_2!12 lt!203)))) ((_ sign_extend 32) (currentByte!1252 (_2!12 lt!203))) ((_ sign_extend 32) (currentBit!1247 (_2!12 lt!203)))))))

(declare-fun lt!326 () (_ BitVec 64))

(declare-fun lt!327 () (_ BitVec 64))

(assert (=> d!950 (= lt!329 (bvmul lt!326 lt!327))))

(assert (=> d!950 (or (= lt!326 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!327 (bvsdiv (bvmul lt!326 lt!327) lt!326)))))

(assert (=> d!950 (= lt!327 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!950 (= lt!326 ((_ sign_extend 32) (size!33 (buf!345 (_2!12 lt!203)))))))

(assert (=> d!950 (= lt!324 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1252 (_2!12 lt!203))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1247 (_2!12 lt!203)))))))

(assert (=> d!950 (invariant!0 (currentBit!1247 (_2!12 lt!203)) (currentByte!1252 (_2!12 lt!203)) (size!33 (buf!345 (_2!12 lt!203))))))

(assert (=> d!950 (= (bitIndex!0 (size!33 (buf!345 (_2!12 lt!203))) (currentByte!1252 (_2!12 lt!203)) (currentBit!1247 (_2!12 lt!203))) lt!324)))

(declare-fun b!742 () Bool)

(declare-fun res!2830 () Bool)

(assert (=> b!742 (=> (not res!2830) (not e!413))))

(assert (=> b!742 (= res!2830 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!324))))

(declare-fun b!743 () Bool)

(declare-fun lt!325 () (_ BitVec 64))

(assert (=> b!743 (= e!413 (bvsle lt!324 (bvmul lt!325 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!743 (or (= lt!325 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!325 #b0000000000000000000000000000000000000000000000000000000000001000) lt!325)))))

(assert (=> b!743 (= lt!325 ((_ sign_extend 32) (size!33 (buf!345 (_2!12 lt!203)))))))

(assert (= (and d!950 res!2831) b!742))

(assert (= (and b!742 res!2830) b!743))

(declare-fun m!467 () Bool)

(assert (=> d!950 m!467))

(assert (=> d!950 m!455))

(assert (=> b!638 d!950))

(declare-fun d!968 () Bool)

(declare-fun e!414 () Bool)

(assert (=> d!968 e!414))

(declare-fun res!2833 () Bool)

(assert (=> d!968 (=> (not res!2833) (not e!414))))

(declare-fun lt!334 () (_ BitVec 64))

(declare-fun lt!335 () (_ BitVec 64))

(declare-fun lt!330 () (_ BitVec 64))

(assert (=> d!968 (= res!2833 (= lt!330 (bvsub lt!335 lt!334)))))

(assert (=> d!968 (or (= (bvand lt!335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!334 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!335 lt!334) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!968 (= lt!334 (remainingBits!0 ((_ sign_extend 32) (size!33 (buf!345 thiss!932))) ((_ sign_extend 32) (currentByte!1252 thiss!932)) ((_ sign_extend 32) (currentBit!1247 thiss!932))))))

(declare-fun lt!332 () (_ BitVec 64))

(declare-fun lt!333 () (_ BitVec 64))

(assert (=> d!968 (= lt!335 (bvmul lt!332 lt!333))))

(assert (=> d!968 (or (= lt!332 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!333 (bvsdiv (bvmul lt!332 lt!333) lt!332)))))

(assert (=> d!968 (= lt!333 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!968 (= lt!332 ((_ sign_extend 32) (size!33 (buf!345 thiss!932))))))

(assert (=> d!968 (= lt!330 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1252 thiss!932)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1247 thiss!932))))))

(assert (=> d!968 (invariant!0 (currentBit!1247 thiss!932) (currentByte!1252 thiss!932) (size!33 (buf!345 thiss!932)))))

(assert (=> d!968 (= (bitIndex!0 (size!33 (buf!345 thiss!932)) (currentByte!1252 thiss!932) (currentBit!1247 thiss!932)) lt!330)))

(declare-fun b!744 () Bool)

(declare-fun res!2832 () Bool)

(assert (=> b!744 (=> (not res!2832) (not e!414))))

(assert (=> b!744 (= res!2832 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!330))))

(declare-fun b!745 () Bool)

(declare-fun lt!331 () (_ BitVec 64))

(assert (=> b!745 (= e!414 (bvsle lt!330 (bvmul lt!331 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!745 (or (= lt!331 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!331 #b0000000000000000000000000000000000000000000000000000000000001000) lt!331)))))

(assert (=> b!745 (= lt!331 ((_ sign_extend 32) (size!33 (buf!345 thiss!932))))))

(assert (= (and d!968 res!2833) b!744))

(assert (= (and b!744 res!2832) b!745))

(assert (=> d!968 m!395))

(assert (=> d!968 m!383))

(assert (=> b!638 d!968))

(declare-fun d!970 () Bool)

(assert (=> d!970 (= (invariant!0 (currentBit!1247 thiss!932) (currentByte!1252 thiss!932) (size!33 (buf!345 thiss!932))) (and (bvsge (currentBit!1247 thiss!932) #b00000000000000000000000000000000) (bvslt (currentBit!1247 thiss!932) #b00000000000000000000000000001000) (bvsge (currentByte!1252 thiss!932) #b00000000000000000000000000000000) (or (bvslt (currentByte!1252 thiss!932) (size!33 (buf!345 thiss!932))) (and (= (currentBit!1247 thiss!932) #b00000000000000000000000000000000) (= (currentByte!1252 thiss!932) (size!33 (buf!345 thiss!932)))))))))

(assert (=> b!643 d!970))

(declare-fun d!972 () Bool)

(assert (=> d!972 (= (array_inv!30 (buf!345 thiss!932)) (bvsge (size!33 (buf!345 thiss!932)) #b00000000000000000000000000000000))))

(assert (=> b!640 d!972))

(declare-fun d!974 () Bool)

(declare-fun e!416 () Bool)

(assert (=> d!974 e!416))

(declare-fun res!2836 () Bool)

(assert (=> d!974 (=> (not res!2836) (not e!416))))

(declare-fun lt!341 () (_ BitVec 64))

(declare-fun lt!340 () (_ BitVec 64))

(declare-fun lt!336 () (_ BitVec 64))

(assert (=> d!974 (= res!2836 (= lt!336 (bvsub lt!341 lt!340)))))

(assert (=> d!974 (or (= (bvand lt!341 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!340 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!341 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!341 lt!340) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!974 (= lt!340 (remainingBits!0 ((_ sign_extend 32) (size!33 (buf!345 (_1!13 lt!204)))) ((_ sign_extend 32) (currentByte!1252 (_1!13 lt!204))) ((_ sign_extend 32) (currentBit!1247 (_1!13 lt!204)))))))

(declare-fun lt!338 () (_ BitVec 64))

(declare-fun lt!339 () (_ BitVec 64))

(assert (=> d!974 (= lt!341 (bvmul lt!338 lt!339))))

(assert (=> d!974 (or (= lt!338 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!339 (bvsdiv (bvmul lt!338 lt!339) lt!338)))))

(assert (=> d!974 (= lt!339 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!974 (= lt!338 ((_ sign_extend 32) (size!33 (buf!345 (_1!13 lt!204)))))))

(assert (=> d!974 (= lt!336 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1252 (_1!13 lt!204))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1247 (_1!13 lt!204)))))))

(assert (=> d!974 (invariant!0 (currentBit!1247 (_1!13 lt!204)) (currentByte!1252 (_1!13 lt!204)) (size!33 (buf!345 (_1!13 lt!204))))))

(assert (=> d!974 (= (bitIndex!0 (size!33 (buf!345 (_1!13 lt!204))) (currentByte!1252 (_1!13 lt!204)) (currentBit!1247 (_1!13 lt!204))) lt!336)))

(declare-fun b!747 () Bool)

(declare-fun res!2835 () Bool)

(assert (=> b!747 (=> (not res!2835) (not e!416))))

(assert (=> b!747 (= res!2835 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!336))))

(declare-fun b!748 () Bool)

(declare-fun lt!337 () (_ BitVec 64))

(assert (=> b!748 (= e!416 (bvsle lt!336 (bvmul lt!337 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!748 (or (= lt!337 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!337 #b0000000000000000000000000000000000000000000000000000000000001000) lt!337)))))

(assert (=> b!748 (= lt!337 ((_ sign_extend 32) (size!33 (buf!345 (_1!13 lt!204)))))))

(assert (= (and d!974 res!2836) b!747))

(assert (= (and b!747 res!2835) b!748))

(declare-fun m!471 () Bool)

(assert (=> d!974 m!471))

(declare-fun m!473 () Bool)

(assert (=> d!974 m!473))

(assert (=> b!639 d!974))

(push 1)

