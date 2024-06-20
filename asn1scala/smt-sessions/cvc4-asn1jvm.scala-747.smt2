; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21356 () Bool)

(assert start!21356)

(declare-fun b!107563 () Bool)

(declare-fun res!88646 () Bool)

(declare-fun e!70414 () Bool)

(assert (=> b!107563 (=> (not res!88646) (not e!70414))))

(declare-datatypes ((array!4929 0))(
  ( (array!4930 (arr!2837 (Array (_ BitVec 32) (_ BitVec 8))) (size!2244 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3962 0))(
  ( (BitStream!3963 (buf!2629 array!4929) (currentByte!5153 (_ BitVec 32)) (currentBit!5148 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!3962)

(declare-datatypes ((Unit!6590 0))(
  ( (Unit!6591) )
))
(declare-datatypes ((tuple2!8864 0))(
  ( (tuple2!8865 (_1!4689 Unit!6590) (_2!4689 BitStream!3962)) )
))
(declare-fun lt!161028 () tuple2!8864)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!107563 (= res!88646 (invariant!0 (currentBit!5148 thiss!1305) (currentByte!5153 thiss!1305) (size!2244 (buf!2629 (_2!4689 lt!161028)))))))

(declare-fun b!107564 () Bool)

(declare-fun res!88644 () Bool)

(declare-fun e!70416 () Bool)

(assert (=> b!107564 (=> (not res!88644) (not e!70416))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!107564 (= res!88644 (bvslt i!615 nBits!396))))

(declare-fun b!107565 () Bool)

(declare-fun res!88641 () Bool)

(assert (=> b!107565 (=> (not res!88641) (not e!70416))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!107565 (= res!88641 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!107566 () Bool)

(declare-fun e!70410 () Bool)

(declare-fun lt!161016 () (_ BitVec 64))

(declare-fun lt!161035 () (_ BitVec 64))

(assert (=> b!107566 (= e!70410 (= lt!161016 (bvsub lt!161035 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!107567 () Bool)

(declare-fun lt!161040 () tuple2!8864)

(assert (=> b!107567 (= e!70414 (invariant!0 (currentBit!5148 thiss!1305) (currentByte!5153 thiss!1305) (size!2244 (buf!2629 (_2!4689 lt!161040)))))))

(declare-fun b!107568 () Bool)

(declare-fun e!70411 () Bool)

(assert (=> b!107568 (= e!70411 e!70416)))

(declare-fun res!88643 () Bool)

(assert (=> b!107568 (=> (not res!88643) (not e!70416))))

(declare-fun lt!161025 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!107568 (= res!88643 (validate_offset_bits!1 ((_ sign_extend 32) (size!2244 (buf!2629 thiss!1305))) ((_ sign_extend 32) (currentByte!5153 thiss!1305)) ((_ sign_extend 32) (currentBit!5148 thiss!1305)) lt!161025))))

(assert (=> b!107568 (= lt!161025 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!88651 () Bool)

(assert (=> start!21356 (=> (not res!88651) (not e!70411))))

(assert (=> start!21356 (= res!88651 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21356 e!70411))

(assert (=> start!21356 true))

(declare-fun e!70413 () Bool)

(declare-fun inv!12 (BitStream!3962) Bool)

(assert (=> start!21356 (and (inv!12 thiss!1305) e!70413)))

(declare-fun b!107569 () Bool)

(declare-fun e!70406 () Bool)

(declare-fun e!70409 () Bool)

(assert (=> b!107569 (= e!70406 e!70409)))

(declare-fun res!88647 () Bool)

(assert (=> b!107569 (=> (not res!88647) (not e!70409))))

(declare-fun lt!161015 () (_ BitVec 64))

(declare-fun lt!161029 () (_ BitVec 64))

(assert (=> b!107569 (= res!88647 (= lt!161015 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!161029)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!107569 (= lt!161015 (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161028))) (currentByte!5153 (_2!4689 lt!161028)) (currentBit!5148 (_2!4689 lt!161028))))))

(assert (=> b!107569 (= lt!161029 (bitIndex!0 (size!2244 (buf!2629 thiss!1305)) (currentByte!5153 thiss!1305) (currentBit!5148 thiss!1305)))))

(declare-fun b!107570 () Bool)

(declare-fun e!70412 () Bool)

(assert (=> b!107570 (= e!70416 (not e!70412))))

(declare-fun res!88650 () Bool)

(assert (=> b!107570 (=> res!88650 e!70412)))

(declare-datatypes ((tuple2!8866 0))(
  ( (tuple2!8867 (_1!4690 BitStream!3962) (_2!4690 BitStream!3962)) )
))
(declare-fun lt!161020 () tuple2!8866)

(declare-fun lt!161014 () (_ BitVec 64))

(declare-datatypes ((tuple2!8868 0))(
  ( (tuple2!8869 (_1!4691 BitStream!3962) (_2!4691 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!3962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8868)

(assert (=> b!107570 (= res!88650 (not (= (_1!4691 (readNLeastSignificantBitsLoopPure!0 (_1!4690 lt!161020) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!161014)) (_2!4690 lt!161020))))))

(declare-fun lt!161036 () (_ BitVec 64))

(assert (=> b!107570 (validate_offset_bits!1 ((_ sign_extend 32) (size!2244 (buf!2629 (_2!4689 lt!161040)))) ((_ sign_extend 32) (currentByte!5153 (_2!4689 lt!161028))) ((_ sign_extend 32) (currentBit!5148 (_2!4689 lt!161028))) lt!161036)))

(declare-fun lt!161026 () Unit!6590)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!3962 array!4929 (_ BitVec 64)) Unit!6590)

(assert (=> b!107570 (= lt!161026 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4689 lt!161028) (buf!2629 (_2!4689 lt!161040)) lt!161036))))

(assert (=> b!107570 (= lt!161036 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!161030 () (_ BitVec 64))

(declare-fun lt!161017 () (_ BitVec 64))

(declare-datatypes ((tuple2!8870 0))(
  ( (tuple2!8871 (_1!4692 BitStream!3962) (_2!4692 Bool)) )
))
(declare-fun lt!161039 () tuple2!8870)

(assert (=> b!107570 (= lt!161014 (bvor lt!161030 (ite (_2!4692 lt!161039) lt!161017 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!161024 () tuple2!8868)

(declare-fun lt!161023 () tuple2!8866)

(assert (=> b!107570 (= lt!161024 (readNLeastSignificantBitsLoopPure!0 (_1!4690 lt!161023) nBits!396 i!615 lt!161030))))

(assert (=> b!107570 (validate_offset_bits!1 ((_ sign_extend 32) (size!2244 (buf!2629 (_2!4689 lt!161040)))) ((_ sign_extend 32) (currentByte!5153 thiss!1305)) ((_ sign_extend 32) (currentBit!5148 thiss!1305)) lt!161025)))

(declare-fun lt!161021 () Unit!6590)

(assert (=> b!107570 (= lt!161021 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2629 (_2!4689 lt!161040)) lt!161025))))

(assert (=> b!107570 (= lt!161030 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!161019 () Bool)

(assert (=> b!107570 (= (_2!4692 lt!161039) lt!161019)))

(declare-fun readBitPure!0 (BitStream!3962) tuple2!8870)

(assert (=> b!107570 (= lt!161039 (readBitPure!0 (_1!4690 lt!161023)))))

(declare-fun reader!0 (BitStream!3962 BitStream!3962) tuple2!8866)

(assert (=> b!107570 (= lt!161020 (reader!0 (_2!4689 lt!161028) (_2!4689 lt!161040)))))

(assert (=> b!107570 (= lt!161023 (reader!0 thiss!1305 (_2!4689 lt!161040)))))

(declare-fun e!70408 () Bool)

(assert (=> b!107570 e!70408))

(declare-fun res!88645 () Bool)

(assert (=> b!107570 (=> (not res!88645) (not e!70408))))

(declare-fun lt!161018 () tuple2!8870)

(declare-fun lt!161031 () tuple2!8870)

(assert (=> b!107570 (= res!88645 (= (bitIndex!0 (size!2244 (buf!2629 (_1!4692 lt!161018))) (currentByte!5153 (_1!4692 lt!161018)) (currentBit!5148 (_1!4692 lt!161018))) (bitIndex!0 (size!2244 (buf!2629 (_1!4692 lt!161031))) (currentByte!5153 (_1!4692 lt!161031)) (currentBit!5148 (_1!4692 lt!161031)))))))

(declare-fun lt!161027 () Unit!6590)

(declare-fun lt!161032 () BitStream!3962)

(declare-fun readBitPrefixLemma!0 (BitStream!3962 BitStream!3962) Unit!6590)

(assert (=> b!107570 (= lt!161027 (readBitPrefixLemma!0 lt!161032 (_2!4689 lt!161040)))))

(assert (=> b!107570 (= lt!161031 (readBitPure!0 (BitStream!3963 (buf!2629 (_2!4689 lt!161040)) (currentByte!5153 thiss!1305) (currentBit!5148 thiss!1305))))))

(assert (=> b!107570 (= lt!161018 (readBitPure!0 lt!161032))))

(assert (=> b!107570 (= lt!161032 (BitStream!3963 (buf!2629 (_2!4689 lt!161028)) (currentByte!5153 thiss!1305) (currentBit!5148 thiss!1305)))))

(assert (=> b!107570 e!70414))

(declare-fun res!88653 () Bool)

(assert (=> b!107570 (=> (not res!88653) (not e!70414))))

(declare-fun isPrefixOf!0 (BitStream!3962 BitStream!3962) Bool)

(assert (=> b!107570 (= res!88653 (isPrefixOf!0 thiss!1305 (_2!4689 lt!161040)))))

(declare-fun lt!161037 () Unit!6590)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!3962 BitStream!3962 BitStream!3962) Unit!6590)

(assert (=> b!107570 (= lt!161037 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4689 lt!161028) (_2!4689 lt!161040)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3962 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!8864)

(assert (=> b!107570 (= lt!161040 (appendNLeastSignificantBitsLoop!0 (_2!4689 lt!161028) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!107570 e!70406))

(declare-fun res!88649 () Bool)

(assert (=> b!107570 (=> (not res!88649) (not e!70406))))

(assert (=> b!107570 (= res!88649 (= (size!2244 (buf!2629 thiss!1305)) (size!2244 (buf!2629 (_2!4689 lt!161028)))))))

(declare-fun appendBit!0 (BitStream!3962 Bool) tuple2!8864)

(assert (=> b!107570 (= lt!161028 (appendBit!0 thiss!1305 lt!161019))))

(assert (=> b!107570 (= lt!161019 (not (= (bvand v!199 lt!161017) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107570 (= lt!161017 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!107571 () Bool)

(declare-fun res!88652 () Bool)

(assert (=> b!107571 (=> (not res!88652) (not e!70409))))

(assert (=> b!107571 (= res!88652 (isPrefixOf!0 thiss!1305 (_2!4689 lt!161028)))))

(declare-fun b!107572 () Bool)

(assert (=> b!107572 (= e!70408 (= (_2!4692 lt!161018) (_2!4692 lt!161031)))))

(declare-fun b!107573 () Bool)

(declare-fun array_inv!2046 (array!4929) Bool)

(assert (=> b!107573 (= e!70413 (array_inv!2046 (buf!2629 thiss!1305)))))

(declare-fun b!107574 () Bool)

(declare-fun e!70415 () Bool)

(declare-fun lt!161038 () tuple2!8870)

(assert (=> b!107574 (= e!70415 (= (bitIndex!0 (size!2244 (buf!2629 (_1!4692 lt!161038))) (currentByte!5153 (_1!4692 lt!161038)) (currentBit!5148 (_1!4692 lt!161038))) lt!161015))))

(declare-fun b!107575 () Bool)

(declare-fun moveBitIndexPrecond!0 (BitStream!3962 (_ BitVec 64)) Bool)

(assert (=> b!107575 (= e!70412 (moveBitIndexPrecond!0 (_1!4690 lt!161023) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!107575 e!70410))

(declare-fun res!88642 () Bool)

(assert (=> b!107575 (=> (not res!88642) (not e!70410))))

(declare-fun lt!161033 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!3962 (_ BitVec 64)) BitStream!3962)

(assert (=> b!107575 (= res!88642 (= (_1!4690 lt!161020) (withMovedBitIndex!0 (_2!4690 lt!161020) (bvsub lt!161035 lt!161033))))))

(assert (=> b!107575 (= lt!161035 (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161028))) (currentByte!5153 (_2!4689 lt!161028)) (currentBit!5148 (_2!4689 lt!161028))))))

(assert (=> b!107575 (= (_1!4690 lt!161023) (withMovedBitIndex!0 (_2!4690 lt!161023) (bvsub lt!161016 lt!161033)))))

(assert (=> b!107575 (= lt!161033 (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161040))) (currentByte!5153 (_2!4689 lt!161040)) (currentBit!5148 (_2!4689 lt!161040))))))

(assert (=> b!107575 (= lt!161016 (bitIndex!0 (size!2244 (buf!2629 thiss!1305)) (currentByte!5153 thiss!1305) (currentBit!5148 thiss!1305)))))

(declare-fun lt!161022 () tuple2!8868)

(assert (=> b!107575 (and (= (_2!4691 lt!161024) (_2!4691 lt!161022)) (= (_1!4691 lt!161024) (_1!4691 lt!161022)))))

(declare-fun lt!161034 () Unit!6590)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!3962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6590)

(assert (=> b!107575 (= lt!161034 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4690 lt!161023) nBits!396 i!615 lt!161030))))

(assert (=> b!107575 (= lt!161022 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4690 lt!161023) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!161014))))

(declare-fun b!107576 () Bool)

(assert (=> b!107576 (= e!70409 e!70415)))

(declare-fun res!88648 () Bool)

(assert (=> b!107576 (=> (not res!88648) (not e!70415))))

(assert (=> b!107576 (= res!88648 (and (= (_2!4692 lt!161038) lt!161019) (= (_1!4692 lt!161038) (_2!4689 lt!161028))))))

(declare-fun readerFrom!0 (BitStream!3962 (_ BitVec 32) (_ BitVec 32)) BitStream!3962)

(assert (=> b!107576 (= lt!161038 (readBitPure!0 (readerFrom!0 (_2!4689 lt!161028) (currentBit!5148 thiss!1305) (currentByte!5153 thiss!1305))))))

(assert (= (and start!21356 res!88651) b!107568))

(assert (= (and b!107568 res!88643) b!107565))

(assert (= (and b!107565 res!88641) b!107564))

(assert (= (and b!107564 res!88644) b!107570))

(assert (= (and b!107570 res!88649) b!107569))

(assert (= (and b!107569 res!88647) b!107571))

(assert (= (and b!107571 res!88652) b!107576))

(assert (= (and b!107576 res!88648) b!107574))

(assert (= (and b!107570 res!88653) b!107563))

(assert (= (and b!107563 res!88646) b!107567))

(assert (= (and b!107570 res!88645) b!107572))

(assert (= (and b!107570 (not res!88650)) b!107575))

(assert (= (and b!107575 res!88642) b!107566))

(assert (= start!21356 b!107573))

(declare-fun m!159005 () Bool)

(assert (=> b!107568 m!159005))

(declare-fun m!159007 () Bool)

(assert (=> b!107573 m!159007))

(declare-fun m!159009 () Bool)

(assert (=> b!107576 m!159009))

(assert (=> b!107576 m!159009))

(declare-fun m!159011 () Bool)

(assert (=> b!107576 m!159011))

(declare-fun m!159013 () Bool)

(assert (=> b!107575 m!159013))

(declare-fun m!159015 () Bool)

(assert (=> b!107575 m!159015))

(declare-fun m!159017 () Bool)

(assert (=> b!107575 m!159017))

(declare-fun m!159019 () Bool)

(assert (=> b!107575 m!159019))

(declare-fun m!159021 () Bool)

(assert (=> b!107575 m!159021))

(assert (=> b!107575 m!159013))

(declare-fun m!159023 () Bool)

(assert (=> b!107575 m!159023))

(declare-fun m!159025 () Bool)

(assert (=> b!107575 m!159025))

(declare-fun m!159027 () Bool)

(assert (=> b!107575 m!159027))

(declare-fun m!159029 () Bool)

(assert (=> b!107575 m!159029))

(assert (=> b!107569 m!159017))

(assert (=> b!107569 m!159027))

(declare-fun m!159031 () Bool)

(assert (=> b!107567 m!159031))

(declare-fun m!159033 () Bool)

(assert (=> b!107563 m!159033))

(declare-fun m!159035 () Bool)

(assert (=> b!107574 m!159035))

(declare-fun m!159037 () Bool)

(assert (=> b!107565 m!159037))

(declare-fun m!159039 () Bool)

(assert (=> b!107570 m!159039))

(declare-fun m!159041 () Bool)

(assert (=> b!107570 m!159041))

(declare-fun m!159043 () Bool)

(assert (=> b!107570 m!159043))

(declare-fun m!159045 () Bool)

(assert (=> b!107570 m!159045))

(declare-fun m!159047 () Bool)

(assert (=> b!107570 m!159047))

(declare-fun m!159049 () Bool)

(assert (=> b!107570 m!159049))

(declare-fun m!159051 () Bool)

(assert (=> b!107570 m!159051))

(declare-fun m!159053 () Bool)

(assert (=> b!107570 m!159053))

(declare-fun m!159055 () Bool)

(assert (=> b!107570 m!159055))

(declare-fun m!159057 () Bool)

(assert (=> b!107570 m!159057))

(declare-fun m!159059 () Bool)

(assert (=> b!107570 m!159059))

(declare-fun m!159061 () Bool)

(assert (=> b!107570 m!159061))

(declare-fun m!159063 () Bool)

(assert (=> b!107570 m!159063))

(declare-fun m!159065 () Bool)

(assert (=> b!107570 m!159065))

(declare-fun m!159067 () Bool)

(assert (=> b!107570 m!159067))

(declare-fun m!159069 () Bool)

(assert (=> b!107570 m!159069))

(declare-fun m!159071 () Bool)

(assert (=> b!107570 m!159071))

(declare-fun m!159073 () Bool)

(assert (=> b!107570 m!159073))

(declare-fun m!159075 () Bool)

(assert (=> b!107570 m!159075))

(declare-fun m!159077 () Bool)

(assert (=> b!107571 m!159077))

(declare-fun m!159079 () Bool)

(assert (=> start!21356 m!159079))

(push 1)

(assert (not b!107569))

(assert (not b!107570))

(assert (not b!107568))

(assert (not b!107575))

(assert (not b!107571))

(assert (not b!107563))

(assert (not start!21356))

(assert (not b!107573))

(assert (not b!107565))

(assert (not b!107576))

(assert (not b!107567))

(assert (not b!107574))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!33970 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!33970 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2244 (buf!2629 thiss!1305))) ((_ sign_extend 32) (currentByte!5153 thiss!1305)) ((_ sign_extend 32) (currentBit!5148 thiss!1305)) lt!161025) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2244 (buf!2629 thiss!1305))) ((_ sign_extend 32) (currentByte!5153 thiss!1305)) ((_ sign_extend 32) (currentBit!5148 thiss!1305))) lt!161025))))

(declare-fun bs!8289 () Bool)

(assert (= bs!8289 d!33970))

(declare-fun m!159081 () Bool)

(assert (=> bs!8289 m!159081))

(assert (=> b!107568 d!33970))

(declare-fun d!33974 () Bool)

(assert (=> d!33974 (= (invariant!0 (currentBit!5148 thiss!1305) (currentByte!5153 thiss!1305) (size!2244 (buf!2629 (_2!4689 lt!161040)))) (and (bvsge (currentBit!5148 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5148 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5153 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5153 thiss!1305) (size!2244 (buf!2629 (_2!4689 lt!161040)))) (and (= (currentBit!5148 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5153 thiss!1305) (size!2244 (buf!2629 (_2!4689 lt!161040))))))))))

(assert (=> b!107567 d!33974))

(declare-fun d!33976 () Bool)

(declare-fun e!70423 () Bool)

(assert (=> d!33976 e!70423))

(declare-fun res!88667 () Bool)

(assert (=> d!33976 (=> (not res!88667) (not e!70423))))

(declare-fun lt!161078 () (_ BitVec 64))

(declare-fun lt!161081 () (_ BitVec 64))

(declare-fun lt!161079 () (_ BitVec 64))

(assert (=> d!33976 (= res!88667 (= lt!161078 (bvsub lt!161081 lt!161079)))))

(assert (=> d!33976 (or (= (bvand lt!161081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161079 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!161081 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!161081 lt!161079) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33976 (= lt!161079 (remainingBits!0 ((_ sign_extend 32) (size!2244 (buf!2629 (_2!4689 lt!161028)))) ((_ sign_extend 32) (currentByte!5153 (_2!4689 lt!161028))) ((_ sign_extend 32) (currentBit!5148 (_2!4689 lt!161028)))))))

(declare-fun lt!161082 () (_ BitVec 64))

(declare-fun lt!161077 () (_ BitVec 64))

(assert (=> d!33976 (= lt!161081 (bvmul lt!161082 lt!161077))))

(assert (=> d!33976 (or (= lt!161082 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!161077 (bvsdiv (bvmul lt!161082 lt!161077) lt!161082)))))

(assert (=> d!33976 (= lt!161077 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33976 (= lt!161082 ((_ sign_extend 32) (size!2244 (buf!2629 (_2!4689 lt!161028)))))))

(assert (=> d!33976 (= lt!161078 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5153 (_2!4689 lt!161028))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5148 (_2!4689 lt!161028)))))))

(assert (=> d!33976 (invariant!0 (currentBit!5148 (_2!4689 lt!161028)) (currentByte!5153 (_2!4689 lt!161028)) (size!2244 (buf!2629 (_2!4689 lt!161028))))))

(assert (=> d!33976 (= (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161028))) (currentByte!5153 (_2!4689 lt!161028)) (currentBit!5148 (_2!4689 lt!161028))) lt!161078)))

(declare-fun b!107589 () Bool)

(declare-fun res!88666 () Bool)

(assert (=> b!107589 (=> (not res!88666) (not e!70423))))

(assert (=> b!107589 (= res!88666 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!161078))))

(declare-fun b!107590 () Bool)

(declare-fun lt!161080 () (_ BitVec 64))

(assert (=> b!107590 (= e!70423 (bvsle lt!161078 (bvmul lt!161080 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107590 (or (= lt!161080 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!161080 #b0000000000000000000000000000000000000000000000000000000000001000) lt!161080)))))

(assert (=> b!107590 (= lt!161080 ((_ sign_extend 32) (size!2244 (buf!2629 (_2!4689 lt!161028)))))))

(assert (= (and d!33976 res!88667) b!107589))

(assert (= (and b!107589 res!88666) b!107590))

(declare-fun m!159091 () Bool)

(assert (=> d!33976 m!159091))

(declare-fun m!159093 () Bool)

(assert (=> d!33976 m!159093))

(assert (=> b!107569 d!33976))

(declare-fun d!33984 () Bool)

(declare-fun e!70425 () Bool)

(assert (=> d!33984 e!70425))

(declare-fun res!88671 () Bool)

(assert (=> d!33984 (=> (not res!88671) (not e!70425))))

(declare-fun lt!161090 () (_ BitVec 64))

(declare-fun lt!161093 () (_ BitVec 64))

(declare-fun lt!161091 () (_ BitVec 64))

(assert (=> d!33984 (= res!88671 (= lt!161090 (bvsub lt!161093 lt!161091)))))

(assert (=> d!33984 (or (= (bvand lt!161093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161091 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!161093 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!161093 lt!161091) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!33984 (= lt!161091 (remainingBits!0 ((_ sign_extend 32) (size!2244 (buf!2629 thiss!1305))) ((_ sign_extend 32) (currentByte!5153 thiss!1305)) ((_ sign_extend 32) (currentBit!5148 thiss!1305))))))

(declare-fun lt!161094 () (_ BitVec 64))

(declare-fun lt!161089 () (_ BitVec 64))

(assert (=> d!33984 (= lt!161093 (bvmul lt!161094 lt!161089))))

(assert (=> d!33984 (or (= lt!161094 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!161089 (bvsdiv (bvmul lt!161094 lt!161089) lt!161094)))))

(assert (=> d!33984 (= lt!161089 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!33984 (= lt!161094 ((_ sign_extend 32) (size!2244 (buf!2629 thiss!1305))))))

(assert (=> d!33984 (= lt!161090 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5153 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5148 thiss!1305))))))

(assert (=> d!33984 (invariant!0 (currentBit!5148 thiss!1305) (currentByte!5153 thiss!1305) (size!2244 (buf!2629 thiss!1305)))))

(assert (=> d!33984 (= (bitIndex!0 (size!2244 (buf!2629 thiss!1305)) (currentByte!5153 thiss!1305) (currentBit!5148 thiss!1305)) lt!161090)))

(declare-fun b!107593 () Bool)

(declare-fun res!88670 () Bool)

(assert (=> b!107593 (=> (not res!88670) (not e!70425))))

(assert (=> b!107593 (= res!88670 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!161090))))

(declare-fun b!107594 () Bool)

(declare-fun lt!161092 () (_ BitVec 64))

(assert (=> b!107594 (= e!70425 (bvsle lt!161090 (bvmul lt!161092 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107594 (or (= lt!161092 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!161092 #b0000000000000000000000000000000000000000000000000000000000001000) lt!161092)))))

(assert (=> b!107594 (= lt!161092 ((_ sign_extend 32) (size!2244 (buf!2629 thiss!1305))))))

(assert (= (and d!33984 res!88671) b!107593))

(assert (= (and b!107593 res!88670) b!107594))

(assert (=> d!33984 m!159081))

(declare-fun m!159099 () Bool)

(assert (=> d!33984 m!159099))

(assert (=> b!107569 d!33984))

(declare-fun d!33988 () Bool)

(declare-fun e!70430 () Bool)

(assert (=> d!33988 e!70430))

(declare-fun res!88680 () Bool)

(assert (=> d!33988 (=> (not res!88680) (not e!70430))))

(declare-fun lt!161152 () tuple2!8866)

(assert (=> d!33988 (= res!88680 (isPrefixOf!0 (_1!4690 lt!161152) (_2!4690 lt!161152)))))

(declare-fun lt!161135 () BitStream!3962)

(assert (=> d!33988 (= lt!161152 (tuple2!8867 lt!161135 (_2!4689 lt!161040)))))

(declare-fun lt!161148 () Unit!6590)

(declare-fun lt!161149 () Unit!6590)

(assert (=> d!33988 (= lt!161148 lt!161149)))

(assert (=> d!33988 (isPrefixOf!0 lt!161135 (_2!4689 lt!161040))))

(assert (=> d!33988 (= lt!161149 (lemmaIsPrefixTransitive!0 lt!161135 (_2!4689 lt!161040) (_2!4689 lt!161040)))))

(declare-fun lt!161144 () Unit!6590)

(declare-fun lt!161142 () Unit!6590)

(assert (=> d!33988 (= lt!161144 lt!161142)))

(assert (=> d!33988 (isPrefixOf!0 lt!161135 (_2!4689 lt!161040))))

(assert (=> d!33988 (= lt!161142 (lemmaIsPrefixTransitive!0 lt!161135 (_2!4689 lt!161028) (_2!4689 lt!161040)))))

(declare-fun lt!161146 () Unit!6590)

(declare-fun e!70431 () Unit!6590)

(assert (=> d!33988 (= lt!161146 e!70431)))

(declare-fun c!6632 () Bool)

(assert (=> d!33988 (= c!6632 (not (= (size!2244 (buf!2629 (_2!4689 lt!161028))) #b00000000000000000000000000000000)))))

(declare-fun lt!161147 () Unit!6590)

(declare-fun lt!161154 () Unit!6590)

(assert (=> d!33988 (= lt!161147 lt!161154)))

(assert (=> d!33988 (isPrefixOf!0 (_2!4689 lt!161040) (_2!4689 lt!161040))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!3962) Unit!6590)

(assert (=> d!33988 (= lt!161154 (lemmaIsPrefixRefl!0 (_2!4689 lt!161040)))))

(declare-fun lt!161136 () Unit!6590)

(declare-fun lt!161137 () Unit!6590)

(assert (=> d!33988 (= lt!161136 lt!161137)))

(assert (=> d!33988 (= lt!161137 (lemmaIsPrefixRefl!0 (_2!4689 lt!161040)))))

(declare-fun lt!161140 () Unit!6590)

(declare-fun lt!161138 () Unit!6590)

(assert (=> d!33988 (= lt!161140 lt!161138)))

(assert (=> d!33988 (isPrefixOf!0 lt!161135 lt!161135)))

(assert (=> d!33988 (= lt!161138 (lemmaIsPrefixRefl!0 lt!161135))))

(declare-fun lt!161145 () Unit!6590)

(declare-fun lt!161151 () Unit!6590)

(assert (=> d!33988 (= lt!161145 lt!161151)))

(assert (=> d!33988 (isPrefixOf!0 (_2!4689 lt!161028) (_2!4689 lt!161028))))

(assert (=> d!33988 (= lt!161151 (lemmaIsPrefixRefl!0 (_2!4689 lt!161028)))))

(assert (=> d!33988 (= lt!161135 (BitStream!3963 (buf!2629 (_2!4689 lt!161040)) (currentByte!5153 (_2!4689 lt!161028)) (currentBit!5148 (_2!4689 lt!161028))))))

(assert (=> d!33988 (isPrefixOf!0 (_2!4689 lt!161028) (_2!4689 lt!161040))))

(assert (=> d!33988 (= (reader!0 (_2!4689 lt!161028) (_2!4689 lt!161040)) lt!161152)))

(declare-fun b!107605 () Bool)

(declare-fun res!88679 () Bool)

(assert (=> b!107605 (=> (not res!88679) (not e!70430))))

(assert (=> b!107605 (= res!88679 (isPrefixOf!0 (_2!4690 lt!161152) (_2!4689 lt!161040)))))

(declare-fun b!107606 () Bool)

(declare-fun lt!161150 () Unit!6590)

(assert (=> b!107606 (= e!70431 lt!161150)))

(declare-fun lt!161143 () (_ BitVec 64))

(assert (=> b!107606 (= lt!161143 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161141 () (_ BitVec 64))

(assert (=> b!107606 (= lt!161141 (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161028))) (currentByte!5153 (_2!4689 lt!161028)) (currentBit!5148 (_2!4689 lt!161028))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!4929 array!4929 (_ BitVec 64) (_ BitVec 64)) Unit!6590)

(assert (=> b!107606 (= lt!161150 (arrayBitRangesEqSymmetric!0 (buf!2629 (_2!4689 lt!161028)) (buf!2629 (_2!4689 lt!161040)) lt!161143 lt!161141))))

(declare-fun arrayBitRangesEq!0 (array!4929 array!4929 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!107606 (arrayBitRangesEq!0 (buf!2629 (_2!4689 lt!161040)) (buf!2629 (_2!4689 lt!161028)) lt!161143 lt!161141)))

(declare-fun b!107607 () Bool)

(declare-fun Unit!6592 () Unit!6590)

(assert (=> b!107607 (= e!70431 Unit!6592)))

(declare-fun b!107608 () Bool)

(declare-fun res!88678 () Bool)

(assert (=> b!107608 (=> (not res!88678) (not e!70430))))

(assert (=> b!107608 (= res!88678 (isPrefixOf!0 (_1!4690 lt!161152) (_2!4689 lt!161028)))))

(declare-fun b!107609 () Bool)

(declare-fun lt!161153 () (_ BitVec 64))

(declare-fun lt!161139 () (_ BitVec 64))

(assert (=> b!107609 (= e!70430 (= (_1!4690 lt!161152) (withMovedBitIndex!0 (_2!4690 lt!161152) (bvsub lt!161153 lt!161139))))))

(assert (=> b!107609 (or (= (bvand lt!161153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161139 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!161153 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!161153 lt!161139) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107609 (= lt!161139 (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161040))) (currentByte!5153 (_2!4689 lt!161040)) (currentBit!5148 (_2!4689 lt!161040))))))

(assert (=> b!107609 (= lt!161153 (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161028))) (currentByte!5153 (_2!4689 lt!161028)) (currentBit!5148 (_2!4689 lt!161028))))))

(assert (= (and d!33988 c!6632) b!107606))

(assert (= (and d!33988 (not c!6632)) b!107607))

(assert (= (and d!33988 res!88680) b!107608))

(assert (= (and b!107608 res!88678) b!107605))

(assert (= (and b!107605 res!88679) b!107609))

(declare-fun m!159103 () Bool)

(assert (=> d!33988 m!159103))

(declare-fun m!159105 () Bool)

(assert (=> d!33988 m!159105))

(declare-fun m!159107 () Bool)

(assert (=> d!33988 m!159107))

(declare-fun m!159109 () Bool)

(assert (=> d!33988 m!159109))

(declare-fun m!159111 () Bool)

(assert (=> d!33988 m!159111))

(declare-fun m!159113 () Bool)

(assert (=> d!33988 m!159113))

(declare-fun m!159115 () Bool)

(assert (=> d!33988 m!159115))

(declare-fun m!159117 () Bool)

(assert (=> d!33988 m!159117))

(declare-fun m!159119 () Bool)

(assert (=> d!33988 m!159119))

(declare-fun m!159121 () Bool)

(assert (=> d!33988 m!159121))

(declare-fun m!159123 () Bool)

(assert (=> d!33988 m!159123))

(assert (=> b!107606 m!159017))

(declare-fun m!159125 () Bool)

(assert (=> b!107606 m!159125))

(declare-fun m!159127 () Bool)

(assert (=> b!107606 m!159127))

(declare-fun m!159129 () Bool)

(assert (=> b!107608 m!159129))

(declare-fun m!159131 () Bool)

(assert (=> b!107605 m!159131))

(declare-fun m!159133 () Bool)

(assert (=> b!107609 m!159133))

(assert (=> b!107609 m!159025))

(assert (=> b!107609 m!159017))

(assert (=> b!107570 d!33988))

(declare-datatypes ((tuple2!8872 0))(
  ( (tuple2!8873 (_1!4693 (_ BitVec 64)) (_2!4693 BitStream!3962)) )
))
(declare-fun lt!161157 () tuple2!8872)

(declare-fun d!33992 () Bool)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!3962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!8872)

(assert (=> d!33992 (= lt!161157 (readNLeastSignificantBitsLoop!0 (_1!4690 lt!161020) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!161014))))

(assert (=> d!33992 (= (readNLeastSignificantBitsLoopPure!0 (_1!4690 lt!161020) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!161014) (tuple2!8869 (_2!4693 lt!161157) (_1!4693 lt!161157)))))

(declare-fun bs!8291 () Bool)

(assert (= bs!8291 d!33992))

(declare-fun m!159135 () Bool)

(assert (=> bs!8291 m!159135))

(assert (=> b!107570 d!33992))

(declare-fun d!33994 () Bool)

(declare-fun lt!161158 () tuple2!8872)

(assert (=> d!33994 (= lt!161158 (readNLeastSignificantBitsLoop!0 (_1!4690 lt!161023) nBits!396 i!615 lt!161030))))

(assert (=> d!33994 (= (readNLeastSignificantBitsLoopPure!0 (_1!4690 lt!161023) nBits!396 i!615 lt!161030) (tuple2!8869 (_2!4693 lt!161158) (_1!4693 lt!161158)))))

(declare-fun bs!8292 () Bool)

(assert (= bs!8292 d!33994))

(declare-fun m!159137 () Bool)

(assert (=> bs!8292 m!159137))

(assert (=> b!107570 d!33994))

(declare-fun d!33996 () Bool)

(declare-datatypes ((tuple2!8874 0))(
  ( (tuple2!8875 (_1!4694 Bool) (_2!4694 BitStream!3962)) )
))
(declare-fun lt!161161 () tuple2!8874)

(declare-fun readBit!0 (BitStream!3962) tuple2!8874)

(assert (=> d!33996 (= lt!161161 (readBit!0 lt!161032))))

(assert (=> d!33996 (= (readBitPure!0 lt!161032) (tuple2!8871 (_2!4694 lt!161161) (_1!4694 lt!161161)))))

(declare-fun bs!8293 () Bool)

(assert (= bs!8293 d!33996))

(declare-fun m!159139 () Bool)

(assert (=> bs!8293 m!159139))

(assert (=> b!107570 d!33996))

(declare-fun d!33998 () Bool)

(declare-fun e!70434 () Bool)

(assert (=> d!33998 e!70434))

(declare-fun res!88683 () Bool)

(assert (=> d!33998 (=> (not res!88683) (not e!70434))))

(declare-fun lt!161172 () tuple2!8870)

(declare-fun lt!161173 () tuple2!8870)

(assert (=> d!33998 (= res!88683 (= (bitIndex!0 (size!2244 (buf!2629 (_1!4692 lt!161172))) (currentByte!5153 (_1!4692 lt!161172)) (currentBit!5148 (_1!4692 lt!161172))) (bitIndex!0 (size!2244 (buf!2629 (_1!4692 lt!161173))) (currentByte!5153 (_1!4692 lt!161173)) (currentBit!5148 (_1!4692 lt!161173)))))))

(declare-fun lt!161170 () BitStream!3962)

(declare-fun lt!161171 () Unit!6590)

(declare-fun choose!50 (BitStream!3962 BitStream!3962 BitStream!3962 tuple2!8870 tuple2!8870 BitStream!3962 Bool tuple2!8870 tuple2!8870 BitStream!3962 Bool) Unit!6590)

(assert (=> d!33998 (= lt!161171 (choose!50 lt!161032 (_2!4689 lt!161040) lt!161170 lt!161172 (tuple2!8871 (_1!4692 lt!161172) (_2!4692 lt!161172)) (_1!4692 lt!161172) (_2!4692 lt!161172) lt!161173 (tuple2!8871 (_1!4692 lt!161173) (_2!4692 lt!161173)) (_1!4692 lt!161173) (_2!4692 lt!161173)))))

(assert (=> d!33998 (= lt!161173 (readBitPure!0 lt!161170))))

(assert (=> d!33998 (= lt!161172 (readBitPure!0 lt!161032))))

(assert (=> d!33998 (= lt!161170 (BitStream!3963 (buf!2629 (_2!4689 lt!161040)) (currentByte!5153 lt!161032) (currentBit!5148 lt!161032)))))

(assert (=> d!33998 (invariant!0 (currentBit!5148 lt!161032) (currentByte!5153 lt!161032) (size!2244 (buf!2629 (_2!4689 lt!161040))))))

(assert (=> d!33998 (= (readBitPrefixLemma!0 lt!161032 (_2!4689 lt!161040)) lt!161171)))

(declare-fun b!107612 () Bool)

(assert (=> b!107612 (= e!70434 (= (_2!4692 lt!161172) (_2!4692 lt!161173)))))

(assert (= (and d!33998 res!88683) b!107612))

(assert (=> d!33998 m!159045))

(declare-fun m!159141 () Bool)

(assert (=> d!33998 m!159141))

(declare-fun m!159143 () Bool)

(assert (=> d!33998 m!159143))

(declare-fun m!159145 () Bool)

(assert (=> d!33998 m!159145))

(declare-fun m!159147 () Bool)

(assert (=> d!33998 m!159147))

(declare-fun m!159149 () Bool)

(assert (=> d!33998 m!159149))

(assert (=> b!107570 d!33998))

(declare-fun d!34000 () Bool)

(declare-fun lt!161174 () tuple2!8874)

(assert (=> d!34000 (= lt!161174 (readBit!0 (BitStream!3963 (buf!2629 (_2!4689 lt!161040)) (currentByte!5153 thiss!1305) (currentBit!5148 thiss!1305))))))

(assert (=> d!34000 (= (readBitPure!0 (BitStream!3963 (buf!2629 (_2!4689 lt!161040)) (currentByte!5153 thiss!1305) (currentBit!5148 thiss!1305))) (tuple2!8871 (_2!4694 lt!161174) (_1!4694 lt!161174)))))

(declare-fun bs!8294 () Bool)

(assert (= bs!8294 d!34000))

(declare-fun m!159151 () Bool)

(assert (=> bs!8294 m!159151))

(assert (=> b!107570 d!34000))

(declare-fun b!107692 () Bool)

(declare-fun e!70486 () Bool)

(declare-fun lt!161442 () tuple2!8870)

(declare-fun lt!161456 () tuple2!8870)

(assert (=> b!107692 (= e!70486 (= (_2!4692 lt!161442) (_2!4692 lt!161456)))))

(declare-fun b!107693 () Bool)

(declare-fun res!88743 () Bool)

(declare-fun lt!161463 () tuple2!8864)

(assert (=> b!107693 (= res!88743 (isPrefixOf!0 (_2!4689 lt!161028) (_2!4689 lt!161463)))))

(declare-fun e!70483 () Bool)

(assert (=> b!107693 (=> (not res!88743) (not e!70483))))

(declare-fun b!107694 () Bool)

(declare-fun res!88749 () Bool)

(declare-fun e!70482 () Bool)

(assert (=> b!107694 (=> (not res!88749) (not e!70482))))

(declare-fun lt!161467 () tuple2!8864)

(assert (=> b!107694 (= res!88749 (isPrefixOf!0 (_2!4689 lt!161028) (_2!4689 lt!161467)))))

(declare-fun b!107695 () Bool)

(declare-fun e!70484 () (_ BitVec 64))

(assert (=> b!107695 (= e!70484 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!107697 () Bool)

(declare-fun e!70485 () Bool)

(declare-fun lt!161451 () (_ BitVec 64))

(assert (=> b!107697 (= e!70485 (validate_offset_bits!1 ((_ sign_extend 32) (size!2244 (buf!2629 (_2!4689 lt!161028)))) ((_ sign_extend 32) (currentByte!5153 (_2!4689 lt!161028))) ((_ sign_extend 32) (currentBit!5148 (_2!4689 lt!161028))) lt!161451))))

(declare-fun b!107698 () Bool)

(declare-fun e!70481 () tuple2!8864)

(declare-fun lt!161453 () tuple2!8864)

(declare-fun Unit!6597 () Unit!6590)

(assert (=> b!107698 (= e!70481 (tuple2!8865 Unit!6597 (_2!4689 lt!161453)))))

(declare-fun lt!161436 () Bool)

(assert (=> b!107698 (= lt!161436 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107698 (= lt!161463 (appendBit!0 (_2!4689 lt!161028) lt!161436))))

(declare-fun res!88748 () Bool)

(assert (=> b!107698 (= res!88748 (= (size!2244 (buf!2629 (_2!4689 lt!161028))) (size!2244 (buf!2629 (_2!4689 lt!161463)))))))

(assert (=> b!107698 (=> (not res!88748) (not e!70483))))

(assert (=> b!107698 e!70483))

(declare-fun lt!161437 () tuple2!8864)

(assert (=> b!107698 (= lt!161437 lt!161463)))

(assert (=> b!107698 (= lt!161453 (appendNLeastSignificantBitsLoop!0 (_2!4689 lt!161437) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!161438 () Unit!6590)

(assert (=> b!107698 (= lt!161438 (lemmaIsPrefixTransitive!0 (_2!4689 lt!161028) (_2!4689 lt!161437) (_2!4689 lt!161453)))))

(declare-fun call!1365 () Bool)

(assert (=> b!107698 call!1365))

(declare-fun lt!161460 () Unit!6590)

(assert (=> b!107698 (= lt!161460 lt!161438)))

(assert (=> b!107698 (invariant!0 (currentBit!5148 (_2!4689 lt!161028)) (currentByte!5153 (_2!4689 lt!161028)) (size!2244 (buf!2629 (_2!4689 lt!161437))))))

(declare-fun lt!161473 () BitStream!3962)

(assert (=> b!107698 (= lt!161473 (BitStream!3963 (buf!2629 (_2!4689 lt!161437)) (currentByte!5153 (_2!4689 lt!161028)) (currentBit!5148 (_2!4689 lt!161028))))))

(assert (=> b!107698 (invariant!0 (currentBit!5148 lt!161473) (currentByte!5153 lt!161473) (size!2244 (buf!2629 (_2!4689 lt!161453))))))

(declare-fun lt!161474 () BitStream!3962)

(assert (=> b!107698 (= lt!161474 (BitStream!3963 (buf!2629 (_2!4689 lt!161453)) (currentByte!5153 lt!161473) (currentBit!5148 lt!161473)))))

(assert (=> b!107698 (= lt!161442 (readBitPure!0 lt!161473))))

(assert (=> b!107698 (= lt!161456 (readBitPure!0 lt!161474))))

(declare-fun lt!161431 () Unit!6590)

(assert (=> b!107698 (= lt!161431 (readBitPrefixLemma!0 lt!161473 (_2!4689 lt!161453)))))

(declare-fun res!88747 () Bool)

(assert (=> b!107698 (= res!88747 (= (bitIndex!0 (size!2244 (buf!2629 (_1!4692 lt!161442))) (currentByte!5153 (_1!4692 lt!161442)) (currentBit!5148 (_1!4692 lt!161442))) (bitIndex!0 (size!2244 (buf!2629 (_1!4692 lt!161456))) (currentByte!5153 (_1!4692 lt!161456)) (currentBit!5148 (_1!4692 lt!161456)))))))

(assert (=> b!107698 (=> (not res!88747) (not e!70486))))

(assert (=> b!107698 e!70486))

(declare-fun lt!161452 () Unit!6590)

(assert (=> b!107698 (= lt!161452 lt!161431)))

(declare-fun lt!161468 () tuple2!8866)

(assert (=> b!107698 (= lt!161468 (reader!0 (_2!4689 lt!161028) (_2!4689 lt!161453)))))

(declare-fun lt!161433 () tuple2!8866)

(assert (=> b!107698 (= lt!161433 (reader!0 (_2!4689 lt!161437) (_2!4689 lt!161453)))))

(declare-fun lt!161469 () tuple2!8870)

(assert (=> b!107698 (= lt!161469 (readBitPure!0 (_1!4690 lt!161468)))))

(assert (=> b!107698 (= (_2!4692 lt!161469) lt!161436)))

(declare-fun lt!161435 () Unit!6590)

(declare-fun Unit!6600 () Unit!6590)

(assert (=> b!107698 (= lt!161435 Unit!6600)))

(declare-fun lt!161459 () (_ BitVec 64))

(assert (=> b!107698 (= lt!161459 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!161449 () (_ BitVec 64))

(assert (=> b!107698 (= lt!161449 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!161447 () Unit!6590)

(assert (=> b!107698 (= lt!161447 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4689 lt!161028) (buf!2629 (_2!4689 lt!161453)) lt!161449))))

(assert (=> b!107698 (validate_offset_bits!1 ((_ sign_extend 32) (size!2244 (buf!2629 (_2!4689 lt!161453)))) ((_ sign_extend 32) (currentByte!5153 (_2!4689 lt!161028))) ((_ sign_extend 32) (currentBit!5148 (_2!4689 lt!161028))) lt!161449)))

(declare-fun lt!161464 () Unit!6590)

(assert (=> b!107698 (= lt!161464 lt!161447)))

(declare-fun lt!161471 () tuple2!8868)

(assert (=> b!107698 (= lt!161471 (readNLeastSignificantBitsLoopPure!0 (_1!4690 lt!161468) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!161459))))

(declare-fun lt!161441 () (_ BitVec 64))

(assert (=> b!107698 (= lt!161441 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!161458 () Unit!6590)

(assert (=> b!107698 (= lt!161458 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4689 lt!161437) (buf!2629 (_2!4689 lt!161453)) lt!161441))))

(assert (=> b!107698 (validate_offset_bits!1 ((_ sign_extend 32) (size!2244 (buf!2629 (_2!4689 lt!161453)))) ((_ sign_extend 32) (currentByte!5153 (_2!4689 lt!161437))) ((_ sign_extend 32) (currentBit!5148 (_2!4689 lt!161437))) lt!161441)))

(declare-fun lt!161454 () Unit!6590)

(assert (=> b!107698 (= lt!161454 lt!161458)))

(declare-fun lt!161448 () tuple2!8868)

(assert (=> b!107698 (= lt!161448 (readNLeastSignificantBitsLoopPure!0 (_1!4690 lt!161433) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!161459 (ite (_2!4692 lt!161469) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!161432 () tuple2!8868)

(assert (=> b!107698 (= lt!161432 (readNLeastSignificantBitsLoopPure!0 (_1!4690 lt!161468) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!161459))))

(declare-fun c!6643 () Bool)

(assert (=> b!107698 (= c!6643 (_2!4692 (readBitPure!0 (_1!4690 lt!161468))))))

(declare-fun lt!161472 () tuple2!8868)

(assert (=> b!107698 (= lt!161472 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4690 lt!161468) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!161459 e!70484)))))

(declare-fun lt!161445 () Unit!6590)

(assert (=> b!107698 (= lt!161445 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4690 lt!161468) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!161459))))

(assert (=> b!107698 (and (= (_2!4691 lt!161432) (_2!4691 lt!161472)) (= (_1!4691 lt!161432) (_1!4691 lt!161472)))))

(declare-fun lt!161434 () Unit!6590)

(assert (=> b!107698 (= lt!161434 lt!161445)))

(assert (=> b!107698 (= (_1!4690 lt!161468) (withMovedBitIndex!0 (_2!4690 lt!161468) (bvsub (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161028))) (currentByte!5153 (_2!4689 lt!161028)) (currentBit!5148 (_2!4689 lt!161028))) (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161453))) (currentByte!5153 (_2!4689 lt!161453)) (currentBit!5148 (_2!4689 lt!161453))))))))

(declare-fun lt!161444 () Unit!6590)

(declare-fun Unit!6601 () Unit!6590)

(assert (=> b!107698 (= lt!161444 Unit!6601)))

(assert (=> b!107698 (= (_1!4690 lt!161433) (withMovedBitIndex!0 (_2!4690 lt!161433) (bvsub (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161437))) (currentByte!5153 (_2!4689 lt!161437)) (currentBit!5148 (_2!4689 lt!161437))) (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161453))) (currentByte!5153 (_2!4689 lt!161453)) (currentBit!5148 (_2!4689 lt!161453))))))))

(declare-fun lt!161466 () Unit!6590)

(declare-fun Unit!6602 () Unit!6590)

(assert (=> b!107698 (= lt!161466 Unit!6602)))

(assert (=> b!107698 (= (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161028))) (currentByte!5153 (_2!4689 lt!161028)) (currentBit!5148 (_2!4689 lt!161028))) (bvsub (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161437))) (currentByte!5153 (_2!4689 lt!161437)) (currentBit!5148 (_2!4689 lt!161437))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!161455 () Unit!6590)

(declare-fun Unit!6603 () Unit!6590)

(assert (=> b!107698 (= lt!161455 Unit!6603)))

(assert (=> b!107698 (= (_2!4691 lt!161471) (_2!4691 lt!161448))))

(declare-fun lt!161461 () Unit!6590)

(declare-fun Unit!6604 () Unit!6590)

(assert (=> b!107698 (= lt!161461 Unit!6604)))

(assert (=> b!107698 (= (_1!4691 lt!161471) (_2!4690 lt!161468))))

(declare-fun b!107699 () Bool)

(assert (=> b!107699 (= e!70484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!107700 () Bool)

(declare-fun e!70480 () Bool)

(declare-fun lt!161430 () tuple2!8870)

(assert (=> b!107700 (= e!70480 (= (bitIndex!0 (size!2244 (buf!2629 (_1!4692 lt!161430))) (currentByte!5153 (_1!4692 lt!161430)) (currentBit!5148 (_1!4692 lt!161430))) (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161463))) (currentByte!5153 (_2!4689 lt!161463)) (currentBit!5148 (_2!4689 lt!161463)))))))

(declare-fun b!107701 () Bool)

(assert (=> b!107701 (= lt!161430 (readBitPure!0 (readerFrom!0 (_2!4689 lt!161463) (currentBit!5148 (_2!4689 lt!161028)) (currentByte!5153 (_2!4689 lt!161028)))))))

(declare-fun res!88746 () Bool)

(assert (=> b!107701 (= res!88746 (and (= (_2!4692 lt!161430) lt!161436) (= (_1!4692 lt!161430) (_2!4689 lt!161463))))))

(assert (=> b!107701 (=> (not res!88746) (not e!70480))))

(assert (=> b!107701 (= e!70483 e!70480)))

(declare-fun d!34002 () Bool)

(assert (=> d!34002 e!70482))

(declare-fun res!88745 () Bool)

(assert (=> d!34002 (=> (not res!88745) (not e!70482))))

(assert (=> d!34002 (= res!88745 (= (size!2244 (buf!2629 (_2!4689 lt!161028))) (size!2244 (buf!2629 (_2!4689 lt!161467)))))))

(assert (=> d!34002 (= lt!161467 e!70481)))

(declare-fun c!6644 () Bool)

(assert (=> d!34002 (= c!6644 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!34002 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!34002 (= (appendNLeastSignificantBitsLoop!0 (_2!4689 lt!161028) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!161467)))

(declare-fun b!107696 () Bool)

(declare-fun res!88744 () Bool)

(assert (=> b!107696 (=> (not res!88744) (not e!70482))))

(declare-fun lt!161465 () (_ BitVec 64))

(declare-fun lt!161439 () (_ BitVec 64))

(assert (=> b!107696 (= res!88744 (= (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161467))) (currentByte!5153 (_2!4689 lt!161467)) (currentBit!5148 (_2!4689 lt!161467))) (bvadd lt!161465 lt!161439)))))

(assert (=> b!107696 (or (not (= (bvand lt!161465 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161439 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!161465 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!161465 lt!161439) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107696 (= lt!161439 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!107696 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!107696 (= lt!161465 (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161028))) (currentByte!5153 (_2!4689 lt!161028)) (currentBit!5148 (_2!4689 lt!161028))))))

(declare-fun b!107702 () Bool)

(declare-fun lt!161450 () Unit!6590)

(assert (=> b!107702 (= e!70481 (tuple2!8865 lt!161450 (_2!4689 lt!161028)))))

(declare-fun lt!161457 () BitStream!3962)

(assert (=> b!107702 (= lt!161457 (_2!4689 lt!161028))))

(assert (=> b!107702 (= lt!161450 (lemmaIsPrefixRefl!0 lt!161457))))

(assert (=> b!107702 call!1365))

(declare-fun bm!1362 () Bool)

(assert (=> bm!1362 (= call!1365 (isPrefixOf!0 (ite c!6644 (_2!4689 lt!161028) lt!161457) (ite c!6644 (_2!4689 lt!161453) lt!161457)))))

(declare-fun b!107703 () Bool)

(declare-fun lt!161446 () tuple2!8866)

(declare-fun lt!161470 () tuple2!8868)

(assert (=> b!107703 (= e!70482 (and (= (_2!4691 lt!161470) v!199) (= (_1!4691 lt!161470) (_2!4690 lt!161446))))))

(declare-fun lt!161462 () (_ BitVec 64))

(assert (=> b!107703 (= lt!161470 (readNLeastSignificantBitsLoopPure!0 (_1!4690 lt!161446) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!161462))))

(declare-fun lt!161443 () Unit!6590)

(declare-fun lt!161440 () Unit!6590)

(assert (=> b!107703 (= lt!161443 lt!161440)))

(assert (=> b!107703 (validate_offset_bits!1 ((_ sign_extend 32) (size!2244 (buf!2629 (_2!4689 lt!161467)))) ((_ sign_extend 32) (currentByte!5153 (_2!4689 lt!161028))) ((_ sign_extend 32) (currentBit!5148 (_2!4689 lt!161028))) lt!161451)))

(assert (=> b!107703 (= lt!161440 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4689 lt!161028) (buf!2629 (_2!4689 lt!161467)) lt!161451))))

(assert (=> b!107703 e!70485))

(declare-fun res!88750 () Bool)

(assert (=> b!107703 (=> (not res!88750) (not e!70485))))

(assert (=> b!107703 (= res!88750 (and (= (size!2244 (buf!2629 (_2!4689 lt!161028))) (size!2244 (buf!2629 (_2!4689 lt!161467)))) (bvsge lt!161451 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107703 (= lt!161451 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!107703 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!107703 (= lt!161462 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!107703 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!107703 (= lt!161446 (reader!0 (_2!4689 lt!161028) (_2!4689 lt!161467)))))

(declare-fun b!107704 () Bool)

(declare-fun res!88751 () Bool)

(assert (=> b!107704 (= res!88751 (= (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161463))) (currentByte!5153 (_2!4689 lt!161463)) (currentBit!5148 (_2!4689 lt!161463))) (bvadd (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161028))) (currentByte!5153 (_2!4689 lt!161028)) (currentBit!5148 (_2!4689 lt!161028))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!107704 (=> (not res!88751) (not e!70483))))

(assert (= (and d!34002 c!6644) b!107698))

(assert (= (and d!34002 (not c!6644)) b!107702))

(assert (= (and b!107698 res!88748) b!107704))

(assert (= (and b!107704 res!88751) b!107693))

(assert (= (and b!107693 res!88743) b!107701))

(assert (= (and b!107701 res!88746) b!107700))

(assert (= (and b!107698 res!88747) b!107692))

(assert (= (and b!107698 c!6643) b!107695))

(assert (= (and b!107698 (not c!6643)) b!107699))

(assert (= (or b!107698 b!107702) bm!1362))

(assert (= (and d!34002 res!88745) b!107696))

(assert (= (and b!107696 res!88744) b!107694))

(assert (= (and b!107694 res!88749) b!107703))

(assert (= (and b!107703 res!88750) b!107697))

(declare-fun m!159265 () Bool)

(assert (=> b!107704 m!159265))

(assert (=> b!107704 m!159017))

(declare-fun m!159267 () Bool)

(assert (=> b!107697 m!159267))

(declare-fun m!159269 () Bool)

(assert (=> b!107702 m!159269))

(declare-fun m!159271 () Bool)

(assert (=> bm!1362 m!159271))

(declare-fun m!159273 () Bool)

(assert (=> b!107694 m!159273))

(declare-fun m!159275 () Bool)

(assert (=> b!107703 m!159275))

(declare-fun m!159277 () Bool)

(assert (=> b!107703 m!159277))

(declare-fun m!159279 () Bool)

(assert (=> b!107703 m!159279))

(declare-fun m!159281 () Bool)

(assert (=> b!107703 m!159281))

(declare-fun m!159283 () Bool)

(assert (=> b!107703 m!159283))

(declare-fun m!159285 () Bool)

(assert (=> b!107698 m!159285))

(declare-fun m!159287 () Bool)

(assert (=> b!107698 m!159287))

(declare-fun m!159289 () Bool)

(assert (=> b!107698 m!159289))

(declare-fun m!159291 () Bool)

(assert (=> b!107698 m!159291))

(declare-fun m!159293 () Bool)

(assert (=> b!107698 m!159293))

(declare-fun m!159295 () Bool)

(assert (=> b!107698 m!159295))

(declare-fun m!159297 () Bool)

(assert (=> b!107698 m!159297))

(declare-fun m!159299 () Bool)

(assert (=> b!107698 m!159299))

(declare-fun m!159301 () Bool)

(assert (=> b!107698 m!159301))

(declare-fun m!159303 () Bool)

(assert (=> b!107698 m!159303))

(declare-fun m!159305 () Bool)

(assert (=> b!107698 m!159305))

(declare-fun m!159307 () Bool)

(assert (=> b!107698 m!159307))

(declare-fun m!159309 () Bool)

(assert (=> b!107698 m!159309))

(declare-fun m!159311 () Bool)

(assert (=> b!107698 m!159311))

(declare-fun m!159313 () Bool)

(assert (=> b!107698 m!159313))

(declare-fun m!159315 () Bool)

(assert (=> b!107698 m!159315))

(assert (=> b!107698 m!159017))

(declare-fun m!159317 () Bool)

(assert (=> b!107698 m!159317))

(declare-fun m!159319 () Bool)

(assert (=> b!107698 m!159319))

(declare-fun m!159321 () Bool)

(assert (=> b!107698 m!159321))

(declare-fun m!159323 () Bool)

(assert (=> b!107698 m!159323))

(assert (=> b!107698 m!159287))

(declare-fun m!159325 () Bool)

(assert (=> b!107698 m!159325))

(declare-fun m!159327 () Bool)

(assert (=> b!107698 m!159327))

(declare-fun m!159329 () Bool)

(assert (=> b!107698 m!159329))

(declare-fun m!159331 () Bool)

(assert (=> b!107698 m!159331))

(declare-fun m!159333 () Bool)

(assert (=> b!107698 m!159333))

(assert (=> b!107698 m!159281))

(declare-fun m!159335 () Bool)

(assert (=> b!107698 m!159335))

(declare-fun m!159337 () Bool)

(assert (=> b!107693 m!159337))

(declare-fun m!159339 () Bool)

(assert (=> b!107701 m!159339))

(assert (=> b!107701 m!159339))

(declare-fun m!159341 () Bool)

(assert (=> b!107701 m!159341))

(declare-fun m!159343 () Bool)

(assert (=> b!107696 m!159343))

(assert (=> b!107696 m!159017))

(declare-fun m!159345 () Bool)

(assert (=> b!107700 m!159345))

(assert (=> b!107700 m!159265))

(assert (=> b!107570 d!34002))

(declare-fun d!34028 () Bool)

(assert (=> d!34028 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2244 (buf!2629 (_2!4689 lt!161040)))) ((_ sign_extend 32) (currentByte!5153 thiss!1305)) ((_ sign_extend 32) (currentBit!5148 thiss!1305)) lt!161025) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2244 (buf!2629 (_2!4689 lt!161040)))) ((_ sign_extend 32) (currentByte!5153 thiss!1305)) ((_ sign_extend 32) (currentBit!5148 thiss!1305))) lt!161025))))

(declare-fun bs!8302 () Bool)

(assert (= bs!8302 d!34028))

(declare-fun m!159347 () Bool)

(assert (=> bs!8302 m!159347))

(assert (=> b!107570 d!34028))

(declare-fun d!34030 () Bool)

(assert (=> d!34030 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!107570 d!34030))

(declare-fun d!34032 () Bool)

(declare-fun lt!161477 () tuple2!8874)

(assert (=> d!34032 (= lt!161477 (readBit!0 (_1!4690 lt!161023)))))

(assert (=> d!34032 (= (readBitPure!0 (_1!4690 lt!161023)) (tuple2!8871 (_2!4694 lt!161477) (_1!4694 lt!161477)))))

(declare-fun bs!8303 () Bool)

(assert (= bs!8303 d!34032))

(declare-fun m!159349 () Bool)

(assert (=> bs!8303 m!159349))

(assert (=> b!107570 d!34032))

(declare-fun d!34034 () Bool)

(assert (=> d!34034 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2244 (buf!2629 (_2!4689 lt!161040)))) ((_ sign_extend 32) (currentByte!5153 (_2!4689 lt!161028))) ((_ sign_extend 32) (currentBit!5148 (_2!4689 lt!161028))) lt!161036) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2244 (buf!2629 (_2!4689 lt!161040)))) ((_ sign_extend 32) (currentByte!5153 (_2!4689 lt!161028))) ((_ sign_extend 32) (currentBit!5148 (_2!4689 lt!161028)))) lt!161036))))

(declare-fun bs!8304 () Bool)

(assert (= bs!8304 d!34034))

(declare-fun m!159351 () Bool)

(assert (=> bs!8304 m!159351))

(assert (=> b!107570 d!34034))

(declare-fun d!34036 () Bool)

(assert (=> d!34036 (validate_offset_bits!1 ((_ sign_extend 32) (size!2244 (buf!2629 (_2!4689 lt!161040)))) ((_ sign_extend 32) (currentByte!5153 (_2!4689 lt!161028))) ((_ sign_extend 32) (currentBit!5148 (_2!4689 lt!161028))) lt!161036)))

(declare-fun lt!161486 () Unit!6590)

(declare-fun choose!9 (BitStream!3962 array!4929 (_ BitVec 64) BitStream!3962) Unit!6590)

(assert (=> d!34036 (= lt!161486 (choose!9 (_2!4689 lt!161028) (buf!2629 (_2!4689 lt!161040)) lt!161036 (BitStream!3963 (buf!2629 (_2!4689 lt!161040)) (currentByte!5153 (_2!4689 lt!161028)) (currentBit!5148 (_2!4689 lt!161028)))))))

(assert (=> d!34036 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4689 lt!161028) (buf!2629 (_2!4689 lt!161040)) lt!161036) lt!161486)))

(declare-fun bs!8305 () Bool)

(assert (= bs!8305 d!34036))

(assert (=> bs!8305 m!159071))

(declare-fun m!159353 () Bool)

(assert (=> bs!8305 m!159353))

(assert (=> b!107570 d!34036))

(declare-fun d!34038 () Bool)

(declare-fun e!70491 () Bool)

(assert (=> d!34038 e!70491))

(declare-fun res!88761 () Bool)

(assert (=> d!34038 (=> (not res!88761) (not e!70491))))

(declare-fun lt!161491 () (_ BitVec 64))

(declare-fun lt!161489 () (_ BitVec 64))

(declare-fun lt!161488 () (_ BitVec 64))

(assert (=> d!34038 (= res!88761 (= lt!161488 (bvsub lt!161491 lt!161489)))))

(assert (=> d!34038 (or (= (bvand lt!161491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161489 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!161491 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!161491 lt!161489) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34038 (= lt!161489 (remainingBits!0 ((_ sign_extend 32) (size!2244 (buf!2629 (_1!4692 lt!161031)))) ((_ sign_extend 32) (currentByte!5153 (_1!4692 lt!161031))) ((_ sign_extend 32) (currentBit!5148 (_1!4692 lt!161031)))))))

(declare-fun lt!161492 () (_ BitVec 64))

(declare-fun lt!161487 () (_ BitVec 64))

(assert (=> d!34038 (= lt!161491 (bvmul lt!161492 lt!161487))))

(assert (=> d!34038 (or (= lt!161492 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!161487 (bvsdiv (bvmul lt!161492 lt!161487) lt!161492)))))

(assert (=> d!34038 (= lt!161487 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34038 (= lt!161492 ((_ sign_extend 32) (size!2244 (buf!2629 (_1!4692 lt!161031)))))))

(assert (=> d!34038 (= lt!161488 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5153 (_1!4692 lt!161031))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5148 (_1!4692 lt!161031)))))))

(assert (=> d!34038 (invariant!0 (currentBit!5148 (_1!4692 lt!161031)) (currentByte!5153 (_1!4692 lt!161031)) (size!2244 (buf!2629 (_1!4692 lt!161031))))))

(assert (=> d!34038 (= (bitIndex!0 (size!2244 (buf!2629 (_1!4692 lt!161031))) (currentByte!5153 (_1!4692 lt!161031)) (currentBit!5148 (_1!4692 lt!161031))) lt!161488)))

(declare-fun b!107714 () Bool)

(declare-fun res!88760 () Bool)

(assert (=> b!107714 (=> (not res!88760) (not e!70491))))

(assert (=> b!107714 (= res!88760 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!161488))))

(declare-fun b!107715 () Bool)

(declare-fun lt!161490 () (_ BitVec 64))

(assert (=> b!107715 (= e!70491 (bvsle lt!161488 (bvmul lt!161490 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107715 (or (= lt!161490 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!161490 #b0000000000000000000000000000000000000000000000000000000000001000) lt!161490)))))

(assert (=> b!107715 (= lt!161490 ((_ sign_extend 32) (size!2244 (buf!2629 (_1!4692 lt!161031)))))))

(assert (= (and d!34038 res!88761) b!107714))

(assert (= (and b!107714 res!88760) b!107715))

(declare-fun m!159355 () Bool)

(assert (=> d!34038 m!159355))

(declare-fun m!159357 () Bool)

(assert (=> d!34038 m!159357))

(assert (=> b!107570 d!34038))

(declare-fun d!34040 () Bool)

(declare-fun e!70494 () Bool)

(assert (=> d!34040 e!70494))

(declare-fun res!88767 () Bool)

(assert (=> d!34040 (=> (not res!88767) (not e!70494))))

(declare-fun lt!161499 () (_ BitVec 64))

(declare-fun lt!161498 () (_ BitVec 64))

(declare-fun lt!161501 () (_ BitVec 64))

(assert (=> d!34040 (= res!88767 (= lt!161498 (bvsub lt!161501 lt!161499)))))

(assert (=> d!34040 (or (= (bvand lt!161501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161499 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!161501 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!161501 lt!161499) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34040 (= lt!161499 (remainingBits!0 ((_ sign_extend 32) (size!2244 (buf!2629 (_1!4692 lt!161018)))) ((_ sign_extend 32) (currentByte!5153 (_1!4692 lt!161018))) ((_ sign_extend 32) (currentBit!5148 (_1!4692 lt!161018)))))))

(declare-fun lt!161502 () (_ BitVec 64))

(declare-fun lt!161497 () (_ BitVec 64))

(assert (=> d!34040 (= lt!161501 (bvmul lt!161502 lt!161497))))

(assert (=> d!34040 (or (= lt!161502 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!161497 (bvsdiv (bvmul lt!161502 lt!161497) lt!161502)))))

(assert (=> d!34040 (= lt!161497 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34040 (= lt!161502 ((_ sign_extend 32) (size!2244 (buf!2629 (_1!4692 lt!161018)))))))

(assert (=> d!34040 (= lt!161498 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5153 (_1!4692 lt!161018))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5148 (_1!4692 lt!161018)))))))

(assert (=> d!34040 (invariant!0 (currentBit!5148 (_1!4692 lt!161018)) (currentByte!5153 (_1!4692 lt!161018)) (size!2244 (buf!2629 (_1!4692 lt!161018))))))

(assert (=> d!34040 (= (bitIndex!0 (size!2244 (buf!2629 (_1!4692 lt!161018))) (currentByte!5153 (_1!4692 lt!161018)) (currentBit!5148 (_1!4692 lt!161018))) lt!161498)))

(declare-fun b!107720 () Bool)

(declare-fun res!88766 () Bool)

(assert (=> b!107720 (=> (not res!88766) (not e!70494))))

(assert (=> b!107720 (= res!88766 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!161498))))

(declare-fun b!107721 () Bool)

(declare-fun lt!161500 () (_ BitVec 64))

(assert (=> b!107721 (= e!70494 (bvsle lt!161498 (bvmul lt!161500 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107721 (or (= lt!161500 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!161500 #b0000000000000000000000000000000000000000000000000000000000001000) lt!161500)))))

(assert (=> b!107721 (= lt!161500 ((_ sign_extend 32) (size!2244 (buf!2629 (_1!4692 lt!161018)))))))

(assert (= (and d!34040 res!88767) b!107720))

(assert (= (and b!107720 res!88766) b!107721))

(declare-fun m!159359 () Bool)

(assert (=> d!34040 m!159359))

(declare-fun m!159361 () Bool)

(assert (=> d!34040 m!159361))

(assert (=> b!107570 d!34040))

(declare-fun d!34042 () Bool)

(declare-fun e!70495 () Bool)

(assert (=> d!34042 e!70495))

(declare-fun res!88770 () Bool)

(assert (=> d!34042 (=> (not res!88770) (not e!70495))))

(declare-fun lt!161520 () tuple2!8866)

(assert (=> d!34042 (= res!88770 (isPrefixOf!0 (_1!4690 lt!161520) (_2!4690 lt!161520)))))

(declare-fun lt!161503 () BitStream!3962)

(assert (=> d!34042 (= lt!161520 (tuple2!8867 lt!161503 (_2!4689 lt!161040)))))

(declare-fun lt!161516 () Unit!6590)

(declare-fun lt!161517 () Unit!6590)

(assert (=> d!34042 (= lt!161516 lt!161517)))

(assert (=> d!34042 (isPrefixOf!0 lt!161503 (_2!4689 lt!161040))))

(assert (=> d!34042 (= lt!161517 (lemmaIsPrefixTransitive!0 lt!161503 (_2!4689 lt!161040) (_2!4689 lt!161040)))))

(declare-fun lt!161512 () Unit!6590)

(declare-fun lt!161510 () Unit!6590)

(assert (=> d!34042 (= lt!161512 lt!161510)))

(assert (=> d!34042 (isPrefixOf!0 lt!161503 (_2!4689 lt!161040))))

(assert (=> d!34042 (= lt!161510 (lemmaIsPrefixTransitive!0 lt!161503 thiss!1305 (_2!4689 lt!161040)))))

(declare-fun lt!161514 () Unit!6590)

(declare-fun e!70496 () Unit!6590)

(assert (=> d!34042 (= lt!161514 e!70496)))

(declare-fun c!6645 () Bool)

(assert (=> d!34042 (= c!6645 (not (= (size!2244 (buf!2629 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!161515 () Unit!6590)

(declare-fun lt!161522 () Unit!6590)

(assert (=> d!34042 (= lt!161515 lt!161522)))

(assert (=> d!34042 (isPrefixOf!0 (_2!4689 lt!161040) (_2!4689 lt!161040))))

(assert (=> d!34042 (= lt!161522 (lemmaIsPrefixRefl!0 (_2!4689 lt!161040)))))

(declare-fun lt!161504 () Unit!6590)

(declare-fun lt!161505 () Unit!6590)

(assert (=> d!34042 (= lt!161504 lt!161505)))

(assert (=> d!34042 (= lt!161505 (lemmaIsPrefixRefl!0 (_2!4689 lt!161040)))))

(declare-fun lt!161508 () Unit!6590)

(declare-fun lt!161506 () Unit!6590)

(assert (=> d!34042 (= lt!161508 lt!161506)))

(assert (=> d!34042 (isPrefixOf!0 lt!161503 lt!161503)))

(assert (=> d!34042 (= lt!161506 (lemmaIsPrefixRefl!0 lt!161503))))

(declare-fun lt!161513 () Unit!6590)

(declare-fun lt!161519 () Unit!6590)

(assert (=> d!34042 (= lt!161513 lt!161519)))

(assert (=> d!34042 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!34042 (= lt!161519 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!34042 (= lt!161503 (BitStream!3963 (buf!2629 (_2!4689 lt!161040)) (currentByte!5153 thiss!1305) (currentBit!5148 thiss!1305)))))

(assert (=> d!34042 (isPrefixOf!0 thiss!1305 (_2!4689 lt!161040))))

(assert (=> d!34042 (= (reader!0 thiss!1305 (_2!4689 lt!161040)) lt!161520)))

(declare-fun b!107722 () Bool)

(declare-fun res!88769 () Bool)

(assert (=> b!107722 (=> (not res!88769) (not e!70495))))

(assert (=> b!107722 (= res!88769 (isPrefixOf!0 (_2!4690 lt!161520) (_2!4689 lt!161040)))))

(declare-fun b!107723 () Bool)

(declare-fun lt!161518 () Unit!6590)

(assert (=> b!107723 (= e!70496 lt!161518)))

(declare-fun lt!161511 () (_ BitVec 64))

(assert (=> b!107723 (= lt!161511 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!161509 () (_ BitVec 64))

(assert (=> b!107723 (= lt!161509 (bitIndex!0 (size!2244 (buf!2629 thiss!1305)) (currentByte!5153 thiss!1305) (currentBit!5148 thiss!1305)))))

(assert (=> b!107723 (= lt!161518 (arrayBitRangesEqSymmetric!0 (buf!2629 thiss!1305) (buf!2629 (_2!4689 lt!161040)) lt!161511 lt!161509))))

(assert (=> b!107723 (arrayBitRangesEq!0 (buf!2629 (_2!4689 lt!161040)) (buf!2629 thiss!1305) lt!161511 lt!161509)))

(declare-fun b!107724 () Bool)

(declare-fun Unit!6607 () Unit!6590)

(assert (=> b!107724 (= e!70496 Unit!6607)))

(declare-fun b!107725 () Bool)

(declare-fun res!88768 () Bool)

(assert (=> b!107725 (=> (not res!88768) (not e!70495))))

(assert (=> b!107725 (= res!88768 (isPrefixOf!0 (_1!4690 lt!161520) thiss!1305))))

(declare-fun lt!161507 () (_ BitVec 64))

(declare-fun b!107726 () Bool)

(declare-fun lt!161521 () (_ BitVec 64))

(assert (=> b!107726 (= e!70495 (= (_1!4690 lt!161520) (withMovedBitIndex!0 (_2!4690 lt!161520) (bvsub lt!161521 lt!161507))))))

(assert (=> b!107726 (or (= (bvand lt!161521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161507 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!161521 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!161521 lt!161507) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107726 (= lt!161507 (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161040))) (currentByte!5153 (_2!4689 lt!161040)) (currentBit!5148 (_2!4689 lt!161040))))))

(assert (=> b!107726 (= lt!161521 (bitIndex!0 (size!2244 (buf!2629 thiss!1305)) (currentByte!5153 thiss!1305) (currentBit!5148 thiss!1305)))))

(assert (= (and d!34042 c!6645) b!107723))

(assert (= (and d!34042 (not c!6645)) b!107724))

(assert (= (and d!34042 res!88770) b!107725))

(assert (= (and b!107725 res!88768) b!107722))

(assert (= (and b!107722 res!88769) b!107726))

(declare-fun m!159377 () Bool)

(assert (=> d!34042 m!159377))

(declare-fun m!159379 () Bool)

(assert (=> d!34042 m!159379))

(assert (=> d!34042 m!159107))

(declare-fun m!159381 () Bool)

(assert (=> d!34042 m!159381))

(declare-fun m!159383 () Bool)

(assert (=> d!34042 m!159383))

(declare-fun m!159385 () Bool)

(assert (=> d!34042 m!159385))

(declare-fun m!159387 () Bool)

(assert (=> d!34042 m!159387))

(assert (=> d!34042 m!159059))

(assert (=> d!34042 m!159119))

(declare-fun m!159389 () Bool)

(assert (=> d!34042 m!159389))

(declare-fun m!159391 () Bool)

(assert (=> d!34042 m!159391))

(assert (=> b!107723 m!159027))

(declare-fun m!159393 () Bool)

(assert (=> b!107723 m!159393))

(declare-fun m!159395 () Bool)

(assert (=> b!107723 m!159395))

(declare-fun m!159397 () Bool)

(assert (=> b!107725 m!159397))

(declare-fun m!159399 () Bool)

(assert (=> b!107722 m!159399))

(declare-fun m!159401 () Bool)

(assert (=> b!107726 m!159401))

(assert (=> b!107726 m!159025))

(assert (=> b!107726 m!159027))

(assert (=> b!107570 d!34042))

(declare-fun d!34046 () Bool)

(declare-fun res!88779 () Bool)

(declare-fun e!70501 () Bool)

(assert (=> d!34046 (=> (not res!88779) (not e!70501))))

(assert (=> d!34046 (= res!88779 (= (size!2244 (buf!2629 thiss!1305)) (size!2244 (buf!2629 (_2!4689 lt!161040)))))))

(assert (=> d!34046 (= (isPrefixOf!0 thiss!1305 (_2!4689 lt!161040)) e!70501)))

(declare-fun b!107733 () Bool)

(declare-fun res!88778 () Bool)

(assert (=> b!107733 (=> (not res!88778) (not e!70501))))

(assert (=> b!107733 (= res!88778 (bvsle (bitIndex!0 (size!2244 (buf!2629 thiss!1305)) (currentByte!5153 thiss!1305) (currentBit!5148 thiss!1305)) (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161040))) (currentByte!5153 (_2!4689 lt!161040)) (currentBit!5148 (_2!4689 lt!161040)))))))

(declare-fun b!107734 () Bool)

(declare-fun e!70502 () Bool)

(assert (=> b!107734 (= e!70501 e!70502)))

(declare-fun res!88777 () Bool)

(assert (=> b!107734 (=> res!88777 e!70502)))

(assert (=> b!107734 (= res!88777 (= (size!2244 (buf!2629 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!107735 () Bool)

(assert (=> b!107735 (= e!70502 (arrayBitRangesEq!0 (buf!2629 thiss!1305) (buf!2629 (_2!4689 lt!161040)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2244 (buf!2629 thiss!1305)) (currentByte!5153 thiss!1305) (currentBit!5148 thiss!1305))))))

(assert (= (and d!34046 res!88779) b!107733))

(assert (= (and b!107733 res!88778) b!107734))

(assert (= (and b!107734 (not res!88777)) b!107735))

(assert (=> b!107733 m!159027))

(assert (=> b!107733 m!159025))

(assert (=> b!107735 m!159027))

(assert (=> b!107735 m!159027))

(declare-fun m!159403 () Bool)

(assert (=> b!107735 m!159403))

(assert (=> b!107570 d!34046))

(declare-fun b!107746 () Bool)

(declare-fun res!88791 () Bool)

(declare-fun e!70508 () Bool)

(assert (=> b!107746 (=> (not res!88791) (not e!70508))))

(declare-fun lt!161534 () tuple2!8864)

(assert (=> b!107746 (= res!88791 (isPrefixOf!0 thiss!1305 (_2!4689 lt!161534)))))

(declare-fun d!34048 () Bool)

(assert (=> d!34048 e!70508))

(declare-fun res!88789 () Bool)

(assert (=> d!34048 (=> (not res!88789) (not e!70508))))

(assert (=> d!34048 (= res!88789 (= (size!2244 (buf!2629 thiss!1305)) (size!2244 (buf!2629 (_2!4689 lt!161534)))))))

(declare-fun choose!16 (BitStream!3962 Bool) tuple2!8864)

(assert (=> d!34048 (= lt!161534 (choose!16 thiss!1305 lt!161019))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!34048 (validate_offset_bit!0 ((_ sign_extend 32) (size!2244 (buf!2629 thiss!1305))) ((_ sign_extend 32) (currentByte!5153 thiss!1305)) ((_ sign_extend 32) (currentBit!5148 thiss!1305)))))

(assert (=> d!34048 (= (appendBit!0 thiss!1305 lt!161019) lt!161534)))

(declare-fun b!107748 () Bool)

(declare-fun e!70507 () Bool)

(declare-fun lt!161532 () tuple2!8870)

(assert (=> b!107748 (= e!70507 (= (bitIndex!0 (size!2244 (buf!2629 (_1!4692 lt!161532))) (currentByte!5153 (_1!4692 lt!161532)) (currentBit!5148 (_1!4692 lt!161532))) (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161534))) (currentByte!5153 (_2!4689 lt!161534)) (currentBit!5148 (_2!4689 lt!161534)))))))

(declare-fun b!107747 () Bool)

(assert (=> b!107747 (= e!70508 e!70507)))

(declare-fun res!88788 () Bool)

(assert (=> b!107747 (=> (not res!88788) (not e!70507))))

(assert (=> b!107747 (= res!88788 (and (= (_2!4692 lt!161532) lt!161019) (= (_1!4692 lt!161532) (_2!4689 lt!161534))))))

(assert (=> b!107747 (= lt!161532 (readBitPure!0 (readerFrom!0 (_2!4689 lt!161534) (currentBit!5148 thiss!1305) (currentByte!5153 thiss!1305))))))

(declare-fun b!107745 () Bool)

(declare-fun res!88790 () Bool)

(assert (=> b!107745 (=> (not res!88790) (not e!70508))))

(declare-fun lt!161531 () (_ BitVec 64))

(declare-fun lt!161533 () (_ BitVec 64))

(assert (=> b!107745 (= res!88790 (= (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161534))) (currentByte!5153 (_2!4689 lt!161534)) (currentBit!5148 (_2!4689 lt!161534))) (bvadd lt!161533 lt!161531)))))

(assert (=> b!107745 (or (not (= (bvand lt!161533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161531 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!161533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!161533 lt!161531) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!107745 (= lt!161531 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!107745 (= lt!161533 (bitIndex!0 (size!2244 (buf!2629 thiss!1305)) (currentByte!5153 thiss!1305) (currentBit!5148 thiss!1305)))))

(assert (= (and d!34048 res!88789) b!107745))

(assert (= (and b!107745 res!88790) b!107746))

(assert (= (and b!107746 res!88791) b!107747))

(assert (= (and b!107747 res!88788) b!107748))

(declare-fun m!159405 () Bool)

(assert (=> b!107746 m!159405))

(declare-fun m!159407 () Bool)

(assert (=> d!34048 m!159407))

(declare-fun m!159409 () Bool)

(assert (=> d!34048 m!159409))

(declare-fun m!159411 () Bool)

(assert (=> b!107745 m!159411))

(assert (=> b!107745 m!159027))

(declare-fun m!159413 () Bool)

(assert (=> b!107748 m!159413))

(assert (=> b!107748 m!159411))

(declare-fun m!159415 () Bool)

(assert (=> b!107747 m!159415))

(assert (=> b!107747 m!159415))

(declare-fun m!159417 () Bool)

(assert (=> b!107747 m!159417))

(assert (=> b!107570 d!34048))

(declare-fun d!34050 () Bool)

(assert (=> d!34050 (validate_offset_bits!1 ((_ sign_extend 32) (size!2244 (buf!2629 (_2!4689 lt!161040)))) ((_ sign_extend 32) (currentByte!5153 thiss!1305)) ((_ sign_extend 32) (currentBit!5148 thiss!1305)) lt!161025)))

(declare-fun lt!161537 () Unit!6590)

(assert (=> d!34050 (= lt!161537 (choose!9 thiss!1305 (buf!2629 (_2!4689 lt!161040)) lt!161025 (BitStream!3963 (buf!2629 (_2!4689 lt!161040)) (currentByte!5153 thiss!1305) (currentBit!5148 thiss!1305))))))

(assert (=> d!34050 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2629 (_2!4689 lt!161040)) lt!161025) lt!161537)))

(declare-fun bs!8306 () Bool)

(assert (= bs!8306 d!34050))

(assert (=> bs!8306 m!159051))

(declare-fun m!159419 () Bool)

(assert (=> bs!8306 m!159419))

(assert (=> b!107570 d!34050))

(declare-fun d!34052 () Bool)

(assert (=> d!34052 (isPrefixOf!0 thiss!1305 (_2!4689 lt!161040))))

(declare-fun lt!161578 () Unit!6590)

(declare-fun choose!30 (BitStream!3962 BitStream!3962 BitStream!3962) Unit!6590)

(assert (=> d!34052 (= lt!161578 (choose!30 thiss!1305 (_2!4689 lt!161028) (_2!4689 lt!161040)))))

(assert (=> d!34052 (isPrefixOf!0 thiss!1305 (_2!4689 lt!161028))))

(assert (=> d!34052 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4689 lt!161028) (_2!4689 lt!161040)) lt!161578)))

(declare-fun bs!8307 () Bool)

(assert (= bs!8307 d!34052))

(assert (=> bs!8307 m!159059))

(declare-fun m!159421 () Bool)

(assert (=> bs!8307 m!159421))

(assert (=> bs!8307 m!159077))

(assert (=> b!107570 d!34052))

(declare-fun d!34054 () Bool)

(assert (=> d!34054 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5148 thiss!1305) (currentByte!5153 thiss!1305) (size!2244 (buf!2629 thiss!1305))))))

(declare-fun bs!8308 () Bool)

(assert (= bs!8308 d!34054))

(assert (=> bs!8308 m!159099))

(assert (=> start!21356 d!34054))

(declare-fun d!34056 () Bool)

(declare-fun res!88800 () Bool)

(declare-fun e!70513 () Bool)

(assert (=> d!34056 (=> (not res!88800) (not e!70513))))

(assert (=> d!34056 (= res!88800 (= (size!2244 (buf!2629 thiss!1305)) (size!2244 (buf!2629 (_2!4689 lt!161028)))))))

(assert (=> d!34056 (= (isPrefixOf!0 thiss!1305 (_2!4689 lt!161028)) e!70513)))

(declare-fun b!107759 () Bool)

(declare-fun res!88799 () Bool)

(assert (=> b!107759 (=> (not res!88799) (not e!70513))))

(assert (=> b!107759 (= res!88799 (bvsle (bitIndex!0 (size!2244 (buf!2629 thiss!1305)) (currentByte!5153 thiss!1305) (currentBit!5148 thiss!1305)) (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161028))) (currentByte!5153 (_2!4689 lt!161028)) (currentBit!5148 (_2!4689 lt!161028)))))))

(declare-fun b!107760 () Bool)

(declare-fun e!70514 () Bool)

(assert (=> b!107760 (= e!70513 e!70514)))

(declare-fun res!88798 () Bool)

(assert (=> b!107760 (=> res!88798 e!70514)))

(assert (=> b!107760 (= res!88798 (= (size!2244 (buf!2629 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!107761 () Bool)

(assert (=> b!107761 (= e!70514 (arrayBitRangesEq!0 (buf!2629 thiss!1305) (buf!2629 (_2!4689 lt!161028)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2244 (buf!2629 thiss!1305)) (currentByte!5153 thiss!1305) (currentBit!5148 thiss!1305))))))

(assert (= (and d!34056 res!88800) b!107759))

(assert (= (and b!107759 res!88799) b!107760))

(assert (= (and b!107760 (not res!88798)) b!107761))

(assert (=> b!107759 m!159027))

(assert (=> b!107759 m!159017))

(assert (=> b!107761 m!159027))

(assert (=> b!107761 m!159027))

(declare-fun m!159423 () Bool)

(assert (=> b!107761 m!159423))

(assert (=> b!107571 d!34056))

(declare-fun d!34058 () Bool)

(assert (=> d!34058 (= (array_inv!2046 (buf!2629 thiss!1305)) (bvsge (size!2244 (buf!2629 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!107573 d!34058))

(declare-fun d!34060 () Bool)

(declare-fun e!70515 () Bool)

(assert (=> d!34060 e!70515))

(declare-fun res!88802 () Bool)

(assert (=> d!34060 (=> (not res!88802) (not e!70515))))

(declare-fun lt!161580 () (_ BitVec 64))

(declare-fun lt!161581 () (_ BitVec 64))

(declare-fun lt!161583 () (_ BitVec 64))

(assert (=> d!34060 (= res!88802 (= lt!161580 (bvsub lt!161583 lt!161581)))))

(assert (=> d!34060 (or (= (bvand lt!161583 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161581 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!161583 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!161583 lt!161581) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34060 (= lt!161581 (remainingBits!0 ((_ sign_extend 32) (size!2244 (buf!2629 (_1!4692 lt!161038)))) ((_ sign_extend 32) (currentByte!5153 (_1!4692 lt!161038))) ((_ sign_extend 32) (currentBit!5148 (_1!4692 lt!161038)))))))

(declare-fun lt!161584 () (_ BitVec 64))

(declare-fun lt!161579 () (_ BitVec 64))

(assert (=> d!34060 (= lt!161583 (bvmul lt!161584 lt!161579))))

(assert (=> d!34060 (or (= lt!161584 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!161579 (bvsdiv (bvmul lt!161584 lt!161579) lt!161584)))))

(assert (=> d!34060 (= lt!161579 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34060 (= lt!161584 ((_ sign_extend 32) (size!2244 (buf!2629 (_1!4692 lt!161038)))))))

(assert (=> d!34060 (= lt!161580 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5153 (_1!4692 lt!161038))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5148 (_1!4692 lt!161038)))))))

(assert (=> d!34060 (invariant!0 (currentBit!5148 (_1!4692 lt!161038)) (currentByte!5153 (_1!4692 lt!161038)) (size!2244 (buf!2629 (_1!4692 lt!161038))))))

(assert (=> d!34060 (= (bitIndex!0 (size!2244 (buf!2629 (_1!4692 lt!161038))) (currentByte!5153 (_1!4692 lt!161038)) (currentBit!5148 (_1!4692 lt!161038))) lt!161580)))

(declare-fun b!107762 () Bool)

(declare-fun res!88801 () Bool)

(assert (=> b!107762 (=> (not res!88801) (not e!70515))))

(assert (=> b!107762 (= res!88801 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!161580))))

(declare-fun b!107763 () Bool)

(declare-fun lt!161582 () (_ BitVec 64))

(assert (=> b!107763 (= e!70515 (bvsle lt!161580 (bvmul lt!161582 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107763 (or (= lt!161582 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!161582 #b0000000000000000000000000000000000000000000000000000000000001000) lt!161582)))))

(assert (=> b!107763 (= lt!161582 ((_ sign_extend 32) (size!2244 (buf!2629 (_1!4692 lt!161038)))))))

(assert (= (and d!34060 res!88802) b!107762))

(assert (= (and b!107762 res!88801) b!107763))

(declare-fun m!159425 () Bool)

(assert (=> d!34060 m!159425))

(declare-fun m!159427 () Bool)

(assert (=> d!34060 m!159427))

(assert (=> b!107574 d!34060))

(declare-fun d!34062 () Bool)

(assert (=> d!34062 (= (invariant!0 (currentBit!5148 thiss!1305) (currentByte!5153 thiss!1305) (size!2244 (buf!2629 (_2!4689 lt!161028)))) (and (bvsge (currentBit!5148 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5148 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5153 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5153 thiss!1305) (size!2244 (buf!2629 (_2!4689 lt!161028)))) (and (= (currentBit!5148 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5153 thiss!1305) (size!2244 (buf!2629 (_2!4689 lt!161028))))))))))

(assert (=> b!107563 d!34062))

(declare-fun d!34064 () Bool)

(declare-fun lt!161605 () tuple2!8874)

(assert (=> d!34064 (= lt!161605 (readBit!0 (readerFrom!0 (_2!4689 lt!161028) (currentBit!5148 thiss!1305) (currentByte!5153 thiss!1305))))))

(assert (=> d!34064 (= (readBitPure!0 (readerFrom!0 (_2!4689 lt!161028) (currentBit!5148 thiss!1305) (currentByte!5153 thiss!1305))) (tuple2!8871 (_2!4694 lt!161605) (_1!4694 lt!161605)))))

(declare-fun bs!8309 () Bool)

(assert (= bs!8309 d!34064))

(assert (=> bs!8309 m!159009))

(declare-fun m!159429 () Bool)

(assert (=> bs!8309 m!159429))

(assert (=> b!107576 d!34064))

(declare-fun d!34066 () Bool)

(declare-fun e!70521 () Bool)

(assert (=> d!34066 e!70521))

(declare-fun res!88811 () Bool)

(assert (=> d!34066 (=> (not res!88811) (not e!70521))))

(assert (=> d!34066 (= res!88811 (invariant!0 (currentBit!5148 (_2!4689 lt!161028)) (currentByte!5153 (_2!4689 lt!161028)) (size!2244 (buf!2629 (_2!4689 lt!161028)))))))

(assert (=> d!34066 (= (readerFrom!0 (_2!4689 lt!161028) (currentBit!5148 thiss!1305) (currentByte!5153 thiss!1305)) (BitStream!3963 (buf!2629 (_2!4689 lt!161028)) (currentByte!5153 thiss!1305) (currentBit!5148 thiss!1305)))))

(declare-fun b!107773 () Bool)

(assert (=> b!107773 (= e!70521 (invariant!0 (currentBit!5148 thiss!1305) (currentByte!5153 thiss!1305) (size!2244 (buf!2629 (_2!4689 lt!161028)))))))

(assert (= (and d!34066 res!88811) b!107773))

(assert (=> d!34066 m!159093))

(assert (=> b!107773 m!159033))

(assert (=> b!107576 d!34066))

(declare-fun d!34074 () Bool)

(assert (=> d!34074 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!107565 d!34074))

(declare-fun d!34076 () Bool)

(declare-fun e!70528 () Bool)

(assert (=> d!34076 e!70528))

(declare-fun res!88819 () Bool)

(assert (=> d!34076 (=> (not res!88819) (not e!70528))))

(declare-fun lt!161642 () BitStream!3962)

(declare-fun lt!161643 () (_ BitVec 64))

(assert (=> d!34076 (= res!88819 (= (bvadd lt!161643 (bvsub lt!161035 lt!161033)) (bitIndex!0 (size!2244 (buf!2629 lt!161642)) (currentByte!5153 lt!161642) (currentBit!5148 lt!161642))))))

(assert (=> d!34076 (or (not (= (bvand lt!161643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!161035 lt!161033) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!161643 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!161643 (bvsub lt!161035 lt!161033)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34076 (= lt!161643 (bitIndex!0 (size!2244 (buf!2629 (_2!4690 lt!161020))) (currentByte!5153 (_2!4690 lt!161020)) (currentBit!5148 (_2!4690 lt!161020))))))

(declare-fun moveBitIndex!0 (BitStream!3962 (_ BitVec 64)) tuple2!8864)

(assert (=> d!34076 (= lt!161642 (_2!4689 (moveBitIndex!0 (_2!4690 lt!161020) (bvsub lt!161035 lt!161033))))))

(assert (=> d!34076 (moveBitIndexPrecond!0 (_2!4690 lt!161020) (bvsub lt!161035 lt!161033))))

(assert (=> d!34076 (= (withMovedBitIndex!0 (_2!4690 lt!161020) (bvsub lt!161035 lt!161033)) lt!161642)))

(declare-fun b!107784 () Bool)

(assert (=> b!107784 (= e!70528 (= (size!2244 (buf!2629 (_2!4690 lt!161020))) (size!2244 (buf!2629 lt!161642))))))

(assert (= (and d!34076 res!88819) b!107784))

(declare-fun m!159497 () Bool)

(assert (=> d!34076 m!159497))

(declare-fun m!159499 () Bool)

(assert (=> d!34076 m!159499))

(declare-fun m!159501 () Bool)

(assert (=> d!34076 m!159501))

(declare-fun m!159503 () Bool)

(assert (=> d!34076 m!159503))

(assert (=> b!107575 d!34076))

(declare-fun d!34082 () Bool)

(declare-fun e!70529 () Bool)

(assert (=> d!34082 e!70529))

(declare-fun res!88821 () Bool)

(assert (=> d!34082 (=> (not res!88821) (not e!70529))))

(declare-fun lt!161648 () (_ BitVec 64))

(declare-fun lt!161645 () (_ BitVec 64))

(declare-fun lt!161646 () (_ BitVec 64))

(assert (=> d!34082 (= res!88821 (= lt!161645 (bvsub lt!161648 lt!161646)))))

(assert (=> d!34082 (or (= (bvand lt!161648 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!161646 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!161648 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!161648 lt!161646) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34082 (= lt!161646 (remainingBits!0 ((_ sign_extend 32) (size!2244 (buf!2629 (_2!4689 lt!161040)))) ((_ sign_extend 32) (currentByte!5153 (_2!4689 lt!161040))) ((_ sign_extend 32) (currentBit!5148 (_2!4689 lt!161040)))))))

(declare-fun lt!161649 () (_ BitVec 64))

(declare-fun lt!161644 () (_ BitVec 64))

(assert (=> d!34082 (= lt!161648 (bvmul lt!161649 lt!161644))))

(assert (=> d!34082 (or (= lt!161649 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!161644 (bvsdiv (bvmul lt!161649 lt!161644) lt!161649)))))

(assert (=> d!34082 (= lt!161644 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!34082 (= lt!161649 ((_ sign_extend 32) (size!2244 (buf!2629 (_2!4689 lt!161040)))))))

(assert (=> d!34082 (= lt!161645 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5153 (_2!4689 lt!161040))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5148 (_2!4689 lt!161040)))))))

(assert (=> d!34082 (invariant!0 (currentBit!5148 (_2!4689 lt!161040)) (currentByte!5153 (_2!4689 lt!161040)) (size!2244 (buf!2629 (_2!4689 lt!161040))))))

(assert (=> d!34082 (= (bitIndex!0 (size!2244 (buf!2629 (_2!4689 lt!161040))) (currentByte!5153 (_2!4689 lt!161040)) (currentBit!5148 (_2!4689 lt!161040))) lt!161645)))

(declare-fun b!107785 () Bool)

(declare-fun res!88820 () Bool)

(assert (=> b!107785 (=> (not res!88820) (not e!70529))))

(assert (=> b!107785 (= res!88820 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!161645))))

(declare-fun b!107786 () Bool)

(declare-fun lt!161647 () (_ BitVec 64))

(assert (=> b!107786 (= e!70529 (bvsle lt!161645 (bvmul lt!161647 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!107786 (or (= lt!161647 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!161647 #b0000000000000000000000000000000000000000000000000000000000001000) lt!161647)))))

(assert (=> b!107786 (= lt!161647 ((_ sign_extend 32) (size!2244 (buf!2629 (_2!4689 lt!161040)))))))

(assert (= (and d!34082 res!88821) b!107785))

(assert (= (and b!107785 res!88820) b!107786))

(declare-fun m!159505 () Bool)

(assert (=> d!34082 m!159505))

(declare-fun m!159509 () Bool)

(assert (=> d!34082 m!159509))

(assert (=> b!107575 d!34082))

(declare-fun d!34086 () Bool)

(declare-fun lt!161679 () tuple2!8868)

(declare-fun lt!161678 () tuple2!8868)

(assert (=> d!34086 (and (= (_2!4691 lt!161679) (_2!4691 lt!161678)) (= (_1!4691 lt!161679) (_1!4691 lt!161678)))))

(declare-fun lt!161682 () BitStream!3962)

(declare-fun lt!161677 () Bool)

(declare-fun lt!161680 () (_ BitVec 64))

(declare-fun lt!161681 () Unit!6590)

(declare-fun choose!45 (BitStream!3962 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!8868 tuple2!8868 BitStream!3962 (_ BitVec 64) Bool BitStream!3962 (_ BitVec 64) tuple2!8868 tuple2!8868 BitStream!3962 (_ BitVec 64)) Unit!6590)

(assert (=> d!34086 (= lt!161681 (choose!45 (_1!4690 lt!161023) nBits!396 i!615 lt!161030 lt!161679 (tuple2!8869 (_1!4691 lt!161679) (_2!4691 lt!161679)) (_1!4691 lt!161679) (_2!4691 lt!161679) lt!161677 lt!161682 lt!161680 lt!161678 (tuple2!8869 (_1!4691 lt!161678) (_2!4691 lt!161678)) (_1!4691 lt!161678) (_2!4691 lt!161678)))))

(assert (=> d!34086 (= lt!161678 (readNLeastSignificantBitsLoopPure!0 lt!161682 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!161680))))

(assert (=> d!34086 (= lt!161680 (bvor lt!161030 (ite lt!161677 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34086 (= lt!161682 (withMovedBitIndex!0 (_1!4690 lt!161023) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!34086 (= lt!161677 (_2!4692 (readBitPure!0 (_1!4690 lt!161023))))))

(assert (=> d!34086 (= lt!161679 (readNLeastSignificantBitsLoopPure!0 (_1!4690 lt!161023) nBits!396 i!615 lt!161030))))

(assert (=> d!34086 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4690 lt!161023) nBits!396 i!615 lt!161030) lt!161681)))

(declare-fun bs!8313 () Bool)

(assert (= bs!8313 d!34086))

(assert (=> bs!8313 m!159013))

(declare-fun m!159531 () Bool)

(assert (=> bs!8313 m!159531))

(assert (=> bs!8313 m!159055))

(assert (=> bs!8313 m!159049))

(declare-fun m!159533 () Bool)

(assert (=> bs!8313 m!159533))

(assert (=> b!107575 d!34086))

(declare-fun d!34094 () Bool)

(declare-fun res!88831 () Bool)

(declare-fun e!70538 () Bool)

(assert (=> d!34094 (=> (not res!88831) (not e!70538))))

(assert (=> d!34094 (= res!88831 (and (bvsle (bvmul #b1111111111111111111111111111111111111111111111111111111111111000 ((_ sign_extend 32) (size!2244 (buf!2629 (_1!4690 lt!161023))))) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2244 (buf!2629 (_1!4690 lt!161023))))))))))

(assert (=> d!34094 (= (moveBitIndexPrecond!0 (_1!4690 lt!161023) #b0000000000000000000000000000000000000000000000000000000000000001) e!70538)))

(declare-fun b!107797 () Bool)

(declare-fun lt!161685 () (_ BitVec 64))

(assert (=> b!107797 (= e!70538 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!161685) (bvsle lt!161685 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2244 (buf!2629 (_1!4690 lt!161023))))))))))

(assert (=> b!107797 (= lt!161685 (bvadd (bitIndex!0 (size!2244 (buf!2629 (_1!4690 lt!161023))) (currentByte!5153 (_1!4690 lt!161023)) (currentBit!5148 (_1!4690 lt!161023))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (= (and d!34094 res!88831) b!107797))

(declare-fun m!159535 () Bool)

(assert (=> b!107797 m!159535))

(assert (=> b!107575 d!34094))

(declare-fun d!34096 () Bool)

(declare-fun e!70539 () Bool)

(assert (=> d!34096 e!70539))

(declare-fun res!88832 () Bool)

(assert (=> d!34096 (=> (not res!88832) (not e!70539))))

(declare-fun lt!161687 () (_ BitVec 64))

(declare-fun lt!161686 () BitStream!3962)

(assert (=> d!34096 (= res!88832 (= (bvadd lt!161687 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2244 (buf!2629 lt!161686)) (currentByte!5153 lt!161686) (currentBit!5148 lt!161686))))))

(assert (=> d!34096 (or (not (= (bvand lt!161687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!161687 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!161687 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34096 (= lt!161687 (bitIndex!0 (size!2244 (buf!2629 (_1!4690 lt!161023))) (currentByte!5153 (_1!4690 lt!161023)) (currentBit!5148 (_1!4690 lt!161023))))))

(assert (=> d!34096 (= lt!161686 (_2!4689 (moveBitIndex!0 (_1!4690 lt!161023) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!34096 (moveBitIndexPrecond!0 (_1!4690 lt!161023) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!34096 (= (withMovedBitIndex!0 (_1!4690 lt!161023) #b0000000000000000000000000000000000000000000000000000000000000001) lt!161686)))

(declare-fun b!107798 () Bool)

(assert (=> b!107798 (= e!70539 (= (size!2244 (buf!2629 (_1!4690 lt!161023))) (size!2244 (buf!2629 lt!161686))))))

(assert (= (and d!34096 res!88832) b!107798))

(declare-fun m!159537 () Bool)

(assert (=> d!34096 m!159537))

(assert (=> d!34096 m!159535))

(declare-fun m!159539 () Bool)

(assert (=> d!34096 m!159539))

(assert (=> d!34096 m!159023))

(assert (=> b!107575 d!34096))

(declare-fun d!34098 () Bool)

(declare-fun e!70540 () Bool)

(assert (=> d!34098 e!70540))

(declare-fun res!88833 () Bool)

(assert (=> d!34098 (=> (not res!88833) (not e!70540))))

(declare-fun lt!161689 () (_ BitVec 64))

(declare-fun lt!161688 () BitStream!3962)

(assert (=> d!34098 (= res!88833 (= (bvadd lt!161689 (bvsub lt!161016 lt!161033)) (bitIndex!0 (size!2244 (buf!2629 lt!161688)) (currentByte!5153 lt!161688) (currentBit!5148 lt!161688))))))

(assert (=> d!34098 (or (not (= (bvand lt!161689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!161016 lt!161033) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!161689 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!161689 (bvsub lt!161016 lt!161033)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!34098 (= lt!161689 (bitIndex!0 (size!2244 (buf!2629 (_2!4690 lt!161023))) (currentByte!5153 (_2!4690 lt!161023)) (currentBit!5148 (_2!4690 lt!161023))))))

(assert (=> d!34098 (= lt!161688 (_2!4689 (moveBitIndex!0 (_2!4690 lt!161023) (bvsub lt!161016 lt!161033))))))

(assert (=> d!34098 (moveBitIndexPrecond!0 (_2!4690 lt!161023) (bvsub lt!161016 lt!161033))))

(assert (=> d!34098 (= (withMovedBitIndex!0 (_2!4690 lt!161023) (bvsub lt!161016 lt!161033)) lt!161688)))

(declare-fun b!107799 () Bool)

(assert (=> b!107799 (= e!70540 (= (size!2244 (buf!2629 (_2!4690 lt!161023))) (size!2244 (buf!2629 lt!161688))))))

(assert (= (and d!34098 res!88833) b!107799))

(declare-fun m!159541 () Bool)

(assert (=> d!34098 m!159541))

(declare-fun m!159543 () Bool)

(assert (=> d!34098 m!159543))

(declare-fun m!159545 () Bool)

(assert (=> d!34098 m!159545))

(declare-fun m!159547 () Bool)

(assert (=> d!34098 m!159547))

(assert (=> b!107575 d!34098))

(assert (=> b!107575 d!33984))

(declare-fun lt!161692 () tuple2!8872)

(declare-fun d!34100 () Bool)

(assert (=> d!34100 (= lt!161692 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!4690 lt!161023) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!161014))))

(assert (=> d!34100 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4690 lt!161023) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!161014) (tuple2!8869 (_2!4693 lt!161692) (_1!4693 lt!161692)))))

(declare-fun bs!8315 () Bool)

(assert (= bs!8315 d!34100))

(assert (=> bs!8315 m!159013))

(declare-fun m!159549 () Bool)

(assert (=> bs!8315 m!159549))

(assert (=> b!107575 d!34100))

(assert (=> b!107575 d!33976))

(push 1)

(assert (not d!33970))

(assert (not d!34036))

(assert (not d!34042))

(assert (not d!34028))

(assert (not b!107703))

(assert (not b!107693))

(assert (not bm!1362))

(assert (not b!107733))

(assert (not b!107694))

(assert (not b!107735))

(assert (not b!107746))

(assert (not d!34098))

(assert (not b!107726))

(assert (not b!107748))

(assert (not d!34082))

(assert (not d!34038))

(assert (not d!34048))

(assert (not d!34052))

(assert (not d!34066))

(assert (not d!33992))

(assert (not d!34064))

(assert (not b!107745))

(assert (not b!107722))

(assert (not d!33996))

(assert (not b!107773))

(assert (not d!33998))

(assert (not d!34034))

(assert (not d!34060))

(assert (not b!107761))

(assert (not d!34032))

(assert (not b!107723))

(assert (not b!107701))

(assert (not d!34100))

(assert (not b!107797))

(assert (not b!107697))

(assert (not b!107700))

(assert (not d!34040))

(assert (not b!107606))

(assert (not b!107696))

(assert (not d!33994))

(assert (not d!34076))

(assert (not b!107725))

(assert (not d!34000))

(assert (not d!34086))

(assert (not d!34054))

(assert (not d!33984))

(assert (not b!107609))

(assert (not b!107747))

(assert (not d!33976))

(assert (not d!33988))

(assert (not b!107698))

(assert (not b!107608))

(assert (not b!107759))

(assert (not d!34096))

(assert (not b!107702))

(assert (not b!107704))

(assert (not b!107605))

(assert (not d!34050))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

