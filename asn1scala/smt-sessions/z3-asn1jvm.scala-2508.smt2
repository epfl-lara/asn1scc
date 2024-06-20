; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63396 () Bool)

(assert start!63396)

(declare-fun res!235061 () Bool)

(declare-fun e!202573 () Bool)

(assert (=> start!63396 (=> (not res!235061) (not e!202573))))

(declare-datatypes ((array!16497 0))(
  ( (array!16498 (arr!8120 (Array (_ BitVec 32) (_ BitVec 8))) (size!7124 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12618 0))(
  ( (BitStream!12619 (buf!7370 array!16497) (currentByte!13647 (_ BitVec 32)) (currentBit!13642 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12618)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63396 (= res!235061 (validate_offset_bits!1 ((_ sign_extend 32) (size!7124 (buf!7370 thiss!1939))) ((_ sign_extend 32) (currentByte!13647 thiss!1939)) ((_ sign_extend 32) (currentBit!13642 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13647 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13642 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63396 e!202573))

(declare-fun e!202575 () Bool)

(declare-fun inv!12 (BitStream!12618) Bool)

(assert (=> start!63396 (and (inv!12 thiss!1939) e!202575)))

(declare-fun b!283649 () Bool)

(declare-datatypes ((Unit!19849 0))(
  ( (Unit!19850) )
))
(declare-datatypes ((tuple2!22592 0))(
  ( (tuple2!22593 (_1!12490 Unit!19849) (_2!12490 BitStream!12618)) )
))
(declare-fun lt!417981 () tuple2!22592)

(assert (=> b!283649 (= e!202573 (not (inv!12 (BitStream!12619 (buf!7370 (_2!12490 lt!417981)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13647 (_2!12490 lt!417981))) #b00000000000000000000000000000010)) (currentBit!13642 (_2!12490 lt!417981))))))))

(declare-fun alignToByte!0 (BitStream!12618) tuple2!22592)

(assert (=> b!283649 (= lt!417981 (alignToByte!0 thiss!1939))))

(declare-fun b!283650 () Bool)

(declare-fun array_inv!6817 (array!16497) Bool)

(assert (=> b!283650 (= e!202575 (array_inv!6817 (buf!7370 thiss!1939)))))

(assert (= (and start!63396 res!235061) b!283649))

(assert (= start!63396 b!283650))

(declare-fun m!416717 () Bool)

(assert (=> start!63396 m!416717))

(declare-fun m!416719 () Bool)

(assert (=> start!63396 m!416719))

(declare-fun m!416721 () Bool)

(assert (=> b!283649 m!416721))

(declare-fun m!416723 () Bool)

(assert (=> b!283649 m!416723))

(declare-fun m!416725 () Bool)

(assert (=> b!283650 m!416725))

(check-sat (not b!283649) (not b!283650) (not start!63396))
(check-sat)
(get-model)

(declare-fun d!97370 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97370 (= (inv!12 (BitStream!12619 (buf!7370 (_2!12490 lt!417981)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13647 (_2!12490 lt!417981))) #b00000000000000000000000000000010)) (currentBit!13642 (_2!12490 lt!417981)))) (invariant!0 (currentBit!13642 (BitStream!12619 (buf!7370 (_2!12490 lt!417981)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13647 (_2!12490 lt!417981))) #b00000000000000000000000000000010)) (currentBit!13642 (_2!12490 lt!417981)))) (currentByte!13647 (BitStream!12619 (buf!7370 (_2!12490 lt!417981)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13647 (_2!12490 lt!417981))) #b00000000000000000000000000000010)) (currentBit!13642 (_2!12490 lt!417981)))) (size!7124 (buf!7370 (BitStream!12619 (buf!7370 (_2!12490 lt!417981)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13647 (_2!12490 lt!417981))) #b00000000000000000000000000000010)) (currentBit!13642 (_2!12490 lt!417981)))))))))

(declare-fun bs!24587 () Bool)

(assert (= bs!24587 d!97370))

(declare-fun m!416741 () Bool)

(assert (=> bs!24587 m!416741))

(assert (=> b!283649 d!97370))

(declare-fun d!97378 () Bool)

(declare-fun e!202601 () Bool)

(assert (=> d!97378 e!202601))

(declare-fun res!235082 () Bool)

(assert (=> d!97378 (=> (not res!235082) (not e!202601))))

(assert (=> d!97378 (= res!235082 (validate_offset_bits!1 ((_ sign_extend 32) (size!7124 (buf!7370 thiss!1939))) ((_ sign_extend 32) (currentByte!13647 thiss!1939)) ((_ sign_extend 32) (currentBit!13642 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13642 thiss!1939)) #b00000000000000000000000000000111))))))

(declare-fun Unit!19861 () Unit!19849)

(declare-fun Unit!19862 () Unit!19849)

(assert (=> d!97378 (= (alignToByte!0 thiss!1939) (ite (not (= (currentBit!13642 thiss!1939) #b00000000000000000000000000000000)) (tuple2!22593 Unit!19861 (BitStream!12619 (buf!7370 thiss!1939) (bvadd (currentByte!13647 thiss!1939) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!22593 Unit!19862 thiss!1939)))))

(declare-fun b!283673 () Bool)

(declare-fun e!202602 () Bool)

(assert (=> b!283673 (= e!202601 e!202602)))

(declare-fun res!235081 () Bool)

(assert (=> b!283673 (=> (not res!235081) (not e!202602))))

(declare-fun lt!418011 () tuple2!22592)

(assert (=> b!283673 (= res!235081 (= (buf!7370 (_2!12490 lt!418011)) (buf!7370 thiss!1939)))))

(declare-fun Unit!19863 () Unit!19849)

(declare-fun Unit!19864 () Unit!19849)

(assert (=> b!283673 (= lt!418011 (ite (not (= (currentBit!13642 thiss!1939) #b00000000000000000000000000000000)) (tuple2!22593 Unit!19863 (BitStream!12619 (buf!7370 thiss!1939) (bvadd (currentByte!13647 thiss!1939) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!22593 Unit!19864 thiss!1939)))))

(declare-fun b!283674 () Bool)

(declare-fun lt!418010 () (_ BitVec 64))

(declare-fun lt!418009 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!283674 (= e!202602 (bvsle (bitIndex!0 (size!7124 (buf!7370 (_2!12490 lt!418011))) (currentByte!13647 (_2!12490 lt!418011)) (currentBit!13642 (_2!12490 lt!418011))) (bvadd lt!418009 lt!418010)))))

(assert (=> b!283674 (or (not (= (bvand lt!418009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418010 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!418009 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!418009 lt!418010) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!283674 (= lt!418010 #b0000000000000000000000000000000000000000000000000000000000000111)))

(assert (=> b!283674 (= lt!418009 (bitIndex!0 (size!7124 (buf!7370 thiss!1939)) (currentByte!13647 thiss!1939) (currentBit!13642 thiss!1939)))))

(assert (= (and d!97378 res!235082) b!283673))

(assert (= (and b!283673 res!235081) b!283674))

(declare-fun m!416763 () Bool)

(assert (=> d!97378 m!416763))

(declare-fun m!416765 () Bool)

(assert (=> b!283674 m!416765))

(declare-fun m!416767 () Bool)

(assert (=> b!283674 m!416767))

(assert (=> b!283649 d!97378))

(declare-fun d!97394 () Bool)

(assert (=> d!97394 (= (array_inv!6817 (buf!7370 thiss!1939)) (bvsge (size!7124 (buf!7370 thiss!1939)) #b00000000000000000000000000000000))))

(assert (=> b!283650 d!97394))

(declare-fun d!97396 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97396 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7124 (buf!7370 thiss!1939))) ((_ sign_extend 32) (currentByte!13647 thiss!1939)) ((_ sign_extend 32) (currentBit!13642 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13647 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13642 thiss!1939))) #b00000000000000000000000000001111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7124 (buf!7370 thiss!1939))) ((_ sign_extend 32) (currentByte!13647 thiss!1939)) ((_ sign_extend 32) (currentBit!13642 thiss!1939))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13647 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13642 thiss!1939))) #b00000000000000000000000000001111))))))

(declare-fun bs!24592 () Bool)

(assert (= bs!24592 d!97396))

(declare-fun m!416769 () Bool)

(assert (=> bs!24592 m!416769))

(assert (=> start!63396 d!97396))

(declare-fun d!97398 () Bool)

(assert (=> d!97398 (= (inv!12 thiss!1939) (invariant!0 (currentBit!13642 thiss!1939) (currentByte!13647 thiss!1939) (size!7124 (buf!7370 thiss!1939))))))

(declare-fun bs!24593 () Bool)

(assert (= bs!24593 d!97398))

(declare-fun m!416771 () Bool)

(assert (=> bs!24593 m!416771))

(assert (=> start!63396 d!97398))

(check-sat (not d!97396) (not d!97378) (not d!97398) (not d!97370) (not b!283674))
(check-sat)
(get-model)

(declare-fun d!97406 () Bool)

(assert (=> d!97406 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7124 (buf!7370 thiss!1939))) ((_ sign_extend 32) (currentByte!13647 thiss!1939)) ((_ sign_extend 32) (currentBit!13642 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13642 thiss!1939)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7124 (buf!7370 thiss!1939))) ((_ sign_extend 32) (currentByte!13647 thiss!1939)) ((_ sign_extend 32) (currentBit!13642 thiss!1939))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13642 thiss!1939)) #b00000000000000000000000000000111))))))

(declare-fun bs!24594 () Bool)

(assert (= bs!24594 d!97406))

(assert (=> bs!24594 m!416769))

(assert (=> d!97378 d!97406))

(declare-fun d!97410 () Bool)

(assert (=> d!97410 (= (remainingBits!0 ((_ sign_extend 32) (size!7124 (buf!7370 thiss!1939))) ((_ sign_extend 32) (currentByte!13647 thiss!1939)) ((_ sign_extend 32) (currentBit!13642 thiss!1939))) (bvsub (bvmul ((_ sign_extend 32) (size!7124 (buf!7370 thiss!1939))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13647 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13642 thiss!1939)))))))

(assert (=> d!97396 d!97410))

(declare-fun d!97414 () Bool)

(declare-fun e!202609 () Bool)

(assert (=> d!97414 e!202609))

(declare-fun res!235095 () Bool)

(assert (=> d!97414 (=> (not res!235095) (not e!202609))))

(declare-fun lt!418052 () (_ BitVec 64))

(declare-fun lt!418048 () (_ BitVec 64))

(declare-fun lt!418049 () (_ BitVec 64))

(assert (=> d!97414 (= res!235095 (= lt!418048 (bvsub lt!418052 lt!418049)))))

(assert (=> d!97414 (or (= (bvand lt!418052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418049 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418052 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418052 lt!418049) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97414 (= lt!418049 (remainingBits!0 ((_ sign_extend 32) (size!7124 (buf!7370 (_2!12490 lt!418011)))) ((_ sign_extend 32) (currentByte!13647 (_2!12490 lt!418011))) ((_ sign_extend 32) (currentBit!13642 (_2!12490 lt!418011)))))))

(declare-fun lt!418050 () (_ BitVec 64))

(declare-fun lt!418053 () (_ BitVec 64))

(assert (=> d!97414 (= lt!418052 (bvmul lt!418050 lt!418053))))

(assert (=> d!97414 (or (= lt!418050 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418053 (bvsdiv (bvmul lt!418050 lt!418053) lt!418050)))))

(assert (=> d!97414 (= lt!418053 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97414 (= lt!418050 ((_ sign_extend 32) (size!7124 (buf!7370 (_2!12490 lt!418011)))))))

(assert (=> d!97414 (= lt!418048 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13647 (_2!12490 lt!418011))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13642 (_2!12490 lt!418011)))))))

(assert (=> d!97414 (invariant!0 (currentBit!13642 (_2!12490 lt!418011)) (currentByte!13647 (_2!12490 lt!418011)) (size!7124 (buf!7370 (_2!12490 lt!418011))))))

(assert (=> d!97414 (= (bitIndex!0 (size!7124 (buf!7370 (_2!12490 lt!418011))) (currentByte!13647 (_2!12490 lt!418011)) (currentBit!13642 (_2!12490 lt!418011))) lt!418048)))

(declare-fun b!283687 () Bool)

(declare-fun res!235096 () Bool)

(assert (=> b!283687 (=> (not res!235096) (not e!202609))))

(assert (=> b!283687 (= res!235096 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418048))))

(declare-fun b!283688 () Bool)

(declare-fun lt!418051 () (_ BitVec 64))

(assert (=> b!283688 (= e!202609 (bvsle lt!418048 (bvmul lt!418051 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!283688 (or (= lt!418051 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418051 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418051)))))

(assert (=> b!283688 (= lt!418051 ((_ sign_extend 32) (size!7124 (buf!7370 (_2!12490 lt!418011)))))))

(assert (= (and d!97414 res!235095) b!283687))

(assert (= (and b!283687 res!235096) b!283688))

(declare-fun m!416777 () Bool)

(assert (=> d!97414 m!416777))

(declare-fun m!416779 () Bool)

(assert (=> d!97414 m!416779))

(assert (=> b!283674 d!97414))

(declare-fun d!97428 () Bool)

(declare-fun e!202610 () Bool)

(assert (=> d!97428 e!202610))

(declare-fun res!235097 () Bool)

(assert (=> d!97428 (=> (not res!235097) (not e!202610))))

(declare-fun lt!418055 () (_ BitVec 64))

(declare-fun lt!418054 () (_ BitVec 64))

(declare-fun lt!418058 () (_ BitVec 64))

(assert (=> d!97428 (= res!235097 (= lt!418054 (bvsub lt!418058 lt!418055)))))

(assert (=> d!97428 (or (= (bvand lt!418058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418055 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418058 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418058 lt!418055) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97428 (= lt!418055 (remainingBits!0 ((_ sign_extend 32) (size!7124 (buf!7370 thiss!1939))) ((_ sign_extend 32) (currentByte!13647 thiss!1939)) ((_ sign_extend 32) (currentBit!13642 thiss!1939))))))

(declare-fun lt!418056 () (_ BitVec 64))

(declare-fun lt!418059 () (_ BitVec 64))

(assert (=> d!97428 (= lt!418058 (bvmul lt!418056 lt!418059))))

(assert (=> d!97428 (or (= lt!418056 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418059 (bvsdiv (bvmul lt!418056 lt!418059) lt!418056)))))

(assert (=> d!97428 (= lt!418059 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97428 (= lt!418056 ((_ sign_extend 32) (size!7124 (buf!7370 thiss!1939))))))

(assert (=> d!97428 (= lt!418054 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13647 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13642 thiss!1939))))))

(assert (=> d!97428 (invariant!0 (currentBit!13642 thiss!1939) (currentByte!13647 thiss!1939) (size!7124 (buf!7370 thiss!1939)))))

(assert (=> d!97428 (= (bitIndex!0 (size!7124 (buf!7370 thiss!1939)) (currentByte!13647 thiss!1939) (currentBit!13642 thiss!1939)) lt!418054)))

(declare-fun b!283689 () Bool)

(declare-fun res!235098 () Bool)

(assert (=> b!283689 (=> (not res!235098) (not e!202610))))

(assert (=> b!283689 (= res!235098 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418054))))

(declare-fun b!283690 () Bool)

(declare-fun lt!418057 () (_ BitVec 64))

(assert (=> b!283690 (= e!202610 (bvsle lt!418054 (bvmul lt!418057 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!283690 (or (= lt!418057 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418057 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418057)))))

(assert (=> b!283690 (= lt!418057 ((_ sign_extend 32) (size!7124 (buf!7370 thiss!1939))))))

(assert (= (and d!97428 res!235097) b!283689))

(assert (= (and b!283689 res!235098) b!283690))

(assert (=> d!97428 m!416769))

(assert (=> d!97428 m!416771))

(assert (=> b!283674 d!97428))

(declare-fun d!97430 () Bool)

(assert (=> d!97430 (= (invariant!0 (currentBit!13642 thiss!1939) (currentByte!13647 thiss!1939) (size!7124 (buf!7370 thiss!1939))) (and (bvsge (currentBit!13642 thiss!1939) #b00000000000000000000000000000000) (bvslt (currentBit!13642 thiss!1939) #b00000000000000000000000000001000) (bvsge (currentByte!13647 thiss!1939) #b00000000000000000000000000000000) (or (bvslt (currentByte!13647 thiss!1939) (size!7124 (buf!7370 thiss!1939))) (and (= (currentBit!13642 thiss!1939) #b00000000000000000000000000000000) (= (currentByte!13647 thiss!1939) (size!7124 (buf!7370 thiss!1939)))))))))

(assert (=> d!97398 d!97430))

(declare-fun d!97432 () Bool)

(assert (=> d!97432 (= (invariant!0 (currentBit!13642 (BitStream!12619 (buf!7370 (_2!12490 lt!417981)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13647 (_2!12490 lt!417981))) #b00000000000000000000000000000010)) (currentBit!13642 (_2!12490 lt!417981)))) (currentByte!13647 (BitStream!12619 (buf!7370 (_2!12490 lt!417981)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13647 (_2!12490 lt!417981))) #b00000000000000000000000000000010)) (currentBit!13642 (_2!12490 lt!417981)))) (size!7124 (buf!7370 (BitStream!12619 (buf!7370 (_2!12490 lt!417981)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13647 (_2!12490 lt!417981))) #b00000000000000000000000000000010)) (currentBit!13642 (_2!12490 lt!417981)))))) (and (bvsge (currentBit!13642 (BitStream!12619 (buf!7370 (_2!12490 lt!417981)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13647 (_2!12490 lt!417981))) #b00000000000000000000000000000010)) (currentBit!13642 (_2!12490 lt!417981)))) #b00000000000000000000000000000000) (bvslt (currentBit!13642 (BitStream!12619 (buf!7370 (_2!12490 lt!417981)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13647 (_2!12490 lt!417981))) #b00000000000000000000000000000010)) (currentBit!13642 (_2!12490 lt!417981)))) #b00000000000000000000000000001000) (bvsge (currentByte!13647 (BitStream!12619 (buf!7370 (_2!12490 lt!417981)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13647 (_2!12490 lt!417981))) #b00000000000000000000000000000010)) (currentBit!13642 (_2!12490 lt!417981)))) #b00000000000000000000000000000000) (or (bvslt (currentByte!13647 (BitStream!12619 (buf!7370 (_2!12490 lt!417981)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13647 (_2!12490 lt!417981))) #b00000000000000000000000000000010)) (currentBit!13642 (_2!12490 lt!417981)))) (size!7124 (buf!7370 (BitStream!12619 (buf!7370 (_2!12490 lt!417981)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13647 (_2!12490 lt!417981))) #b00000000000000000000000000000010)) (currentBit!13642 (_2!12490 lt!417981)))))) (and (= (currentBit!13642 (BitStream!12619 (buf!7370 (_2!12490 lt!417981)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13647 (_2!12490 lt!417981))) #b00000000000000000000000000000010)) (currentBit!13642 (_2!12490 lt!417981)))) #b00000000000000000000000000000000) (= (currentByte!13647 (BitStream!12619 (buf!7370 (_2!12490 lt!417981)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13647 (_2!12490 lt!417981))) #b00000000000000000000000000000010)) (currentBit!13642 (_2!12490 lt!417981)))) (size!7124 (buf!7370 (BitStream!12619 (buf!7370 (_2!12490 lt!417981)) (bvmul #b00000000000000000000000000000010 (bvsdiv (bvadd #b00000000000000000000000000000001 (currentByte!13647 (_2!12490 lt!417981))) #b00000000000000000000000000000010)) (currentBit!13642 (_2!12490 lt!417981))))))))))))

(assert (=> d!97370 d!97432))

(check-sat (not d!97406) (not d!97428) (not d!97414))
(check-sat)
