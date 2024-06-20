; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43260 () Bool)

(assert start!43260)

(declare-fun res!170900 () Bool)

(declare-fun e!139728 () Bool)

(assert (=> start!43260 (=> (not res!170900) (not e!139728))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!43260 (= res!170900 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43260 e!139728))

(assert (=> start!43260 true))

(declare-datatypes ((array!10325 0))(
  ( (array!10326 (arr!5470 (Array (_ BitVec 32) (_ BitVec 8))) (size!4540 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8188 0))(
  ( (BitStream!8189 (buf!5045 array!10325) (currentByte!9521 (_ BitVec 32)) (currentBit!9516 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8188)

(declare-fun e!139722 () Bool)

(declare-fun inv!12 (BitStream!8188) Bool)

(assert (=> start!43260 (and (inv!12 thiss!1204) e!139722)))

(declare-fun b!203971 () Bool)

(declare-fun e!139726 () Bool)

(declare-fun e!139721 () Bool)

(assert (=> b!203971 (= e!139726 e!139721)))

(declare-fun res!170901 () Bool)

(assert (=> b!203971 (=> (not res!170901) (not e!139721))))

(declare-datatypes ((Unit!14538 0))(
  ( (Unit!14539) )
))
(declare-datatypes ((tuple2!17450 0))(
  ( (tuple2!17451 (_1!9377 Unit!14538) (_2!9377 BitStream!8188)) )
))
(declare-fun lt!318598 () tuple2!17450)

(declare-fun lt!318591 () Bool)

(declare-datatypes ((tuple2!17452 0))(
  ( (tuple2!17453 (_1!9378 BitStream!8188) (_2!9378 Bool)) )
))
(declare-fun lt!318594 () tuple2!17452)

(assert (=> b!203971 (= res!170901 (and (= (_2!9378 lt!318594) lt!318591) (= (_1!9378 lt!318594) (_2!9377 lt!318598))))))

(declare-fun readBitPure!0 (BitStream!8188) tuple2!17452)

(declare-fun readerFrom!0 (BitStream!8188 (_ BitVec 32) (_ BitVec 32)) BitStream!8188)

(assert (=> b!203971 (= lt!318594 (readBitPure!0 (readerFrom!0 (_2!9377 lt!318598) (currentBit!9516 thiss!1204) (currentByte!9521 thiss!1204))))))

(declare-fun b!203972 () Bool)

(declare-fun res!170893 () Bool)

(assert (=> b!203972 (=> (not res!170893) (not e!139728))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!203972 (= res!170893 (validate_offset_bits!1 ((_ sign_extend 32) (size!4540 (buf!5045 thiss!1204))) ((_ sign_extend 32) (currentByte!9521 thiss!1204)) ((_ sign_extend 32) (currentBit!9516 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!203973 () Bool)

(declare-fun res!170899 () Bool)

(assert (=> b!203973 (=> (not res!170899) (not e!139728))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!203973 (= res!170899 (invariant!0 (currentBit!9516 thiss!1204) (currentByte!9521 thiss!1204) (size!4540 (buf!5045 thiss!1204))))))

(declare-fun b!203974 () Bool)

(declare-fun e!139724 () Bool)

(assert (=> b!203974 (= e!139728 (not e!139724))))

(declare-fun res!170894 () Bool)

(assert (=> b!203974 (=> res!170894 e!139724)))

(declare-fun lt!318595 () (_ BitVec 64))

(declare-fun lt!318596 () (_ BitVec 64))

(assert (=> b!203974 (= res!170894 (not (= lt!318595 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!318596))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!203974 (= lt!318595 (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!318598))) (currentByte!9521 (_2!9377 lt!318598)) (currentBit!9516 (_2!9377 lt!318598))))))

(assert (=> b!203974 (= lt!318596 (bitIndex!0 (size!4540 (buf!5045 thiss!1204)) (currentByte!9521 thiss!1204) (currentBit!9516 thiss!1204)))))

(declare-fun e!139725 () Bool)

(assert (=> b!203974 e!139725))

(declare-fun res!170896 () Bool)

(assert (=> b!203974 (=> (not res!170896) (not e!139725))))

(assert (=> b!203974 (= res!170896 (= (size!4540 (buf!5045 thiss!1204)) (size!4540 (buf!5045 (_2!9377 lt!318598)))))))

(declare-fun appendBit!0 (BitStream!8188 Bool) tuple2!17450)

(assert (=> b!203974 (= lt!318598 (appendBit!0 thiss!1204 lt!318591))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!203974 (= lt!318591 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!203975 () Bool)

(declare-fun res!170898 () Bool)

(assert (=> b!203975 (=> (not res!170898) (not e!139728))))

(assert (=> b!203975 (= res!170898 (not (= i!590 nBits!348)))))

(declare-fun b!203976 () Bool)

(declare-fun lt!318599 () (_ BitVec 64))

(assert (=> b!203976 (= e!139721 (= (bitIndex!0 (size!4540 (buf!5045 (_1!9378 lt!318594))) (currentByte!9521 (_1!9378 lt!318594)) (currentBit!9516 (_1!9378 lt!318594))) lt!318599))))

(declare-fun b!203977 () Bool)

(assert (=> b!203977 (= e!139725 e!139726)))

(declare-fun res!170895 () Bool)

(assert (=> b!203977 (=> (not res!170895) (not e!139726))))

(declare-fun lt!318593 () (_ BitVec 64))

(assert (=> b!203977 (= res!170895 (= lt!318599 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!318593)))))

(assert (=> b!203977 (= lt!318599 (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!318598))) (currentByte!9521 (_2!9377 lt!318598)) (currentBit!9516 (_2!9377 lt!318598))))))

(assert (=> b!203977 (= lt!318593 (bitIndex!0 (size!4540 (buf!5045 thiss!1204)) (currentByte!9521 thiss!1204) (currentBit!9516 thiss!1204)))))

(declare-fun b!203978 () Bool)

(declare-fun array_inv!4281 (array!10325) Bool)

(assert (=> b!203978 (= e!139722 (array_inv!4281 (buf!5045 thiss!1204)))))

(declare-fun e!139723 () Bool)

(declare-fun lt!318592 () tuple2!17450)

(declare-fun b!203979 () Bool)

(assert (=> b!203979 (= e!139723 (or (not (= (size!4540 (buf!5045 (_2!9377 lt!318592))) (size!4540 (buf!5045 thiss!1204)))) (let ((bdg!12240 (bvadd lt!318596 ((_ sign_extend 32) nBits!348)))) (let ((bdg!12241 (bvand bdg!12240 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (= bdg!12241 (bvand ((_ sign_extend 32) i!590) #b1000000000000000000000000000000000000000000000000000000000000000)) (= bdg!12241 (bvand (bvsub bdg!12240 ((_ sign_extend 32) i!590)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!203980 () Bool)

(assert (=> b!203980 (= e!139724 e!139723)))

(declare-fun res!170903 () Bool)

(assert (=> b!203980 (=> res!170903 e!139723)))

(assert (=> b!203980 (= res!170903 (not (= (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!318592))) (currentByte!9521 (_2!9377 lt!318592)) (currentBit!9516 (_2!9377 lt!318592))) (bvsub (bvsub (bvadd lt!318595 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun isPrefixOf!0 (BitStream!8188 BitStream!8188) Bool)

(assert (=> b!203980 (isPrefixOf!0 thiss!1204 (_2!9377 lt!318592))))

(declare-fun lt!318597 () Unit!14538)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8188 BitStream!8188 BitStream!8188) Unit!14538)

(assert (=> b!203980 (= lt!318597 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9377 lt!318598) (_2!9377 lt!318592)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8188 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17450)

(assert (=> b!203980 (= lt!318592 (appendBitsLSBFirstLoopTR!0 (_2!9377 lt!318598) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun b!203981 () Bool)

(declare-fun res!170902 () Bool)

(assert (=> b!203981 (=> (not res!170902) (not e!139726))))

(assert (=> b!203981 (= res!170902 (isPrefixOf!0 thiss!1204 (_2!9377 lt!318598)))))

(declare-fun b!203982 () Bool)

(declare-fun res!170897 () Bool)

(assert (=> b!203982 (=> res!170897 e!139723)))

(assert (=> b!203982 (= res!170897 (not (invariant!0 (currentBit!9516 (_2!9377 lt!318592)) (currentByte!9521 (_2!9377 lt!318592)) (size!4540 (buf!5045 (_2!9377 lt!318592))))))))

(assert (= (and start!43260 res!170900) b!203972))

(assert (= (and b!203972 res!170893) b!203973))

(assert (= (and b!203973 res!170899) b!203975))

(assert (= (and b!203975 res!170898) b!203974))

(assert (= (and b!203974 res!170896) b!203977))

(assert (= (and b!203977 res!170895) b!203981))

(assert (= (and b!203981 res!170902) b!203971))

(assert (= (and b!203971 res!170901) b!203976))

(assert (= (and b!203974 (not res!170894)) b!203980))

(assert (= (and b!203980 (not res!170903)) b!203982))

(assert (= (and b!203982 (not res!170897)) b!203979))

(assert (= start!43260 b!203978))

(declare-fun m!315009 () Bool)

(assert (=> b!203980 m!315009))

(declare-fun m!315011 () Bool)

(assert (=> b!203980 m!315011))

(declare-fun m!315013 () Bool)

(assert (=> b!203980 m!315013))

(declare-fun m!315015 () Bool)

(assert (=> b!203980 m!315015))

(declare-fun m!315017 () Bool)

(assert (=> b!203981 m!315017))

(declare-fun m!315019 () Bool)

(assert (=> b!203978 m!315019))

(declare-fun m!315021 () Bool)

(assert (=> b!203976 m!315021))

(declare-fun m!315023 () Bool)

(assert (=> b!203971 m!315023))

(assert (=> b!203971 m!315023))

(declare-fun m!315025 () Bool)

(assert (=> b!203971 m!315025))

(declare-fun m!315027 () Bool)

(assert (=> start!43260 m!315027))

(declare-fun m!315029 () Bool)

(assert (=> b!203972 m!315029))

(declare-fun m!315031 () Bool)

(assert (=> b!203973 m!315031))

(declare-fun m!315033 () Bool)

(assert (=> b!203982 m!315033))

(declare-fun m!315035 () Bool)

(assert (=> b!203977 m!315035))

(declare-fun m!315037 () Bool)

(assert (=> b!203977 m!315037))

(assert (=> b!203974 m!315035))

(assert (=> b!203974 m!315037))

(declare-fun m!315039 () Bool)

(assert (=> b!203974 m!315039))

(push 1)

(assert (not b!203982))

(assert (not b!203971))

(assert (not b!203981))

(assert (not b!203973))

(assert (not b!203972))

(assert (not b!203977))

(assert (not b!203980))

(assert (not b!203976))

(assert (not b!203978))

(assert (not start!43260))

(assert (not b!203974))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!69675 () Bool)

(assert (=> d!69675 (= (invariant!0 (currentBit!9516 thiss!1204) (currentByte!9521 thiss!1204) (size!4540 (buf!5045 thiss!1204))) (and (bvsge (currentBit!9516 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9516 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9521 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9521 thiss!1204) (size!4540 (buf!5045 thiss!1204))) (and (= (currentBit!9516 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9521 thiss!1204) (size!4540 (buf!5045 thiss!1204)))))))))

(assert (=> b!203973 d!69675))

(declare-fun d!69677 () Bool)

(assert (=> d!69677 (= (array_inv!4281 (buf!5045 thiss!1204)) (bvsge (size!4540 (buf!5045 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!203978 d!69677))

(declare-fun d!69679 () Bool)

(declare-fun e!139802 () Bool)

(assert (=> d!69679 e!139802))

(declare-fun res!171015 () Bool)

(assert (=> d!69679 (=> (not res!171015) (not e!139802))))

(declare-fun lt!318725 () (_ BitVec 64))

(declare-fun lt!318721 () (_ BitVec 64))

(declare-fun lt!318723 () (_ BitVec 64))

(assert (=> d!69679 (= res!171015 (= lt!318721 (bvsub lt!318725 lt!318723)))))

(assert (=> d!69679 (or (= (bvand lt!318725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318723 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318725 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318725 lt!318723) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69679 (= lt!318723 (remainingBits!0 ((_ sign_extend 32) (size!4540 (buf!5045 (_2!9377 lt!318598)))) ((_ sign_extend 32) (currentByte!9521 (_2!9377 lt!318598))) ((_ sign_extend 32) (currentBit!9516 (_2!9377 lt!318598)))))))

(declare-fun lt!318720 () (_ BitVec 64))

(declare-fun lt!318724 () (_ BitVec 64))

(assert (=> d!69679 (= lt!318725 (bvmul lt!318720 lt!318724))))

(assert (=> d!69679 (or (= lt!318720 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!318724 (bvsdiv (bvmul lt!318720 lt!318724) lt!318720)))))

(assert (=> d!69679 (= lt!318724 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69679 (= lt!318720 ((_ sign_extend 32) (size!4540 (buf!5045 (_2!9377 lt!318598)))))))

(assert (=> d!69679 (= lt!318721 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9521 (_2!9377 lt!318598))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9516 (_2!9377 lt!318598)))))))

(assert (=> d!69679 (invariant!0 (currentBit!9516 (_2!9377 lt!318598)) (currentByte!9521 (_2!9377 lt!318598)) (size!4540 (buf!5045 (_2!9377 lt!318598))))))

(assert (=> d!69679 (= (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!318598))) (currentByte!9521 (_2!9377 lt!318598)) (currentBit!9516 (_2!9377 lt!318598))) lt!318721)))

(declare-fun b!204099 () Bool)

(declare-fun res!171014 () Bool)

(assert (=> b!204099 (=> (not res!171014) (not e!139802))))

(assert (=> b!204099 (= res!171014 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!318721))))

(declare-fun b!204100 () Bool)

(declare-fun lt!318722 () (_ BitVec 64))

(assert (=> b!204100 (= e!139802 (bvsle lt!318721 (bvmul lt!318722 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204100 (or (= lt!318722 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!318722 #b0000000000000000000000000000000000000000000000000000000000001000) lt!318722)))))

(assert (=> b!204100 (= lt!318722 ((_ sign_extend 32) (size!4540 (buf!5045 (_2!9377 lt!318598)))))))

(assert (= (and d!69679 res!171015) b!204099))

(assert (= (and b!204099 res!171014) b!204100))

(declare-fun m!315141 () Bool)

(assert (=> d!69679 m!315141))

(declare-fun m!315143 () Bool)

(assert (=> d!69679 m!315143))

(assert (=> b!203977 d!69679))

(declare-fun d!69681 () Bool)

(declare-fun e!139803 () Bool)

(assert (=> d!69681 e!139803))

(declare-fun res!171017 () Bool)

(assert (=> d!69681 (=> (not res!171017) (not e!139803))))

(declare-fun lt!318729 () (_ BitVec 64))

(declare-fun lt!318731 () (_ BitVec 64))

(declare-fun lt!318727 () (_ BitVec 64))

(assert (=> d!69681 (= res!171017 (= lt!318727 (bvsub lt!318731 lt!318729)))))

(assert (=> d!69681 (or (= (bvand lt!318731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318729 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318731 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318731 lt!318729) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69681 (= lt!318729 (remainingBits!0 ((_ sign_extend 32) (size!4540 (buf!5045 thiss!1204))) ((_ sign_extend 32) (currentByte!9521 thiss!1204)) ((_ sign_extend 32) (currentBit!9516 thiss!1204))))))

(declare-fun lt!318726 () (_ BitVec 64))

(declare-fun lt!318730 () (_ BitVec 64))

(assert (=> d!69681 (= lt!318731 (bvmul lt!318726 lt!318730))))

(assert (=> d!69681 (or (= lt!318726 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!318730 (bvsdiv (bvmul lt!318726 lt!318730) lt!318726)))))

(assert (=> d!69681 (= lt!318730 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69681 (= lt!318726 ((_ sign_extend 32) (size!4540 (buf!5045 thiss!1204))))))

(assert (=> d!69681 (= lt!318727 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9521 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9516 thiss!1204))))))

(assert (=> d!69681 (invariant!0 (currentBit!9516 thiss!1204) (currentByte!9521 thiss!1204) (size!4540 (buf!5045 thiss!1204)))))

(assert (=> d!69681 (= (bitIndex!0 (size!4540 (buf!5045 thiss!1204)) (currentByte!9521 thiss!1204) (currentBit!9516 thiss!1204)) lt!318727)))

(declare-fun b!204101 () Bool)

(declare-fun res!171016 () Bool)

(assert (=> b!204101 (=> (not res!171016) (not e!139803))))

(assert (=> b!204101 (= res!171016 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!318727))))

(declare-fun b!204102 () Bool)

(declare-fun lt!318728 () (_ BitVec 64))

(assert (=> b!204102 (= e!139803 (bvsle lt!318727 (bvmul lt!318728 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204102 (or (= lt!318728 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!318728 #b0000000000000000000000000000000000000000000000000000000000001000) lt!318728)))))

(assert (=> b!204102 (= lt!318728 ((_ sign_extend 32) (size!4540 (buf!5045 thiss!1204))))))

(assert (= (and d!69681 res!171017) b!204101))

(assert (= (and b!204101 res!171016) b!204102))

(declare-fun m!315145 () Bool)

(assert (=> d!69681 m!315145))

(assert (=> d!69681 m!315031))

(assert (=> b!203977 d!69681))

(declare-fun d!69683 () Bool)

(assert (=> d!69683 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4540 (buf!5045 thiss!1204))) ((_ sign_extend 32) (currentByte!9521 thiss!1204)) ((_ sign_extend 32) (currentBit!9516 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4540 (buf!5045 thiss!1204))) ((_ sign_extend 32) (currentByte!9521 thiss!1204)) ((_ sign_extend 32) (currentBit!9516 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17158 () Bool)

(assert (= bs!17158 d!69683))

(assert (=> bs!17158 m!315145))

(assert (=> b!203972 d!69683))

(declare-fun d!69685 () Bool)

(declare-datatypes ((tuple2!17468 0))(
  ( (tuple2!17469 (_1!9386 Bool) (_2!9386 BitStream!8188)) )
))
(declare-fun lt!318734 () tuple2!17468)

(declare-fun readBit!0 (BitStream!8188) tuple2!17468)

(assert (=> d!69685 (= lt!318734 (readBit!0 (readerFrom!0 (_2!9377 lt!318598) (currentBit!9516 thiss!1204) (currentByte!9521 thiss!1204))))))

(assert (=> d!69685 (= (readBitPure!0 (readerFrom!0 (_2!9377 lt!318598) (currentBit!9516 thiss!1204) (currentByte!9521 thiss!1204))) (tuple2!17453 (_2!9386 lt!318734) (_1!9386 lt!318734)))))

(declare-fun bs!17159 () Bool)

(assert (= bs!17159 d!69685))

(assert (=> bs!17159 m!315023))

(declare-fun m!315147 () Bool)

(assert (=> bs!17159 m!315147))

(assert (=> b!203971 d!69685))

(declare-fun d!69687 () Bool)

(declare-fun e!139806 () Bool)

(assert (=> d!69687 e!139806))

(declare-fun res!171021 () Bool)

(assert (=> d!69687 (=> (not res!171021) (not e!139806))))

(assert (=> d!69687 (= res!171021 (invariant!0 (currentBit!9516 (_2!9377 lt!318598)) (currentByte!9521 (_2!9377 lt!318598)) (size!4540 (buf!5045 (_2!9377 lt!318598)))))))

(assert (=> d!69687 (= (readerFrom!0 (_2!9377 lt!318598) (currentBit!9516 thiss!1204) (currentByte!9521 thiss!1204)) (BitStream!8189 (buf!5045 (_2!9377 lt!318598)) (currentByte!9521 thiss!1204) (currentBit!9516 thiss!1204)))))

(declare-fun b!204105 () Bool)

(assert (=> b!204105 (= e!139806 (invariant!0 (currentBit!9516 thiss!1204) (currentByte!9521 thiss!1204) (size!4540 (buf!5045 (_2!9377 lt!318598)))))))

(assert (= (and d!69687 res!171021) b!204105))

(assert (=> d!69687 m!315143))

(declare-fun m!315149 () Bool)

(assert (=> b!204105 m!315149))

(assert (=> b!203971 d!69687))

(declare-fun d!69691 () Bool)

(assert (=> d!69691 (= (invariant!0 (currentBit!9516 (_2!9377 lt!318592)) (currentByte!9521 (_2!9377 lt!318592)) (size!4540 (buf!5045 (_2!9377 lt!318592)))) (and (bvsge (currentBit!9516 (_2!9377 lt!318592)) #b00000000000000000000000000000000) (bvslt (currentBit!9516 (_2!9377 lt!318592)) #b00000000000000000000000000001000) (bvsge (currentByte!9521 (_2!9377 lt!318592)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9521 (_2!9377 lt!318592)) (size!4540 (buf!5045 (_2!9377 lt!318592)))) (and (= (currentBit!9516 (_2!9377 lt!318592)) #b00000000000000000000000000000000) (= (currentByte!9521 (_2!9377 lt!318592)) (size!4540 (buf!5045 (_2!9377 lt!318592))))))))))

(assert (=> b!203982 d!69691))

(declare-fun d!69693 () Bool)

(declare-fun res!171030 () Bool)

(declare-fun e!139811 () Bool)

(assert (=> d!69693 (=> (not res!171030) (not e!139811))))

(assert (=> d!69693 (= res!171030 (= (size!4540 (buf!5045 thiss!1204)) (size!4540 (buf!5045 (_2!9377 lt!318598)))))))

(assert (=> d!69693 (= (isPrefixOf!0 thiss!1204 (_2!9377 lt!318598)) e!139811)))

(declare-fun b!204112 () Bool)

(declare-fun res!171028 () Bool)

(assert (=> b!204112 (=> (not res!171028) (not e!139811))))

(assert (=> b!204112 (= res!171028 (bvsle (bitIndex!0 (size!4540 (buf!5045 thiss!1204)) (currentByte!9521 thiss!1204) (currentBit!9516 thiss!1204)) (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!318598))) (currentByte!9521 (_2!9377 lt!318598)) (currentBit!9516 (_2!9377 lt!318598)))))))

(declare-fun b!204113 () Bool)

(declare-fun e!139812 () Bool)

(assert (=> b!204113 (= e!139811 e!139812)))

(declare-fun res!171029 () Bool)

(assert (=> b!204113 (=> res!171029 e!139812)))

(assert (=> b!204113 (= res!171029 (= (size!4540 (buf!5045 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!204114 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10325 array!10325 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204114 (= e!139812 (arrayBitRangesEq!0 (buf!5045 thiss!1204) (buf!5045 (_2!9377 lt!318598)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4540 (buf!5045 thiss!1204)) (currentByte!9521 thiss!1204) (currentBit!9516 thiss!1204))))))

(assert (= (and d!69693 res!171030) b!204112))

(assert (= (and b!204112 res!171028) b!204113))

(assert (= (and b!204113 (not res!171029)) b!204114))

(assert (=> b!204112 m!315037))

(assert (=> b!204112 m!315035))

(assert (=> b!204114 m!315037))

(assert (=> b!204114 m!315037))

(declare-fun m!315151 () Bool)

(assert (=> b!204114 m!315151))

(assert (=> b!203981 d!69693))

(declare-fun d!69695 () Bool)

(declare-fun e!139813 () Bool)

(assert (=> d!69695 e!139813))

(declare-fun res!171032 () Bool)

(assert (=> d!69695 (=> (not res!171032) (not e!139813))))

(declare-fun lt!318736 () (_ BitVec 64))

(declare-fun lt!318740 () (_ BitVec 64))

(declare-fun lt!318738 () (_ BitVec 64))

(assert (=> d!69695 (= res!171032 (= lt!318736 (bvsub lt!318740 lt!318738)))))

(assert (=> d!69695 (or (= (bvand lt!318740 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318738 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318740 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318740 lt!318738) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69695 (= lt!318738 (remainingBits!0 ((_ sign_extend 32) (size!4540 (buf!5045 (_1!9378 lt!318594)))) ((_ sign_extend 32) (currentByte!9521 (_1!9378 lt!318594))) ((_ sign_extend 32) (currentBit!9516 (_1!9378 lt!318594)))))))

(declare-fun lt!318735 () (_ BitVec 64))

(declare-fun lt!318739 () (_ BitVec 64))

(assert (=> d!69695 (= lt!318740 (bvmul lt!318735 lt!318739))))

(assert (=> d!69695 (or (= lt!318735 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!318739 (bvsdiv (bvmul lt!318735 lt!318739) lt!318735)))))

(assert (=> d!69695 (= lt!318739 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69695 (= lt!318735 ((_ sign_extend 32) (size!4540 (buf!5045 (_1!9378 lt!318594)))))))

(assert (=> d!69695 (= lt!318736 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9521 (_1!9378 lt!318594))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9516 (_1!9378 lt!318594)))))))

(assert (=> d!69695 (invariant!0 (currentBit!9516 (_1!9378 lt!318594)) (currentByte!9521 (_1!9378 lt!318594)) (size!4540 (buf!5045 (_1!9378 lt!318594))))))

(assert (=> d!69695 (= (bitIndex!0 (size!4540 (buf!5045 (_1!9378 lt!318594))) (currentByte!9521 (_1!9378 lt!318594)) (currentBit!9516 (_1!9378 lt!318594))) lt!318736)))

(declare-fun b!204115 () Bool)

(declare-fun res!171031 () Bool)

(assert (=> b!204115 (=> (not res!171031) (not e!139813))))

(assert (=> b!204115 (= res!171031 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!318736))))

(declare-fun b!204116 () Bool)

(declare-fun lt!318737 () (_ BitVec 64))

(assert (=> b!204116 (= e!139813 (bvsle lt!318736 (bvmul lt!318737 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204116 (or (= lt!318737 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!318737 #b0000000000000000000000000000000000000000000000000000000000001000) lt!318737)))))

(assert (=> b!204116 (= lt!318737 ((_ sign_extend 32) (size!4540 (buf!5045 (_1!9378 lt!318594)))))))

(assert (= (and d!69695 res!171032) b!204115))

(assert (= (and b!204115 res!171031) b!204116))

(declare-fun m!315153 () Bool)

(assert (=> d!69695 m!315153))

(declare-fun m!315155 () Bool)

(assert (=> d!69695 m!315155))

(assert (=> b!203976 d!69695))

(declare-fun d!69697 () Bool)

(declare-fun e!139814 () Bool)

(assert (=> d!69697 e!139814))

(declare-fun res!171034 () Bool)

(assert (=> d!69697 (=> (not res!171034) (not e!139814))))

(declare-fun lt!318742 () (_ BitVec 64))

(declare-fun lt!318746 () (_ BitVec 64))

(declare-fun lt!318744 () (_ BitVec 64))

(assert (=> d!69697 (= res!171034 (= lt!318742 (bvsub lt!318746 lt!318744)))))

(assert (=> d!69697 (or (= (bvand lt!318746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318744 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318746 lt!318744) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69697 (= lt!318744 (remainingBits!0 ((_ sign_extend 32) (size!4540 (buf!5045 (_2!9377 lt!318592)))) ((_ sign_extend 32) (currentByte!9521 (_2!9377 lt!318592))) ((_ sign_extend 32) (currentBit!9516 (_2!9377 lt!318592)))))))

(declare-fun lt!318741 () (_ BitVec 64))

(declare-fun lt!318745 () (_ BitVec 64))

(assert (=> d!69697 (= lt!318746 (bvmul lt!318741 lt!318745))))

(assert (=> d!69697 (or (= lt!318741 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!318745 (bvsdiv (bvmul lt!318741 lt!318745) lt!318741)))))

(assert (=> d!69697 (= lt!318745 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69697 (= lt!318741 ((_ sign_extend 32) (size!4540 (buf!5045 (_2!9377 lt!318592)))))))

(assert (=> d!69697 (= lt!318742 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9521 (_2!9377 lt!318592))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9516 (_2!9377 lt!318592)))))))

(assert (=> d!69697 (invariant!0 (currentBit!9516 (_2!9377 lt!318592)) (currentByte!9521 (_2!9377 lt!318592)) (size!4540 (buf!5045 (_2!9377 lt!318592))))))

(assert (=> d!69697 (= (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!318592))) (currentByte!9521 (_2!9377 lt!318592)) (currentBit!9516 (_2!9377 lt!318592))) lt!318742)))

(declare-fun b!204117 () Bool)

(declare-fun res!171033 () Bool)

(assert (=> b!204117 (=> (not res!171033) (not e!139814))))

(assert (=> b!204117 (= res!171033 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!318742))))

(declare-fun b!204118 () Bool)

(declare-fun lt!318743 () (_ BitVec 64))

(assert (=> b!204118 (= e!139814 (bvsle lt!318742 (bvmul lt!318743 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204118 (or (= lt!318743 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!318743 #b0000000000000000000000000000000000000000000000000000000000001000) lt!318743)))))

(assert (=> b!204118 (= lt!318743 ((_ sign_extend 32) (size!4540 (buf!5045 (_2!9377 lt!318592)))))))

(assert (= (and d!69697 res!171034) b!204117))

(assert (= (and b!204117 res!171033) b!204118))

(declare-fun m!315157 () Bool)

(assert (=> d!69697 m!315157))

(assert (=> d!69697 m!315033))

(assert (=> b!203980 d!69697))

(declare-fun d!69699 () Bool)

(declare-fun res!171037 () Bool)

(declare-fun e!139815 () Bool)

(assert (=> d!69699 (=> (not res!171037) (not e!139815))))

(assert (=> d!69699 (= res!171037 (= (size!4540 (buf!5045 thiss!1204)) (size!4540 (buf!5045 (_2!9377 lt!318592)))))))

(assert (=> d!69699 (= (isPrefixOf!0 thiss!1204 (_2!9377 lt!318592)) e!139815)))

(declare-fun b!204119 () Bool)

(declare-fun res!171035 () Bool)

(assert (=> b!204119 (=> (not res!171035) (not e!139815))))

(assert (=> b!204119 (= res!171035 (bvsle (bitIndex!0 (size!4540 (buf!5045 thiss!1204)) (currentByte!9521 thiss!1204) (currentBit!9516 thiss!1204)) (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!318592))) (currentByte!9521 (_2!9377 lt!318592)) (currentBit!9516 (_2!9377 lt!318592)))))))

(declare-fun b!204120 () Bool)

(declare-fun e!139816 () Bool)

(assert (=> b!204120 (= e!139815 e!139816)))

(declare-fun res!171036 () Bool)

(assert (=> b!204120 (=> res!171036 e!139816)))

(assert (=> b!204120 (= res!171036 (= (size!4540 (buf!5045 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!204121 () Bool)

(assert (=> b!204121 (= e!139816 (arrayBitRangesEq!0 (buf!5045 thiss!1204) (buf!5045 (_2!9377 lt!318592)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4540 (buf!5045 thiss!1204)) (currentByte!9521 thiss!1204) (currentBit!9516 thiss!1204))))))

(assert (= (and d!69699 res!171037) b!204119))

(assert (= (and b!204119 res!171035) b!204120))

(assert (= (and b!204120 (not res!171036)) b!204121))

(assert (=> b!204119 m!315037))

(assert (=> b!204119 m!315009))

(assert (=> b!204121 m!315037))

(assert (=> b!204121 m!315037))

(declare-fun m!315159 () Bool)

(assert (=> b!204121 m!315159))

(assert (=> b!203980 d!69699))

(declare-fun d!69701 () Bool)

(assert (=> d!69701 (isPrefixOf!0 thiss!1204 (_2!9377 lt!318592))))

(declare-fun lt!318761 () Unit!14538)

(declare-fun choose!30 (BitStream!8188 BitStream!8188 BitStream!8188) Unit!14538)

(assert (=> d!69701 (= lt!318761 (choose!30 thiss!1204 (_2!9377 lt!318598) (_2!9377 lt!318592)))))

(assert (=> d!69701 (isPrefixOf!0 thiss!1204 (_2!9377 lt!318598))))

(assert (=> d!69701 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9377 lt!318598) (_2!9377 lt!318592)) lt!318761)))

(declare-fun bs!17160 () Bool)

(assert (= bs!17160 d!69701))

(assert (=> bs!17160 m!315011))

(declare-fun m!315161 () Bool)

(assert (=> bs!17160 m!315161))

(assert (=> bs!17160 m!315017))

(assert (=> b!203980 d!69701))

(declare-fun b!204242 () Bool)

(declare-fun e!139888 () Bool)

(declare-fun lt!319139 () (_ BitVec 64))

(assert (=> b!204242 (= e!139888 (validate_offset_bits!1 ((_ sign_extend 32) (size!4540 (buf!5045 (_2!9377 lt!318598)))) ((_ sign_extend 32) (currentByte!9521 (_2!9377 lt!318598))) ((_ sign_extend 32) (currentBit!9516 (_2!9377 lt!318598))) lt!319139))))

(declare-fun d!69703 () Bool)

(declare-fun e!139892 () Bool)

(assert (=> d!69703 e!139892))

(declare-fun res!171142 () Bool)

(assert (=> d!69703 (=> (not res!171142) (not e!139892))))

(declare-fun lt!319118 () tuple2!17450)

(assert (=> d!69703 (= res!171142 (invariant!0 (currentBit!9516 (_2!9377 lt!319118)) (currentByte!9521 (_2!9377 lt!319118)) (size!4540 (buf!5045 (_2!9377 lt!319118)))))))

(declare-fun e!139886 () tuple2!17450)

(assert (=> d!69703 (= lt!319118 e!139886)))

(declare-fun c!10126 () Bool)

(assert (=> d!69703 (= c!10126 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69703 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69703 (= (appendBitsLSBFirstLoopTR!0 (_2!9377 lt!318598) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!319118)))

(declare-fun b!204243 () Bool)

(declare-fun res!171138 () Bool)

(assert (=> b!204243 (=> (not res!171138) (not e!139892))))

(assert (=> b!204243 (= res!171138 (isPrefixOf!0 (_2!9377 lt!318598) (_2!9377 lt!319118)))))

(declare-fun b!204244 () Bool)

(declare-fun e!139887 () (_ BitVec 64))

(assert (=> b!204244 (= e!139887 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!204245 () Bool)

(declare-fun lt!319110 () tuple2!17450)

(assert (=> b!204245 (= e!139886 (tuple2!17451 (_1!9377 lt!319110) (_2!9377 lt!319110)))))

(declare-fun lt!319137 () Bool)

(assert (=> b!204245 (= lt!319137 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!319087 () tuple2!17450)

(assert (=> b!204245 (= lt!319087 (appendBit!0 (_2!9377 lt!318598) lt!319137))))

(declare-fun res!171146 () Bool)

(assert (=> b!204245 (= res!171146 (= (size!4540 (buf!5045 (_2!9377 lt!318598))) (size!4540 (buf!5045 (_2!9377 lt!319087)))))))

(declare-fun e!139891 () Bool)

(assert (=> b!204245 (=> (not res!171146) (not e!139891))))

(assert (=> b!204245 e!139891))

(declare-fun lt!319085 () tuple2!17450)

(assert (=> b!204245 (= lt!319085 lt!319087)))

(assert (=> b!204245 (= lt!319110 (appendBitsLSBFirstLoopTR!0 (_2!9377 lt!319085) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!319102 () Unit!14538)

(assert (=> b!204245 (= lt!319102 (lemmaIsPrefixTransitive!0 (_2!9377 lt!318598) (_2!9377 lt!319085) (_2!9377 lt!319110)))))

(declare-fun call!3231 () Bool)

(assert (=> b!204245 call!3231))

(declare-fun lt!319138 () Unit!14538)

(assert (=> b!204245 (= lt!319138 lt!319102)))

(assert (=> b!204245 (invariant!0 (currentBit!9516 (_2!9377 lt!318598)) (currentByte!9521 (_2!9377 lt!318598)) (size!4540 (buf!5045 (_2!9377 lt!319085))))))

(declare-fun lt!319117 () BitStream!8188)

(assert (=> b!204245 (= lt!319117 (BitStream!8189 (buf!5045 (_2!9377 lt!319085)) (currentByte!9521 (_2!9377 lt!318598)) (currentBit!9516 (_2!9377 lt!318598))))))

(assert (=> b!204245 (invariant!0 (currentBit!9516 lt!319117) (currentByte!9521 lt!319117) (size!4540 (buf!5045 (_2!9377 lt!319110))))))

(declare-fun lt!319101 () BitStream!8188)

(assert (=> b!204245 (= lt!319101 (BitStream!8189 (buf!5045 (_2!9377 lt!319110)) (currentByte!9521 lt!319117) (currentBit!9516 lt!319117)))))

(declare-fun lt!319128 () tuple2!17452)

(assert (=> b!204245 (= lt!319128 (readBitPure!0 lt!319117))))

(declare-fun lt!319136 () tuple2!17452)

(assert (=> b!204245 (= lt!319136 (readBitPure!0 lt!319101))))

(declare-fun lt!319096 () Unit!14538)

(declare-fun readBitPrefixLemma!0 (BitStream!8188 BitStream!8188) Unit!14538)

(assert (=> b!204245 (= lt!319096 (readBitPrefixLemma!0 lt!319117 (_2!9377 lt!319110)))))

(declare-fun res!171148 () Bool)

(assert (=> b!204245 (= res!171148 (= (bitIndex!0 (size!4540 (buf!5045 (_1!9378 lt!319128))) (currentByte!9521 (_1!9378 lt!319128)) (currentBit!9516 (_1!9378 lt!319128))) (bitIndex!0 (size!4540 (buf!5045 (_1!9378 lt!319136))) (currentByte!9521 (_1!9378 lt!319136)) (currentBit!9516 (_1!9378 lt!319136)))))))

(declare-fun e!139885 () Bool)

(assert (=> b!204245 (=> (not res!171148) (not e!139885))))

(assert (=> b!204245 e!139885))

(declare-fun lt!319113 () Unit!14538)

(assert (=> b!204245 (= lt!319113 lt!319096)))

(declare-datatypes ((tuple2!17470 0))(
  ( (tuple2!17471 (_1!9387 BitStream!8188) (_2!9387 BitStream!8188)) )
))
(declare-fun lt!319132 () tuple2!17470)

(declare-fun reader!0 (BitStream!8188 BitStream!8188) tuple2!17470)

(assert (=> b!204245 (= lt!319132 (reader!0 (_2!9377 lt!318598) (_2!9377 lt!319110)))))

(declare-fun lt!319104 () tuple2!17470)

(assert (=> b!204245 (= lt!319104 (reader!0 (_2!9377 lt!319085) (_2!9377 lt!319110)))))

(declare-fun lt!319107 () tuple2!17452)

(assert (=> b!204245 (= lt!319107 (readBitPure!0 (_1!9387 lt!319132)))))

(assert (=> b!204245 (= (_2!9378 lt!319107) lt!319137)))

(declare-fun lt!319100 () Unit!14538)

(declare-fun Unit!14555 () Unit!14538)

(assert (=> b!204245 (= lt!319100 Unit!14555)))

(declare-fun lt!319130 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!204245 (= lt!319130 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!319109 () (_ BitVec 64))

(assert (=> b!204245 (= lt!319109 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!319108 () Unit!14538)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8188 array!10325 (_ BitVec 64)) Unit!14538)

(assert (=> b!204245 (= lt!319108 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9377 lt!318598) (buf!5045 (_2!9377 lt!319110)) lt!319109))))

(assert (=> b!204245 (validate_offset_bits!1 ((_ sign_extend 32) (size!4540 (buf!5045 (_2!9377 lt!319110)))) ((_ sign_extend 32) (currentByte!9521 (_2!9377 lt!318598))) ((_ sign_extend 32) (currentBit!9516 (_2!9377 lt!318598))) lt!319109)))

(declare-fun lt!319094 () Unit!14538)

(assert (=> b!204245 (= lt!319094 lt!319108)))

(declare-datatypes ((tuple2!17472 0))(
  ( (tuple2!17473 (_1!9388 BitStream!8188) (_2!9388 (_ BitVec 64))) )
))
(declare-fun lt!319103 () tuple2!17472)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8188 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17472)

(assert (=> b!204245 (= lt!319103 (readNBitsLSBFirstsLoopPure!0 (_1!9387 lt!319132) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!319130))))

(declare-fun lt!319086 () (_ BitVec 64))

(assert (=> b!204245 (= lt!319086 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!319092 () Unit!14538)

(assert (=> b!204245 (= lt!319092 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9377 lt!319085) (buf!5045 (_2!9377 lt!319110)) lt!319086))))

(assert (=> b!204245 (validate_offset_bits!1 ((_ sign_extend 32) (size!4540 (buf!5045 (_2!9377 lt!319110)))) ((_ sign_extend 32) (currentByte!9521 (_2!9377 lt!319085))) ((_ sign_extend 32) (currentBit!9516 (_2!9377 lt!319085))) lt!319086)))

(declare-fun lt!319120 () Unit!14538)

(assert (=> b!204245 (= lt!319120 lt!319092)))

(declare-fun lt!319124 () tuple2!17472)

(assert (=> b!204245 (= lt!319124 (readNBitsLSBFirstsLoopPure!0 (_1!9387 lt!319104) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!319130 (ite (_2!9378 lt!319107) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!319121 () tuple2!17472)

(assert (=> b!204245 (= lt!319121 (readNBitsLSBFirstsLoopPure!0 (_1!9387 lt!319132) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!319130))))

(declare-fun c!10127 () Bool)

(assert (=> b!204245 (= c!10127 (_2!9378 (readBitPure!0 (_1!9387 lt!319132))))))

(declare-fun lt!319127 () tuple2!17472)

(declare-fun withMovedBitIndex!0 (BitStream!8188 (_ BitVec 64)) BitStream!8188)

(assert (=> b!204245 (= lt!319127 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9387 lt!319132) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!319130 e!139887)))))

(declare-fun lt!319088 () Unit!14538)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8188 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14538)

(assert (=> b!204245 (= lt!319088 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9387 lt!319132) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!319130))))

(assert (=> b!204245 (and (= (_2!9388 lt!319121) (_2!9388 lt!319127)) (= (_1!9388 lt!319121) (_1!9388 lt!319127)))))

(declare-fun lt!319089 () Unit!14538)

(assert (=> b!204245 (= lt!319089 lt!319088)))

(assert (=> b!204245 (= (_1!9387 lt!319132) (withMovedBitIndex!0 (_2!9387 lt!319132) (bvsub (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!318598))) (currentByte!9521 (_2!9377 lt!318598)) (currentBit!9516 (_2!9377 lt!318598))) (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!319110))) (currentByte!9521 (_2!9377 lt!319110)) (currentBit!9516 (_2!9377 lt!319110))))))))

(declare-fun lt!319134 () Unit!14538)

(declare-fun Unit!14556 () Unit!14538)

(assert (=> b!204245 (= lt!319134 Unit!14556)))

(assert (=> b!204245 (= (_1!9387 lt!319104) (withMovedBitIndex!0 (_2!9387 lt!319104) (bvsub (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!319085))) (currentByte!9521 (_2!9377 lt!319085)) (currentBit!9516 (_2!9377 lt!319085))) (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!319110))) (currentByte!9521 (_2!9377 lt!319110)) (currentBit!9516 (_2!9377 lt!319110))))))))

(declare-fun lt!319135 () Unit!14538)

(declare-fun Unit!14557 () Unit!14538)

(assert (=> b!204245 (= lt!319135 Unit!14557)))

(assert (=> b!204245 (= (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!318598))) (currentByte!9521 (_2!9377 lt!318598)) (currentBit!9516 (_2!9377 lt!318598))) (bvsub (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!319085))) (currentByte!9521 (_2!9377 lt!319085)) (currentBit!9516 (_2!9377 lt!319085))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!319114 () Unit!14538)

(declare-fun Unit!14558 () Unit!14538)

(assert (=> b!204245 (= lt!319114 Unit!14558)))

(assert (=> b!204245 (= (_2!9388 lt!319103) (_2!9388 lt!319124))))

(declare-fun lt!319093 () Unit!14538)

(declare-fun Unit!14559 () Unit!14538)

(assert (=> b!204245 (= lt!319093 Unit!14559)))

(assert (=> b!204245 (invariant!0 (currentBit!9516 (_2!9377 lt!319110)) (currentByte!9521 (_2!9377 lt!319110)) (size!4540 (buf!5045 (_2!9377 lt!319110))))))

(declare-fun lt!319090 () Unit!14538)

(declare-fun Unit!14560 () Unit!14538)

(assert (=> b!204245 (= lt!319090 Unit!14560)))

(assert (=> b!204245 (= (size!4540 (buf!5045 (_2!9377 lt!318598))) (size!4540 (buf!5045 (_2!9377 lt!319110))))))

(declare-fun lt!319111 () Unit!14538)

(declare-fun Unit!14561 () Unit!14538)

(assert (=> b!204245 (= lt!319111 Unit!14561)))

(assert (=> b!204245 (= (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!319110))) (currentByte!9521 (_2!9377 lt!319110)) (currentBit!9516 (_2!9377 lt!319110))) (bvsub (bvadd (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!318598))) (currentByte!9521 (_2!9377 lt!318598)) (currentBit!9516 (_2!9377 lt!318598))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!319122 () Unit!14538)

(declare-fun Unit!14562 () Unit!14538)

(assert (=> b!204245 (= lt!319122 Unit!14562)))

(declare-fun lt!319091 () Unit!14538)

(declare-fun Unit!14563 () Unit!14538)

(assert (=> b!204245 (= lt!319091 Unit!14563)))

(declare-fun lt!319131 () tuple2!17470)

(assert (=> b!204245 (= lt!319131 (reader!0 (_2!9377 lt!318598) (_2!9377 lt!319110)))))

(declare-fun lt!319119 () (_ BitVec 64))

(assert (=> b!204245 (= lt!319119 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!319098 () Unit!14538)

(assert (=> b!204245 (= lt!319098 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9377 lt!318598) (buf!5045 (_2!9377 lt!319110)) lt!319119))))

(assert (=> b!204245 (validate_offset_bits!1 ((_ sign_extend 32) (size!4540 (buf!5045 (_2!9377 lt!319110)))) ((_ sign_extend 32) (currentByte!9521 (_2!9377 lt!318598))) ((_ sign_extend 32) (currentBit!9516 (_2!9377 lt!318598))) lt!319119)))

(declare-fun lt!319126 () Unit!14538)

(assert (=> b!204245 (= lt!319126 lt!319098)))

(declare-fun lt!319112 () tuple2!17472)

(assert (=> b!204245 (= lt!319112 (readNBitsLSBFirstsLoopPure!0 (_1!9387 lt!319131) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!171147 () Bool)

(assert (=> b!204245 (= res!171147 (= (_2!9388 lt!319112) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!139893 () Bool)

(assert (=> b!204245 (=> (not res!171147) (not e!139893))))

(assert (=> b!204245 e!139893))

(declare-fun lt!319097 () Unit!14538)

(declare-fun Unit!14564 () Unit!14538)

(assert (=> b!204245 (= lt!319097 Unit!14564)))

(declare-fun b!204246 () Bool)

(declare-fun e!139889 () Bool)

(declare-fun lt!319125 () tuple2!17452)

(assert (=> b!204246 (= e!139889 (= (bitIndex!0 (size!4540 (buf!5045 (_1!9378 lt!319125))) (currentByte!9521 (_1!9378 lt!319125)) (currentBit!9516 (_1!9378 lt!319125))) (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!319087))) (currentByte!9521 (_2!9377 lt!319087)) (currentBit!9516 (_2!9377 lt!319087)))))))

(declare-fun b!204247 () Bool)

(declare-fun res!171141 () Bool)

(assert (=> b!204247 (= res!171141 (= (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!319087))) (currentByte!9521 (_2!9377 lt!319087)) (currentBit!9516 (_2!9377 lt!319087))) (bvadd (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!318598))) (currentByte!9521 (_2!9377 lt!318598)) (currentBit!9516 (_2!9377 lt!318598))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!204247 (=> (not res!171141) (not e!139891))))

(declare-fun b!204248 () Bool)

(assert (=> b!204248 (= e!139893 (= (_1!9388 lt!319112) (_2!9387 lt!319131)))))

(declare-fun b!204249 () Bool)

(declare-fun e!139890 () Bool)

(declare-fun lt!319123 () tuple2!17472)

(declare-fun lt!319129 () tuple2!17470)

(assert (=> b!204249 (= e!139890 (= (_1!9388 lt!319123) (_2!9387 lt!319129)))))

(declare-fun b!204250 () Bool)

(assert (=> b!204250 (= e!139887 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!204251 () Bool)

(assert (=> b!204251 (= e!139892 e!139890)))

(declare-fun res!171144 () Bool)

(assert (=> b!204251 (=> (not res!171144) (not e!139890))))

(assert (=> b!204251 (= res!171144 (= (_2!9388 lt!319123) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!204251 (= lt!319123 (readNBitsLSBFirstsLoopPure!0 (_1!9387 lt!319129) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!319133 () Unit!14538)

(declare-fun lt!319115 () Unit!14538)

(assert (=> b!204251 (= lt!319133 lt!319115)))

(assert (=> b!204251 (validate_offset_bits!1 ((_ sign_extend 32) (size!4540 (buf!5045 (_2!9377 lt!319118)))) ((_ sign_extend 32) (currentByte!9521 (_2!9377 lt!318598))) ((_ sign_extend 32) (currentBit!9516 (_2!9377 lt!318598))) lt!319139)))

(assert (=> b!204251 (= lt!319115 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9377 lt!318598) (buf!5045 (_2!9377 lt!319118)) lt!319139))))

(assert (=> b!204251 e!139888))

(declare-fun res!171139 () Bool)

(assert (=> b!204251 (=> (not res!171139) (not e!139888))))

(assert (=> b!204251 (= res!171139 (and (= (size!4540 (buf!5045 (_2!9377 lt!318598))) (size!4540 (buf!5045 (_2!9377 lt!319118)))) (bvsge lt!319139 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204251 (= lt!319139 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!204251 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!204251 (= lt!319129 (reader!0 (_2!9377 lt!318598) (_2!9377 lt!319118)))))

(declare-fun b!204252 () Bool)

(declare-fun res!171145 () Bool)

(assert (=> b!204252 (= res!171145 (isPrefixOf!0 (_2!9377 lt!318598) (_2!9377 lt!319087)))))

(assert (=> b!204252 (=> (not res!171145) (not e!139891))))

(declare-fun b!204253 () Bool)

(assert (=> b!204253 (= lt!319125 (readBitPure!0 (readerFrom!0 (_2!9377 lt!319087) (currentBit!9516 (_2!9377 lt!318598)) (currentByte!9521 (_2!9377 lt!318598)))))))

(declare-fun res!171143 () Bool)

(assert (=> b!204253 (= res!171143 (and (= (_2!9378 lt!319125) lt!319137) (= (_1!9378 lt!319125) (_2!9377 lt!319087))))))

(assert (=> b!204253 (=> (not res!171143) (not e!139889))))

(assert (=> b!204253 (= e!139891 e!139889)))

(declare-fun bm!3228 () Bool)

(assert (=> bm!3228 (= call!3231 (isPrefixOf!0 (_2!9377 lt!318598) (ite c!10126 (_2!9377 lt!318598) (_2!9377 lt!319110))))))

(declare-fun b!204254 () Bool)

(assert (=> b!204254 (= e!139885 (= (_2!9378 lt!319128) (_2!9378 lt!319136)))))

(declare-fun b!204255 () Bool)

(declare-fun Unit!14565 () Unit!14538)

(assert (=> b!204255 (= e!139886 (tuple2!17451 Unit!14565 (_2!9377 lt!318598)))))

(declare-fun lt!319105 () Unit!14538)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8188) Unit!14538)

(assert (=> b!204255 (= lt!319105 (lemmaIsPrefixRefl!0 (_2!9377 lt!318598)))))

(assert (=> b!204255 call!3231))

(declare-fun lt!319099 () Unit!14538)

(assert (=> b!204255 (= lt!319099 lt!319105)))

(declare-fun b!204256 () Bool)

(declare-fun res!171140 () Bool)

(assert (=> b!204256 (=> (not res!171140) (not e!139892))))

(declare-fun lt!319084 () (_ BitVec 64))

(declare-fun lt!319106 () (_ BitVec 64))

(assert (=> b!204256 (= res!171140 (= (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!319118))) (currentByte!9521 (_2!9377 lt!319118)) (currentBit!9516 (_2!9377 lt!319118))) (bvsub lt!319084 lt!319106)))))

(assert (=> b!204256 (or (= (bvand lt!319084 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!319106 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!319084 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!319084 lt!319106) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204256 (= lt!319106 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!319095 () (_ BitVec 64))

(declare-fun lt!319116 () (_ BitVec 64))

(assert (=> b!204256 (= lt!319084 (bvadd lt!319095 lt!319116))))

(assert (=> b!204256 (or (not (= (bvand lt!319095 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!319116 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!319095 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!319095 lt!319116) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204256 (= lt!319116 ((_ sign_extend 32) nBits!348))))

(assert (=> b!204256 (= lt!319095 (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!318598))) (currentByte!9521 (_2!9377 lt!318598)) (currentBit!9516 (_2!9377 lt!318598))))))

(declare-fun b!204257 () Bool)

(declare-fun res!171149 () Bool)

(assert (=> b!204257 (=> (not res!171149) (not e!139892))))

(assert (=> b!204257 (= res!171149 (= (size!4540 (buf!5045 (_2!9377 lt!318598))) (size!4540 (buf!5045 (_2!9377 lt!319118)))))))

(assert (= (and d!69703 c!10126) b!204255))

(assert (= (and d!69703 (not c!10126)) b!204245))

(assert (= (and b!204245 res!171146) b!204247))

(assert (= (and b!204247 res!171141) b!204252))

(assert (= (and b!204252 res!171145) b!204253))

(assert (= (and b!204253 res!171143) b!204246))

(assert (= (and b!204245 res!171148) b!204254))

(assert (= (and b!204245 c!10127) b!204250))

(assert (= (and b!204245 (not c!10127)) b!204244))

(assert (= (and b!204245 res!171147) b!204248))

(assert (= (or b!204255 b!204245) bm!3228))

(assert (= (and d!69703 res!171142) b!204257))

(assert (= (and b!204257 res!171149) b!204256))

(assert (= (and b!204256 res!171140) b!204243))

(assert (= (and b!204243 res!171138) b!204251))

(assert (= (and b!204251 res!171139) b!204242))

(assert (= (and b!204251 res!171144) b!204249))

(declare-fun m!315293 () Bool)

(assert (=> b!204246 m!315293))

(declare-fun m!315295 () Bool)

(assert (=> b!204246 m!315295))

(declare-fun m!315297 () Bool)

(assert (=> bm!3228 m!315297))

(declare-fun m!315299 () Bool)

(assert (=> b!204243 m!315299))

(declare-fun m!315301 () Bool)

(assert (=> b!204245 m!315301))

(declare-fun m!315303 () Bool)

(assert (=> b!204245 m!315303))

(assert (=> b!204245 m!315035))

(declare-fun m!315305 () Bool)

(assert (=> b!204245 m!315305))

(declare-fun m!315307 () Bool)

(assert (=> b!204245 m!315307))

(declare-fun m!315309 () Bool)

(assert (=> b!204245 m!315309))

(declare-fun m!315311 () Bool)

(assert (=> b!204245 m!315311))

(declare-fun m!315313 () Bool)

(assert (=> b!204245 m!315313))

(declare-fun m!315315 () Bool)

(assert (=> b!204245 m!315315))

(declare-fun m!315317 () Bool)

(assert (=> b!204245 m!315317))

(declare-fun m!315319 () Bool)

(assert (=> b!204245 m!315319))

(declare-fun m!315321 () Bool)

(assert (=> b!204245 m!315321))

(declare-fun m!315323 () Bool)

(assert (=> b!204245 m!315323))

(declare-fun m!315325 () Bool)

(assert (=> b!204245 m!315325))

(declare-fun m!315327 () Bool)

(assert (=> b!204245 m!315327))

(declare-fun m!315329 () Bool)

(assert (=> b!204245 m!315329))

(declare-fun m!315331 () Bool)

(assert (=> b!204245 m!315331))

(declare-fun m!315333 () Bool)

(assert (=> b!204245 m!315333))

(declare-fun m!315335 () Bool)

(assert (=> b!204245 m!315335))

(declare-fun m!315337 () Bool)

(assert (=> b!204245 m!315337))

(declare-fun m!315339 () Bool)

(assert (=> b!204245 m!315339))

(declare-fun m!315341 () Bool)

(assert (=> b!204245 m!315341))

(declare-fun m!315343 () Bool)

(assert (=> b!204245 m!315343))

(declare-fun m!315345 () Bool)

(assert (=> b!204245 m!315345))

(declare-fun m!315347 () Bool)

(assert (=> b!204245 m!315347))

(declare-fun m!315349 () Bool)

(assert (=> b!204245 m!315349))

(declare-fun m!315351 () Bool)

(assert (=> b!204245 m!315351))

(declare-fun m!315353 () Bool)

(assert (=> b!204245 m!315353))

(declare-fun m!315355 () Bool)

(assert (=> b!204245 m!315355))

(declare-fun m!315357 () Bool)

(assert (=> b!204245 m!315357))

(assert (=> b!204245 m!315327))

(declare-fun m!315359 () Bool)

(assert (=> b!204245 m!315359))

(declare-fun m!315361 () Bool)

(assert (=> b!204245 m!315361))

(declare-fun m!315363 () Bool)

(assert (=> b!204245 m!315363))

(assert (=> b!204247 m!315295))

(assert (=> b!204247 m!315035))

(declare-fun m!315365 () Bool)

(assert (=> b!204255 m!315365))

(declare-fun m!315367 () Bool)

(assert (=> b!204256 m!315367))

(assert (=> b!204256 m!315035))

(declare-fun m!315369 () Bool)

(assert (=> b!204242 m!315369))

(declare-fun m!315371 () Bool)

(assert (=> b!204253 m!315371))

(assert (=> b!204253 m!315371))

(declare-fun m!315373 () Bool)

(assert (=> b!204253 m!315373))

(declare-fun m!315375 () Bool)

(assert (=> b!204251 m!315375))

(declare-fun m!315377 () Bool)

(assert (=> b!204251 m!315377))

(assert (=> b!204251 m!315347))

(declare-fun m!315379 () Bool)

(assert (=> b!204251 m!315379))

(assert (=> b!204251 m!315343))

(declare-fun m!315381 () Bool)

(assert (=> b!204251 m!315381))

(declare-fun m!315383 () Bool)

(assert (=> d!69703 m!315383))

(declare-fun m!315385 () Bool)

(assert (=> b!204252 m!315385))

(assert (=> b!203980 d!69703))

(assert (=> b!203974 d!69679))

(assert (=> b!203974 d!69681))

(declare-fun b!204299 () Bool)

(declare-fun res!171183 () Bool)

(declare-fun e!139916 () Bool)

(assert (=> b!204299 (=> (not res!171183) (not e!139916))))

(declare-fun lt!319263 () (_ BitVec 64))

(declare-fun lt!319262 () tuple2!17450)

(declare-fun lt!319260 () (_ BitVec 64))

(assert (=> b!204299 (= res!171183 (= (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!319262))) (currentByte!9521 (_2!9377 lt!319262)) (currentBit!9516 (_2!9377 lt!319262))) (bvadd lt!319263 lt!319260)))))

(assert (=> b!204299 (or (not (= (bvand lt!319263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!319260 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!319263 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!319263 lt!319260) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204299 (= lt!319260 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!204299 (= lt!319263 (bitIndex!0 (size!4540 (buf!5045 thiss!1204)) (currentByte!9521 thiss!1204) (currentBit!9516 thiss!1204)))))

(declare-fun b!204302 () Bool)

(declare-fun e!139917 () Bool)

(declare-fun lt!319261 () tuple2!17452)

(assert (=> b!204302 (= e!139917 (= (bitIndex!0 (size!4540 (buf!5045 (_1!9378 lt!319261))) (currentByte!9521 (_1!9378 lt!319261)) (currentBit!9516 (_1!9378 lt!319261))) (bitIndex!0 (size!4540 (buf!5045 (_2!9377 lt!319262))) (currentByte!9521 (_2!9377 lt!319262)) (currentBit!9516 (_2!9377 lt!319262)))))))

(declare-fun b!204300 () Bool)

(declare-fun res!171184 () Bool)

(assert (=> b!204300 (=> (not res!171184) (not e!139916))))

(assert (=> b!204300 (= res!171184 (isPrefixOf!0 thiss!1204 (_2!9377 lt!319262)))))

(declare-fun b!204301 () Bool)

(assert (=> b!204301 (= e!139916 e!139917)))

(declare-fun res!171185 () Bool)

(assert (=> b!204301 (=> (not res!171185) (not e!139917))))

(assert (=> b!204301 (= res!171185 (and (= (_2!9378 lt!319261) lt!318591) (= (_1!9378 lt!319261) (_2!9377 lt!319262))))))

(assert (=> b!204301 (= lt!319261 (readBitPure!0 (readerFrom!0 (_2!9377 lt!319262) (currentBit!9516 thiss!1204) (currentByte!9521 thiss!1204))))))

(declare-fun d!69733 () Bool)

(assert (=> d!69733 e!139916))

(declare-fun res!171182 () Bool)

(assert (=> d!69733 (=> (not res!171182) (not e!139916))))

(assert (=> d!69733 (= res!171182 (= (size!4540 (buf!5045 thiss!1204)) (size!4540 (buf!5045 (_2!9377 lt!319262)))))))

(declare-fun choose!16 (BitStream!8188 Bool) tuple2!17450)

(assert (=> d!69733 (= lt!319262 (choose!16 thiss!1204 lt!318591))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69733 (validate_offset_bit!0 ((_ sign_extend 32) (size!4540 (buf!5045 thiss!1204))) ((_ sign_extend 32) (currentByte!9521 thiss!1204)) ((_ sign_extend 32) (currentBit!9516 thiss!1204)))))

(assert (=> d!69733 (= (appendBit!0 thiss!1204 lt!318591) lt!319262)))

(assert (= (and d!69733 res!171182) b!204299))

(assert (= (and b!204299 res!171183) b!204300))

(assert (= (and b!204300 res!171184) b!204301))

(assert (= (and b!204301 res!171185) b!204302))

(declare-fun m!315387 () Bool)

(assert (=> b!204301 m!315387))

(assert (=> b!204301 m!315387))

(declare-fun m!315389 () Bool)

(assert (=> b!204301 m!315389))

(declare-fun m!315391 () Bool)

(assert (=> d!69733 m!315391))

(declare-fun m!315393 () Bool)

(assert (=> d!69733 m!315393))

(declare-fun m!315395 () Bool)

(assert (=> b!204299 m!315395))

(assert (=> b!204299 m!315037))

(declare-fun m!315397 () Bool)

(assert (=> b!204300 m!315397))

(declare-fun m!315399 () Bool)

(assert (=> b!204302 m!315399))

(assert (=> b!204302 m!315395))

(assert (=> b!203974 d!69733))

(declare-fun d!69735 () Bool)

(assert (=> d!69735 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9516 thiss!1204) (currentByte!9521 thiss!1204) (size!4540 (buf!5045 thiss!1204))))))

(declare-fun bs!17163 () Bool)

(assert (= bs!17163 d!69735))

(assert (=> bs!17163 m!315031))

(assert (=> start!43260 d!69735))

(push 1)

(assert (not d!69703))

(assert (not b!204301))

(assert (not b!204105))

(assert (not b!204114))

(assert (not d!69685))

(assert (not b!204253))

(assert (not b!204121))

(assert (not b!204251))

(assert (not d!69701))

(assert (not b!204243))

(assert (not d!69733))

(assert (not b!204242))

(assert (not bm!3228))

(assert (not d!69695))

(assert (not b!204302))

(assert (not b!204256))

(assert (not b!204245))

(assert (not b!204300))

(assert (not d!69735))

(assert (not d!69687))

(assert (not d!69681))

(assert (not d!69683))

(assert (not d!69697))

(assert (not d!69679))

(assert (not b!204255))

(assert (not b!204247))

(assert (not b!204299))

(assert (not b!204112))

(assert (not b!204252))

(assert (not b!204119))

(assert (not b!204246))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

