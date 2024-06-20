; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23796 () Bool)

(assert start!23796)

(declare-fun b!120451 () Bool)

(declare-fun e!78899 () Bool)

(declare-fun e!78891 () Bool)

(assert (=> b!120451 (= e!78899 (not e!78891))))

(declare-fun res!99735 () Bool)

(assert (=> b!120451 (=> res!99735 e!78891)))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-datatypes ((array!5361 0))(
  ( (array!5362 (arr!3020 (Array (_ BitVec 32) (_ BitVec 8))) (size!2427 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4328 0))(
  ( (BitStream!4329 (buf!2858 array!5361) (currentByte!5537 (_ BitVec 32)) (currentBit!5532 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!10100 0))(
  ( (tuple2!10101 (_1!5315 BitStream!4328) (_2!5315 BitStream!4328)) )
))
(declare-fun lt!187538 () tuple2!10100)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!187551 () (_ BitVec 64))

(declare-datatypes ((tuple2!10102 0))(
  ( (tuple2!10103 (_1!5316 BitStream!4328) (_2!5316 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10102)

(assert (=> b!120451 (= res!99735 (not (= (_1!5316 (readNLeastSignificantBitsLoopPure!0 (_1!5315 lt!187538) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187551)) (_2!5315 lt!187538))))))

(declare-datatypes ((Unit!7421 0))(
  ( (Unit!7422) )
))
(declare-datatypes ((tuple2!10104 0))(
  ( (tuple2!10105 (_1!5317 Unit!7421) (_2!5317 BitStream!4328)) )
))
(declare-fun lt!187554 () tuple2!10104)

(declare-fun lt!187548 () tuple2!10104)

(declare-fun lt!187545 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!120451 (validate_offset_bits!1 ((_ sign_extend 32) (size!2427 (buf!2858 (_2!5317 lt!187554)))) ((_ sign_extend 32) (currentByte!5537 (_2!5317 lt!187548))) ((_ sign_extend 32) (currentBit!5532 (_2!5317 lt!187548))) lt!187545)))

(declare-fun lt!187535 () Unit!7421)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4328 array!5361 (_ BitVec 64)) Unit!7421)

(assert (=> b!120451 (= lt!187535 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5317 lt!187548) (buf!2858 (_2!5317 lt!187554)) lt!187545))))

(assert (=> b!120451 (= lt!187545 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!187557 () (_ BitVec 64))

(declare-datatypes ((tuple2!10106 0))(
  ( (tuple2!10107 (_1!5318 BitStream!4328) (_2!5318 Bool)) )
))
(declare-fun lt!187543 () tuple2!10106)

(declare-fun lt!187553 () (_ BitVec 64))

(assert (=> b!120451 (= lt!187551 (bvor lt!187557 (ite (_2!5318 lt!187543) lt!187553 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!187534 () tuple2!10100)

(declare-fun lt!187542 () tuple2!10102)

(assert (=> b!120451 (= lt!187542 (readNLeastSignificantBitsLoopPure!0 (_1!5315 lt!187534) nBits!396 i!615 lt!187557))))

(declare-fun thiss!1305 () BitStream!4328)

(declare-fun lt!187544 () (_ BitVec 64))

(assert (=> b!120451 (validate_offset_bits!1 ((_ sign_extend 32) (size!2427 (buf!2858 (_2!5317 lt!187554)))) ((_ sign_extend 32) (currentByte!5537 thiss!1305)) ((_ sign_extend 32) (currentBit!5532 thiss!1305)) lt!187544)))

(declare-fun lt!187546 () Unit!7421)

(assert (=> b!120451 (= lt!187546 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2858 (_2!5317 lt!187554)) lt!187544))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!120451 (= lt!187557 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!187556 () Bool)

(assert (=> b!120451 (= (_2!5318 lt!187543) lt!187556)))

(declare-fun readBitPure!0 (BitStream!4328) tuple2!10106)

(assert (=> b!120451 (= lt!187543 (readBitPure!0 (_1!5315 lt!187534)))))

(declare-fun reader!0 (BitStream!4328 BitStream!4328) tuple2!10100)

(assert (=> b!120451 (= lt!187538 (reader!0 (_2!5317 lt!187548) (_2!5317 lt!187554)))))

(assert (=> b!120451 (= lt!187534 (reader!0 thiss!1305 (_2!5317 lt!187554)))))

(declare-fun e!78894 () Bool)

(assert (=> b!120451 e!78894))

(declare-fun res!99724 () Bool)

(assert (=> b!120451 (=> (not res!99724) (not e!78894))))

(declare-fun lt!187533 () tuple2!10106)

(declare-fun lt!187536 () tuple2!10106)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!120451 (= res!99724 (= (bitIndex!0 (size!2427 (buf!2858 (_1!5318 lt!187533))) (currentByte!5537 (_1!5318 lt!187533)) (currentBit!5532 (_1!5318 lt!187533))) (bitIndex!0 (size!2427 (buf!2858 (_1!5318 lt!187536))) (currentByte!5537 (_1!5318 lt!187536)) (currentBit!5532 (_1!5318 lt!187536)))))))

(declare-fun lt!187539 () Unit!7421)

(declare-fun lt!187552 () BitStream!4328)

(declare-fun readBitPrefixLemma!0 (BitStream!4328 BitStream!4328) Unit!7421)

(assert (=> b!120451 (= lt!187539 (readBitPrefixLemma!0 lt!187552 (_2!5317 lt!187554)))))

(assert (=> b!120451 (= lt!187536 (readBitPure!0 (BitStream!4329 (buf!2858 (_2!5317 lt!187554)) (currentByte!5537 thiss!1305) (currentBit!5532 thiss!1305))))))

(assert (=> b!120451 (= lt!187533 (readBitPure!0 lt!187552))))

(assert (=> b!120451 (= lt!187552 (BitStream!4329 (buf!2858 (_2!5317 lt!187548)) (currentByte!5537 thiss!1305) (currentBit!5532 thiss!1305)))))

(declare-fun e!78895 () Bool)

(assert (=> b!120451 e!78895))

(declare-fun res!99728 () Bool)

(assert (=> b!120451 (=> (not res!99728) (not e!78895))))

(declare-fun isPrefixOf!0 (BitStream!4328 BitStream!4328) Bool)

(assert (=> b!120451 (= res!99728 (isPrefixOf!0 thiss!1305 (_2!5317 lt!187554)))))

(declare-fun lt!187549 () Unit!7421)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4328 BitStream!4328 BitStream!4328) Unit!7421)

(assert (=> b!120451 (= lt!187549 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5317 lt!187548) (_2!5317 lt!187554)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4328 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10104)

(assert (=> b!120451 (= lt!187554 (appendNLeastSignificantBitsLoop!0 (_2!5317 lt!187548) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!78900 () Bool)

(assert (=> b!120451 e!78900))

(declare-fun res!99727 () Bool)

(assert (=> b!120451 (=> (not res!99727) (not e!78900))))

(assert (=> b!120451 (= res!99727 (= (size!2427 (buf!2858 thiss!1305)) (size!2427 (buf!2858 (_2!5317 lt!187548)))))))

(declare-fun appendBit!0 (BitStream!4328 Bool) tuple2!10104)

(assert (=> b!120451 (= lt!187548 (appendBit!0 thiss!1305 lt!187556))))

(assert (=> b!120451 (= lt!187556 (not (= (bvand v!199 lt!187553) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120451 (= lt!187553 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun res!99731 () Bool)

(declare-fun e!78896 () Bool)

(assert (=> start!23796 (=> (not res!99731) (not e!78896))))

(assert (=> start!23796 (= res!99731 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23796 e!78896))

(assert (=> start!23796 true))

(declare-fun e!78893 () Bool)

(declare-fun inv!12 (BitStream!4328) Bool)

(assert (=> start!23796 (and (inv!12 thiss!1305) e!78893)))

(declare-fun b!120452 () Bool)

(declare-fun e!78897 () Bool)

(declare-fun e!78898 () Bool)

(assert (=> b!120452 (= e!78897 e!78898)))

(declare-fun res!99725 () Bool)

(assert (=> b!120452 (=> (not res!99725) (not e!78898))))

(declare-fun lt!187558 () tuple2!10106)

(assert (=> b!120452 (= res!99725 (and (= (_2!5318 lt!187558) lt!187556) (= (_1!5318 lt!187558) (_2!5317 lt!187548))))))

(declare-fun readerFrom!0 (BitStream!4328 (_ BitVec 32) (_ BitVec 32)) BitStream!4328)

(assert (=> b!120452 (= lt!187558 (readBitPure!0 (readerFrom!0 (_2!5317 lt!187548) (currentBit!5532 thiss!1305) (currentByte!5537 thiss!1305))))))

(declare-fun b!120453 () Bool)

(assert (=> b!120453 (= e!78896 e!78899)))

(declare-fun res!99726 () Bool)

(assert (=> b!120453 (=> (not res!99726) (not e!78899))))

(assert (=> b!120453 (= res!99726 (validate_offset_bits!1 ((_ sign_extend 32) (size!2427 (buf!2858 thiss!1305))) ((_ sign_extend 32) (currentByte!5537 thiss!1305)) ((_ sign_extend 32) (currentBit!5532 thiss!1305)) lt!187544))))

(assert (=> b!120453 (= lt!187544 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!120454 () Bool)

(declare-fun res!99729 () Bool)

(assert (=> b!120454 (=> (not res!99729) (not e!78899))))

(assert (=> b!120454 (= res!99729 (bvslt i!615 nBits!396))))

(declare-fun b!120455 () Bool)

(declare-fun res!99730 () Bool)

(assert (=> b!120455 (=> (not res!99730) (not e!78899))))

(assert (=> b!120455 (= res!99730 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!120456 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!120456 (= e!78895 (invariant!0 (currentBit!5532 thiss!1305) (currentByte!5537 thiss!1305) (size!2427 (buf!2858 (_2!5317 lt!187554)))))))

(declare-fun b!120457 () Bool)

(declare-fun lt!187541 () (_ BitVec 64))

(assert (=> b!120457 (= e!78898 (= (bitIndex!0 (size!2427 (buf!2858 (_1!5318 lt!187558))) (currentByte!5537 (_1!5318 lt!187558)) (currentBit!5532 (_1!5318 lt!187558))) lt!187541))))

(declare-fun b!120458 () Bool)

(declare-fun res!99732 () Bool)

(assert (=> b!120458 (=> (not res!99732) (not e!78895))))

(assert (=> b!120458 (= res!99732 (invariant!0 (currentBit!5532 thiss!1305) (currentByte!5537 thiss!1305) (size!2427 (buf!2858 (_2!5317 lt!187548)))))))

(declare-fun b!120459 () Bool)

(declare-fun res!99733 () Bool)

(assert (=> b!120459 (=> (not res!99733) (not e!78897))))

(assert (=> b!120459 (= res!99733 (isPrefixOf!0 thiss!1305 (_2!5317 lt!187548)))))

(declare-fun b!120460 () Bool)

(assert (=> b!120460 (= e!78894 (= (_2!5318 lt!187533) (_2!5318 lt!187536)))))

(declare-fun b!120461 () Bool)

(assert (=> b!120461 (= e!78900 e!78897)))

(declare-fun res!99734 () Bool)

(assert (=> b!120461 (=> (not res!99734) (not e!78897))))

(declare-fun lt!187547 () (_ BitVec 64))

(assert (=> b!120461 (= res!99734 (= lt!187541 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!187547)))))

(assert (=> b!120461 (= lt!187541 (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!187548))) (currentByte!5537 (_2!5317 lt!187548)) (currentBit!5532 (_2!5317 lt!187548))))))

(assert (=> b!120461 (= lt!187547 (bitIndex!0 (size!2427 (buf!2858 thiss!1305)) (currentByte!5537 thiss!1305) (currentBit!5532 thiss!1305)))))

(declare-fun b!120462 () Bool)

(declare-fun lt!187555 () (_ BitVec 64))

(declare-fun lt!187550 () (_ BitVec 64))

(assert (=> b!120462 (= e!78891 (or (= lt!187555 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187555 (bvand (bvsub lt!187550 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!120462 (= lt!187555 (bvand lt!187550 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!187540 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4328 (_ BitVec 64)) BitStream!4328)

(assert (=> b!120462 (= (_1!5315 lt!187538) (withMovedBitIndex!0 (_2!5315 lt!187538) (bvsub lt!187550 lt!187540)))))

(assert (=> b!120462 (= lt!187550 (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!187548))) (currentByte!5537 (_2!5317 lt!187548)) (currentBit!5532 (_2!5317 lt!187548))))))

(declare-fun lt!187559 () (_ BitVec 64))

(assert (=> b!120462 (= (_1!5315 lt!187534) (withMovedBitIndex!0 (_2!5315 lt!187534) (bvsub lt!187559 lt!187540)))))

(assert (=> b!120462 (= lt!187540 (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!187554))) (currentByte!5537 (_2!5317 lt!187554)) (currentBit!5532 (_2!5317 lt!187554))))))

(assert (=> b!120462 (= lt!187559 (bitIndex!0 (size!2427 (buf!2858 thiss!1305)) (currentByte!5537 thiss!1305) (currentBit!5532 thiss!1305)))))

(declare-fun lt!187537 () tuple2!10102)

(assert (=> b!120462 (and (= (_2!5316 lt!187542) (_2!5316 lt!187537)) (= (_1!5316 lt!187542) (_1!5316 lt!187537)))))

(declare-fun lt!187560 () Unit!7421)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7421)

(assert (=> b!120462 (= lt!187560 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5315 lt!187534) nBits!396 i!615 lt!187557))))

(assert (=> b!120462 (= lt!187537 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5315 lt!187534) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187551))))

(declare-fun b!120463 () Bool)

(declare-fun array_inv!2229 (array!5361) Bool)

(assert (=> b!120463 (= e!78893 (array_inv!2229 (buf!2858 thiss!1305)))))

(assert (= (and start!23796 res!99731) b!120453))

(assert (= (and b!120453 res!99726) b!120455))

(assert (= (and b!120455 res!99730) b!120454))

(assert (= (and b!120454 res!99729) b!120451))

(assert (= (and b!120451 res!99727) b!120461))

(assert (= (and b!120461 res!99734) b!120459))

(assert (= (and b!120459 res!99733) b!120452))

(assert (= (and b!120452 res!99725) b!120457))

(assert (= (and b!120451 res!99728) b!120458))

(assert (= (and b!120458 res!99732) b!120456))

(assert (= (and b!120451 res!99724) b!120460))

(assert (= (and b!120451 (not res!99735)) b!120462))

(assert (= start!23796 b!120463))

(declare-fun m!182001 () Bool)

(assert (=> b!120455 m!182001))

(declare-fun m!182003 () Bool)

(assert (=> b!120458 m!182003))

(declare-fun m!182005 () Bool)

(assert (=> b!120459 m!182005))

(declare-fun m!182007 () Bool)

(assert (=> b!120461 m!182007))

(declare-fun m!182009 () Bool)

(assert (=> b!120461 m!182009))

(declare-fun m!182011 () Bool)

(assert (=> b!120451 m!182011))

(declare-fun m!182013 () Bool)

(assert (=> b!120451 m!182013))

(declare-fun m!182015 () Bool)

(assert (=> b!120451 m!182015))

(declare-fun m!182017 () Bool)

(assert (=> b!120451 m!182017))

(declare-fun m!182019 () Bool)

(assert (=> b!120451 m!182019))

(declare-fun m!182021 () Bool)

(assert (=> b!120451 m!182021))

(declare-fun m!182023 () Bool)

(assert (=> b!120451 m!182023))

(declare-fun m!182025 () Bool)

(assert (=> b!120451 m!182025))

(declare-fun m!182027 () Bool)

(assert (=> b!120451 m!182027))

(declare-fun m!182029 () Bool)

(assert (=> b!120451 m!182029))

(declare-fun m!182031 () Bool)

(assert (=> b!120451 m!182031))

(declare-fun m!182033 () Bool)

(assert (=> b!120451 m!182033))

(declare-fun m!182035 () Bool)

(assert (=> b!120451 m!182035))

(declare-fun m!182037 () Bool)

(assert (=> b!120451 m!182037))

(declare-fun m!182039 () Bool)

(assert (=> b!120451 m!182039))

(declare-fun m!182041 () Bool)

(assert (=> b!120451 m!182041))

(declare-fun m!182043 () Bool)

(assert (=> b!120451 m!182043))

(declare-fun m!182045 () Bool)

(assert (=> b!120451 m!182045))

(declare-fun m!182047 () Bool)

(assert (=> b!120451 m!182047))

(declare-fun m!182049 () Bool)

(assert (=> b!120452 m!182049))

(assert (=> b!120452 m!182049))

(declare-fun m!182051 () Bool)

(assert (=> b!120452 m!182051))

(declare-fun m!182053 () Bool)

(assert (=> b!120463 m!182053))

(declare-fun m!182055 () Bool)

(assert (=> start!23796 m!182055))

(declare-fun m!182057 () Bool)

(assert (=> b!120453 m!182057))

(declare-fun m!182059 () Bool)

(assert (=> b!120456 m!182059))

(declare-fun m!182061 () Bool)

(assert (=> b!120457 m!182061))

(declare-fun m!182063 () Bool)

(assert (=> b!120462 m!182063))

(declare-fun m!182065 () Bool)

(assert (=> b!120462 m!182065))

(declare-fun m!182067 () Bool)

(assert (=> b!120462 m!182067))

(declare-fun m!182069 () Bool)

(assert (=> b!120462 m!182069))

(declare-fun m!182071 () Bool)

(assert (=> b!120462 m!182071))

(assert (=> b!120462 m!182009))

(assert (=> b!120462 m!182065))

(assert (=> b!120462 m!182007))

(declare-fun m!182073 () Bool)

(assert (=> b!120462 m!182073))

(push 1)

(assert (not b!120451))

(assert (not start!23796))

(assert (not b!120461))

(assert (not b!120463))

(assert (not b!120453))

(assert (not b!120458))

(assert (not b!120456))

(assert (not b!120455))

(assert (not b!120452))

(assert (not b!120457))

(assert (not b!120462))

(assert (not b!120459))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!38796 () Bool)

(declare-fun e!78923 () Bool)

(assert (=> d!38796 e!78923))

(declare-fun res!99775 () Bool)

(assert (=> d!38796 (=> (not res!99775) (not e!78923))))

(declare-fun lt!187698 () (_ BitVec 64))

(declare-fun lt!187697 () (_ BitVec 64))

(declare-fun lt!187700 () (_ BitVec 64))

(assert (=> d!38796 (= res!99775 (= lt!187698 (bvsub lt!187700 lt!187697)))))

(assert (=> d!38796 (or (= (bvand lt!187700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187697 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187700 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187700 lt!187697) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!38796 (= lt!187697 (remainingBits!0 ((_ sign_extend 32) (size!2427 (buf!2858 (_2!5317 lt!187548)))) ((_ sign_extend 32) (currentByte!5537 (_2!5317 lt!187548))) ((_ sign_extend 32) (currentBit!5532 (_2!5317 lt!187548)))))))

(declare-fun lt!187699 () (_ BitVec 64))

(declare-fun lt!187696 () (_ BitVec 64))

(assert (=> d!38796 (= lt!187700 (bvmul lt!187699 lt!187696))))

(assert (=> d!38796 (or (= lt!187699 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187696 (bvsdiv (bvmul lt!187699 lt!187696) lt!187699)))))

(assert (=> d!38796 (= lt!187696 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38796 (= lt!187699 ((_ sign_extend 32) (size!2427 (buf!2858 (_2!5317 lt!187548)))))))

(assert (=> d!38796 (= lt!187698 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5537 (_2!5317 lt!187548))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5532 (_2!5317 lt!187548)))))))

(assert (=> d!38796 (invariant!0 (currentBit!5532 (_2!5317 lt!187548)) (currentByte!5537 (_2!5317 lt!187548)) (size!2427 (buf!2858 (_2!5317 lt!187548))))))

(assert (=> d!38796 (= (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!187548))) (currentByte!5537 (_2!5317 lt!187548)) (currentBit!5532 (_2!5317 lt!187548))) lt!187698)))

(declare-fun b!120510 () Bool)

(declare-fun res!99774 () Bool)

(assert (=> b!120510 (=> (not res!99774) (not e!78923))))

(assert (=> b!120510 (= res!99774 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!187698))))

(declare-fun b!120511 () Bool)

(declare-fun lt!187695 () (_ BitVec 64))

(assert (=> b!120511 (= e!78923 (bvsle lt!187698 (bvmul lt!187695 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120511 (or (= lt!187695 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!187695 #b0000000000000000000000000000000000000000000000000000000000001000) lt!187695)))))

(assert (=> b!120511 (= lt!187695 ((_ sign_extend 32) (size!2427 (buf!2858 (_2!5317 lt!187548)))))))

(assert (= (and d!38796 res!99775) b!120510))

(assert (= (and b!120510 res!99774) b!120511))

(declare-fun m!182161 () Bool)

(assert (=> d!38796 m!182161))

(declare-fun m!182163 () Bool)

(assert (=> d!38796 m!182163))

(assert (=> b!120461 d!38796))

(declare-fun d!38802 () Bool)

(declare-fun e!78924 () Bool)

(assert (=> d!38802 e!78924))

(declare-fun res!99777 () Bool)

(assert (=> d!38802 (=> (not res!99777) (not e!78924))))

(declare-fun lt!187704 () (_ BitVec 64))

(declare-fun lt!187706 () (_ BitVec 64))

(declare-fun lt!187703 () (_ BitVec 64))

(assert (=> d!38802 (= res!99777 (= lt!187704 (bvsub lt!187706 lt!187703)))))

(assert (=> d!38802 (or (= (bvand lt!187706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187703 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187706 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187706 lt!187703) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38802 (= lt!187703 (remainingBits!0 ((_ sign_extend 32) (size!2427 (buf!2858 thiss!1305))) ((_ sign_extend 32) (currentByte!5537 thiss!1305)) ((_ sign_extend 32) (currentBit!5532 thiss!1305))))))

(declare-fun lt!187705 () (_ BitVec 64))

(declare-fun lt!187702 () (_ BitVec 64))

(assert (=> d!38802 (= lt!187706 (bvmul lt!187705 lt!187702))))

(assert (=> d!38802 (or (= lt!187705 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187702 (bvsdiv (bvmul lt!187705 lt!187702) lt!187705)))))

(assert (=> d!38802 (= lt!187702 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38802 (= lt!187705 ((_ sign_extend 32) (size!2427 (buf!2858 thiss!1305))))))

(assert (=> d!38802 (= lt!187704 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5537 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5532 thiss!1305))))))

(assert (=> d!38802 (invariant!0 (currentBit!5532 thiss!1305) (currentByte!5537 thiss!1305) (size!2427 (buf!2858 thiss!1305)))))

(assert (=> d!38802 (= (bitIndex!0 (size!2427 (buf!2858 thiss!1305)) (currentByte!5537 thiss!1305) (currentBit!5532 thiss!1305)) lt!187704)))

(declare-fun b!120512 () Bool)

(declare-fun res!99776 () Bool)

(assert (=> b!120512 (=> (not res!99776) (not e!78924))))

(assert (=> b!120512 (= res!99776 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!187704))))

(declare-fun b!120513 () Bool)

(declare-fun lt!187701 () (_ BitVec 64))

(assert (=> b!120513 (= e!78924 (bvsle lt!187704 (bvmul lt!187701 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120513 (or (= lt!187701 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!187701 #b0000000000000000000000000000000000000000000000000000000000001000) lt!187701)))))

(assert (=> b!120513 (= lt!187701 ((_ sign_extend 32) (size!2427 (buf!2858 thiss!1305))))))

(assert (= (and d!38802 res!99777) b!120512))

(assert (= (and b!120512 res!99776) b!120513))

(declare-fun m!182165 () Bool)

(assert (=> d!38802 m!182165))

(declare-fun m!182167 () Bool)

(assert (=> d!38802 m!182167))

(assert (=> b!120461 d!38802))

(declare-fun d!38804 () Bool)

(declare-fun res!99784 () Bool)

(declare-fun e!78930 () Bool)

(assert (=> d!38804 (=> (not res!99784) (not e!78930))))

(assert (=> d!38804 (= res!99784 (= (size!2427 (buf!2858 thiss!1305)) (size!2427 (buf!2858 (_2!5317 lt!187548)))))))

(assert (=> d!38804 (= (isPrefixOf!0 thiss!1305 (_2!5317 lt!187548)) e!78930)))

(declare-fun b!120520 () Bool)

(declare-fun res!99786 () Bool)

(assert (=> b!120520 (=> (not res!99786) (not e!78930))))

(assert (=> b!120520 (= res!99786 (bvsle (bitIndex!0 (size!2427 (buf!2858 thiss!1305)) (currentByte!5537 thiss!1305) (currentBit!5532 thiss!1305)) (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!187548))) (currentByte!5537 (_2!5317 lt!187548)) (currentBit!5532 (_2!5317 lt!187548)))))))

(declare-fun b!120521 () Bool)

(declare-fun e!78929 () Bool)

(assert (=> b!120521 (= e!78930 e!78929)))

(declare-fun res!99785 () Bool)

(assert (=> b!120521 (=> res!99785 e!78929)))

(assert (=> b!120521 (= res!99785 (= (size!2427 (buf!2858 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!120522 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5361 array!5361 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!120522 (= e!78929 (arrayBitRangesEq!0 (buf!2858 thiss!1305) (buf!2858 (_2!5317 lt!187548)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2427 (buf!2858 thiss!1305)) (currentByte!5537 thiss!1305) (currentBit!5532 thiss!1305))))))

(assert (= (and d!38804 res!99784) b!120520))

(assert (= (and b!120520 res!99786) b!120521))

(assert (= (and b!120521 (not res!99785)) b!120522))

(assert (=> b!120520 m!182009))

(assert (=> b!120520 m!182007))

(assert (=> b!120522 m!182009))

(assert (=> b!120522 m!182009))

(declare-fun m!182169 () Bool)

(assert (=> b!120522 m!182169))

(assert (=> b!120459 d!38804))

(declare-fun d!38806 () Bool)

(assert (=> d!38806 (= (invariant!0 (currentBit!5532 thiss!1305) (currentByte!5537 thiss!1305) (size!2427 (buf!2858 (_2!5317 lt!187548)))) (and (bvsge (currentBit!5532 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5532 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5537 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5537 thiss!1305) (size!2427 (buf!2858 (_2!5317 lt!187548)))) (and (= (currentBit!5532 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5537 thiss!1305) (size!2427 (buf!2858 (_2!5317 lt!187548))))))))))

(assert (=> b!120458 d!38806))

(declare-fun d!38808 () Bool)

(declare-fun e!78931 () Bool)

(assert (=> d!38808 e!78931))

(declare-fun res!99788 () Bool)

(assert (=> d!38808 (=> (not res!99788) (not e!78931))))

(declare-fun lt!187712 () (_ BitVec 64))

(declare-fun lt!187709 () (_ BitVec 64))

(declare-fun lt!187710 () (_ BitVec 64))

(assert (=> d!38808 (= res!99788 (= lt!187710 (bvsub lt!187712 lt!187709)))))

(assert (=> d!38808 (or (= (bvand lt!187712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187709 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187712 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187712 lt!187709) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38808 (= lt!187709 (remainingBits!0 ((_ sign_extend 32) (size!2427 (buf!2858 (_1!5318 lt!187558)))) ((_ sign_extend 32) (currentByte!5537 (_1!5318 lt!187558))) ((_ sign_extend 32) (currentBit!5532 (_1!5318 lt!187558)))))))

(declare-fun lt!187711 () (_ BitVec 64))

(declare-fun lt!187708 () (_ BitVec 64))

(assert (=> d!38808 (= lt!187712 (bvmul lt!187711 lt!187708))))

(assert (=> d!38808 (or (= lt!187711 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187708 (bvsdiv (bvmul lt!187711 lt!187708) lt!187711)))))

(assert (=> d!38808 (= lt!187708 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38808 (= lt!187711 ((_ sign_extend 32) (size!2427 (buf!2858 (_1!5318 lt!187558)))))))

(assert (=> d!38808 (= lt!187710 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5537 (_1!5318 lt!187558))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5532 (_1!5318 lt!187558)))))))

(assert (=> d!38808 (invariant!0 (currentBit!5532 (_1!5318 lt!187558)) (currentByte!5537 (_1!5318 lt!187558)) (size!2427 (buf!2858 (_1!5318 lt!187558))))))

(assert (=> d!38808 (= (bitIndex!0 (size!2427 (buf!2858 (_1!5318 lt!187558))) (currentByte!5537 (_1!5318 lt!187558)) (currentBit!5532 (_1!5318 lt!187558))) lt!187710)))

(declare-fun b!120523 () Bool)

(declare-fun res!99787 () Bool)

(assert (=> b!120523 (=> (not res!99787) (not e!78931))))

(assert (=> b!120523 (= res!99787 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!187710))))

(declare-fun b!120524 () Bool)

(declare-fun lt!187707 () (_ BitVec 64))

(assert (=> b!120524 (= e!78931 (bvsle lt!187710 (bvmul lt!187707 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120524 (or (= lt!187707 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!187707 #b0000000000000000000000000000000000000000000000000000000000001000) lt!187707)))))

(assert (=> b!120524 (= lt!187707 ((_ sign_extend 32) (size!2427 (buf!2858 (_1!5318 lt!187558)))))))

(assert (= (and d!38808 res!99788) b!120523))

(assert (= (and b!120523 res!99787) b!120524))

(declare-fun m!182171 () Bool)

(assert (=> d!38808 m!182171))

(declare-fun m!182173 () Bool)

(assert (=> d!38808 m!182173))

(assert (=> b!120457 d!38808))

(declare-fun d!38810 () Bool)

(assert (=> d!38810 (= (invariant!0 (currentBit!5532 thiss!1305) (currentByte!5537 thiss!1305) (size!2427 (buf!2858 (_2!5317 lt!187554)))) (and (bvsge (currentBit!5532 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5532 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5537 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5537 thiss!1305) (size!2427 (buf!2858 (_2!5317 lt!187554)))) (and (= (currentBit!5532 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5537 thiss!1305) (size!2427 (buf!2858 (_2!5317 lt!187554))))))))))

(assert (=> b!120456 d!38810))

(declare-fun d!38812 () Bool)

(assert (=> d!38812 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!120455 d!38812))

(declare-fun d!38814 () Bool)

(assert (=> d!38814 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5532 thiss!1305) (currentByte!5537 thiss!1305) (size!2427 (buf!2858 thiss!1305))))))

(declare-fun bs!9384 () Bool)

(assert (= bs!9384 d!38814))

(assert (=> bs!9384 m!182167))

(assert (=> start!23796 d!38814))

(declare-fun d!38816 () Bool)

(assert (=> d!38816 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2427 (buf!2858 thiss!1305))) ((_ sign_extend 32) (currentByte!5537 thiss!1305)) ((_ sign_extend 32) (currentBit!5532 thiss!1305)) lt!187544) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2427 (buf!2858 thiss!1305))) ((_ sign_extend 32) (currentByte!5537 thiss!1305)) ((_ sign_extend 32) (currentBit!5532 thiss!1305))) lt!187544))))

(declare-fun bs!9385 () Bool)

(assert (= bs!9385 d!38816))

(assert (=> bs!9385 m!182165))

(assert (=> b!120453 d!38816))

(declare-fun d!38818 () Bool)

(declare-datatypes ((tuple2!10114 0))(
  ( (tuple2!10115 (_1!5322 Bool) (_2!5322 BitStream!4328)) )
))
(declare-fun lt!187733 () tuple2!10114)

(declare-fun readBit!0 (BitStream!4328) tuple2!10114)

(assert (=> d!38818 (= lt!187733 (readBit!0 (readerFrom!0 (_2!5317 lt!187548) (currentBit!5532 thiss!1305) (currentByte!5537 thiss!1305))))))

(assert (=> d!38818 (= (readBitPure!0 (readerFrom!0 (_2!5317 lt!187548) (currentBit!5532 thiss!1305) (currentByte!5537 thiss!1305))) (tuple2!10107 (_2!5322 lt!187733) (_1!5322 lt!187733)))))

(declare-fun bs!9387 () Bool)

(assert (= bs!9387 d!38818))

(assert (=> bs!9387 m!182049))

(declare-fun m!182181 () Bool)

(assert (=> bs!9387 m!182181))

(assert (=> b!120452 d!38818))

(declare-fun d!38828 () Bool)

(declare-fun e!78937 () Bool)

(assert (=> d!38828 e!78937))

(declare-fun res!99798 () Bool)

(assert (=> d!38828 (=> (not res!99798) (not e!78937))))

(assert (=> d!38828 (= res!99798 (invariant!0 (currentBit!5532 (_2!5317 lt!187548)) (currentByte!5537 (_2!5317 lt!187548)) (size!2427 (buf!2858 (_2!5317 lt!187548)))))))

(assert (=> d!38828 (= (readerFrom!0 (_2!5317 lt!187548) (currentBit!5532 thiss!1305) (currentByte!5537 thiss!1305)) (BitStream!4329 (buf!2858 (_2!5317 lt!187548)) (currentByte!5537 thiss!1305) (currentBit!5532 thiss!1305)))))

(declare-fun b!120533 () Bool)

(assert (=> b!120533 (= e!78937 (invariant!0 (currentBit!5532 thiss!1305) (currentByte!5537 thiss!1305) (size!2427 (buf!2858 (_2!5317 lt!187548)))))))

(assert (= (and d!38828 res!99798) b!120533))

(assert (=> d!38828 m!182163))

(assert (=> b!120533 m!182003))

(assert (=> b!120452 d!38828))

(declare-fun d!38832 () Bool)

(assert (=> d!38832 (= (array_inv!2229 (buf!2858 thiss!1305)) (bvsge (size!2427 (buf!2858 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!120463 d!38832))

(declare-fun d!38834 () Bool)

(declare-fun lt!187766 () tuple2!10102)

(declare-fun lt!187769 () tuple2!10102)

(assert (=> d!38834 (and (= (_2!5316 lt!187766) (_2!5316 lt!187769)) (= (_1!5316 lt!187766) (_1!5316 lt!187769)))))

(declare-fun lt!187765 () (_ BitVec 64))

(declare-fun lt!187767 () BitStream!4328)

(declare-fun lt!187770 () Unit!7421)

(declare-fun lt!187768 () Bool)

(declare-fun choose!45 (BitStream!4328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!10102 tuple2!10102 BitStream!4328 (_ BitVec 64) Bool BitStream!4328 (_ BitVec 64) tuple2!10102 tuple2!10102 BitStream!4328 (_ BitVec 64)) Unit!7421)

(assert (=> d!38834 (= lt!187770 (choose!45 (_1!5315 lt!187534) nBits!396 i!615 lt!187557 lt!187766 (tuple2!10103 (_1!5316 lt!187766) (_2!5316 lt!187766)) (_1!5316 lt!187766) (_2!5316 lt!187766) lt!187768 lt!187767 lt!187765 lt!187769 (tuple2!10103 (_1!5316 lt!187769) (_2!5316 lt!187769)) (_1!5316 lt!187769) (_2!5316 lt!187769)))))

(assert (=> d!38834 (= lt!187769 (readNLeastSignificantBitsLoopPure!0 lt!187767 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!187765))))

(assert (=> d!38834 (= lt!187765 (bvor lt!187557 (ite lt!187768 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38834 (= lt!187767 (withMovedBitIndex!0 (_1!5315 lt!187534) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!38834 (= lt!187768 (_2!5318 (readBitPure!0 (_1!5315 lt!187534))))))

(assert (=> d!38834 (= lt!187766 (readNLeastSignificantBitsLoopPure!0 (_1!5315 lt!187534) nBits!396 i!615 lt!187557))))

(assert (=> d!38834 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5315 lt!187534) nBits!396 i!615 lt!187557) lt!187770)))

(declare-fun bs!9394 () Bool)

(assert (= bs!9394 d!38834))

(assert (=> bs!9394 m!182029))

(declare-fun m!182197 () Bool)

(assert (=> bs!9394 m!182197))

(assert (=> bs!9394 m!182065))

(assert (=> bs!9394 m!182041))

(declare-fun m!182199 () Bool)

(assert (=> bs!9394 m!182199))

(assert (=> b!120462 d!38834))

(declare-fun d!38856 () Bool)

(declare-datatypes ((tuple2!10116 0))(
  ( (tuple2!10117 (_1!5323 (_ BitVec 64)) (_2!5323 BitStream!4328)) )
))
(declare-fun lt!187778 () tuple2!10116)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4328 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10116)

(assert (=> d!38856 (= lt!187778 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!5315 lt!187534) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187551))))

(assert (=> d!38856 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5315 lt!187534) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187551) (tuple2!10103 (_2!5323 lt!187778) (_1!5323 lt!187778)))))

(declare-fun bs!9399 () Bool)

(assert (= bs!9399 d!38856))

(assert (=> bs!9399 m!182065))

(declare-fun m!182209 () Bool)

(assert (=> bs!9399 m!182209))

(assert (=> b!120462 d!38856))

(declare-fun d!38866 () Bool)

(declare-fun e!78949 () Bool)

(assert (=> d!38866 e!78949))

(declare-fun res!99816 () Bool)

(assert (=> d!38866 (=> (not res!99816) (not e!78949))))

(declare-fun lt!187791 () (_ BitVec 64))

(declare-fun lt!187790 () BitStream!4328)

(assert (=> d!38866 (= res!99816 (= (bvadd lt!187791 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2427 (buf!2858 lt!187790)) (currentByte!5537 lt!187790) (currentBit!5532 lt!187790))))))

(assert (=> d!38866 (or (not (= (bvand lt!187791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!187791 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!187791 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38866 (= lt!187791 (bitIndex!0 (size!2427 (buf!2858 (_1!5315 lt!187534))) (currentByte!5537 (_1!5315 lt!187534)) (currentBit!5532 (_1!5315 lt!187534))))))

(declare-fun moveBitIndex!0 (BitStream!4328 (_ BitVec 64)) tuple2!10104)

(assert (=> d!38866 (= lt!187790 (_2!5317 (moveBitIndex!0 (_1!5315 lt!187534) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4328 (_ BitVec 64)) Bool)

(assert (=> d!38866 (moveBitIndexPrecond!0 (_1!5315 lt!187534) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!38866 (= (withMovedBitIndex!0 (_1!5315 lt!187534) #b0000000000000000000000000000000000000000000000000000000000000001) lt!187790)))

(declare-fun b!120551 () Bool)

(assert (=> b!120551 (= e!78949 (= (size!2427 (buf!2858 (_1!5315 lt!187534))) (size!2427 (buf!2858 lt!187790))))))

(assert (= (and d!38866 res!99816) b!120551))

(declare-fun m!182217 () Bool)

(assert (=> d!38866 m!182217))

(declare-fun m!182219 () Bool)

(assert (=> d!38866 m!182219))

(declare-fun m!182221 () Bool)

(assert (=> d!38866 m!182221))

(declare-fun m!182223 () Bool)

(assert (=> d!38866 m!182223))

(assert (=> b!120462 d!38866))

(assert (=> b!120462 d!38796))

(declare-fun d!38872 () Bool)

(declare-fun e!78950 () Bool)

(assert (=> d!38872 e!78950))

(declare-fun res!99817 () Bool)

(assert (=> d!38872 (=> (not res!99817) (not e!78950))))

(declare-fun lt!187793 () (_ BitVec 64))

(declare-fun lt!187792 () BitStream!4328)

(assert (=> d!38872 (= res!99817 (= (bvadd lt!187793 (bvsub lt!187559 lt!187540)) (bitIndex!0 (size!2427 (buf!2858 lt!187792)) (currentByte!5537 lt!187792) (currentBit!5532 lt!187792))))))

(assert (=> d!38872 (or (not (= (bvand lt!187793 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187559 lt!187540) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!187793 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!187793 (bvsub lt!187559 lt!187540)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38872 (= lt!187793 (bitIndex!0 (size!2427 (buf!2858 (_2!5315 lt!187534))) (currentByte!5537 (_2!5315 lt!187534)) (currentBit!5532 (_2!5315 lt!187534))))))

(assert (=> d!38872 (= lt!187792 (_2!5317 (moveBitIndex!0 (_2!5315 lt!187534) (bvsub lt!187559 lt!187540))))))

(assert (=> d!38872 (moveBitIndexPrecond!0 (_2!5315 lt!187534) (bvsub lt!187559 lt!187540))))

(assert (=> d!38872 (= (withMovedBitIndex!0 (_2!5315 lt!187534) (bvsub lt!187559 lt!187540)) lt!187792)))

(declare-fun b!120552 () Bool)

(assert (=> b!120552 (= e!78950 (= (size!2427 (buf!2858 (_2!5315 lt!187534))) (size!2427 (buf!2858 lt!187792))))))

(assert (= (and d!38872 res!99817) b!120552))

(declare-fun m!182225 () Bool)

(assert (=> d!38872 m!182225))

(declare-fun m!182227 () Bool)

(assert (=> d!38872 m!182227))

(declare-fun m!182229 () Bool)

(assert (=> d!38872 m!182229))

(declare-fun m!182231 () Bool)

(assert (=> d!38872 m!182231))

(assert (=> b!120462 d!38872))

(declare-fun d!38874 () Bool)

(declare-fun e!78951 () Bool)

(assert (=> d!38874 e!78951))

(declare-fun res!99818 () Bool)

(assert (=> d!38874 (=> (not res!99818) (not e!78951))))

(declare-fun lt!187794 () BitStream!4328)

(declare-fun lt!187795 () (_ BitVec 64))

(assert (=> d!38874 (= res!99818 (= (bvadd lt!187795 (bvsub lt!187550 lt!187540)) (bitIndex!0 (size!2427 (buf!2858 lt!187794)) (currentByte!5537 lt!187794) (currentBit!5532 lt!187794))))))

(assert (=> d!38874 (or (not (= (bvand lt!187795 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187550 lt!187540) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!187795 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!187795 (bvsub lt!187550 lt!187540)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38874 (= lt!187795 (bitIndex!0 (size!2427 (buf!2858 (_2!5315 lt!187538))) (currentByte!5537 (_2!5315 lt!187538)) (currentBit!5532 (_2!5315 lt!187538))))))

(assert (=> d!38874 (= lt!187794 (_2!5317 (moveBitIndex!0 (_2!5315 lt!187538) (bvsub lt!187550 lt!187540))))))

(assert (=> d!38874 (moveBitIndexPrecond!0 (_2!5315 lt!187538) (bvsub lt!187550 lt!187540))))

(assert (=> d!38874 (= (withMovedBitIndex!0 (_2!5315 lt!187538) (bvsub lt!187550 lt!187540)) lt!187794)))

(declare-fun b!120553 () Bool)

(assert (=> b!120553 (= e!78951 (= (size!2427 (buf!2858 (_2!5315 lt!187538))) (size!2427 (buf!2858 lt!187794))))))

(assert (= (and d!38874 res!99818) b!120553))

(declare-fun m!182233 () Bool)

(assert (=> d!38874 m!182233))

(declare-fun m!182235 () Bool)

(assert (=> d!38874 m!182235))

(declare-fun m!182237 () Bool)

(assert (=> d!38874 m!182237))

(declare-fun m!182239 () Bool)

(assert (=> d!38874 m!182239))

(assert (=> b!120462 d!38874))

(declare-fun d!38876 () Bool)

(declare-fun e!78952 () Bool)

(assert (=> d!38876 e!78952))

(declare-fun res!99820 () Bool)

(assert (=> d!38876 (=> (not res!99820) (not e!78952))))

(declare-fun lt!187799 () (_ BitVec 64))

(declare-fun lt!187801 () (_ BitVec 64))

(declare-fun lt!187798 () (_ BitVec 64))

(assert (=> d!38876 (= res!99820 (= lt!187799 (bvsub lt!187801 lt!187798)))))

(assert (=> d!38876 (or (= (bvand lt!187801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187798 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187801 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187801 lt!187798) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38876 (= lt!187798 (remainingBits!0 ((_ sign_extend 32) (size!2427 (buf!2858 (_2!5317 lt!187554)))) ((_ sign_extend 32) (currentByte!5537 (_2!5317 lt!187554))) ((_ sign_extend 32) (currentBit!5532 (_2!5317 lt!187554)))))))

(declare-fun lt!187800 () (_ BitVec 64))

(declare-fun lt!187797 () (_ BitVec 64))

(assert (=> d!38876 (= lt!187801 (bvmul lt!187800 lt!187797))))

(assert (=> d!38876 (or (= lt!187800 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187797 (bvsdiv (bvmul lt!187800 lt!187797) lt!187800)))))

(assert (=> d!38876 (= lt!187797 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38876 (= lt!187800 ((_ sign_extend 32) (size!2427 (buf!2858 (_2!5317 lt!187554)))))))

(assert (=> d!38876 (= lt!187799 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5537 (_2!5317 lt!187554))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5532 (_2!5317 lt!187554)))))))

(assert (=> d!38876 (invariant!0 (currentBit!5532 (_2!5317 lt!187554)) (currentByte!5537 (_2!5317 lt!187554)) (size!2427 (buf!2858 (_2!5317 lt!187554))))))

(assert (=> d!38876 (= (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!187554))) (currentByte!5537 (_2!5317 lt!187554)) (currentBit!5532 (_2!5317 lt!187554))) lt!187799)))

(declare-fun b!120554 () Bool)

(declare-fun res!99819 () Bool)

(assert (=> b!120554 (=> (not res!99819) (not e!78952))))

(assert (=> b!120554 (= res!99819 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!187799))))

(declare-fun b!120555 () Bool)

(declare-fun lt!187796 () (_ BitVec 64))

(assert (=> b!120555 (= e!78952 (bvsle lt!187799 (bvmul lt!187796 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120555 (or (= lt!187796 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!187796 #b0000000000000000000000000000000000000000000000000000000000001000) lt!187796)))))

(assert (=> b!120555 (= lt!187796 ((_ sign_extend 32) (size!2427 (buf!2858 (_2!5317 lt!187554)))))))

(assert (= (and d!38876 res!99820) b!120554))

(assert (= (and b!120554 res!99819) b!120555))

(declare-fun m!182241 () Bool)

(assert (=> d!38876 m!182241))

(declare-fun m!182243 () Bool)

(assert (=> d!38876 m!182243))

(assert (=> b!120462 d!38876))

(assert (=> b!120462 d!38802))

(declare-fun d!38878 () Bool)

(assert (=> d!38878 (validate_offset_bits!1 ((_ sign_extend 32) (size!2427 (buf!2858 (_2!5317 lt!187554)))) ((_ sign_extend 32) (currentByte!5537 thiss!1305)) ((_ sign_extend 32) (currentBit!5532 thiss!1305)) lt!187544)))

(declare-fun lt!187804 () Unit!7421)

(declare-fun choose!9 (BitStream!4328 array!5361 (_ BitVec 64) BitStream!4328) Unit!7421)

(assert (=> d!38878 (= lt!187804 (choose!9 thiss!1305 (buf!2858 (_2!5317 lt!187554)) lt!187544 (BitStream!4329 (buf!2858 (_2!5317 lt!187554)) (currentByte!5537 thiss!1305) (currentBit!5532 thiss!1305))))))

(assert (=> d!38878 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2858 (_2!5317 lt!187554)) lt!187544) lt!187804)))

(declare-fun bs!9401 () Bool)

(assert (= bs!9401 d!38878))

(assert (=> bs!9401 m!182027))

(declare-fun m!182245 () Bool)

(assert (=> bs!9401 m!182245))

(assert (=> b!120451 d!38878))

(declare-fun d!38880 () Bool)

(declare-fun res!99821 () Bool)

(declare-fun e!78954 () Bool)

(assert (=> d!38880 (=> (not res!99821) (not e!78954))))

(assert (=> d!38880 (= res!99821 (= (size!2427 (buf!2858 thiss!1305)) (size!2427 (buf!2858 (_2!5317 lt!187554)))))))

(assert (=> d!38880 (= (isPrefixOf!0 thiss!1305 (_2!5317 lt!187554)) e!78954)))

(declare-fun b!120556 () Bool)

(declare-fun res!99823 () Bool)

(assert (=> b!120556 (=> (not res!99823) (not e!78954))))

(assert (=> b!120556 (= res!99823 (bvsle (bitIndex!0 (size!2427 (buf!2858 thiss!1305)) (currentByte!5537 thiss!1305) (currentBit!5532 thiss!1305)) (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!187554))) (currentByte!5537 (_2!5317 lt!187554)) (currentBit!5532 (_2!5317 lt!187554)))))))

(declare-fun b!120557 () Bool)

(declare-fun e!78953 () Bool)

(assert (=> b!120557 (= e!78954 e!78953)))

(declare-fun res!99822 () Bool)

(assert (=> b!120557 (=> res!99822 e!78953)))

(assert (=> b!120557 (= res!99822 (= (size!2427 (buf!2858 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!120558 () Bool)

(assert (=> b!120558 (= e!78953 (arrayBitRangesEq!0 (buf!2858 thiss!1305) (buf!2858 (_2!5317 lt!187554)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2427 (buf!2858 thiss!1305)) (currentByte!5537 thiss!1305) (currentBit!5532 thiss!1305))))))

(assert (= (and d!38880 res!99821) b!120556))

(assert (= (and b!120556 res!99823) b!120557))

(assert (= (and b!120557 (not res!99822)) b!120558))

(assert (=> b!120556 m!182009))

(assert (=> b!120556 m!182069))

(assert (=> b!120558 m!182009))

(assert (=> b!120558 m!182009))

(declare-fun m!182247 () Bool)

(assert (=> b!120558 m!182247))

(assert (=> b!120451 d!38880))

(declare-fun b!120584 () Bool)

(declare-fun e!78965 () Unit!7421)

(declare-fun Unit!7432 () Unit!7421)

(assert (=> b!120584 (= e!78965 Unit!7432)))

(declare-fun b!120585 () Bool)

(declare-fun e!78966 () Bool)

(declare-fun lt!187916 () (_ BitVec 64))

(declare-fun lt!187905 () tuple2!10100)

(declare-fun lt!187909 () (_ BitVec 64))

(assert (=> b!120585 (= e!78966 (= (_1!5315 lt!187905) (withMovedBitIndex!0 (_2!5315 lt!187905) (bvsub lt!187916 lt!187909))))))

(assert (=> b!120585 (or (= (bvand lt!187916 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187909 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187916 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187916 lt!187909) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120585 (= lt!187909 (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!187554))) (currentByte!5537 (_2!5317 lt!187554)) (currentBit!5532 (_2!5317 lt!187554))))))

(assert (=> b!120585 (= lt!187916 (bitIndex!0 (size!2427 (buf!2858 thiss!1305)) (currentByte!5537 thiss!1305) (currentBit!5532 thiss!1305)))))

(declare-fun d!38882 () Bool)

(assert (=> d!38882 e!78966))

(declare-fun res!99839 () Bool)

(assert (=> d!38882 (=> (not res!99839) (not e!78966))))

(assert (=> d!38882 (= res!99839 (isPrefixOf!0 (_1!5315 lt!187905) (_2!5315 lt!187905)))))

(declare-fun lt!187910 () BitStream!4328)

(assert (=> d!38882 (= lt!187905 (tuple2!10101 lt!187910 (_2!5317 lt!187554)))))

(declare-fun lt!187915 () Unit!7421)

(declare-fun lt!187917 () Unit!7421)

(assert (=> d!38882 (= lt!187915 lt!187917)))

(assert (=> d!38882 (isPrefixOf!0 lt!187910 (_2!5317 lt!187554))))

(assert (=> d!38882 (= lt!187917 (lemmaIsPrefixTransitive!0 lt!187910 (_2!5317 lt!187554) (_2!5317 lt!187554)))))

(declare-fun lt!187923 () Unit!7421)

(declare-fun lt!187914 () Unit!7421)

(assert (=> d!38882 (= lt!187923 lt!187914)))

(assert (=> d!38882 (isPrefixOf!0 lt!187910 (_2!5317 lt!187554))))

(assert (=> d!38882 (= lt!187914 (lemmaIsPrefixTransitive!0 lt!187910 thiss!1305 (_2!5317 lt!187554)))))

(declare-fun lt!187921 () Unit!7421)

(assert (=> d!38882 (= lt!187921 e!78965)))

(declare-fun c!7250 () Bool)

(assert (=> d!38882 (= c!7250 (not (= (size!2427 (buf!2858 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!187922 () Unit!7421)

(declare-fun lt!187924 () Unit!7421)

(assert (=> d!38882 (= lt!187922 lt!187924)))

(assert (=> d!38882 (isPrefixOf!0 (_2!5317 lt!187554) (_2!5317 lt!187554))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4328) Unit!7421)

(assert (=> d!38882 (= lt!187924 (lemmaIsPrefixRefl!0 (_2!5317 lt!187554)))))

(declare-fun lt!187907 () Unit!7421)

(declare-fun lt!187908 () Unit!7421)

(assert (=> d!38882 (= lt!187907 lt!187908)))

(assert (=> d!38882 (= lt!187908 (lemmaIsPrefixRefl!0 (_2!5317 lt!187554)))))

(declare-fun lt!187913 () Unit!7421)

(declare-fun lt!187911 () Unit!7421)

(assert (=> d!38882 (= lt!187913 lt!187911)))

(assert (=> d!38882 (isPrefixOf!0 lt!187910 lt!187910)))

(assert (=> d!38882 (= lt!187911 (lemmaIsPrefixRefl!0 lt!187910))))

(declare-fun lt!187912 () Unit!7421)

(declare-fun lt!187918 () Unit!7421)

(assert (=> d!38882 (= lt!187912 lt!187918)))

(assert (=> d!38882 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!38882 (= lt!187918 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!38882 (= lt!187910 (BitStream!4329 (buf!2858 (_2!5317 lt!187554)) (currentByte!5537 thiss!1305) (currentBit!5532 thiss!1305)))))

(assert (=> d!38882 (isPrefixOf!0 thiss!1305 (_2!5317 lt!187554))))

(assert (=> d!38882 (= (reader!0 thiss!1305 (_2!5317 lt!187554)) lt!187905)))

(declare-fun b!120586 () Bool)

(declare-fun res!99841 () Bool)

(assert (=> b!120586 (=> (not res!99841) (not e!78966))))

(assert (=> b!120586 (= res!99841 (isPrefixOf!0 (_1!5315 lt!187905) thiss!1305))))

(declare-fun b!120587 () Bool)

(declare-fun lt!187906 () Unit!7421)

(assert (=> b!120587 (= e!78965 lt!187906)))

(declare-fun lt!187920 () (_ BitVec 64))

(assert (=> b!120587 (= lt!187920 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!187919 () (_ BitVec 64))

(assert (=> b!120587 (= lt!187919 (bitIndex!0 (size!2427 (buf!2858 thiss!1305)) (currentByte!5537 thiss!1305) (currentBit!5532 thiss!1305)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5361 array!5361 (_ BitVec 64) (_ BitVec 64)) Unit!7421)

(assert (=> b!120587 (= lt!187906 (arrayBitRangesEqSymmetric!0 (buf!2858 thiss!1305) (buf!2858 (_2!5317 lt!187554)) lt!187920 lt!187919))))

(assert (=> b!120587 (arrayBitRangesEq!0 (buf!2858 (_2!5317 lt!187554)) (buf!2858 thiss!1305) lt!187920 lt!187919)))

(declare-fun b!120588 () Bool)

(declare-fun res!99840 () Bool)

(assert (=> b!120588 (=> (not res!99840) (not e!78966))))

(assert (=> b!120588 (= res!99840 (isPrefixOf!0 (_2!5315 lt!187905) (_2!5317 lt!187554)))))

(assert (= (and d!38882 c!7250) b!120587))

(assert (= (and d!38882 (not c!7250)) b!120584))

(assert (= (and d!38882 res!99839) b!120586))

(assert (= (and b!120586 res!99841) b!120588))

(assert (= (and b!120588 res!99840) b!120585))

(declare-fun m!182279 () Bool)

(assert (=> d!38882 m!182279))

(declare-fun m!182281 () Bool)

(assert (=> d!38882 m!182281))

(assert (=> d!38882 m!182023))

(declare-fun m!182283 () Bool)

(assert (=> d!38882 m!182283))

(declare-fun m!182285 () Bool)

(assert (=> d!38882 m!182285))

(declare-fun m!182287 () Bool)

(assert (=> d!38882 m!182287))

(declare-fun m!182289 () Bool)

(assert (=> d!38882 m!182289))

(declare-fun m!182291 () Bool)

(assert (=> d!38882 m!182291))

(declare-fun m!182293 () Bool)

(assert (=> d!38882 m!182293))

(declare-fun m!182295 () Bool)

(assert (=> d!38882 m!182295))

(declare-fun m!182297 () Bool)

(assert (=> d!38882 m!182297))

(declare-fun m!182299 () Bool)

(assert (=> b!120588 m!182299))

(declare-fun m!182301 () Bool)

(assert (=> b!120586 m!182301))

(declare-fun m!182303 () Bool)

(assert (=> b!120585 m!182303))

(assert (=> b!120585 m!182069))

(assert (=> b!120585 m!182009))

(assert (=> b!120587 m!182009))

(declare-fun m!182305 () Bool)

(assert (=> b!120587 m!182305))

(declare-fun m!182307 () Bool)

(assert (=> b!120587 m!182307))

(assert (=> b!120451 d!38882))

(declare-fun d!38886 () Bool)

(declare-fun lt!187925 () tuple2!10114)

(assert (=> d!38886 (= lt!187925 (readBit!0 (_1!5315 lt!187534)))))

(assert (=> d!38886 (= (readBitPure!0 (_1!5315 lt!187534)) (tuple2!10107 (_2!5322 lt!187925) (_1!5322 lt!187925)))))

(declare-fun bs!9402 () Bool)

(assert (= bs!9402 d!38886))

(declare-fun m!182309 () Bool)

(assert (=> bs!9402 m!182309))

(assert (=> b!120451 d!38886))

(declare-fun d!38888 () Bool)

(declare-fun e!78967 () Bool)

(assert (=> d!38888 e!78967))

(declare-fun res!99843 () Bool)

(assert (=> d!38888 (=> (not res!99843) (not e!78967))))

(declare-fun lt!187931 () (_ BitVec 64))

(declare-fun lt!187929 () (_ BitVec 64))

(declare-fun lt!187928 () (_ BitVec 64))

(assert (=> d!38888 (= res!99843 (= lt!187929 (bvsub lt!187931 lt!187928)))))

(assert (=> d!38888 (or (= (bvand lt!187931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!187928 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!187931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!187931 lt!187928) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38888 (= lt!187928 (remainingBits!0 ((_ sign_extend 32) (size!2427 (buf!2858 (_1!5318 lt!187536)))) ((_ sign_extend 32) (currentByte!5537 (_1!5318 lt!187536))) ((_ sign_extend 32) (currentBit!5532 (_1!5318 lt!187536)))))))

(declare-fun lt!187930 () (_ BitVec 64))

(declare-fun lt!187927 () (_ BitVec 64))

(assert (=> d!38888 (= lt!187931 (bvmul lt!187930 lt!187927))))

(assert (=> d!38888 (or (= lt!187930 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!187927 (bvsdiv (bvmul lt!187930 lt!187927) lt!187930)))))

(assert (=> d!38888 (= lt!187927 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38888 (= lt!187930 ((_ sign_extend 32) (size!2427 (buf!2858 (_1!5318 lt!187536)))))))

(assert (=> d!38888 (= lt!187929 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5537 (_1!5318 lt!187536))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5532 (_1!5318 lt!187536)))))))

(assert (=> d!38888 (invariant!0 (currentBit!5532 (_1!5318 lt!187536)) (currentByte!5537 (_1!5318 lt!187536)) (size!2427 (buf!2858 (_1!5318 lt!187536))))))

(assert (=> d!38888 (= (bitIndex!0 (size!2427 (buf!2858 (_1!5318 lt!187536))) (currentByte!5537 (_1!5318 lt!187536)) (currentBit!5532 (_1!5318 lt!187536))) lt!187929)))

(declare-fun b!120589 () Bool)

(declare-fun res!99842 () Bool)

(assert (=> b!120589 (=> (not res!99842) (not e!78967))))

(assert (=> b!120589 (= res!99842 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!187929))))

(declare-fun b!120590 () Bool)

(declare-fun lt!187926 () (_ BitVec 64))

(assert (=> b!120590 (= e!78967 (bvsle lt!187929 (bvmul lt!187926 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120590 (or (= lt!187926 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!187926 #b0000000000000000000000000000000000000000000000000000000000001000) lt!187926)))))

(assert (=> b!120590 (= lt!187926 ((_ sign_extend 32) (size!2427 (buf!2858 (_1!5318 lt!187536)))))))

(assert (= (and d!38888 res!99843) b!120589))

(assert (= (and b!120589 res!99842) b!120590))

(declare-fun m!182311 () Bool)

(assert (=> d!38888 m!182311))

(declare-fun m!182313 () Bool)

(assert (=> d!38888 m!182313))

(assert (=> b!120451 d!38888))

(declare-fun lt!188357 () tuple2!10102)

(declare-fun b!120715 () Bool)

(declare-fun e!79046 () Bool)

(declare-fun lt!188352 () tuple2!10100)

(assert (=> b!120715 (= e!79046 (and (= (_2!5316 lt!188357) v!199) (= (_1!5316 lt!188357) (_2!5315 lt!188352))))))

(declare-fun lt!188342 () (_ BitVec 64))

(assert (=> b!120715 (= lt!188357 (readNLeastSignificantBitsLoopPure!0 (_1!5315 lt!188352) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188342))))

(declare-fun lt!188344 () Unit!7421)

(declare-fun lt!188354 () Unit!7421)

(assert (=> b!120715 (= lt!188344 lt!188354)))

(declare-fun lt!188359 () tuple2!10104)

(declare-fun lt!188345 () (_ BitVec 64))

(assert (=> b!120715 (validate_offset_bits!1 ((_ sign_extend 32) (size!2427 (buf!2858 (_2!5317 lt!188359)))) ((_ sign_extend 32) (currentByte!5537 (_2!5317 lt!187548))) ((_ sign_extend 32) (currentBit!5532 (_2!5317 lt!187548))) lt!188345)))

(assert (=> b!120715 (= lt!188354 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5317 lt!187548) (buf!2858 (_2!5317 lt!188359)) lt!188345))))

(declare-fun e!79041 () Bool)

(assert (=> b!120715 e!79041))

(declare-fun res!99945 () Bool)

(assert (=> b!120715 (=> (not res!99945) (not e!79041))))

(assert (=> b!120715 (= res!99945 (and (= (size!2427 (buf!2858 (_2!5317 lt!187548))) (size!2427 (buf!2858 (_2!5317 lt!188359)))) (bvsge lt!188345 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120715 (= lt!188345 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!120715 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!120715 (= lt!188342 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!120715 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!120715 (= lt!188352 (reader!0 (_2!5317 lt!187548) (_2!5317 lt!188359)))))

(declare-fun b!120716 () Bool)

(declare-fun res!99948 () Bool)

(assert (=> b!120716 (=> (not res!99948) (not e!79046))))

(declare-fun lt!188347 () (_ BitVec 64))

(declare-fun lt!188351 () (_ BitVec 64))

(assert (=> b!120716 (= res!99948 (= (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!188359))) (currentByte!5537 (_2!5317 lt!188359)) (currentBit!5532 (_2!5317 lt!188359))) (bvadd lt!188351 lt!188347)))))

(assert (=> b!120716 (or (not (= (bvand lt!188351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!188347 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!188351 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!188351 lt!188347) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120716 (= lt!188347 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!120716 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!120716 (= lt!188351 (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!187548))) (currentByte!5537 (_2!5317 lt!187548)) (currentBit!5532 (_2!5317 lt!187548))))))

(declare-fun b!120717 () Bool)

(declare-fun res!99943 () Bool)

(assert (=> b!120717 (=> (not res!99943) (not e!79046))))

(assert (=> b!120717 (= res!99943 (isPrefixOf!0 (_2!5317 lt!187548) (_2!5317 lt!188359)))))

(declare-fun d!38890 () Bool)

(assert (=> d!38890 e!79046))

(declare-fun res!99944 () Bool)

(assert (=> d!38890 (=> (not res!99944) (not e!79046))))

(assert (=> d!38890 (= res!99944 (= (size!2427 (buf!2858 (_2!5317 lt!187548))) (size!2427 (buf!2858 (_2!5317 lt!188359)))))))

(declare-fun e!79045 () tuple2!10104)

(assert (=> d!38890 (= lt!188359 e!79045)))

(declare-fun c!7265 () Bool)

(assert (=> d!38890 (= c!7265 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!38890 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!38890 (= (appendNLeastSignificantBitsLoop!0 (_2!5317 lt!187548) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!188359)))

(declare-fun b!120718 () Bool)

(assert (=> b!120718 (= e!79041 (validate_offset_bits!1 ((_ sign_extend 32) (size!2427 (buf!2858 (_2!5317 lt!187548)))) ((_ sign_extend 32) (currentByte!5537 (_2!5317 lt!187548))) ((_ sign_extend 32) (currentBit!5532 (_2!5317 lt!187548))) lt!188345))))

(declare-fun b!120719 () Bool)

(declare-fun lt!188327 () Unit!7421)

(assert (=> b!120719 (= e!79045 (tuple2!10105 lt!188327 (_2!5317 lt!187548)))))

(declare-fun lt!188326 () BitStream!4328)

(assert (=> b!120719 (= lt!188326 (_2!5317 lt!187548))))

(assert (=> b!120719 (= lt!188327 (lemmaIsPrefixRefl!0 lt!188326))))

(declare-fun call!1579 () Bool)

(assert (=> b!120719 call!1579))

(declare-fun b!120720 () Bool)

(declare-fun lt!188332 () tuple2!10106)

(declare-fun lt!188328 () tuple2!10104)

(assert (=> b!120720 (= lt!188332 (readBitPure!0 (readerFrom!0 (_2!5317 lt!188328) (currentBit!5532 (_2!5317 lt!187548)) (currentByte!5537 (_2!5317 lt!187548)))))))

(declare-fun res!99947 () Bool)

(declare-fun lt!188362 () Bool)

(assert (=> b!120720 (= res!99947 (and (= (_2!5318 lt!188332) lt!188362) (= (_1!5318 lt!188332) (_2!5317 lt!188328))))))

(declare-fun e!79043 () Bool)

(assert (=> b!120720 (=> (not res!99947) (not e!79043))))

(declare-fun e!79047 () Bool)

(assert (=> b!120720 (= e!79047 e!79043)))

(declare-fun b!120721 () Bool)

(declare-fun res!99942 () Bool)

(assert (=> b!120721 (= res!99942 call!1579)))

(assert (=> b!120721 (=> (not res!99942) (not e!79047))))

(declare-fun bm!1576 () Bool)

(assert (=> bm!1576 (= call!1579 (isPrefixOf!0 (ite c!7265 (_2!5317 lt!187548) lt!188326) (ite c!7265 (_2!5317 lt!188328) lt!188326)))))

(declare-fun b!120722 () Bool)

(declare-fun res!99949 () Bool)

(assert (=> b!120722 (= res!99949 (= (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!188328))) (currentByte!5537 (_2!5317 lt!188328)) (currentBit!5532 (_2!5317 lt!188328))) (bvadd (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!187548))) (currentByte!5537 (_2!5317 lt!187548)) (currentBit!5532 (_2!5317 lt!187548))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!120722 (=> (not res!99949) (not e!79047))))

(declare-fun b!120723 () Bool)

(declare-fun lt!188364 () tuple2!10104)

(declare-fun Unit!7439 () Unit!7421)

(assert (=> b!120723 (= e!79045 (tuple2!10105 Unit!7439 (_2!5317 lt!188364)))))

(assert (=> b!120723 (= lt!188362 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120723 (= lt!188328 (appendBit!0 (_2!5317 lt!187548) lt!188362))))

(declare-fun res!99946 () Bool)

(assert (=> b!120723 (= res!99946 (= (size!2427 (buf!2858 (_2!5317 lt!187548))) (size!2427 (buf!2858 (_2!5317 lt!188328)))))))

(assert (=> b!120723 (=> (not res!99946) (not e!79047))))

(assert (=> b!120723 e!79047))

(declare-fun lt!188336 () tuple2!10104)

(assert (=> b!120723 (= lt!188336 lt!188328)))

(assert (=> b!120723 (= lt!188364 (appendNLeastSignificantBitsLoop!0 (_2!5317 lt!188336) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!188369 () Unit!7421)

(assert (=> b!120723 (= lt!188369 (lemmaIsPrefixTransitive!0 (_2!5317 lt!187548) (_2!5317 lt!188336) (_2!5317 lt!188364)))))

(assert (=> b!120723 (isPrefixOf!0 (_2!5317 lt!187548) (_2!5317 lt!188364))))

(declare-fun lt!188365 () Unit!7421)

(assert (=> b!120723 (= lt!188365 lt!188369)))

(assert (=> b!120723 (invariant!0 (currentBit!5532 (_2!5317 lt!187548)) (currentByte!5537 (_2!5317 lt!187548)) (size!2427 (buf!2858 (_2!5317 lt!188336))))))

(declare-fun lt!188370 () BitStream!4328)

(assert (=> b!120723 (= lt!188370 (BitStream!4329 (buf!2858 (_2!5317 lt!188336)) (currentByte!5537 (_2!5317 lt!187548)) (currentBit!5532 (_2!5317 lt!187548))))))

(assert (=> b!120723 (invariant!0 (currentBit!5532 lt!188370) (currentByte!5537 lt!188370) (size!2427 (buf!2858 (_2!5317 lt!188364))))))

(declare-fun lt!188337 () BitStream!4328)

(assert (=> b!120723 (= lt!188337 (BitStream!4329 (buf!2858 (_2!5317 lt!188364)) (currentByte!5537 lt!188370) (currentBit!5532 lt!188370)))))

(declare-fun lt!188329 () tuple2!10106)

(assert (=> b!120723 (= lt!188329 (readBitPure!0 lt!188370))))

(declare-fun lt!188367 () tuple2!10106)

(assert (=> b!120723 (= lt!188367 (readBitPure!0 lt!188337))))

(declare-fun lt!188355 () Unit!7421)

(assert (=> b!120723 (= lt!188355 (readBitPrefixLemma!0 lt!188370 (_2!5317 lt!188364)))))

(declare-fun res!99941 () Bool)

(assert (=> b!120723 (= res!99941 (= (bitIndex!0 (size!2427 (buf!2858 (_1!5318 lt!188329))) (currentByte!5537 (_1!5318 lt!188329)) (currentBit!5532 (_1!5318 lt!188329))) (bitIndex!0 (size!2427 (buf!2858 (_1!5318 lt!188367))) (currentByte!5537 (_1!5318 lt!188367)) (currentBit!5532 (_1!5318 lt!188367)))))))

(declare-fun e!79042 () Bool)

(assert (=> b!120723 (=> (not res!99941) (not e!79042))))

(assert (=> b!120723 e!79042))

(declare-fun lt!188358 () Unit!7421)

(assert (=> b!120723 (= lt!188358 lt!188355)))

(declare-fun lt!188360 () tuple2!10100)

(assert (=> b!120723 (= lt!188360 (reader!0 (_2!5317 lt!187548) (_2!5317 lt!188364)))))

(declare-fun lt!188343 () tuple2!10100)

(assert (=> b!120723 (= lt!188343 (reader!0 (_2!5317 lt!188336) (_2!5317 lt!188364)))))

(declare-fun lt!188348 () tuple2!10106)

(assert (=> b!120723 (= lt!188348 (readBitPure!0 (_1!5315 lt!188360)))))

(assert (=> b!120723 (= (_2!5318 lt!188348) lt!188362)))

(declare-fun lt!188349 () Unit!7421)

(declare-fun Unit!7441 () Unit!7421)

(assert (=> b!120723 (= lt!188349 Unit!7441)))

(declare-fun lt!188368 () (_ BitVec 64))

(assert (=> b!120723 (= lt!188368 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!188353 () (_ BitVec 64))

(assert (=> b!120723 (= lt!188353 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!188334 () Unit!7421)

(assert (=> b!120723 (= lt!188334 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5317 lt!187548) (buf!2858 (_2!5317 lt!188364)) lt!188353))))

(assert (=> b!120723 (validate_offset_bits!1 ((_ sign_extend 32) (size!2427 (buf!2858 (_2!5317 lt!188364)))) ((_ sign_extend 32) (currentByte!5537 (_2!5317 lt!187548))) ((_ sign_extend 32) (currentBit!5532 (_2!5317 lt!187548))) lt!188353)))

(declare-fun lt!188361 () Unit!7421)

(assert (=> b!120723 (= lt!188361 lt!188334)))

(declare-fun lt!188331 () tuple2!10102)

(assert (=> b!120723 (= lt!188331 (readNLeastSignificantBitsLoopPure!0 (_1!5315 lt!188360) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188368))))

(declare-fun lt!188350 () (_ BitVec 64))

(assert (=> b!120723 (= lt!188350 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!188338 () Unit!7421)

(assert (=> b!120723 (= lt!188338 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5317 lt!188336) (buf!2858 (_2!5317 lt!188364)) lt!188350))))

(assert (=> b!120723 (validate_offset_bits!1 ((_ sign_extend 32) (size!2427 (buf!2858 (_2!5317 lt!188364)))) ((_ sign_extend 32) (currentByte!5537 (_2!5317 lt!188336))) ((_ sign_extend 32) (currentBit!5532 (_2!5317 lt!188336))) lt!188350)))

(declare-fun lt!188339 () Unit!7421)

(assert (=> b!120723 (= lt!188339 lt!188338)))

(declare-fun lt!188333 () tuple2!10102)

(assert (=> b!120723 (= lt!188333 (readNLeastSignificantBitsLoopPure!0 (_1!5315 lt!188343) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!188368 (ite (_2!5318 lt!188348) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!188340 () tuple2!10102)

(assert (=> b!120723 (= lt!188340 (readNLeastSignificantBitsLoopPure!0 (_1!5315 lt!188360) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188368))))

(declare-fun c!7266 () Bool)

(assert (=> b!120723 (= c!7266 (_2!5318 (readBitPure!0 (_1!5315 lt!188360))))))

(declare-fun e!79044 () (_ BitVec 64))

(declare-fun lt!188330 () tuple2!10102)

(assert (=> b!120723 (= lt!188330 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5315 lt!188360) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!188368 e!79044)))))

(declare-fun lt!188366 () Unit!7421)

(assert (=> b!120723 (= lt!188366 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5315 lt!188360) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!188368))))

(assert (=> b!120723 (and (= (_2!5316 lt!188340) (_2!5316 lt!188330)) (= (_1!5316 lt!188340) (_1!5316 lt!188330)))))

(declare-fun lt!188341 () Unit!7421)

(assert (=> b!120723 (= lt!188341 lt!188366)))

(assert (=> b!120723 (= (_1!5315 lt!188360) (withMovedBitIndex!0 (_2!5315 lt!188360) (bvsub (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!187548))) (currentByte!5537 (_2!5317 lt!187548)) (currentBit!5532 (_2!5317 lt!187548))) (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!188364))) (currentByte!5537 (_2!5317 lt!188364)) (currentBit!5532 (_2!5317 lt!188364))))))))

(declare-fun lt!188346 () Unit!7421)

(declare-fun Unit!7442 () Unit!7421)

(assert (=> b!120723 (= lt!188346 Unit!7442)))

(assert (=> b!120723 (= (_1!5315 lt!188343) (withMovedBitIndex!0 (_2!5315 lt!188343) (bvsub (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!188336))) (currentByte!5537 (_2!5317 lt!188336)) (currentBit!5532 (_2!5317 lt!188336))) (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!188364))) (currentByte!5537 (_2!5317 lt!188364)) (currentBit!5532 (_2!5317 lt!188364))))))))

(declare-fun lt!188335 () Unit!7421)

(declare-fun Unit!7443 () Unit!7421)

(assert (=> b!120723 (= lt!188335 Unit!7443)))

(assert (=> b!120723 (= (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!187548))) (currentByte!5537 (_2!5317 lt!187548)) (currentBit!5532 (_2!5317 lt!187548))) (bvsub (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!188336))) (currentByte!5537 (_2!5317 lt!188336)) (currentBit!5532 (_2!5317 lt!188336))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!188356 () Unit!7421)

(declare-fun Unit!7444 () Unit!7421)

(assert (=> b!120723 (= lt!188356 Unit!7444)))

(assert (=> b!120723 (= (_2!5316 lt!188331) (_2!5316 lt!188333))))

(declare-fun lt!188363 () Unit!7421)

(declare-fun Unit!7445 () Unit!7421)

(assert (=> b!120723 (= lt!188363 Unit!7445)))

(assert (=> b!120723 (= (_1!5316 lt!188331) (_2!5315 lt!188360))))

(declare-fun b!120724 () Bool)

(assert (=> b!120724 (= e!79042 (= (_2!5318 lt!188329) (_2!5318 lt!188367)))))

(declare-fun b!120725 () Bool)

(assert (=> b!120725 (= e!79044 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!120726 () Bool)

(assert (=> b!120726 (= e!79044 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!120727 () Bool)

(assert (=> b!120727 (= e!79043 (= (bitIndex!0 (size!2427 (buf!2858 (_1!5318 lt!188332))) (currentByte!5537 (_1!5318 lt!188332)) (currentBit!5532 (_1!5318 lt!188332))) (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!188328))) (currentByte!5537 (_2!5317 lt!188328)) (currentBit!5532 (_2!5317 lt!188328)))))))

(assert (= (and d!38890 c!7265) b!120723))

(assert (= (and d!38890 (not c!7265)) b!120719))

(assert (= (and b!120723 res!99946) b!120722))

(assert (= (and b!120722 res!99949) b!120721))

(assert (= (and b!120721 res!99942) b!120720))

(assert (= (and b!120720 res!99947) b!120727))

(assert (= (and b!120723 res!99941) b!120724))

(assert (= (and b!120723 c!7266) b!120725))

(assert (= (and b!120723 (not c!7266)) b!120726))

(assert (= (or b!120721 b!120719) bm!1576))

(assert (= (and d!38890 res!99944) b!120716))

(assert (= (and b!120716 res!99948) b!120717))

(assert (= (and b!120717 res!99943) b!120715))

(assert (= (and b!120715 res!99945) b!120718))

(declare-fun m!182477 () Bool)

(assert (=> b!120717 m!182477))

(declare-fun m!182479 () Bool)

(assert (=> b!120720 m!182479))

(assert (=> b!120720 m!182479))

(declare-fun m!182481 () Bool)

(assert (=> b!120720 m!182481))

(declare-fun m!182483 () Bool)

(assert (=> bm!1576 m!182483))

(declare-fun m!182485 () Bool)

(assert (=> b!120727 m!182485))

(declare-fun m!182487 () Bool)

(assert (=> b!120727 m!182487))

(assert (=> b!120722 m!182487))

(assert (=> b!120722 m!182007))

(declare-fun m!182489 () Bool)

(assert (=> b!120723 m!182489))

(declare-fun m!182491 () Bool)

(assert (=> b!120723 m!182491))

(declare-fun m!182493 () Bool)

(assert (=> b!120723 m!182493))

(declare-fun m!182495 () Bool)

(assert (=> b!120723 m!182495))

(declare-fun m!182497 () Bool)

(assert (=> b!120723 m!182497))

(declare-fun m!182499 () Bool)

(assert (=> b!120723 m!182499))

(declare-fun m!182501 () Bool)

(assert (=> b!120723 m!182501))

(declare-fun m!182503 () Bool)

(assert (=> b!120723 m!182503))

(declare-fun m!182505 () Bool)

(assert (=> b!120723 m!182505))

(declare-fun m!182507 () Bool)

(assert (=> b!120723 m!182507))

(declare-fun m!182509 () Bool)

(assert (=> b!120723 m!182509))

(declare-fun m!182511 () Bool)

(assert (=> b!120723 m!182511))

(declare-fun m!182513 () Bool)

(assert (=> b!120723 m!182513))

(declare-fun m!182515 () Bool)

(assert (=> b!120723 m!182515))

(assert (=> b!120723 m!182499))

(declare-fun m!182517 () Bool)

(assert (=> b!120723 m!182517))

(declare-fun m!182519 () Bool)

(assert (=> b!120723 m!182519))

(declare-fun m!182521 () Bool)

(assert (=> b!120723 m!182521))

(assert (=> b!120723 m!182007))

(declare-fun m!182523 () Bool)

(assert (=> b!120723 m!182523))

(declare-fun m!182525 () Bool)

(assert (=> b!120723 m!182525))

(declare-fun m!182527 () Bool)

(assert (=> b!120723 m!182527))

(declare-fun m!182529 () Bool)

(assert (=> b!120723 m!182529))

(declare-fun m!182531 () Bool)

(assert (=> b!120723 m!182531))

(declare-fun m!182533 () Bool)

(assert (=> b!120723 m!182533))

(declare-fun m!182535 () Bool)

(assert (=> b!120723 m!182535))

(declare-fun m!182537 () Bool)

(assert (=> b!120723 m!182537))

(declare-fun m!182539 () Bool)

(assert (=> b!120723 m!182539))

(declare-fun m!182541 () Bool)

(assert (=> b!120723 m!182541))

(declare-fun m!182543 () Bool)

(assert (=> b!120723 m!182543))

(declare-fun m!182545 () Bool)

(assert (=> b!120719 m!182545))

(declare-fun m!182547 () Bool)

(assert (=> b!120715 m!182547))

(declare-fun m!182549 () Bool)

(assert (=> b!120715 m!182549))

(declare-fun m!182551 () Bool)

(assert (=> b!120715 m!182551))

(assert (=> b!120715 m!182503))

(declare-fun m!182553 () Bool)

(assert (=> b!120715 m!182553))

(declare-fun m!182555 () Bool)

(assert (=> b!120716 m!182555))

(assert (=> b!120716 m!182007))

(declare-fun m!182557 () Bool)

(assert (=> b!120718 m!182557))

(assert (=> b!120451 d!38890))

(declare-fun d!38946 () Bool)

(assert (=> d!38946 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2427 (buf!2858 (_2!5317 lt!187554)))) ((_ sign_extend 32) (currentByte!5537 thiss!1305)) ((_ sign_extend 32) (currentBit!5532 thiss!1305)) lt!187544) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2427 (buf!2858 (_2!5317 lt!187554)))) ((_ sign_extend 32) (currentByte!5537 thiss!1305)) ((_ sign_extend 32) (currentBit!5532 thiss!1305))) lt!187544))))

(declare-fun bs!9416 () Bool)

(assert (= bs!9416 d!38946))

(declare-fun m!182559 () Bool)

(assert (=> bs!9416 m!182559))

(assert (=> b!120451 d!38946))

(declare-fun d!38948 () Bool)

(declare-fun e!79057 () Bool)

(assert (=> d!38948 e!79057))

(declare-fun res!99961 () Bool)

(assert (=> d!38948 (=> (not res!99961) (not e!79057))))

(declare-fun lt!188424 () tuple2!10106)

(declare-fun lt!188427 () tuple2!10106)

(assert (=> d!38948 (= res!99961 (= (bitIndex!0 (size!2427 (buf!2858 (_1!5318 lt!188424))) (currentByte!5537 (_1!5318 lt!188424)) (currentBit!5532 (_1!5318 lt!188424))) (bitIndex!0 (size!2427 (buf!2858 (_1!5318 lt!188427))) (currentByte!5537 (_1!5318 lt!188427)) (currentBit!5532 (_1!5318 lt!188427)))))))

(declare-fun lt!188425 () Unit!7421)

(declare-fun lt!188426 () BitStream!4328)

(declare-fun choose!50 (BitStream!4328 BitStream!4328 BitStream!4328 tuple2!10106 tuple2!10106 BitStream!4328 Bool tuple2!10106 tuple2!10106 BitStream!4328 Bool) Unit!7421)

(assert (=> d!38948 (= lt!188425 (choose!50 lt!187552 (_2!5317 lt!187554) lt!188426 lt!188424 (tuple2!10107 (_1!5318 lt!188424) (_2!5318 lt!188424)) (_1!5318 lt!188424) (_2!5318 lt!188424) lt!188427 (tuple2!10107 (_1!5318 lt!188427) (_2!5318 lt!188427)) (_1!5318 lt!188427) (_2!5318 lt!188427)))))

(assert (=> d!38948 (= lt!188427 (readBitPure!0 lt!188426))))

(assert (=> d!38948 (= lt!188424 (readBitPure!0 lt!187552))))

(assert (=> d!38948 (= lt!188426 (BitStream!4329 (buf!2858 (_2!5317 lt!187554)) (currentByte!5537 lt!187552) (currentBit!5532 lt!187552)))))

(assert (=> d!38948 (invariant!0 (currentBit!5532 lt!187552) (currentByte!5537 lt!187552) (size!2427 (buf!2858 (_2!5317 lt!187554))))))

(assert (=> d!38948 (= (readBitPrefixLemma!0 lt!187552 (_2!5317 lt!187554)) lt!188425)))

(declare-fun b!120743 () Bool)

(assert (=> b!120743 (= e!79057 (= (_2!5318 lt!188424) (_2!5318 lt!188427)))))

(assert (= (and d!38948 res!99961) b!120743))

(declare-fun m!182643 () Bool)

(assert (=> d!38948 m!182643))

(declare-fun m!182645 () Bool)

(assert (=> d!38948 m!182645))

(declare-fun m!182647 () Bool)

(assert (=> d!38948 m!182647))

(declare-fun m!182649 () Bool)

(assert (=> d!38948 m!182649))

(declare-fun m!182651 () Bool)

(assert (=> d!38948 m!182651))

(assert (=> d!38948 m!182031))

(assert (=> b!120451 d!38948))

(declare-fun d!38952 () Bool)

(declare-fun e!79058 () Bool)

(assert (=> d!38952 e!79058))

(declare-fun res!99963 () Bool)

(assert (=> d!38952 (=> (not res!99963) (not e!79058))))

(declare-fun lt!188430 () (_ BitVec 64))

(declare-fun lt!188433 () (_ BitVec 64))

(declare-fun lt!188431 () (_ BitVec 64))

(assert (=> d!38952 (= res!99963 (= lt!188431 (bvsub lt!188433 lt!188430)))))

(assert (=> d!38952 (or (= (bvand lt!188433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!188430 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!188433 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!188433 lt!188430) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38952 (= lt!188430 (remainingBits!0 ((_ sign_extend 32) (size!2427 (buf!2858 (_1!5318 lt!187533)))) ((_ sign_extend 32) (currentByte!5537 (_1!5318 lt!187533))) ((_ sign_extend 32) (currentBit!5532 (_1!5318 lt!187533)))))))

(declare-fun lt!188432 () (_ BitVec 64))

(declare-fun lt!188429 () (_ BitVec 64))

(assert (=> d!38952 (= lt!188433 (bvmul lt!188432 lt!188429))))

(assert (=> d!38952 (or (= lt!188432 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!188429 (bvsdiv (bvmul lt!188432 lt!188429) lt!188432)))))

(assert (=> d!38952 (= lt!188429 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38952 (= lt!188432 ((_ sign_extend 32) (size!2427 (buf!2858 (_1!5318 lt!187533)))))))

(assert (=> d!38952 (= lt!188431 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5537 (_1!5318 lt!187533))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5532 (_1!5318 lt!187533)))))))

(assert (=> d!38952 (invariant!0 (currentBit!5532 (_1!5318 lt!187533)) (currentByte!5537 (_1!5318 lt!187533)) (size!2427 (buf!2858 (_1!5318 lt!187533))))))

(assert (=> d!38952 (= (bitIndex!0 (size!2427 (buf!2858 (_1!5318 lt!187533))) (currentByte!5537 (_1!5318 lt!187533)) (currentBit!5532 (_1!5318 lt!187533))) lt!188431)))

(declare-fun b!120744 () Bool)

(declare-fun res!99962 () Bool)

(assert (=> b!120744 (=> (not res!99962) (not e!79058))))

(assert (=> b!120744 (= res!99962 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!188431))))

(declare-fun b!120745 () Bool)

(declare-fun lt!188428 () (_ BitVec 64))

(assert (=> b!120745 (= e!79058 (bvsle lt!188431 (bvmul lt!188428 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!120745 (or (= lt!188428 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!188428 #b0000000000000000000000000000000000000000000000000000000000001000) lt!188428)))))

(assert (=> b!120745 (= lt!188428 ((_ sign_extend 32) (size!2427 (buf!2858 (_1!5318 lt!187533)))))))

(assert (= (and d!38952 res!99963) b!120744))

(assert (= (and b!120744 res!99962) b!120745))

(declare-fun m!182653 () Bool)

(assert (=> d!38952 m!182653))

(declare-fun m!182655 () Bool)

(assert (=> d!38952 m!182655))

(assert (=> b!120451 d!38952))

(declare-fun d!38954 () Bool)

(declare-fun lt!188434 () tuple2!10114)

(assert (=> d!38954 (= lt!188434 (readBit!0 (BitStream!4329 (buf!2858 (_2!5317 lt!187554)) (currentByte!5537 thiss!1305) (currentBit!5532 thiss!1305))))))

(assert (=> d!38954 (= (readBitPure!0 (BitStream!4329 (buf!2858 (_2!5317 lt!187554)) (currentByte!5537 thiss!1305) (currentBit!5532 thiss!1305))) (tuple2!10107 (_2!5322 lt!188434) (_1!5322 lt!188434)))))

(declare-fun bs!9417 () Bool)

(assert (= bs!9417 d!38954))

(declare-fun m!182657 () Bool)

(assert (=> bs!9417 m!182657))

(assert (=> b!120451 d!38954))

(declare-fun d!38956 () Bool)

(declare-fun lt!188435 () tuple2!10114)

(assert (=> d!38956 (= lt!188435 (readBit!0 lt!187552))))

(assert (=> d!38956 (= (readBitPure!0 lt!187552) (tuple2!10107 (_2!5322 lt!188435) (_1!5322 lt!188435)))))

(declare-fun bs!9418 () Bool)

(assert (= bs!9418 d!38956))

(declare-fun m!182659 () Bool)

(assert (=> bs!9418 m!182659))

(assert (=> b!120451 d!38956))

(declare-fun d!38958 () Bool)

(assert (=> d!38958 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2427 (buf!2858 (_2!5317 lt!187554)))) ((_ sign_extend 32) (currentByte!5537 (_2!5317 lt!187548))) ((_ sign_extend 32) (currentBit!5532 (_2!5317 lt!187548))) lt!187545) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2427 (buf!2858 (_2!5317 lt!187554)))) ((_ sign_extend 32) (currentByte!5537 (_2!5317 lt!187548))) ((_ sign_extend 32) (currentBit!5532 (_2!5317 lt!187548)))) lt!187545))))

(declare-fun bs!9419 () Bool)

(assert (= bs!9419 d!38958))

(declare-fun m!182661 () Bool)

(assert (=> bs!9419 m!182661))

(assert (=> b!120451 d!38958))

(declare-fun b!120771 () Bool)

(declare-fun e!79072 () Bool)

(declare-fun lt!188483 () tuple2!10106)

(declare-fun lt!188486 () tuple2!10104)

(assert (=> b!120771 (= e!79072 (= (bitIndex!0 (size!2427 (buf!2858 (_1!5318 lt!188483))) (currentByte!5537 (_1!5318 lt!188483)) (currentBit!5532 (_1!5318 lt!188483))) (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!188486))) (currentByte!5537 (_2!5317 lt!188486)) (currentBit!5532 (_2!5317 lt!188486)))))))

(declare-fun b!120769 () Bool)

(declare-fun res!99986 () Bool)

(declare-fun e!79071 () Bool)

(assert (=> b!120769 (=> (not res!99986) (not e!79071))))

(assert (=> b!120769 (= res!99986 (isPrefixOf!0 thiss!1305 (_2!5317 lt!188486)))))

(declare-fun b!120768 () Bool)

(declare-fun res!99983 () Bool)

(assert (=> b!120768 (=> (not res!99983) (not e!79071))))

(declare-fun lt!188484 () (_ BitVec 64))

(declare-fun lt!188485 () (_ BitVec 64))

(assert (=> b!120768 (= res!99983 (= (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!188486))) (currentByte!5537 (_2!5317 lt!188486)) (currentBit!5532 (_2!5317 lt!188486))) (bvadd lt!188484 lt!188485)))))

(assert (=> b!120768 (or (not (= (bvand lt!188484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!188485 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!188484 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!188484 lt!188485) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120768 (= lt!188485 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!120768 (= lt!188484 (bitIndex!0 (size!2427 (buf!2858 thiss!1305)) (currentByte!5537 thiss!1305) (currentBit!5532 thiss!1305)))))

(declare-fun b!120770 () Bool)

(assert (=> b!120770 (= e!79071 e!79072)))

(declare-fun res!99985 () Bool)

(assert (=> b!120770 (=> (not res!99985) (not e!79072))))

(assert (=> b!120770 (= res!99985 (and (= (_2!5318 lt!188483) lt!187556) (= (_1!5318 lt!188483) (_2!5317 lt!188486))))))

(assert (=> b!120770 (= lt!188483 (readBitPure!0 (readerFrom!0 (_2!5317 lt!188486) (currentBit!5532 thiss!1305) (currentByte!5537 thiss!1305))))))

(declare-fun d!38960 () Bool)

(assert (=> d!38960 e!79071))

(declare-fun res!99984 () Bool)

(assert (=> d!38960 (=> (not res!99984) (not e!79071))))

(assert (=> d!38960 (= res!99984 (= (size!2427 (buf!2858 thiss!1305)) (size!2427 (buf!2858 (_2!5317 lt!188486)))))))

(declare-fun choose!16 (BitStream!4328 Bool) tuple2!10104)

(assert (=> d!38960 (= lt!188486 (choose!16 thiss!1305 lt!187556))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!38960 (validate_offset_bit!0 ((_ sign_extend 32) (size!2427 (buf!2858 thiss!1305))) ((_ sign_extend 32) (currentByte!5537 thiss!1305)) ((_ sign_extend 32) (currentBit!5532 thiss!1305)))))

(assert (=> d!38960 (= (appendBit!0 thiss!1305 lt!187556) lt!188486)))

(assert (= (and d!38960 res!99984) b!120768))

(assert (= (and b!120768 res!99983) b!120769))

(assert (= (and b!120769 res!99986) b!120770))

(assert (= (and b!120770 res!99985) b!120771))

(declare-fun m!182709 () Bool)

(assert (=> b!120768 m!182709))

(assert (=> b!120768 m!182009))

(declare-fun m!182711 () Bool)

(assert (=> d!38960 m!182711))

(declare-fun m!182713 () Bool)

(assert (=> d!38960 m!182713))

(declare-fun m!182715 () Bool)

(assert (=> b!120770 m!182715))

(assert (=> b!120770 m!182715))

(declare-fun m!182717 () Bool)

(assert (=> b!120770 m!182717))

(declare-fun m!182719 () Bool)

(assert (=> b!120769 m!182719))

(declare-fun m!182721 () Bool)

(assert (=> b!120771 m!182721))

(assert (=> b!120771 m!182709))

(assert (=> b!120451 d!38960))

(declare-fun d!38972 () Bool)

(assert (=> d!38972 (isPrefixOf!0 thiss!1305 (_2!5317 lt!187554))))

(declare-fun lt!188491 () Unit!7421)

(declare-fun choose!30 (BitStream!4328 BitStream!4328 BitStream!4328) Unit!7421)

(assert (=> d!38972 (= lt!188491 (choose!30 thiss!1305 (_2!5317 lt!187548) (_2!5317 lt!187554)))))

(assert (=> d!38972 (isPrefixOf!0 thiss!1305 (_2!5317 lt!187548))))

(assert (=> d!38972 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5317 lt!187548) (_2!5317 lt!187554)) lt!188491)))

(declare-fun bs!9421 () Bool)

(assert (= bs!9421 d!38972))

(assert (=> bs!9421 m!182023))

(declare-fun m!182723 () Bool)

(assert (=> bs!9421 m!182723))

(assert (=> bs!9421 m!182005))

(assert (=> b!120451 d!38972))

(declare-fun d!38974 () Bool)

(assert (=> d!38974 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!120451 d!38974))

(declare-fun lt!188498 () tuple2!10116)

(declare-fun d!38976 () Bool)

(assert (=> d!38976 (= lt!188498 (readNLeastSignificantBitsLoop!0 (_1!5315 lt!187534) nBits!396 i!615 lt!187557))))

(assert (=> d!38976 (= (readNLeastSignificantBitsLoopPure!0 (_1!5315 lt!187534) nBits!396 i!615 lt!187557) (tuple2!10103 (_2!5323 lt!188498) (_1!5323 lt!188498)))))

(declare-fun bs!9422 () Bool)

(assert (= bs!9422 d!38976))

(declare-fun m!182725 () Bool)

(assert (=> bs!9422 m!182725))

(assert (=> b!120451 d!38976))

(declare-fun b!120781 () Bool)

(declare-fun e!79077 () Unit!7421)

(declare-fun Unit!7446 () Unit!7421)

(assert (=> b!120781 (= e!79077 Unit!7446)))

(declare-fun lt!188510 () (_ BitVec 64))

(declare-fun b!120782 () Bool)

(declare-fun lt!188499 () tuple2!10100)

(declare-fun e!79078 () Bool)

(declare-fun lt!188503 () (_ BitVec 64))

(assert (=> b!120782 (= e!79078 (= (_1!5315 lt!188499) (withMovedBitIndex!0 (_2!5315 lt!188499) (bvsub lt!188510 lt!188503))))))

(assert (=> b!120782 (or (= (bvand lt!188510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!188503 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!188510 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!188510 lt!188503) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!120782 (= lt!188503 (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!187554))) (currentByte!5537 (_2!5317 lt!187554)) (currentBit!5532 (_2!5317 lt!187554))))))

(assert (=> b!120782 (= lt!188510 (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!187548))) (currentByte!5537 (_2!5317 lt!187548)) (currentBit!5532 (_2!5317 lt!187548))))))

(declare-fun d!38978 () Bool)

(assert (=> d!38978 e!79078))

(declare-fun res!99995 () Bool)

(assert (=> d!38978 (=> (not res!99995) (not e!79078))))

(assert (=> d!38978 (= res!99995 (isPrefixOf!0 (_1!5315 lt!188499) (_2!5315 lt!188499)))))

(declare-fun lt!188504 () BitStream!4328)

(assert (=> d!38978 (= lt!188499 (tuple2!10101 lt!188504 (_2!5317 lt!187554)))))

(declare-fun lt!188509 () Unit!7421)

(declare-fun lt!188511 () Unit!7421)

(assert (=> d!38978 (= lt!188509 lt!188511)))

(assert (=> d!38978 (isPrefixOf!0 lt!188504 (_2!5317 lt!187554))))

(assert (=> d!38978 (= lt!188511 (lemmaIsPrefixTransitive!0 lt!188504 (_2!5317 lt!187554) (_2!5317 lt!187554)))))

(declare-fun lt!188517 () Unit!7421)

(declare-fun lt!188508 () Unit!7421)

(assert (=> d!38978 (= lt!188517 lt!188508)))

(assert (=> d!38978 (isPrefixOf!0 lt!188504 (_2!5317 lt!187554))))

(assert (=> d!38978 (= lt!188508 (lemmaIsPrefixTransitive!0 lt!188504 (_2!5317 lt!187548) (_2!5317 lt!187554)))))

(declare-fun lt!188515 () Unit!7421)

(assert (=> d!38978 (= lt!188515 e!79077)))

(declare-fun c!7270 () Bool)

(assert (=> d!38978 (= c!7270 (not (= (size!2427 (buf!2858 (_2!5317 lt!187548))) #b00000000000000000000000000000000)))))

(declare-fun lt!188516 () Unit!7421)

(declare-fun lt!188518 () Unit!7421)

(assert (=> d!38978 (= lt!188516 lt!188518)))

(assert (=> d!38978 (isPrefixOf!0 (_2!5317 lt!187554) (_2!5317 lt!187554))))

(assert (=> d!38978 (= lt!188518 (lemmaIsPrefixRefl!0 (_2!5317 lt!187554)))))

(declare-fun lt!188501 () Unit!7421)

(declare-fun lt!188502 () Unit!7421)

(assert (=> d!38978 (= lt!188501 lt!188502)))

(assert (=> d!38978 (= lt!188502 (lemmaIsPrefixRefl!0 (_2!5317 lt!187554)))))

(declare-fun lt!188507 () Unit!7421)

(declare-fun lt!188505 () Unit!7421)

(assert (=> d!38978 (= lt!188507 lt!188505)))

(assert (=> d!38978 (isPrefixOf!0 lt!188504 lt!188504)))

(assert (=> d!38978 (= lt!188505 (lemmaIsPrefixRefl!0 lt!188504))))

(declare-fun lt!188506 () Unit!7421)

(declare-fun lt!188512 () Unit!7421)

(assert (=> d!38978 (= lt!188506 lt!188512)))

(assert (=> d!38978 (isPrefixOf!0 (_2!5317 lt!187548) (_2!5317 lt!187548))))

(assert (=> d!38978 (= lt!188512 (lemmaIsPrefixRefl!0 (_2!5317 lt!187548)))))

(assert (=> d!38978 (= lt!188504 (BitStream!4329 (buf!2858 (_2!5317 lt!187554)) (currentByte!5537 (_2!5317 lt!187548)) (currentBit!5532 (_2!5317 lt!187548))))))

(assert (=> d!38978 (isPrefixOf!0 (_2!5317 lt!187548) (_2!5317 lt!187554))))

(assert (=> d!38978 (= (reader!0 (_2!5317 lt!187548) (_2!5317 lt!187554)) lt!188499)))

(declare-fun b!120783 () Bool)

(declare-fun res!99997 () Bool)

(assert (=> b!120783 (=> (not res!99997) (not e!79078))))

(assert (=> b!120783 (= res!99997 (isPrefixOf!0 (_1!5315 lt!188499) (_2!5317 lt!187548)))))

(declare-fun b!120784 () Bool)

(declare-fun lt!188500 () Unit!7421)

(assert (=> b!120784 (= e!79077 lt!188500)))

(declare-fun lt!188514 () (_ BitVec 64))

(assert (=> b!120784 (= lt!188514 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!188513 () (_ BitVec 64))

(assert (=> b!120784 (= lt!188513 (bitIndex!0 (size!2427 (buf!2858 (_2!5317 lt!187548))) (currentByte!5537 (_2!5317 lt!187548)) (currentBit!5532 (_2!5317 lt!187548))))))

(assert (=> b!120784 (= lt!188500 (arrayBitRangesEqSymmetric!0 (buf!2858 (_2!5317 lt!187548)) (buf!2858 (_2!5317 lt!187554)) lt!188514 lt!188513))))

(assert (=> b!120784 (arrayBitRangesEq!0 (buf!2858 (_2!5317 lt!187554)) (buf!2858 (_2!5317 lt!187548)) lt!188514 lt!188513)))

(declare-fun b!120785 () Bool)

(declare-fun res!99996 () Bool)

(assert (=> b!120785 (=> (not res!99996) (not e!79078))))

(assert (=> b!120785 (= res!99996 (isPrefixOf!0 (_2!5315 lt!188499) (_2!5317 lt!187554)))))

(assert (= (and d!38978 c!7270) b!120784))

(assert (= (and d!38978 (not c!7270)) b!120781))

(assert (= (and d!38978 res!99995) b!120783))

(assert (= (and b!120783 res!99997) b!120785))

(assert (= (and b!120785 res!99996) b!120782))

(declare-fun m!182727 () Bool)

(assert (=> d!38978 m!182727))

(declare-fun m!182729 () Bool)

(assert (=> d!38978 m!182729))

(declare-fun m!182731 () Bool)

(assert (=> d!38978 m!182731))

(declare-fun m!182733 () Bool)

(assert (=> d!38978 m!182733))

(assert (=> d!38978 m!182285))

(assert (=> d!38978 m!182287))

(declare-fun m!182735 () Bool)

(assert (=> d!38978 m!182735))

(declare-fun m!182737 () Bool)

(assert (=> d!38978 m!182737))

(declare-fun m!182739 () Bool)

(assert (=> d!38978 m!182739))

(declare-fun m!182741 () Bool)

(assert (=> d!38978 m!182741))

(declare-fun m!182743 () Bool)

(assert (=> d!38978 m!182743))

(declare-fun m!182745 () Bool)

(assert (=> b!120785 m!182745))

(declare-fun m!182747 () Bool)

(assert (=> b!120783 m!182747))

(declare-fun m!182749 () Bool)

(assert (=> b!120782 m!182749))

(assert (=> b!120782 m!182069))

(assert (=> b!120782 m!182007))

(assert (=> b!120784 m!182007))

(declare-fun m!182751 () Bool)

(assert (=> b!120784 m!182751))

(declare-fun m!182753 () Bool)

(assert (=> b!120784 m!182753))

(assert (=> b!120451 d!38978))

(declare-fun lt!188519 () tuple2!10116)

(declare-fun d!38980 () Bool)

(assert (=> d!38980 (= lt!188519 (readNLeastSignificantBitsLoop!0 (_1!5315 lt!187538) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187551))))

(assert (=> d!38980 (= (readNLeastSignificantBitsLoopPure!0 (_1!5315 lt!187538) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!187551) (tuple2!10103 (_2!5323 lt!188519) (_1!5323 lt!188519)))))

(declare-fun bs!9423 () Bool)

(assert (= bs!9423 d!38980))

(declare-fun m!182755 () Bool)

(assert (=> bs!9423 m!182755))

(assert (=> b!120451 d!38980))

(declare-fun d!38982 () Bool)

(assert (=> d!38982 (validate_offset_bits!1 ((_ sign_extend 32) (size!2427 (buf!2858 (_2!5317 lt!187554)))) ((_ sign_extend 32) (currentByte!5537 (_2!5317 lt!187548))) ((_ sign_extend 32) (currentBit!5532 (_2!5317 lt!187548))) lt!187545)))

(declare-fun lt!188520 () Unit!7421)

(assert (=> d!38982 (= lt!188520 (choose!9 (_2!5317 lt!187548) (buf!2858 (_2!5317 lt!187554)) lt!187545 (BitStream!4329 (buf!2858 (_2!5317 lt!187554)) (currentByte!5537 (_2!5317 lt!187548)) (currentBit!5532 (_2!5317 lt!187548)))))))

(assert (=> d!38982 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5317 lt!187548) (buf!2858 (_2!5317 lt!187554)) lt!187545) lt!188520)))

(declare-fun bs!9424 () Bool)

(assert (= bs!9424 d!38982))

(assert (=> bs!9424 m!182033))

(declare-fun m!182757 () Bool)

(assert (=> bs!9424 m!182757))

(assert (=> b!120451 d!38982))

(push 1)

(assert (not d!38872))

(assert (not d!38958))

(assert (not b!120771))

(assert (not b!120783))

(assert (not b!120556))

(assert (not b!120716))

(assert (not d!38888))

(assert (not b!120782))

(assert (not d!38948))

(assert (not b!120586))

(assert (not b!120717))

(assert (not d!38972))

(assert (not d!38976))

(assert (not d!38882))

(assert (not b!120522))

(assert (not bm!1576))

(assert (not b!120719))

(assert (not b!120715))

(assert (not d!38878))

(assert (not d!38816))

(assert (not d!38828))

(assert (not d!38796))

(assert (not b!120722))

(assert (not b!120588))

(assert (not b!120533))

(assert (not d!38876))

(assert (not d!38952))

(assert (not b!120784))

(assert (not b!120720))

(assert (not b!120718))

(assert (not b!120785))

(assert (not d!38982))

(assert (not d!38856))

(assert (not d!38874))

(assert (not b!120558))

(assert (not d!38978))

(assert (not b!120770))

(assert (not d!38954))

(assert (not d!38980))

(assert (not b!120585))

(assert (not d!38866))

(assert (not d!38814))

(assert (not b!120587))

(assert (not b!120768))

(assert (not b!120723))

(assert (not d!38834))

(assert (not d!38946))

(assert (not d!38960))

(assert (not b!120520))

(assert (not d!38808))

(assert (not d!38886))

(assert (not d!38818))

(assert (not b!120727))

(assert (not d!38802))

(assert (not d!38956))

(assert (not b!120769))

(check-sat)

(pop 1)

(push 1)

(check-sat)

