; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24868 () Bool)

(assert start!24868)

(declare-fun b!125924 () Bool)

(declare-fun res!104315 () Bool)

(declare-fun e!82907 () Bool)

(assert (=> b!125924 (=> (not res!104315) (not e!82907))))

(declare-datatypes ((array!5688 0))(
  ( (array!5689 (arr!3173 (Array (_ BitVec 32) (_ BitVec 8))) (size!2574 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4472 0))(
  ( (BitStream!4473 (buf!2953 array!5688) (currentByte!5677 (_ BitVec 32)) (currentBit!5672 (_ BitVec 32))) )
))
(declare-fun thiss!1614 () BitStream!4472)

(declare-datatypes ((Unit!7748 0))(
  ( (Unit!7749) )
))
(declare-datatypes ((tuple2!10510 0))(
  ( (tuple2!10511 (_1!5534 Unit!7748) (_2!5534 BitStream!4472)) )
))
(declare-fun lt!196976 () tuple2!10510)

(declare-fun isPrefixOf!0 (BitStream!4472 BitStream!4472) Bool)

(assert (=> b!125924 (= res!104315 (isPrefixOf!0 thiss!1614 (_2!5534 lt!196976)))))

(declare-fun b!125926 () Bool)

(declare-fun e!82910 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!125926 (= e!82910 (not (invariant!0 (currentBit!5672 thiss!1614) (currentByte!5677 thiss!1614) (size!2574 (buf!2953 thiss!1614)))))))

(declare-fun e!82911 () Bool)

(assert (=> b!125926 e!82911))

(declare-fun res!104317 () Bool)

(assert (=> b!125926 (=> (not res!104317) (not e!82911))))

(assert (=> b!125926 (= res!104317 (= (size!2574 (buf!2953 thiss!1614)) (size!2574 (buf!2953 (_2!5534 lt!196976)))))))

(declare-fun noOfBytes!1 () (_ BitVec 32))

(declare-fun arr!227 () array!5688)

(declare-fun appendByteArrayLoop!0 (BitStream!4472 array!5688 (_ BitVec 32) (_ BitVec 32)) tuple2!10510)

(assert (=> b!125926 (= lt!196976 (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun b!125927 () Bool)

(declare-fun res!104320 () Bool)

(assert (=> b!125927 (=> (not res!104320) (not e!82910))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!125927 (= res!104320 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2574 (buf!2953 thiss!1614))) ((_ sign_extend 32) (currentByte!5677 thiss!1614)) ((_ sign_extend 32) (currentBit!5672 thiss!1614)) noOfBytes!1))))

(declare-fun b!125928 () Bool)

(declare-fun e!82909 () Bool)

(declare-datatypes ((tuple2!10512 0))(
  ( (tuple2!10513 (_1!5535 BitStream!4472) (_2!5535 array!5688)) )
))
(declare-fun lt!196977 () tuple2!10512)

(declare-fun arrayRangesEq!61 (array!5688 array!5688 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!125928 (= e!82909 (not (arrayRangesEq!61 arr!227 (_2!5535 lt!196977) #b00000000000000000000000000000000 noOfBytes!1)))))

(declare-fun b!125929 () Bool)

(assert (=> b!125929 (= e!82911 e!82907)))

(declare-fun res!104319 () Bool)

(assert (=> b!125929 (=> (not res!104319) (not e!82907))))

(declare-fun lt!196979 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!125929 (= res!104319 (= (bitIndex!0 (size!2574 (buf!2953 (_2!5534 lt!196976))) (currentByte!5677 (_2!5534 lt!196976)) (currentBit!5672 (_2!5534 lt!196976))) (bvadd (bitIndex!0 (size!2574 (buf!2953 thiss!1614)) (currentByte!5677 thiss!1614) (currentBit!5672 thiss!1614)) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!196979))))))

(assert (=> b!125929 (= lt!196979 ((_ sign_extend 32) noOfBytes!1))))

(declare-fun b!125930 () Bool)

(declare-fun e!82913 () Bool)

(declare-fun array_inv!2363 (array!5688) Bool)

(assert (=> b!125930 (= e!82913 (array_inv!2363 (buf!2953 thiss!1614)))))

(declare-fun res!104316 () Bool)

(assert (=> start!24868 (=> (not res!104316) (not e!82910))))

(assert (=> start!24868 (= res!104316 (and (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2574 arr!227))))))

(assert (=> start!24868 e!82910))

(assert (=> start!24868 true))

(assert (=> start!24868 (array_inv!2363 arr!227)))

(declare-fun inv!12 (BitStream!4472) Bool)

(assert (=> start!24868 (and (inv!12 thiss!1614) e!82913)))

(declare-fun b!125925 () Bool)

(assert (=> b!125925 (= e!82907 (not e!82909))))

(declare-fun res!104318 () Bool)

(assert (=> b!125925 (=> res!104318 e!82909)))

(declare-datatypes ((tuple2!10514 0))(
  ( (tuple2!10515 (_1!5536 BitStream!4472) (_2!5536 BitStream!4472)) )
))
(declare-fun lt!196978 () tuple2!10514)

(assert (=> b!125925 (= res!104318 (or (not (= (size!2574 (_2!5535 lt!196977)) (size!2574 arr!227))) (not (= (_1!5535 lt!196977) (_2!5536 lt!196978)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!4472 array!5688 (_ BitVec 32) (_ BitVec 32)) tuple2!10512)

(assert (=> b!125925 (= lt!196977 (readByteArrayLoopPure!0 (_1!5536 lt!196978) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!125925 (validate_offset_bits!1 ((_ sign_extend 32) (size!2574 (buf!2953 (_2!5534 lt!196976)))) ((_ sign_extend 32) (currentByte!5677 thiss!1614)) ((_ sign_extend 32) (currentBit!5672 thiss!1614)) lt!196979)))

(declare-fun lt!196975 () Unit!7748)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4472 array!5688 (_ BitVec 64)) Unit!7748)

(assert (=> b!125925 (= lt!196975 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2953 (_2!5534 lt!196976)) lt!196979))))

(declare-fun reader!0 (BitStream!4472 BitStream!4472) tuple2!10514)

(assert (=> b!125925 (= lt!196978 (reader!0 thiss!1614 (_2!5534 lt!196976)))))

(assert (= (and start!24868 res!104316) b!125927))

(assert (= (and b!125927 res!104320) b!125926))

(assert (= (and b!125926 res!104317) b!125929))

(assert (= (and b!125929 res!104319) b!125924))

(assert (= (and b!125924 res!104315) b!125925))

(assert (= (and b!125925 (not res!104318)) b!125928))

(assert (= start!24868 b!125930))

(declare-fun m!191369 () Bool)

(assert (=> b!125924 m!191369))

(declare-fun m!191371 () Bool)

(assert (=> start!24868 m!191371))

(declare-fun m!191373 () Bool)

(assert (=> start!24868 m!191373))

(declare-fun m!191375 () Bool)

(assert (=> b!125929 m!191375))

(declare-fun m!191377 () Bool)

(assert (=> b!125929 m!191377))

(declare-fun m!191379 () Bool)

(assert (=> b!125927 m!191379))

(declare-fun m!191381 () Bool)

(assert (=> b!125928 m!191381))

(declare-fun m!191383 () Bool)

(assert (=> b!125930 m!191383))

(declare-fun m!191385 () Bool)

(assert (=> b!125925 m!191385))

(declare-fun m!191387 () Bool)

(assert (=> b!125925 m!191387))

(declare-fun m!191389 () Bool)

(assert (=> b!125925 m!191389))

(declare-fun m!191391 () Bool)

(assert (=> b!125925 m!191391))

(declare-fun m!191393 () Bool)

(assert (=> b!125926 m!191393))

(declare-fun m!191395 () Bool)

(assert (=> b!125926 m!191395))

(push 1)

(assert (not start!24868))

(assert (not b!125929))

(assert (not b!125924))

(assert (not b!125925))

(assert (not b!125930))

(assert (not b!125928))

(assert (not b!125926))

(assert (not b!125927))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!40942 () Bool)

(assert (=> d!40942 (= (invariant!0 (currentBit!5672 thiss!1614) (currentByte!5677 thiss!1614) (size!2574 (buf!2953 thiss!1614))) (and (bvsge (currentBit!5672 thiss!1614) #b00000000000000000000000000000000) (bvslt (currentBit!5672 thiss!1614) #b00000000000000000000000000001000) (bvsge (currentByte!5677 thiss!1614) #b00000000000000000000000000000000) (or (bvslt (currentByte!5677 thiss!1614) (size!2574 (buf!2953 thiss!1614))) (and (= (currentBit!5672 thiss!1614) #b00000000000000000000000000000000) (= (currentByte!5677 thiss!1614) (size!2574 (buf!2953 thiss!1614)))))))))

(assert (=> b!125926 d!40942))

(declare-fun b!125980 () Bool)

(declare-fun res!104364 () Bool)

(declare-fun e!82946 () Bool)

(assert (=> b!125980 (=> (not res!104364) (not e!82946))))

(declare-fun lt!197078 () tuple2!10510)

(assert (=> b!125980 (= res!104364 (isPrefixOf!0 thiss!1614 (_2!5534 lt!197078)))))

(declare-fun e!82944 () Bool)

(declare-fun lt!197074 () tuple2!10512)

(declare-fun b!125981 () Bool)

(assert (=> b!125981 (= e!82944 (arrayRangesEq!61 arr!227 (_2!5535 lt!197074) #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun d!40944 () Bool)

(assert (=> d!40944 e!82946))

(declare-fun res!104367 () Bool)

(assert (=> d!40944 (=> (not res!104367) (not e!82946))))

(assert (=> d!40944 (= res!104367 (= (size!2574 (buf!2953 thiss!1614)) (size!2574 (buf!2953 (_2!5534 lt!197078)))))))

(declare-fun choose!64 (BitStream!4472 array!5688 (_ BitVec 32) (_ BitVec 32)) tuple2!10510)

(assert (=> d!40944 (= lt!197078 (choose!64 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!40944 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 noOfBytes!1) (bvsle noOfBytes!1 (size!2574 arr!227)))))

(assert (=> d!40944 (= (appendByteArrayLoop!0 thiss!1614 arr!227 #b00000000000000000000000000000000 noOfBytes!1) lt!197078)))

(declare-fun b!125982 () Bool)

(assert (=> b!125982 (= e!82946 e!82944)))

(declare-fun res!104366 () Bool)

(assert (=> b!125982 (=> (not res!104366) (not e!82944))))

(declare-fun lt!197070 () tuple2!10514)

(assert (=> b!125982 (= res!104366 (and (= (size!2574 (_2!5535 lt!197074)) (size!2574 arr!227)) (= (_1!5535 lt!197074) (_2!5536 lt!197070))))))

(assert (=> b!125982 (= lt!197074 (readByteArrayLoopPure!0 (_1!5536 lt!197070) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(declare-fun lt!197075 () Unit!7748)

(declare-fun lt!197073 () Unit!7748)

(assert (=> b!125982 (= lt!197075 lt!197073)))

(declare-fun lt!197072 () (_ BitVec 64))

(assert (=> b!125982 (validate_offset_bits!1 ((_ sign_extend 32) (size!2574 (buf!2953 (_2!5534 lt!197078)))) ((_ sign_extend 32) (currentByte!5677 thiss!1614)) ((_ sign_extend 32) (currentBit!5672 thiss!1614)) lt!197072)))

(assert (=> b!125982 (= lt!197073 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2953 (_2!5534 lt!197078)) lt!197072))))

(declare-fun e!82945 () Bool)

(assert (=> b!125982 e!82945))

(declare-fun res!104365 () Bool)

(assert (=> b!125982 (=> (not res!104365) (not e!82945))))

(assert (=> b!125982 (= res!104365 (and (= (size!2574 (buf!2953 thiss!1614)) (size!2574 (buf!2953 (_2!5534 lt!197078)))) (bvsge lt!197072 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!125982 (= lt!197072 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!125982 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!125982 (= lt!197070 (reader!0 thiss!1614 (_2!5534 lt!197078)))))

(declare-fun b!125983 () Bool)

(assert (=> b!125983 (= e!82945 (validate_offset_bits!1 ((_ sign_extend 32) (size!2574 (buf!2953 thiss!1614))) ((_ sign_extend 32) (currentByte!5677 thiss!1614)) ((_ sign_extend 32) (currentBit!5672 thiss!1614)) lt!197072))))

(declare-fun b!125984 () Bool)

(declare-fun res!104368 () Bool)

(assert (=> b!125984 (=> (not res!104368) (not e!82946))))

(declare-fun lt!197076 () (_ BitVec 64))

(declare-fun lt!197077 () (_ BitVec 64))

(assert (=> b!125984 (= res!104368 (= (bitIndex!0 (size!2574 (buf!2953 (_2!5534 lt!197078))) (currentByte!5677 (_2!5534 lt!197078)) (currentBit!5672 (_2!5534 lt!197078))) (bvadd lt!197076 lt!197077)))))

(assert (=> b!125984 (or (not (= (bvand lt!197076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197077 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!197076 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!197076 lt!197077) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!197071 () (_ BitVec 64))

(assert (=> b!125984 (= lt!197077 (bvmul lt!197071 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!125984 (or (= lt!197071 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!197071 #b0000000000000000000000000000000000000000000000000000000000001000) lt!197071)))))

(assert (=> b!125984 (= lt!197071 ((_ sign_extend 32) (bvsub noOfBytes!1 #b00000000000000000000000000000000)))))

(assert (=> b!125984 (or (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand #b00000000000000000000000000000000 #b10000000000000000000000000000000)) (= (bvand noOfBytes!1 #b10000000000000000000000000000000) (bvand (bvsub noOfBytes!1 #b00000000000000000000000000000000) #b10000000000000000000000000000000)))))

(assert (=> b!125984 (= lt!197076 (bitIndex!0 (size!2574 (buf!2953 thiss!1614)) (currentByte!5677 thiss!1614) (currentBit!5672 thiss!1614)))))

(assert (= (and d!40944 res!104367) b!125984))

(assert (= (and b!125984 res!104368) b!125980))

(assert (= (and b!125980 res!104364) b!125982))

(assert (= (and b!125982 res!104365) b!125983))

(assert (= (and b!125982 res!104366) b!125981))

(declare-fun m!191451 () Bool)

(assert (=> b!125980 m!191451))

(declare-fun m!191453 () Bool)

(assert (=> b!125982 m!191453))

(declare-fun m!191455 () Bool)

(assert (=> b!125982 m!191455))

(declare-fun m!191457 () Bool)

(assert (=> b!125982 m!191457))

(declare-fun m!191459 () Bool)

(assert (=> b!125982 m!191459))

(declare-fun m!191461 () Bool)

(assert (=> b!125984 m!191461))

(assert (=> b!125984 m!191377))

(declare-fun m!191463 () Bool)

(assert (=> b!125983 m!191463))

(declare-fun m!191465 () Bool)

(assert (=> b!125981 m!191465))

(declare-fun m!191467 () Bool)

(assert (=> d!40944 m!191467))

(assert (=> b!125926 d!40944))

(declare-fun d!40972 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!40972 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2574 (buf!2953 thiss!1614))) ((_ sign_extend 32) (currentByte!5677 thiss!1614)) ((_ sign_extend 32) (currentBit!5672 thiss!1614)) noOfBytes!1) (bvsle ((_ sign_extend 32) noOfBytes!1) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2574 (buf!2953 thiss!1614))) ((_ sign_extend 32) (currentByte!5677 thiss!1614)) ((_ sign_extend 32) (currentBit!5672 thiss!1614))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!9919 () Bool)

(assert (= bs!9919 d!40972))

(declare-fun m!191469 () Bool)

(assert (=> bs!9919 m!191469))

(assert (=> b!125927 d!40972))

(declare-fun d!40974 () Bool)

(declare-fun res!104379 () Bool)

(declare-fun e!82956 () Bool)

(assert (=> d!40974 (=> res!104379 e!82956)))

(assert (=> d!40974 (= res!104379 (= #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!40974 (= (arrayRangesEq!61 arr!227 (_2!5535 lt!196977) #b00000000000000000000000000000000 noOfBytes!1) e!82956)))

(declare-fun b!125999 () Bool)

(declare-fun e!82957 () Bool)

(assert (=> b!125999 (= e!82956 e!82957)))

(declare-fun res!104380 () Bool)

(assert (=> b!125999 (=> (not res!104380) (not e!82957))))

(assert (=> b!125999 (= res!104380 (= (select (arr!3173 arr!227) #b00000000000000000000000000000000) (select (arr!3173 (_2!5535 lt!196977)) #b00000000000000000000000000000000)))))

(declare-fun b!126000 () Bool)

(assert (=> b!126000 (= e!82957 (arrayRangesEq!61 arr!227 (_2!5535 lt!196977) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) noOfBytes!1))))

(assert (= (and d!40974 (not res!104379)) b!125999))

(assert (= (and b!125999 res!104380) b!126000))

(declare-fun m!191475 () Bool)

(assert (=> b!125999 m!191475))

(declare-fun m!191477 () Bool)

(assert (=> b!125999 m!191477))

(declare-fun m!191479 () Bool)

(assert (=> b!126000 m!191479))

(assert (=> b!125928 d!40974))

(declare-fun d!40978 () Bool)

(declare-fun e!82965 () Bool)

(assert (=> d!40978 e!82965))

(declare-fun res!104396 () Bool)

(assert (=> d!40978 (=> (not res!104396) (not e!82965))))

(declare-fun lt!197180 () (_ BitVec 64))

(declare-fun lt!197175 () (_ BitVec 64))

(declare-fun lt!197178 () (_ BitVec 64))

(assert (=> d!40978 (= res!104396 (= lt!197180 (bvsub lt!197175 lt!197178)))))

(assert (=> d!40978 (or (= (bvand lt!197175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197178 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!197175 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!197175 lt!197178) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40978 (= lt!197178 (remainingBits!0 ((_ sign_extend 32) (size!2574 (buf!2953 (_2!5534 lt!196976)))) ((_ sign_extend 32) (currentByte!5677 (_2!5534 lt!196976))) ((_ sign_extend 32) (currentBit!5672 (_2!5534 lt!196976)))))))

(declare-fun lt!197177 () (_ BitVec 64))

(declare-fun lt!197176 () (_ BitVec 64))

(assert (=> d!40978 (= lt!197175 (bvmul lt!197177 lt!197176))))

(assert (=> d!40978 (or (= lt!197177 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!197176 (bvsdiv (bvmul lt!197177 lt!197176) lt!197177)))))

(assert (=> d!40978 (= lt!197176 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40978 (= lt!197177 ((_ sign_extend 32) (size!2574 (buf!2953 (_2!5534 lt!196976)))))))

(assert (=> d!40978 (= lt!197180 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5677 (_2!5534 lt!196976))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5672 (_2!5534 lt!196976)))))))

(assert (=> d!40978 (invariant!0 (currentBit!5672 (_2!5534 lt!196976)) (currentByte!5677 (_2!5534 lt!196976)) (size!2574 (buf!2953 (_2!5534 lt!196976))))))

(assert (=> d!40978 (= (bitIndex!0 (size!2574 (buf!2953 (_2!5534 lt!196976))) (currentByte!5677 (_2!5534 lt!196976)) (currentBit!5672 (_2!5534 lt!196976))) lt!197180)))

(declare-fun b!126018 () Bool)

(declare-fun res!104397 () Bool)

(assert (=> b!126018 (=> (not res!104397) (not e!82965))))

(assert (=> b!126018 (= res!104397 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!197180))))

(declare-fun b!126019 () Bool)

(declare-fun lt!197179 () (_ BitVec 64))

(assert (=> b!126019 (= e!82965 (bvsle lt!197180 (bvmul lt!197179 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!126019 (or (= lt!197179 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!197179 #b0000000000000000000000000000000000000000000000000000000000001000) lt!197179)))))

(assert (=> b!126019 (= lt!197179 ((_ sign_extend 32) (size!2574 (buf!2953 (_2!5534 lt!196976)))))))

(assert (= (and d!40978 res!104396) b!126018))

(assert (= (and b!126018 res!104397) b!126019))

(declare-fun m!191511 () Bool)

(assert (=> d!40978 m!191511))

(declare-fun m!191513 () Bool)

(assert (=> d!40978 m!191513))

(assert (=> b!125929 d!40978))

(declare-fun d!40990 () Bool)

(declare-fun e!82966 () Bool)

(assert (=> d!40990 e!82966))

(declare-fun res!104398 () Bool)

(assert (=> d!40990 (=> (not res!104398) (not e!82966))))

(declare-fun lt!197184 () (_ BitVec 64))

(declare-fun lt!197186 () (_ BitVec 64))

(declare-fun lt!197181 () (_ BitVec 64))

(assert (=> d!40990 (= res!104398 (= lt!197186 (bvsub lt!197181 lt!197184)))))

(assert (=> d!40990 (or (= (bvand lt!197181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197184 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!197181 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!197181 lt!197184) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!40990 (= lt!197184 (remainingBits!0 ((_ sign_extend 32) (size!2574 (buf!2953 thiss!1614))) ((_ sign_extend 32) (currentByte!5677 thiss!1614)) ((_ sign_extend 32) (currentBit!5672 thiss!1614))))))

(declare-fun lt!197183 () (_ BitVec 64))

(declare-fun lt!197182 () (_ BitVec 64))

(assert (=> d!40990 (= lt!197181 (bvmul lt!197183 lt!197182))))

(assert (=> d!40990 (or (= lt!197183 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!197182 (bvsdiv (bvmul lt!197183 lt!197182) lt!197183)))))

(assert (=> d!40990 (= lt!197182 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!40990 (= lt!197183 ((_ sign_extend 32) (size!2574 (buf!2953 thiss!1614))))))

(assert (=> d!40990 (= lt!197186 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5677 thiss!1614)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5672 thiss!1614))))))

(assert (=> d!40990 (invariant!0 (currentBit!5672 thiss!1614) (currentByte!5677 thiss!1614) (size!2574 (buf!2953 thiss!1614)))))

(assert (=> d!40990 (= (bitIndex!0 (size!2574 (buf!2953 thiss!1614)) (currentByte!5677 thiss!1614) (currentBit!5672 thiss!1614)) lt!197186)))

(declare-fun b!126020 () Bool)

(declare-fun res!104399 () Bool)

(assert (=> b!126020 (=> (not res!104399) (not e!82966))))

(assert (=> b!126020 (= res!104399 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!197186))))

(declare-fun b!126021 () Bool)

(declare-fun lt!197185 () (_ BitVec 64))

(assert (=> b!126021 (= e!82966 (bvsle lt!197186 (bvmul lt!197185 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!126021 (or (= lt!197185 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!197185 #b0000000000000000000000000000000000000000000000000000000000001000) lt!197185)))))

(assert (=> b!126021 (= lt!197185 ((_ sign_extend 32) (size!2574 (buf!2953 thiss!1614))))))

(assert (= (and d!40990 res!104398) b!126020))

(assert (= (and b!126020 res!104399) b!126021))

(assert (=> d!40990 m!191469))

(assert (=> d!40990 m!191393))

(assert (=> b!125929 d!40990))

(declare-fun d!40992 () Bool)

(declare-fun res!104408 () Bool)

(declare-fun e!82971 () Bool)

(assert (=> d!40992 (=> (not res!104408) (not e!82971))))

(assert (=> d!40992 (= res!104408 (= (size!2574 (buf!2953 thiss!1614)) (size!2574 (buf!2953 (_2!5534 lt!196976)))))))

(assert (=> d!40992 (= (isPrefixOf!0 thiss!1614 (_2!5534 lt!196976)) e!82971)))

(declare-fun b!126028 () Bool)

(declare-fun res!104407 () Bool)

(assert (=> b!126028 (=> (not res!104407) (not e!82971))))

(assert (=> b!126028 (= res!104407 (bvsle (bitIndex!0 (size!2574 (buf!2953 thiss!1614)) (currentByte!5677 thiss!1614) (currentBit!5672 thiss!1614)) (bitIndex!0 (size!2574 (buf!2953 (_2!5534 lt!196976))) (currentByte!5677 (_2!5534 lt!196976)) (currentBit!5672 (_2!5534 lt!196976)))))))

(declare-fun b!126029 () Bool)

(declare-fun e!82972 () Bool)

(assert (=> b!126029 (= e!82971 e!82972)))

(declare-fun res!104406 () Bool)

(assert (=> b!126029 (=> res!104406 e!82972)))

(assert (=> b!126029 (= res!104406 (= (size!2574 (buf!2953 thiss!1614)) #b00000000000000000000000000000000))))

(declare-fun b!126030 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5688 array!5688 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!126030 (= e!82972 (arrayBitRangesEq!0 (buf!2953 thiss!1614) (buf!2953 (_2!5534 lt!196976)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2574 (buf!2953 thiss!1614)) (currentByte!5677 thiss!1614) (currentBit!5672 thiss!1614))))))

(assert (= (and d!40992 res!104408) b!126028))

(assert (= (and b!126028 res!104407) b!126029))

(assert (= (and b!126029 (not res!104406)) b!126030))

(assert (=> b!126028 m!191377))

(assert (=> b!126028 m!191375))

(assert (=> b!126030 m!191377))

(assert (=> b!126030 m!191377))

(declare-fun m!191515 () Bool)

(assert (=> b!126030 m!191515))

(assert (=> b!125924 d!40992))

(declare-fun d!40994 () Bool)

(assert (=> d!40994 (= (array_inv!2363 arr!227) (bvsge (size!2574 arr!227) #b00000000000000000000000000000000))))

(assert (=> start!24868 d!40994))

(declare-fun d!40996 () Bool)

(assert (=> d!40996 (= (inv!12 thiss!1614) (invariant!0 (currentBit!5672 thiss!1614) (currentByte!5677 thiss!1614) (size!2574 (buf!2953 thiss!1614))))))

(declare-fun bs!9921 () Bool)

(assert (= bs!9921 d!40996))

(assert (=> bs!9921 m!191393))

(assert (=> start!24868 d!40996))

(declare-fun d!40998 () Bool)

(assert (=> d!40998 (= (array_inv!2363 (buf!2953 thiss!1614)) (bvsge (size!2574 (buf!2953 thiss!1614)) #b00000000000000000000000000000000))))

(assert (=> b!125930 d!40998))

(declare-datatypes ((tuple3!452 0))(
  ( (tuple3!453 (_1!5539 Unit!7748) (_2!5539 BitStream!4472) (_3!281 array!5688)) )
))
(declare-fun lt!197213 () tuple3!452)

(declare-fun d!41000 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!4472 array!5688 (_ BitVec 32) (_ BitVec 32)) tuple3!452)

(assert (=> d!41000 (= lt!197213 (readByteArrayLoop!0 (_1!5536 lt!196978) arr!227 #b00000000000000000000000000000000 noOfBytes!1))))

(assert (=> d!41000 (= (readByteArrayLoopPure!0 (_1!5536 lt!196978) arr!227 #b00000000000000000000000000000000 noOfBytes!1) (tuple2!10513 (_2!5539 lt!197213) (_3!281 lt!197213)))))

(declare-fun bs!9923 () Bool)

(assert (= bs!9923 d!41000))

(declare-fun m!191523 () Bool)

(assert (=> bs!9923 m!191523))

(assert (=> b!125925 d!41000))

(declare-fun d!41010 () Bool)

(assert (=> d!41010 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2574 (buf!2953 (_2!5534 lt!196976)))) ((_ sign_extend 32) (currentByte!5677 thiss!1614)) ((_ sign_extend 32) (currentBit!5672 thiss!1614)) lt!196979) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2574 (buf!2953 (_2!5534 lt!196976)))) ((_ sign_extend 32) (currentByte!5677 thiss!1614)) ((_ sign_extend 32) (currentBit!5672 thiss!1614))) lt!196979))))

(declare-fun bs!9924 () Bool)

(assert (= bs!9924 d!41010))

(declare-fun m!191525 () Bool)

(assert (=> bs!9924 m!191525))

(assert (=> b!125925 d!41010))

(declare-fun d!41012 () Bool)

(assert (=> d!41012 (validate_offset_bits!1 ((_ sign_extend 32) (size!2574 (buf!2953 (_2!5534 lt!196976)))) ((_ sign_extend 32) (currentByte!5677 thiss!1614)) ((_ sign_extend 32) (currentBit!5672 thiss!1614)) lt!196979)))

(declare-fun lt!197216 () Unit!7748)

(declare-fun choose!9 (BitStream!4472 array!5688 (_ BitVec 64) BitStream!4472) Unit!7748)

(assert (=> d!41012 (= lt!197216 (choose!9 thiss!1614 (buf!2953 (_2!5534 lt!196976)) lt!196979 (BitStream!4473 (buf!2953 (_2!5534 lt!196976)) (currentByte!5677 thiss!1614) (currentBit!5672 thiss!1614))))))

(assert (=> d!41012 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1614 (buf!2953 (_2!5534 lt!196976)) lt!196979) lt!197216)))

(declare-fun bs!9925 () Bool)

(assert (= bs!9925 d!41012))

(assert (=> bs!9925 m!191387))

(declare-fun m!191527 () Bool)

(assert (=> bs!9925 m!191527))

(assert (=> b!125925 d!41012))

(declare-fun b!126059 () Bool)

(declare-fun res!104435 () Bool)

(declare-fun e!82987 () Bool)

(assert (=> b!126059 (=> (not res!104435) (not e!82987))))

(declare-fun lt!197292 () tuple2!10514)

(assert (=> b!126059 (= res!104435 (isPrefixOf!0 (_2!5536 lt!197292) (_2!5534 lt!196976)))))

(declare-fun d!41014 () Bool)

(assert (=> d!41014 e!82987))

(declare-fun res!104434 () Bool)

(assert (=> d!41014 (=> (not res!104434) (not e!82987))))

(assert (=> d!41014 (= res!104434 (isPrefixOf!0 (_1!5536 lt!197292) (_2!5536 lt!197292)))))

(declare-fun lt!197282 () BitStream!4472)

(assert (=> d!41014 (= lt!197292 (tuple2!10515 lt!197282 (_2!5534 lt!196976)))))

(declare-fun lt!197275 () Unit!7748)

(declare-fun lt!197284 () Unit!7748)

(assert (=> d!41014 (= lt!197275 lt!197284)))

(assert (=> d!41014 (isPrefixOf!0 lt!197282 (_2!5534 lt!196976))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4472 BitStream!4472 BitStream!4472) Unit!7748)

(assert (=> d!41014 (= lt!197284 (lemmaIsPrefixTransitive!0 lt!197282 (_2!5534 lt!196976) (_2!5534 lt!196976)))))

(declare-fun lt!197278 () Unit!7748)

(declare-fun lt!197287 () Unit!7748)

(assert (=> d!41014 (= lt!197278 lt!197287)))

(assert (=> d!41014 (isPrefixOf!0 lt!197282 (_2!5534 lt!196976))))

(assert (=> d!41014 (= lt!197287 (lemmaIsPrefixTransitive!0 lt!197282 thiss!1614 (_2!5534 lt!196976)))))

(declare-fun lt!197293 () Unit!7748)

(declare-fun e!82988 () Unit!7748)

(assert (=> d!41014 (= lt!197293 e!82988)))

(declare-fun c!7485 () Bool)

(assert (=> d!41014 (= c!7485 (not (= (size!2574 (buf!2953 thiss!1614)) #b00000000000000000000000000000000)))))

(declare-fun lt!197286 () Unit!7748)

(declare-fun lt!197283 () Unit!7748)

(assert (=> d!41014 (= lt!197286 lt!197283)))

(assert (=> d!41014 (isPrefixOf!0 (_2!5534 lt!196976) (_2!5534 lt!196976))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4472) Unit!7748)

(assert (=> d!41014 (= lt!197283 (lemmaIsPrefixRefl!0 (_2!5534 lt!196976)))))

(declare-fun lt!197291 () Unit!7748)

(declare-fun lt!197289 () Unit!7748)

(assert (=> d!41014 (= lt!197291 lt!197289)))

(assert (=> d!41014 (= lt!197289 (lemmaIsPrefixRefl!0 (_2!5534 lt!196976)))))

(declare-fun lt!197285 () Unit!7748)

(declare-fun lt!197280 () Unit!7748)

(assert (=> d!41014 (= lt!197285 lt!197280)))

(assert (=> d!41014 (isPrefixOf!0 lt!197282 lt!197282)))

(assert (=> d!41014 (= lt!197280 (lemmaIsPrefixRefl!0 lt!197282))))

(declare-fun lt!197288 () Unit!7748)

(declare-fun lt!197281 () Unit!7748)

(assert (=> d!41014 (= lt!197288 lt!197281)))

(assert (=> d!41014 (isPrefixOf!0 thiss!1614 thiss!1614)))

(assert (=> d!41014 (= lt!197281 (lemmaIsPrefixRefl!0 thiss!1614))))

(assert (=> d!41014 (= lt!197282 (BitStream!4473 (buf!2953 (_2!5534 lt!196976)) (currentByte!5677 thiss!1614) (currentBit!5672 thiss!1614)))))

(assert (=> d!41014 (isPrefixOf!0 thiss!1614 (_2!5534 lt!196976))))

(assert (=> d!41014 (= (reader!0 thiss!1614 (_2!5534 lt!196976)) lt!197292)))

(declare-fun b!126060 () Bool)

(declare-fun Unit!7752 () Unit!7748)

(assert (=> b!126060 (= e!82988 Unit!7752)))

(declare-fun b!126061 () Bool)

(declare-fun res!104433 () Bool)

(assert (=> b!126061 (=> (not res!104433) (not e!82987))))

(assert (=> b!126061 (= res!104433 (isPrefixOf!0 (_1!5536 lt!197292) thiss!1614))))

(declare-fun b!126062 () Bool)

(declare-fun lt!197294 () Unit!7748)

(assert (=> b!126062 (= e!82988 lt!197294)))

(declare-fun lt!197276 () (_ BitVec 64))

(assert (=> b!126062 (= lt!197276 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!197279 () (_ BitVec 64))

(assert (=> b!126062 (= lt!197279 (bitIndex!0 (size!2574 (buf!2953 thiss!1614)) (currentByte!5677 thiss!1614) (currentBit!5672 thiss!1614)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5688 array!5688 (_ BitVec 64) (_ BitVec 64)) Unit!7748)

(assert (=> b!126062 (= lt!197294 (arrayBitRangesEqSymmetric!0 (buf!2953 thiss!1614) (buf!2953 (_2!5534 lt!196976)) lt!197276 lt!197279))))

(assert (=> b!126062 (arrayBitRangesEq!0 (buf!2953 (_2!5534 lt!196976)) (buf!2953 thiss!1614) lt!197276 lt!197279)))

(declare-fun b!126063 () Bool)

(declare-fun lt!197290 () (_ BitVec 64))

(declare-fun lt!197277 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4472 (_ BitVec 64)) BitStream!4472)

(assert (=> b!126063 (= e!82987 (= (_1!5536 lt!197292) (withMovedBitIndex!0 (_2!5536 lt!197292) (bvsub lt!197290 lt!197277))))))

(assert (=> b!126063 (or (= (bvand lt!197290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!197277 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!197290 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!197290 lt!197277) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!126063 (= lt!197277 (bitIndex!0 (size!2574 (buf!2953 (_2!5534 lt!196976))) (currentByte!5677 (_2!5534 lt!196976)) (currentBit!5672 (_2!5534 lt!196976))))))

(assert (=> b!126063 (= lt!197290 (bitIndex!0 (size!2574 (buf!2953 thiss!1614)) (currentByte!5677 thiss!1614) (currentBit!5672 thiss!1614)))))

(assert (= (and d!41014 c!7485) b!126062))

(assert (= (and d!41014 (not c!7485)) b!126060))

(assert (= (and d!41014 res!104434) b!126061))

(assert (= (and b!126061 res!104433) b!126059))

(assert (= (and b!126059 res!104435) b!126063))

(declare-fun m!191529 () Bool)

(assert (=> b!126059 m!191529))

(declare-fun m!191531 () Bool)

(assert (=> b!126063 m!191531))

(assert (=> b!126063 m!191375))

(assert (=> b!126063 m!191377))

(declare-fun m!191533 () Bool)

(assert (=> d!41014 m!191533))

(declare-fun m!191537 () Bool)

(assert (=> d!41014 m!191537))

(declare-fun m!191539 () Bool)

(assert (=> d!41014 m!191539))

(declare-fun m!191541 () Bool)

(assert (=> d!41014 m!191541))

(declare-fun m!191545 () Bool)

(assert (=> d!41014 m!191545))

(declare-fun m!191547 () Bool)

(assert (=> d!41014 m!191547))

(declare-fun m!191549 () Bool)

(assert (=> d!41014 m!191549))

(declare-fun m!191551 () Bool)

(assert (=> d!41014 m!191551))

(declare-fun m!191553 () Bool)

(assert (=> d!41014 m!191553))

(assert (=> d!41014 m!191369))

(declare-fun m!191559 () Bool)

(assert (=> d!41014 m!191559))

(assert (=> b!126062 m!191377))

(declare-fun m!191563 () Bool)

(assert (=> b!126062 m!191563))

(declare-fun m!191567 () Bool)

(assert (=> b!126062 m!191567))

(declare-fun m!191571 () Bool)

(assert (=> b!126061 m!191571))

(assert (=> b!125925 d!41014))

(push 1)

