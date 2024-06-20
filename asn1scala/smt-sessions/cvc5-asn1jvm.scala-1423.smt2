; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39020 () Bool)

(assert start!39020)

(declare-fun b!175671 () Bool)

(declare-fun res!145471 () Bool)

(declare-fun e!122489 () Bool)

(assert (=> b!175671 (=> (not res!145471) (not e!122489))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!175671 (= res!145471 (= i!590 nBits!348))))

(declare-fun b!175672 () Bool)

(declare-fun e!122487 () Bool)

(declare-datatypes ((array!9479 0))(
  ( (array!9480 (arr!5113 (Array (_ BitVec 32) (_ BitVec 8))) (size!4183 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7474 0))(
  ( (BitStream!7475 (buf!4623 array!9479) (currentByte!8752 (_ BitVec 32)) (currentBit!8747 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7474)

(declare-fun array_inv!3924 (array!9479) Bool)

(assert (=> b!175672 (= e!122487 (array_inv!3924 (buf!4623 thiss!1204)))))

(declare-fun b!175673 () Bool)

(declare-fun e!122488 () Bool)

(declare-fun e!122486 () Bool)

(assert (=> b!175673 (= e!122488 (not e!122486))))

(declare-fun res!145473 () Bool)

(assert (=> b!175673 (=> res!145473 e!122486)))

(declare-datatypes ((tuple2!15112 0))(
  ( (tuple2!15113 (_1!8201 BitStream!7474) (_2!8201 BitStream!7474)) )
))
(declare-fun lt!270845 () tuple2!15112)

(declare-fun lt!270848 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175673 (= res!145473 (not (validate_offset_bits!1 ((_ sign_extend 32) (size!4183 (buf!4623 (_1!8201 lt!270845)))) ((_ sign_extend 32) (currentByte!8752 (_1!8201 lt!270845))) ((_ sign_extend 32) (currentBit!8747 (_1!8201 lt!270845))) lt!270848)))))

(declare-datatypes ((Unit!12677 0))(
  ( (Unit!12678) )
))
(declare-fun lt!270846 () Unit!12677)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7474 array!9479 (_ BitVec 64)) Unit!12677)

(assert (=> b!175673 (= lt!270846 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4623 thiss!1204) lt!270848))))

(declare-fun reader!0 (BitStream!7474 BitStream!7474) tuple2!15112)

(assert (=> b!175673 (= lt!270845 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!7474 BitStream!7474) Bool)

(assert (=> b!175673 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!270844 () Unit!12677)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7474) Unit!12677)

(assert (=> b!175673 (= lt!270844 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!175674 () Bool)

(declare-fun res!145469 () Bool)

(assert (=> b!175674 (=> (not res!145469) (not e!122489))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175674 (= res!145469 (invariant!0 (currentBit!8747 thiss!1204) (currentByte!8752 thiss!1204) (size!4183 (buf!4623 thiss!1204))))))

(declare-fun b!175676 () Bool)

(declare-fun v!189 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(declare-fun onesMSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175676 (= e!122486 (= (bvand (bvand v!189 (onesLSBLong!0 i!590)) (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!175677 () Bool)

(assert (=> b!175677 (= e!122489 e!122488)))

(declare-fun res!145468 () Bool)

(assert (=> b!175677 (=> (not res!145468) (not e!122488))))

(declare-fun lt!270847 () (_ BitVec 64))

(assert (=> b!175677 (= res!145468 (= lt!270847 (bvsub (bvadd lt!270847 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175677 (= lt!270847 (bitIndex!0 (size!4183 (buf!4623 thiss!1204)) (currentByte!8752 thiss!1204) (currentBit!8747 thiss!1204)))))

(declare-fun res!145472 () Bool)

(declare-fun e!122490 () Bool)

(assert (=> start!39020 (=> (not res!145472) (not e!122490))))

(assert (=> start!39020 (= res!145472 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!39020 e!122490))

(assert (=> start!39020 true))

(declare-fun inv!12 (BitStream!7474) Bool)

(assert (=> start!39020 (and (inv!12 thiss!1204) e!122487)))

(declare-fun b!175675 () Bool)

(assert (=> b!175675 (= e!122490 e!122489)))

(declare-fun res!145470 () Bool)

(assert (=> b!175675 (=> (not res!145470) (not e!122489))))

(assert (=> b!175675 (= res!145470 (validate_offset_bits!1 ((_ sign_extend 32) (size!4183 (buf!4623 thiss!1204))) ((_ sign_extend 32) (currentByte!8752 thiss!1204)) ((_ sign_extend 32) (currentBit!8747 thiss!1204)) lt!270848))))

(assert (=> b!175675 (= lt!270848 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(assert (= (and start!39020 res!145472) b!175675))

(assert (= (and b!175675 res!145470) b!175674))

(assert (= (and b!175674 res!145469) b!175671))

(assert (= (and b!175671 res!145471) b!175677))

(assert (= (and b!175677 res!145468) b!175673))

(assert (= (and b!175673 (not res!145473)) b!175676))

(assert (= start!39020 b!175672))

(declare-fun m!275851 () Bool)

(assert (=> b!175672 m!275851))

(declare-fun m!275853 () Bool)

(assert (=> b!175676 m!275853))

(declare-fun m!275855 () Bool)

(assert (=> b!175676 m!275855))

(declare-fun m!275857 () Bool)

(assert (=> b!175674 m!275857))

(declare-fun m!275859 () Bool)

(assert (=> start!39020 m!275859))

(declare-fun m!275861 () Bool)

(assert (=> b!175677 m!275861))

(declare-fun m!275863 () Bool)

(assert (=> b!175673 m!275863))

(declare-fun m!275865 () Bool)

(assert (=> b!175673 m!275865))

(declare-fun m!275867 () Bool)

(assert (=> b!175673 m!275867))

(declare-fun m!275869 () Bool)

(assert (=> b!175673 m!275869))

(declare-fun m!275871 () Bool)

(assert (=> b!175673 m!275871))

(declare-fun m!275873 () Bool)

(assert (=> b!175675 m!275873))

(push 1)

(assert (not b!175673))

(assert (not b!175676))

(assert (not b!175672))

(assert (not b!175675))

(assert (not start!39020))

(assert (not b!175674))

(assert (not b!175677))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!61999 () Bool)

(declare-fun e!122536 () Bool)

(assert (=> d!61999 e!122536))

(declare-fun res!145526 () Bool)

(assert (=> d!61999 (=> (not res!145526) (not e!122536))))

(declare-fun lt!270934 () (_ BitVec 64))

(declare-fun lt!270933 () (_ BitVec 64))

(declare-fun lt!270931 () (_ BitVec 64))

(assert (=> d!61999 (= res!145526 (= lt!270933 (bvsub lt!270931 lt!270934)))))

(assert (=> d!61999 (or (= (bvand lt!270931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!270934 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!270931 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!270931 lt!270934) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!61999 (= lt!270934 (remainingBits!0 ((_ sign_extend 32) (size!4183 (buf!4623 thiss!1204))) ((_ sign_extend 32) (currentByte!8752 thiss!1204)) ((_ sign_extend 32) (currentBit!8747 thiss!1204))))))

(declare-fun lt!270935 () (_ BitVec 64))

(declare-fun lt!270932 () (_ BitVec 64))

(assert (=> d!61999 (= lt!270931 (bvmul lt!270935 lt!270932))))

(assert (=> d!61999 (or (= lt!270935 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!270932 (bvsdiv (bvmul lt!270935 lt!270932) lt!270935)))))

(assert (=> d!61999 (= lt!270932 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!61999 (= lt!270935 ((_ sign_extend 32) (size!4183 (buf!4623 thiss!1204))))))

(assert (=> d!61999 (= lt!270933 (bvadd (bvmul ((_ sign_extend 32) (currentByte!8752 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!8747 thiss!1204))))))

(assert (=> d!61999 (invariant!0 (currentBit!8747 thiss!1204) (currentByte!8752 thiss!1204) (size!4183 (buf!4623 thiss!1204)))))

(assert (=> d!61999 (= (bitIndex!0 (size!4183 (buf!4623 thiss!1204)) (currentByte!8752 thiss!1204) (currentBit!8747 thiss!1204)) lt!270933)))

(declare-fun b!175736 () Bool)

(declare-fun res!145527 () Bool)

(assert (=> b!175736 (=> (not res!145527) (not e!122536))))

(assert (=> b!175736 (= res!145527 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!270933))))

(declare-fun b!175737 () Bool)

(declare-fun lt!270930 () (_ BitVec 64))

(assert (=> b!175737 (= e!122536 (bvsle lt!270933 (bvmul lt!270930 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!175737 (or (= lt!270930 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!270930 #b0000000000000000000000000000000000000000000000000000000000001000) lt!270930)))))

(assert (=> b!175737 (= lt!270930 ((_ sign_extend 32) (size!4183 (buf!4623 thiss!1204))))))

(assert (= (and d!61999 res!145526) b!175736))

(assert (= (and b!175736 res!145527) b!175737))

(declare-fun m!275931 () Bool)

(assert (=> d!61999 m!275931))

(assert (=> d!61999 m!275857))

(assert (=> b!175677 d!61999))

(declare-fun d!62013 () Bool)

(assert (=> d!62013 (= (array_inv!3924 (buf!4623 thiss!1204)) (bvsge (size!4183 (buf!4623 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!175672 d!62013))

(declare-fun d!62017 () Bool)

(assert (=> d!62017 (= (onesLSBLong!0 i!590) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 i!590))))))

(assert (=> b!175676 d!62017))

(declare-fun d!62023 () Bool)

(assert (=> d!62023 (= (onesMSBLong!0 (bvsub #b00000000000000000000000001000000 i!590)) (ite (= (bvsub #b00000000000000000000000001000000 i!590) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000 (bvshl #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub #b00000000000000000000000001000000 i!590))))))))

(assert (=> b!175676 d!62023))

(declare-fun d!62025 () Bool)

(assert (=> d!62025 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4183 (buf!4623 thiss!1204))) ((_ sign_extend 32) (currentByte!8752 thiss!1204)) ((_ sign_extend 32) (currentBit!8747 thiss!1204)) lt!270848) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4183 (buf!4623 thiss!1204))) ((_ sign_extend 32) (currentByte!8752 thiss!1204)) ((_ sign_extend 32) (currentBit!8747 thiss!1204))) lt!270848))))

(declare-fun bs!15475 () Bool)

(assert (= bs!15475 d!62025))

(assert (=> bs!15475 m!275931))

(assert (=> b!175675 d!62025))

(declare-fun d!62029 () Bool)

(assert (=> d!62029 (= (inv!12 thiss!1204) (invariant!0 (currentBit!8747 thiss!1204) (currentByte!8752 thiss!1204) (size!4183 (buf!4623 thiss!1204))))))

(declare-fun bs!15477 () Bool)

(assert (= bs!15477 d!62029))

(assert (=> bs!15477 m!275857))

(assert (=> start!39020 d!62029))

(declare-fun d!62033 () Bool)

(assert (=> d!62033 (= (invariant!0 (currentBit!8747 thiss!1204) (currentByte!8752 thiss!1204) (size!4183 (buf!4623 thiss!1204))) (and (bvsge (currentBit!8747 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!8747 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!8752 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!8752 thiss!1204) (size!4183 (buf!4623 thiss!1204))) (and (= (currentBit!8747 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!8752 thiss!1204) (size!4183 (buf!4623 thiss!1204)))))))))

(assert (=> b!175674 d!62033))

(declare-fun d!62035 () Bool)

(assert (=> d!62035 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4183 (buf!4623 (_1!8201 lt!270845)))) ((_ sign_extend 32) (currentByte!8752 (_1!8201 lt!270845))) ((_ sign_extend 32) (currentBit!8747 (_1!8201 lt!270845))) lt!270848) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4183 (buf!4623 (_1!8201 lt!270845)))) ((_ sign_extend 32) (currentByte!8752 (_1!8201 lt!270845))) ((_ sign_extend 32) (currentBit!8747 (_1!8201 lt!270845)))) lt!270848))))

(declare-fun bs!15479 () Bool)

(assert (= bs!15479 d!62035))

(declare-fun m!275935 () Bool)

(assert (=> bs!15479 m!275935))

(assert (=> b!175673 d!62035))

(declare-fun d!62037 () Bool)

(assert (=> d!62037 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-fun lt!270946 () Unit!12677)

(declare-fun choose!11 (BitStream!7474) Unit!12677)

(assert (=> d!62037 (= lt!270946 (choose!11 thiss!1204))))

(assert (=> d!62037 (= (lemmaIsPrefixRefl!0 thiss!1204) lt!270946)))

(declare-fun bs!15482 () Bool)

(assert (= bs!15482 d!62037))

(assert (=> bs!15482 m!275867))

(declare-fun m!275939 () Bool)

(assert (=> bs!15482 m!275939))

(assert (=> b!175673 d!62037))

(declare-fun b!175782 () Bool)

(declare-fun e!122557 () Unit!12677)

(declare-fun Unit!12684 () Unit!12677)

(assert (=> b!175782 (= e!122557 Unit!12684)))

(declare-fun d!62041 () Bool)

(declare-fun e!122558 () Bool)

(assert (=> d!62041 e!122558))

(declare-fun res!145558 () Bool)

(assert (=> d!62041 (=> (not res!145558) (not e!122558))))

(declare-fun lt!271103 () tuple2!15112)

(assert (=> d!62041 (= res!145558 (isPrefixOf!0 (_1!8201 lt!271103) (_2!8201 lt!271103)))))

(declare-fun lt!271104 () BitStream!7474)

(assert (=> d!62041 (= lt!271103 (tuple2!15113 lt!271104 thiss!1204))))

(declare-fun lt!271092 () Unit!12677)

(declare-fun lt!271090 () Unit!12677)

(assert (=> d!62041 (= lt!271092 lt!271090)))

(assert (=> d!62041 (isPrefixOf!0 lt!271104 thiss!1204)))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7474 BitStream!7474 BitStream!7474) Unit!12677)

(assert (=> d!62041 (= lt!271090 (lemmaIsPrefixTransitive!0 lt!271104 thiss!1204 thiss!1204))))

(declare-fun lt!271107 () Unit!12677)

(declare-fun lt!271094 () Unit!12677)

(assert (=> d!62041 (= lt!271107 lt!271094)))

(assert (=> d!62041 (isPrefixOf!0 lt!271104 thiss!1204)))

(assert (=> d!62041 (= lt!271094 (lemmaIsPrefixTransitive!0 lt!271104 thiss!1204 thiss!1204))))

(declare-fun lt!271098 () Unit!12677)

(assert (=> d!62041 (= lt!271098 e!122557)))

(declare-fun c!9239 () Bool)

(assert (=> d!62041 (= c!9239 (not (= (size!4183 (buf!4623 thiss!1204)) #b00000000000000000000000000000000)))))

(declare-fun lt!271105 () Unit!12677)

(declare-fun lt!271100 () Unit!12677)

(assert (=> d!62041 (= lt!271105 lt!271100)))

(assert (=> d!62041 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!62041 (= lt!271100 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun lt!271102 () Unit!12677)

(declare-fun lt!271106 () Unit!12677)

(assert (=> d!62041 (= lt!271102 lt!271106)))

(assert (=> d!62041 (= lt!271106 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun lt!271101 () Unit!12677)

(declare-fun lt!271089 () Unit!12677)

(assert (=> d!62041 (= lt!271101 lt!271089)))

(assert (=> d!62041 (isPrefixOf!0 lt!271104 lt!271104)))

(assert (=> d!62041 (= lt!271089 (lemmaIsPrefixRefl!0 lt!271104))))

(declare-fun lt!271088 () Unit!12677)

(declare-fun lt!271096 () Unit!12677)

(assert (=> d!62041 (= lt!271088 lt!271096)))

(assert (=> d!62041 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!62041 (= lt!271096 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (=> d!62041 (= lt!271104 (BitStream!7475 (buf!4623 thiss!1204) (currentByte!8752 thiss!1204) (currentBit!8747 thiss!1204)))))

(assert (=> d!62041 (isPrefixOf!0 thiss!1204 thiss!1204)))

(assert (=> d!62041 (= (reader!0 thiss!1204 thiss!1204) lt!271103)))

(declare-fun b!175783 () Bool)

(declare-fun res!145559 () Bool)

(assert (=> b!175783 (=> (not res!145559) (not e!122558))))

(assert (=> b!175783 (= res!145559 (isPrefixOf!0 (_2!8201 lt!271103) thiss!1204))))

(declare-fun b!175784 () Bool)

(declare-fun res!145560 () Bool)

(assert (=> b!175784 (=> (not res!145560) (not e!122558))))

(assert (=> b!175784 (= res!145560 (isPrefixOf!0 (_1!8201 lt!271103) thiss!1204))))

(declare-fun b!175785 () Bool)

(declare-fun lt!271093 () Unit!12677)

(assert (=> b!175785 (= e!122557 lt!271093)))

(declare-fun lt!271091 () (_ BitVec 64))

(assert (=> b!175785 (= lt!271091 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!271097 () (_ BitVec 64))

(assert (=> b!175785 (= lt!271097 (bitIndex!0 (size!4183 (buf!4623 thiss!1204)) (currentByte!8752 thiss!1204) (currentBit!8747 thiss!1204)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!9479 array!9479 (_ BitVec 64) (_ BitVec 64)) Unit!12677)

(assert (=> b!175785 (= lt!271093 (arrayBitRangesEqSymmetric!0 (buf!4623 thiss!1204) (buf!4623 thiss!1204) lt!271091 lt!271097))))

(declare-fun arrayBitRangesEq!0 (array!9479 array!9479 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175785 (arrayBitRangesEq!0 (buf!4623 thiss!1204) (buf!4623 thiss!1204) lt!271091 lt!271097)))

(declare-fun lt!271095 () (_ BitVec 64))

(declare-fun b!175786 () Bool)

(declare-fun lt!271099 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!7474 (_ BitVec 64)) BitStream!7474)

(assert (=> b!175786 (= e!122558 (= (_1!8201 lt!271103) (withMovedBitIndex!0 (_2!8201 lt!271103) (bvsub lt!271099 lt!271095))))))

(assert (=> b!175786 (or (= (bvand lt!271099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!271095 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!271099 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!271099 lt!271095) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!175786 (= lt!271095 (bitIndex!0 (size!4183 (buf!4623 thiss!1204)) (currentByte!8752 thiss!1204) (currentBit!8747 thiss!1204)))))

(assert (=> b!175786 (= lt!271099 (bitIndex!0 (size!4183 (buf!4623 thiss!1204)) (currentByte!8752 thiss!1204) (currentBit!8747 thiss!1204)))))

(assert (= (and d!62041 c!9239) b!175785))

(assert (= (and d!62041 (not c!9239)) b!175782))

(assert (= (and d!62041 res!145558) b!175784))

(assert (= (and b!175784 res!145560) b!175783))

(assert (= (and b!175783 res!145559) b!175786))

(declare-fun m!275965 () Bool)

(assert (=> b!175783 m!275965))

(assert (=> b!175785 m!275861))

(declare-fun m!275967 () Bool)

(assert (=> b!175785 m!275967))

(declare-fun m!275969 () Bool)

(assert (=> b!175785 m!275969))

(assert (=> d!62041 m!275865))

(assert (=> d!62041 m!275865))

(declare-fun m!275971 () Bool)

(assert (=> d!62041 m!275971))

(declare-fun m!275973 () Bool)

(assert (=> d!62041 m!275973))

(assert (=> d!62041 m!275867))

(assert (=> d!62041 m!275867))

(declare-fun m!275975 () Bool)

(assert (=> d!62041 m!275975))

(declare-fun m!275977 () Bool)

(assert (=> d!62041 m!275977))

(assert (=> d!62041 m!275973))

(assert (=> d!62041 m!275867))

(declare-fun m!275981 () Bool)

(assert (=> d!62041 m!275981))

(declare-fun m!275985 () Bool)

(assert (=> b!175784 m!275985))

(declare-fun m!275991 () Bool)

(assert (=> b!175786 m!275991))

(assert (=> b!175786 m!275861))

(assert (=> b!175786 m!275861))

(assert (=> b!175673 d!62041))

(declare-fun d!62049 () Bool)

(declare-fun res!145580 () Bool)

(declare-fun e!122571 () Bool)

(assert (=> d!62049 (=> (not res!145580) (not e!122571))))

(assert (=> d!62049 (= res!145580 (= (size!4183 (buf!4623 thiss!1204)) (size!4183 (buf!4623 thiss!1204))))))

(assert (=> d!62049 (= (isPrefixOf!0 thiss!1204 thiss!1204) e!122571)))

(declare-fun b!175807 () Bool)

(declare-fun res!145579 () Bool)

(assert (=> b!175807 (=> (not res!145579) (not e!122571))))

(assert (=> b!175807 (= res!145579 (bvsle (bitIndex!0 (size!4183 (buf!4623 thiss!1204)) (currentByte!8752 thiss!1204) (currentBit!8747 thiss!1204)) (bitIndex!0 (size!4183 (buf!4623 thiss!1204)) (currentByte!8752 thiss!1204) (currentBit!8747 thiss!1204))))))

(declare-fun b!175808 () Bool)

(declare-fun e!122572 () Bool)

(assert (=> b!175808 (= e!122571 e!122572)))

(declare-fun res!145581 () Bool)

(assert (=> b!175808 (=> res!145581 e!122572)))

(assert (=> b!175808 (= res!145581 (= (size!4183 (buf!4623 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!175809 () Bool)

(assert (=> b!175809 (= e!122572 (arrayBitRangesEq!0 (buf!4623 thiss!1204) (buf!4623 thiss!1204) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4183 (buf!4623 thiss!1204)) (currentByte!8752 thiss!1204) (currentBit!8747 thiss!1204))))))

(assert (= (and d!62049 res!145580) b!175807))

(assert (= (and b!175807 res!145579) b!175808))

(assert (= (and b!175808 (not res!145581)) b!175809))

(assert (=> b!175807 m!275861))

(assert (=> b!175807 m!275861))

(assert (=> b!175809 m!275861))

(assert (=> b!175809 m!275861))

(declare-fun m!276009 () Bool)

(assert (=> b!175809 m!276009))

(assert (=> b!175673 d!62049))

(declare-fun d!62055 () Bool)

(assert (=> d!62055 (validate_offset_bits!1 ((_ sign_extend 32) (size!4183 (buf!4623 thiss!1204))) ((_ sign_extend 32) (currentByte!8752 thiss!1204)) ((_ sign_extend 32) (currentBit!8747 thiss!1204)) lt!270848)))

(declare-fun lt!271130 () Unit!12677)

(declare-fun choose!9 (BitStream!7474 array!9479 (_ BitVec 64) BitStream!7474) Unit!12677)

(assert (=> d!62055 (= lt!271130 (choose!9 thiss!1204 (buf!4623 thiss!1204) lt!270848 (BitStream!7475 (buf!4623 thiss!1204) (currentByte!8752 thiss!1204) (currentBit!8747 thiss!1204))))))

(assert (=> d!62055 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1204 (buf!4623 thiss!1204) lt!270848) lt!271130)))

(declare-fun bs!15486 () Bool)

(assert (= bs!15486 d!62055))

(assert (=> bs!15486 m!275873))

(declare-fun m!276011 () Bool)

(assert (=> bs!15486 m!276011))

(assert (=> b!175673 d!62055))

(push 1)

(assert (not b!175786))

(assert (not b!175785))

(assert (not b!175783))

(assert (not d!62037))

(assert (not d!62041))

(assert (not d!62025))

(assert (not d!62029))

(assert (not b!175784))

(assert (not d!61999))

(assert (not d!62035))

(assert (not d!62055))

(assert (not b!175809))

(assert (not b!175807))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

