; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63450 () Bool)

(assert start!63450)

(declare-fun res!235121 () Bool)

(declare-fun e!202659 () Bool)

(assert (=> start!63450 (=> (not res!235121) (not e!202659))))

(declare-datatypes ((array!16512 0))(
  ( (array!16513 (arr!8126 (Array (_ BitVec 32) (_ BitVec 8))) (size!7130 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12630 0))(
  ( (BitStream!12631 (buf!7376 array!16512) (currentByte!13665 (_ BitVec 32)) (currentBit!13660 (_ BitVec 32))) )
))
(declare-fun thiss!1939 () BitStream!12630)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63450 (= res!235121 (validate_offset_bits!1 ((_ sign_extend 32) (size!7130 (buf!7376 thiss!1939))) ((_ sign_extend 32) (currentByte!13665 thiss!1939)) ((_ sign_extend 32) (currentBit!13660 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13665 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13660 thiss!1939))) #b00000000000000000000000000001111))))))

(assert (=> start!63450 e!202659))

(declare-fun e!202657 () Bool)

(declare-fun inv!12 (BitStream!12630) Bool)

(assert (=> start!63450 (and (inv!12 thiss!1939) e!202657)))

(declare-fun b!283727 () Bool)

(declare-datatypes ((Unit!19873 0))(
  ( (Unit!19874) )
))
(declare-datatypes ((tuple2!22604 0))(
  ( (tuple2!22605 (_1!12496 Unit!19873) (_2!12496 BitStream!12630)) )
))
(declare-fun lt!418098 () tuple2!22604)

(assert (=> b!283727 (= e!202659 (and (= (bvand (currentByte!13665 (_2!12496 lt!418098)) #b10000000000000000000000000000000) #b00000000000000000000000000000000) (not (= (bvand (currentByte!13665 (_2!12496 lt!418098)) #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 (currentByte!13665 (_2!12496 lt!418098))) #b10000000000000000000000000000000)))))))

(declare-fun alignToByte!0 (BitStream!12630) tuple2!22604)

(assert (=> b!283727 (= lt!418098 (alignToByte!0 thiss!1939))))

(declare-fun b!283728 () Bool)

(declare-fun array_inv!6823 (array!16512) Bool)

(assert (=> b!283728 (= e!202657 (array_inv!6823 (buf!7376 thiss!1939)))))

(assert (= (and start!63450 res!235121) b!283727))

(assert (= start!63450 b!283728))

(declare-fun m!416817 () Bool)

(assert (=> start!63450 m!416817))

(declare-fun m!416819 () Bool)

(assert (=> start!63450 m!416819))

(declare-fun m!416821 () Bool)

(assert (=> b!283727 m!416821))

(declare-fun m!416823 () Bool)

(assert (=> b!283728 m!416823))

(check-sat (not start!63450) (not b!283728) (not b!283727))
(check-sat)
(get-model)

(declare-fun d!97442 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97442 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7130 (buf!7376 thiss!1939))) ((_ sign_extend 32) (currentByte!13665 thiss!1939)) ((_ sign_extend 32) (currentBit!13660 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13665 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13660 thiss!1939))) #b00000000000000000000000000001111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7130 (buf!7376 thiss!1939))) ((_ sign_extend 32) (currentByte!13665 thiss!1939)) ((_ sign_extend 32) (currentBit!13660 thiss!1939))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000010000 (bvadd (bvmul #b00000000000000000000000000001000 (bvand (currentByte!13665 thiss!1939) #b00000000000000000000000000000001)) (currentBit!13660 thiss!1939))) #b00000000000000000000000000001111))))))

(declare-fun bs!24603 () Bool)

(assert (= bs!24603 d!97442))

(declare-fun m!416833 () Bool)

(assert (=> bs!24603 m!416833))

(assert (=> start!63450 d!97442))

(declare-fun d!97444 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97444 (= (inv!12 thiss!1939) (invariant!0 (currentBit!13660 thiss!1939) (currentByte!13665 thiss!1939) (size!7130 (buf!7376 thiss!1939))))))

(declare-fun bs!24604 () Bool)

(assert (= bs!24604 d!97444))

(declare-fun m!416835 () Bool)

(assert (=> bs!24604 m!416835))

(assert (=> start!63450 d!97444))

(declare-fun d!97446 () Bool)

(assert (=> d!97446 (= (array_inv!6823 (buf!7376 thiss!1939)) (bvsge (size!7130 (buf!7376 thiss!1939)) #b00000000000000000000000000000000))))

(assert (=> b!283728 d!97446))

(declare-fun d!97448 () Bool)

(declare-fun e!202680 () Bool)

(assert (=> d!97448 e!202680))

(declare-fun res!235136 () Bool)

(assert (=> d!97448 (=> (not res!235136) (not e!202680))))

(assert (=> d!97448 (= res!235136 (validate_offset_bits!1 ((_ sign_extend 32) (size!7130 (buf!7376 thiss!1939))) ((_ sign_extend 32) (currentByte!13665 thiss!1939)) ((_ sign_extend 32) (currentBit!13660 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13660 thiss!1939)) #b00000000000000000000000000000111))))))

(declare-fun Unit!19881 () Unit!19873)

(declare-fun Unit!19882 () Unit!19873)

(assert (=> d!97448 (= (alignToByte!0 thiss!1939) (ite (not (= (currentBit!13660 thiss!1939) #b00000000000000000000000000000000)) (tuple2!22605 Unit!19881 (BitStream!12631 (buf!7376 thiss!1939) (bvadd (currentByte!13665 thiss!1939) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!22605 Unit!19882 thiss!1939)))))

(declare-fun b!283745 () Bool)

(declare-fun e!202679 () Bool)

(assert (=> b!283745 (= e!202680 e!202679)))

(declare-fun res!235135 () Bool)

(assert (=> b!283745 (=> (not res!235135) (not e!202679))))

(declare-fun lt!418117 () tuple2!22604)

(assert (=> b!283745 (= res!235135 (= (buf!7376 (_2!12496 lt!418117)) (buf!7376 thiss!1939)))))

(declare-fun Unit!19883 () Unit!19873)

(declare-fun Unit!19884 () Unit!19873)

(assert (=> b!283745 (= lt!418117 (ite (not (= (currentBit!13660 thiss!1939) #b00000000000000000000000000000000)) (tuple2!22605 Unit!19883 (BitStream!12631 (buf!7376 thiss!1939) (bvadd (currentByte!13665 thiss!1939) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (tuple2!22605 Unit!19884 thiss!1939)))))

(declare-fun lt!418119 () (_ BitVec 64))

(declare-fun lt!418118 () (_ BitVec 64))

(declare-fun b!283746 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!283746 (= e!202679 (bvsle (bitIndex!0 (size!7130 (buf!7376 (_2!12496 lt!418117))) (currentByte!13665 (_2!12496 lt!418117)) (currentBit!13660 (_2!12496 lt!418117))) (bvadd lt!418118 lt!418119)))))

(assert (=> b!283746 (or (not (= (bvand lt!418118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418119 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!418118 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!418118 lt!418119) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!283746 (= lt!418119 #b0000000000000000000000000000000000000000000000000000000000000111)))

(assert (=> b!283746 (= lt!418118 (bitIndex!0 (size!7130 (buf!7376 thiss!1939)) (currentByte!13665 thiss!1939) (currentBit!13660 thiss!1939)))))

(assert (= (and d!97448 res!235136) b!283745))

(assert (= (and b!283745 res!235135) b!283746))

(declare-fun m!416849 () Bool)

(assert (=> d!97448 m!416849))

(declare-fun m!416853 () Bool)

(assert (=> b!283746 m!416853))

(declare-fun m!416855 () Bool)

(assert (=> b!283746 m!416855))

(assert (=> b!283727 d!97448))

(check-sat (not d!97442) (not d!97444) (not d!97448) (not b!283746))
(check-sat)
(get-model)

(declare-fun d!97464 () Bool)

(assert (=> d!97464 (= (remainingBits!0 ((_ sign_extend 32) (size!7130 (buf!7376 thiss!1939))) ((_ sign_extend 32) (currentByte!13665 thiss!1939)) ((_ sign_extend 32) (currentBit!13660 thiss!1939))) (bvsub (bvmul ((_ sign_extend 32) (size!7130 (buf!7376 thiss!1939))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13665 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13660 thiss!1939)))))))

(assert (=> d!97442 d!97464))

(declare-fun d!97466 () Bool)

(assert (=> d!97466 (= (invariant!0 (currentBit!13660 thiss!1939) (currentByte!13665 thiss!1939) (size!7130 (buf!7376 thiss!1939))) (and (bvsge (currentBit!13660 thiss!1939) #b00000000000000000000000000000000) (bvslt (currentBit!13660 thiss!1939) #b00000000000000000000000000001000) (bvsge (currentByte!13665 thiss!1939) #b00000000000000000000000000000000) (or (bvslt (currentByte!13665 thiss!1939) (size!7130 (buf!7376 thiss!1939))) (and (= (currentBit!13660 thiss!1939) #b00000000000000000000000000000000) (= (currentByte!13665 thiss!1939) (size!7130 (buf!7376 thiss!1939)))))))))

(assert (=> d!97444 d!97466))

(declare-fun d!97468 () Bool)

(assert (=> d!97468 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7130 (buf!7376 thiss!1939))) ((_ sign_extend 32) (currentByte!13665 thiss!1939)) ((_ sign_extend 32) (currentBit!13660 thiss!1939)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13660 thiss!1939)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7130 (buf!7376 thiss!1939))) ((_ sign_extend 32) (currentByte!13665 thiss!1939)) ((_ sign_extend 32) (currentBit!13660 thiss!1939))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13660 thiss!1939)) #b00000000000000000000000000000111))))))

(declare-fun bs!24609 () Bool)

(assert (= bs!24609 d!97468))

(assert (=> bs!24609 m!416833))

(assert (=> d!97448 d!97468))

(declare-fun d!97470 () Bool)

(declare-fun e!202689 () Bool)

(assert (=> d!97470 e!202689))

(declare-fun res!235147 () Bool)

(assert (=> d!97470 (=> (not res!235147) (not e!202689))))

(declare-fun lt!418144 () (_ BitVec 64))

(declare-fun lt!418145 () (_ BitVec 64))

(declare-fun lt!418141 () (_ BitVec 64))

(assert (=> d!97470 (= res!235147 (= lt!418141 (bvsub lt!418145 lt!418144)))))

(assert (=> d!97470 (or (= (bvand lt!418145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418144 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418145 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418145 lt!418144) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97470 (= lt!418144 (remainingBits!0 ((_ sign_extend 32) (size!7130 (buf!7376 (_2!12496 lt!418117)))) ((_ sign_extend 32) (currentByte!13665 (_2!12496 lt!418117))) ((_ sign_extend 32) (currentBit!13660 (_2!12496 lt!418117)))))))

(declare-fun lt!418142 () (_ BitVec 64))

(declare-fun lt!418146 () (_ BitVec 64))

(assert (=> d!97470 (= lt!418145 (bvmul lt!418142 lt!418146))))

(assert (=> d!97470 (or (= lt!418142 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418146 (bvsdiv (bvmul lt!418142 lt!418146) lt!418142)))))

(assert (=> d!97470 (= lt!418146 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97470 (= lt!418142 ((_ sign_extend 32) (size!7130 (buf!7376 (_2!12496 lt!418117)))))))

(assert (=> d!97470 (= lt!418141 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13665 (_2!12496 lt!418117))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13660 (_2!12496 lt!418117)))))))

(assert (=> d!97470 (invariant!0 (currentBit!13660 (_2!12496 lt!418117)) (currentByte!13665 (_2!12496 lt!418117)) (size!7130 (buf!7376 (_2!12496 lt!418117))))))

(assert (=> d!97470 (= (bitIndex!0 (size!7130 (buf!7376 (_2!12496 lt!418117))) (currentByte!13665 (_2!12496 lt!418117)) (currentBit!13660 (_2!12496 lt!418117))) lt!418141)))

(declare-fun b!283757 () Bool)

(declare-fun res!235148 () Bool)

(assert (=> b!283757 (=> (not res!235148) (not e!202689))))

(assert (=> b!283757 (= res!235148 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418141))))

(declare-fun b!283758 () Bool)

(declare-fun lt!418143 () (_ BitVec 64))

(assert (=> b!283758 (= e!202689 (bvsle lt!418141 (bvmul lt!418143 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!283758 (or (= lt!418143 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418143 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418143)))))

(assert (=> b!283758 (= lt!418143 ((_ sign_extend 32) (size!7130 (buf!7376 (_2!12496 lt!418117)))))))

(assert (= (and d!97470 res!235147) b!283757))

(assert (= (and b!283757 res!235148) b!283758))

(declare-fun m!416863 () Bool)

(assert (=> d!97470 m!416863))

(declare-fun m!416865 () Bool)

(assert (=> d!97470 m!416865))

(assert (=> b!283746 d!97470))

(declare-fun d!97480 () Bool)

(declare-fun e!202690 () Bool)

(assert (=> d!97480 e!202690))

(declare-fun res!235149 () Bool)

(assert (=> d!97480 (=> (not res!235149) (not e!202690))))

(declare-fun lt!418150 () (_ BitVec 64))

(declare-fun lt!418147 () (_ BitVec 64))

(declare-fun lt!418151 () (_ BitVec 64))

(assert (=> d!97480 (= res!235149 (= lt!418147 (bvsub lt!418151 lt!418150)))))

(assert (=> d!97480 (or (= (bvand lt!418151 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418150 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418151 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418151 lt!418150) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97480 (= lt!418150 (remainingBits!0 ((_ sign_extend 32) (size!7130 (buf!7376 thiss!1939))) ((_ sign_extend 32) (currentByte!13665 thiss!1939)) ((_ sign_extend 32) (currentBit!13660 thiss!1939))))))

(declare-fun lt!418148 () (_ BitVec 64))

(declare-fun lt!418152 () (_ BitVec 64))

(assert (=> d!97480 (= lt!418151 (bvmul lt!418148 lt!418152))))

(assert (=> d!97480 (or (= lt!418148 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418152 (bvsdiv (bvmul lt!418148 lt!418152) lt!418148)))))

(assert (=> d!97480 (= lt!418152 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97480 (= lt!418148 ((_ sign_extend 32) (size!7130 (buf!7376 thiss!1939))))))

(assert (=> d!97480 (= lt!418147 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13665 thiss!1939)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13660 thiss!1939))))))

(assert (=> d!97480 (invariant!0 (currentBit!13660 thiss!1939) (currentByte!13665 thiss!1939) (size!7130 (buf!7376 thiss!1939)))))

(assert (=> d!97480 (= (bitIndex!0 (size!7130 (buf!7376 thiss!1939)) (currentByte!13665 thiss!1939) (currentBit!13660 thiss!1939)) lt!418147)))

(declare-fun b!283759 () Bool)

(declare-fun res!235150 () Bool)

(assert (=> b!283759 (=> (not res!235150) (not e!202690))))

(assert (=> b!283759 (= res!235150 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418147))))

(declare-fun b!283760 () Bool)

(declare-fun lt!418149 () (_ BitVec 64))

(assert (=> b!283760 (= e!202690 (bvsle lt!418147 (bvmul lt!418149 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!283760 (or (= lt!418149 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418149 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418149)))))

(assert (=> b!283760 (= lt!418149 ((_ sign_extend 32) (size!7130 (buf!7376 thiss!1939))))))

(assert (= (and d!97480 res!235149) b!283759))

(assert (= (and b!283759 res!235150) b!283760))

(assert (=> d!97480 m!416833))

(assert (=> d!97480 m!416835))

(assert (=> b!283746 d!97480))

(check-sat (not d!97468) (not d!97480) (not d!97470))
(check-sat)
