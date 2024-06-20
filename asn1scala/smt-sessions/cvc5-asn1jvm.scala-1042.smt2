; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29884 () Bool)

(assert start!29884)

(declare-fun b!153724 () Bool)

(declare-fun e!103130 () Bool)

(declare-datatypes ((array!6920 0))(
  ( (array!6921 (arr!3944 (Array (_ BitVec 32) (_ BitVec 8))) (size!3121 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5500 0))(
  ( (BitStream!5501 (buf!3624 array!6920) (currentByte!6625 (_ BitVec 32)) (currentBit!6620 (_ BitVec 32))) )
))
(declare-fun bs1!10 () BitStream!5500)

(declare-fun array_inv!2910 (array!6920) Bool)

(assert (=> b!153724 (= e!103130 (array_inv!2910 (buf!3624 bs1!10)))))

(declare-fun b!153725 () Bool)

(declare-fun e!103131 () Bool)

(declare-fun e!103126 () Bool)

(assert (=> b!153725 (= e!103131 e!103126)))

(declare-fun res!128745 () Bool)

(assert (=> b!153725 (=> (not res!128745) (not e!103126))))

(declare-fun lt!240064 () (_ BitVec 64))

(assert (=> b!153725 (= res!128745 (bvsle lt!240064 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!3121 (buf!3624 bs1!10))))))))

(declare-fun lt!240060 () (_ BitVec 64))

(assert (=> b!153725 (= lt!240064 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!240060))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!153725 (= lt!240060 (bitIndex!0 (size!3121 (buf!3624 bs1!10)) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10)))))

(declare-fun b!153726 () Bool)

(declare-fun res!128743 () Bool)

(assert (=> b!153726 (=> (not res!128743) (not e!103126))))

(declare-fun bs2!18 () BitStream!5500)

(assert (=> b!153726 (= res!128743 (bvsle lt!240064 (bitIndex!0 (size!3121 (buf!3624 bs2!18)) (currentByte!6625 bs2!18) (currentBit!6620 bs2!18))))))

(declare-fun b!153727 () Bool)

(declare-fun e!103127 () Bool)

(declare-datatypes ((tuple2!13642 0))(
  ( (tuple2!13643 (_1!7214 BitStream!5500) (_2!7214 (_ BitVec 8))) )
))
(declare-fun lt!240059 () tuple2!13642)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153727 (= e!103127 (not (invariant!0 (currentBit!6620 (_1!7214 lt!240059)) (currentByte!6625 (_1!7214 lt!240059)) (size!3121 (buf!3624 (_1!7214 lt!240059))))))))

(assert (=> b!153727 (= (select (arr!3944 (buf!3624 bs1!10)) (currentByte!6625 bs1!10)) (select (arr!3944 (buf!3624 bs2!18)) (currentByte!6625 bs1!10)))))

(declare-fun lt!240063 () (_ BitVec 32))

(declare-datatypes ((Unit!9721 0))(
  ( (Unit!9722) )
))
(declare-fun lt!240061 () Unit!9721)

(declare-fun arrayRangesEqImpliesEq!24 (array!6920 array!6920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9721)

(assert (=> b!153727 (= lt!240061 (arrayRangesEqImpliesEq!24 (buf!3624 bs1!10) (buf!3624 bs2!18) #b00000000000000000000000000000000 (currentByte!6625 bs1!10) lt!240063))))

(declare-fun b!153728 () Bool)

(declare-fun res!128744 () Bool)

(assert (=> b!153728 (=> (not res!128744) (not e!103127))))

(declare-fun arrayRangesEq!383 (array!6920 array!6920 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!153728 (= res!128744 (arrayRangesEq!383 (buf!3624 bs1!10) (buf!3624 bs2!18) #b00000000000000000000000000000000 lt!240063))))

(declare-fun res!128740 () Bool)

(assert (=> start!29884 (=> (not res!128740) (not e!103131))))

(assert (=> start!29884 (= res!128740 (= (size!3121 (buf!3624 bs1!10)) (size!3121 (buf!3624 bs2!18))))))

(assert (=> start!29884 e!103131))

(declare-fun inv!12 (BitStream!5500) Bool)

(assert (=> start!29884 (and (inv!12 bs1!10) e!103130)))

(declare-fun e!103125 () Bool)

(assert (=> start!29884 (and (inv!12 bs2!18) e!103125)))

(declare-fun b!153729 () Bool)

(assert (=> b!153729 (= e!103126 e!103127)))

(declare-fun res!128742 () Bool)

(assert (=> b!153729 (=> (not res!128742) (not e!103127))))

(assert (=> b!153729 (= res!128742 (and (bvsle #b00000000000000000000000000000000 lt!240063) (bvsle lt!240063 (size!3121 (buf!3624 bs1!10))) (bvsle #b00000000000000000000000000000000 (currentByte!6625 bs1!10)) (bvslt (currentByte!6625 bs1!10) lt!240063)))))

(assert (=> b!153729 (= lt!240063 ((_ extract 31 0) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bvsdiv lt!240060 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun readBytePure!0 (BitStream!5500) tuple2!13642)

(assert (=> b!153729 (= lt!240059 (readBytePure!0 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10))))))

(declare-fun lt!240062 () tuple2!13642)

(assert (=> b!153729 (= lt!240062 (readBytePure!0 bs1!10))))

(declare-fun b!153730 () Bool)

(assert (=> b!153730 (= e!103125 (array_inv!2910 (buf!3624 bs2!18)))))

(declare-fun b!153731 () Bool)

(declare-fun res!128741 () Bool)

(assert (=> b!153731 (=> (not res!128741) (not e!103126))))

(declare-fun arrayBitRangesEq!0 (array!6920 array!6920 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!153731 (= res!128741 (arrayBitRangesEq!0 (buf!3624 bs1!10) (buf!3624 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240064))))

(assert (= (and start!29884 res!128740) b!153725))

(assert (= (and b!153725 res!128745) b!153726))

(assert (= (and b!153726 res!128743) b!153731))

(assert (= (and b!153731 res!128741) b!153729))

(assert (= (and b!153729 res!128742) b!153728))

(assert (= (and b!153728 res!128744) b!153727))

(assert (= start!29884 b!153724))

(assert (= start!29884 b!153730))

(declare-fun m!239611 () Bool)

(assert (=> b!153730 m!239611))

(declare-fun m!239613 () Bool)

(assert (=> b!153729 m!239613))

(declare-fun m!239615 () Bool)

(assert (=> b!153729 m!239615))

(declare-fun m!239617 () Bool)

(assert (=> b!153728 m!239617))

(declare-fun m!239619 () Bool)

(assert (=> b!153726 m!239619))

(declare-fun m!239621 () Bool)

(assert (=> start!29884 m!239621))

(declare-fun m!239623 () Bool)

(assert (=> start!29884 m!239623))

(declare-fun m!239625 () Bool)

(assert (=> b!153731 m!239625))

(declare-fun m!239627 () Bool)

(assert (=> b!153725 m!239627))

(declare-fun m!239629 () Bool)

(assert (=> b!153727 m!239629))

(declare-fun m!239631 () Bool)

(assert (=> b!153727 m!239631))

(declare-fun m!239633 () Bool)

(assert (=> b!153727 m!239633))

(declare-fun m!239635 () Bool)

(assert (=> b!153727 m!239635))

(declare-fun m!239637 () Bool)

(assert (=> b!153724 m!239637))

(push 1)

(assert (not start!29884))

(assert (not b!153731))

(assert (not b!153729))

(assert (not b!153724))

(assert (not b!153727))

(assert (not b!153730))

(assert (not b!153726))

(assert (not b!153725))

(assert (not b!153728))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50592 () Bool)

(declare-fun e!103197 () Bool)

(assert (=> d!50592 e!103197))

(declare-fun res!128808 () Bool)

(assert (=> d!50592 (=> (not res!128808) (not e!103197))))

(declare-fun lt!240143 () (_ BitVec 64))

(declare-fun lt!240141 () (_ BitVec 64))

(declare-fun lt!240144 () (_ BitVec 64))

(assert (=> d!50592 (= res!128808 (= lt!240143 (bvsub lt!240141 lt!240144)))))

(assert (=> d!50592 (or (= (bvand lt!240141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240144 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240141 lt!240144) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!50592 (= lt!240144 (remainingBits!0 ((_ sign_extend 32) (size!3121 (buf!3624 bs1!10))) ((_ sign_extend 32) (currentByte!6625 bs1!10)) ((_ sign_extend 32) (currentBit!6620 bs1!10))))))

(declare-fun lt!240145 () (_ BitVec 64))

(declare-fun lt!240140 () (_ BitVec 64))

(assert (=> d!50592 (= lt!240141 (bvmul lt!240145 lt!240140))))

(assert (=> d!50592 (or (= lt!240145 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240140 (bvsdiv (bvmul lt!240145 lt!240140) lt!240145)))))

(assert (=> d!50592 (= lt!240140 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50592 (= lt!240145 ((_ sign_extend 32) (size!3121 (buf!3624 bs1!10))))))

(assert (=> d!50592 (= lt!240143 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6625 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6620 bs1!10))))))

(assert (=> d!50592 (invariant!0 (currentBit!6620 bs1!10) (currentByte!6625 bs1!10) (size!3121 (buf!3624 bs1!10)))))

(assert (=> d!50592 (= (bitIndex!0 (size!3121 (buf!3624 bs1!10)) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10)) lt!240143)))

(declare-fun b!153811 () Bool)

(declare-fun res!128807 () Bool)

(assert (=> b!153811 (=> (not res!128807) (not e!103197))))

(assert (=> b!153811 (= res!128807 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240143))))

(declare-fun b!153812 () Bool)

(declare-fun lt!240142 () (_ BitVec 64))

(assert (=> b!153812 (= e!103197 (bvsle lt!240143 (bvmul lt!240142 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153812 (or (= lt!240142 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240142 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240142)))))

(assert (=> b!153812 (= lt!240142 ((_ sign_extend 32) (size!3121 (buf!3624 bs1!10))))))

(assert (= (and d!50592 res!128808) b!153811))

(assert (= (and b!153811 res!128807) b!153812))

(declare-fun m!239717 () Bool)

(assert (=> d!50592 m!239717))

(declare-fun m!239719 () Bool)

(assert (=> d!50592 m!239719))

(assert (=> b!153725 d!50592))

(declare-fun d!50602 () Bool)

(declare-fun e!103198 () Bool)

(assert (=> d!50602 e!103198))

(declare-fun res!128810 () Bool)

(assert (=> d!50602 (=> (not res!128810) (not e!103198))))

(declare-fun lt!240150 () (_ BitVec 64))

(declare-fun lt!240149 () (_ BitVec 64))

(declare-fun lt!240147 () (_ BitVec 64))

(assert (=> d!50602 (= res!128810 (= lt!240149 (bvsub lt!240147 lt!240150)))))

(assert (=> d!50602 (or (= (bvand lt!240147 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240150 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!240147 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!240147 lt!240150) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!50602 (= lt!240150 (remainingBits!0 ((_ sign_extend 32) (size!3121 (buf!3624 bs2!18))) ((_ sign_extend 32) (currentByte!6625 bs2!18)) ((_ sign_extend 32) (currentBit!6620 bs2!18))))))

(declare-fun lt!240151 () (_ BitVec 64))

(declare-fun lt!240146 () (_ BitVec 64))

(assert (=> d!50602 (= lt!240147 (bvmul lt!240151 lt!240146))))

(assert (=> d!50602 (or (= lt!240151 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!240146 (bvsdiv (bvmul lt!240151 lt!240146) lt!240151)))))

(assert (=> d!50602 (= lt!240146 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!50602 (= lt!240151 ((_ sign_extend 32) (size!3121 (buf!3624 bs2!18))))))

(assert (=> d!50602 (= lt!240149 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6625 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6620 bs2!18))))))

(assert (=> d!50602 (invariant!0 (currentBit!6620 bs2!18) (currentByte!6625 bs2!18) (size!3121 (buf!3624 bs2!18)))))

(assert (=> d!50602 (= (bitIndex!0 (size!3121 (buf!3624 bs2!18)) (currentByte!6625 bs2!18) (currentBit!6620 bs2!18)) lt!240149)))

(declare-fun b!153813 () Bool)

(declare-fun res!128809 () Bool)

(assert (=> b!153813 (=> (not res!128809) (not e!103198))))

(assert (=> b!153813 (= res!128809 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!240149))))

(declare-fun b!153814 () Bool)

(declare-fun lt!240148 () (_ BitVec 64))

(assert (=> b!153814 (= e!103198 (bvsle lt!240149 (bvmul lt!240148 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153814 (or (= lt!240148 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!240148 #b0000000000000000000000000000000000000000000000000000000000001000) lt!240148)))))

(assert (=> b!153814 (= lt!240148 ((_ sign_extend 32) (size!3121 (buf!3624 bs2!18))))))

(assert (= (and d!50602 res!128810) b!153813))

(assert (= (and b!153813 res!128809) b!153814))

(declare-fun m!239721 () Bool)

(assert (=> d!50602 m!239721))

(declare-fun m!239723 () Bool)

(assert (=> d!50602 m!239723))

(assert (=> b!153726 d!50602))

(declare-fun d!50604 () Bool)

(declare-fun res!128833 () Bool)

(declare-fun e!103220 () Bool)

(assert (=> d!50604 (=> res!128833 e!103220)))

(assert (=> d!50604 (= res!128833 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!240064))))

(assert (=> d!50604 (= (arrayBitRangesEq!0 (buf!3624 bs1!10) (buf!3624 bs2!18) #b0000000000000000000000000000000000000000000000000000000000000000 lt!240064) e!103220)))

(declare-fun e!103218 () Bool)

(declare-fun b!153837 () Bool)

(declare-datatypes ((tuple4!182 0))(
  ( (tuple4!183 (_1!7219 (_ BitVec 32)) (_2!7219 (_ BitVec 32)) (_3!394 (_ BitVec 32)) (_4!91 (_ BitVec 32))) )
))
(declare-fun lt!240172 () tuple4!182)

(assert (=> b!153837 (= e!103218 (arrayRangesEq!383 (buf!3624 bs1!10) (buf!3624 bs2!18) (_1!7219 lt!240172) (_2!7219 lt!240172)))))

(declare-fun b!153838 () Bool)

(declare-fun e!103221 () Bool)

(declare-fun call!2183 () Bool)

(assert (=> b!153838 (= e!103221 call!2183)))

(declare-fun b!153839 () Bool)

(declare-fun e!103223 () Bool)

(assert (=> b!153839 (= e!103223 e!103221)))

(declare-fun c!8199 () Bool)

(assert (=> b!153839 (= c!8199 (= (_3!394 lt!240172) (_4!91 lt!240172)))))

(declare-fun lt!240171 () (_ BitVec 32))

(declare-fun lt!240173 () (_ BitVec 32))

(declare-fun bm!2180 () Bool)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!2180 (= call!2183 (byteRangesEq!0 (select (arr!3944 (buf!3624 bs1!10)) (_3!394 lt!240172)) (select (arr!3944 (buf!3624 bs2!18)) (_3!394 lt!240172)) lt!240173 (ite c!8199 lt!240171 #b00000000000000000000000000001000)))))

(declare-fun b!153840 () Bool)

(declare-fun e!103222 () Bool)

(assert (=> b!153840 (= e!103221 e!103222)))

(declare-fun res!128829 () Bool)

(assert (=> b!153840 (= res!128829 call!2183)))

(assert (=> b!153840 (=> (not res!128829) (not e!103222))))

(declare-fun b!153841 () Bool)

(declare-fun res!128832 () Bool)

(assert (=> b!153841 (= res!128832 (= lt!240171 #b00000000000000000000000000000000))))

(declare-fun e!103219 () Bool)

(assert (=> b!153841 (=> res!128832 e!103219)))

(assert (=> b!153841 (= e!103222 e!103219)))

(declare-fun b!153842 () Bool)

(assert (=> b!153842 (= e!103220 e!103223)))

(declare-fun res!128830 () Bool)

(assert (=> b!153842 (=> (not res!128830) (not e!103223))))

(assert (=> b!153842 (= res!128830 e!103218)))

(declare-fun res!128831 () Bool)

(assert (=> b!153842 (=> res!128831 e!103218)))

(assert (=> b!153842 (= res!128831 (bvsge (_1!7219 lt!240172) (_2!7219 lt!240172)))))

(assert (=> b!153842 (= lt!240171 ((_ extract 31 0) (bvsrem lt!240064 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!153842 (= lt!240173 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!182)

(assert (=> b!153842 (= lt!240172 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!240064))))

(declare-fun b!153843 () Bool)

(assert (=> b!153843 (= e!103219 (byteRangesEq!0 (select (arr!3944 (buf!3624 bs1!10)) (_4!91 lt!240172)) (select (arr!3944 (buf!3624 bs2!18)) (_4!91 lt!240172)) #b00000000000000000000000000000000 lt!240171))))

(assert (= (and d!50604 (not res!128833)) b!153842))

(assert (= (and b!153842 (not res!128831)) b!153837))

(assert (= (and b!153842 res!128830) b!153839))

(assert (= (and b!153839 c!8199) b!153838))

(assert (= (and b!153839 (not c!8199)) b!153840))

(assert (= (and b!153840 res!128829) b!153841))

(assert (= (and b!153841 (not res!128832)) b!153843))

(assert (= (or b!153838 b!153840) bm!2180))

(declare-fun m!239739 () Bool)

(assert (=> b!153837 m!239739))

(declare-fun m!239741 () Bool)

(assert (=> bm!2180 m!239741))

(declare-fun m!239743 () Bool)

(assert (=> bm!2180 m!239743))

(assert (=> bm!2180 m!239741))

(assert (=> bm!2180 m!239743))

(declare-fun m!239745 () Bool)

(assert (=> bm!2180 m!239745))

(declare-fun m!239747 () Bool)

(assert (=> b!153842 m!239747))

(declare-fun m!239749 () Bool)

(assert (=> b!153843 m!239749))

(declare-fun m!239751 () Bool)

(assert (=> b!153843 m!239751))

(assert (=> b!153843 m!239749))

(assert (=> b!153843 m!239751))

(declare-fun m!239753 () Bool)

(assert (=> b!153843 m!239753))

(assert (=> b!153731 d!50604))

(declare-fun d!50614 () Bool)

(assert (=> d!50614 (= (invariant!0 (currentBit!6620 (_1!7214 lt!240059)) (currentByte!6625 (_1!7214 lt!240059)) (size!3121 (buf!3624 (_1!7214 lt!240059)))) (and (bvsge (currentBit!6620 (_1!7214 lt!240059)) #b00000000000000000000000000000000) (bvslt (currentBit!6620 (_1!7214 lt!240059)) #b00000000000000000000000000001000) (bvsge (currentByte!6625 (_1!7214 lt!240059)) #b00000000000000000000000000000000) (or (bvslt (currentByte!6625 (_1!7214 lt!240059)) (size!3121 (buf!3624 (_1!7214 lt!240059)))) (and (= (currentBit!6620 (_1!7214 lt!240059)) #b00000000000000000000000000000000) (= (currentByte!6625 (_1!7214 lt!240059)) (size!3121 (buf!3624 (_1!7214 lt!240059))))))))))

(assert (=> b!153727 d!50614))

(declare-fun d!50616 () Bool)

(assert (=> d!50616 (and (bvsge (currentByte!6625 bs1!10) #b00000000000000000000000000000000) (bvslt (currentByte!6625 bs1!10) (size!3121 (buf!3624 bs1!10))) (bvslt (currentByte!6625 bs1!10) (size!3121 (buf!3624 bs2!18))) (= (select (arr!3944 (buf!3624 bs1!10)) (currentByte!6625 bs1!10)) (select (arr!3944 (buf!3624 bs2!18)) (currentByte!6625 bs1!10))))))

(declare-fun lt!240176 () Unit!9721)

(declare-fun choose!108 (array!6920 array!6920 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9721)

(assert (=> d!50616 (= lt!240176 (choose!108 (buf!3624 bs1!10) (buf!3624 bs2!18) #b00000000000000000000000000000000 (currentByte!6625 bs1!10) lt!240063))))

(assert (=> d!50616 (and (bvsle #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 lt!240063))))

(assert (=> d!50616 (= (arrayRangesEqImpliesEq!24 (buf!3624 bs1!10) (buf!3624 bs2!18) #b00000000000000000000000000000000 (currentByte!6625 bs1!10) lt!240063) lt!240176)))

(declare-fun bs!12379 () Bool)

(assert (= bs!12379 d!50616))

(assert (=> bs!12379 m!239631))

(assert (=> bs!12379 m!239633))

(declare-fun m!239755 () Bool)

(assert (=> bs!12379 m!239755))

(assert (=> b!153727 d!50616))

(declare-fun d!50618 () Bool)

(declare-fun res!128838 () Bool)

(declare-fun e!103228 () Bool)

(assert (=> d!50618 (=> res!128838 e!103228)))

(assert (=> d!50618 (= res!128838 (= #b00000000000000000000000000000000 lt!240063))))

(assert (=> d!50618 (= (arrayRangesEq!383 (buf!3624 bs1!10) (buf!3624 bs2!18) #b00000000000000000000000000000000 lt!240063) e!103228)))

(declare-fun b!153848 () Bool)

(declare-fun e!103229 () Bool)

(assert (=> b!153848 (= e!103228 e!103229)))

(declare-fun res!128839 () Bool)

(assert (=> b!153848 (=> (not res!128839) (not e!103229))))

(assert (=> b!153848 (= res!128839 (= (select (arr!3944 (buf!3624 bs1!10)) #b00000000000000000000000000000000) (select (arr!3944 (buf!3624 bs2!18)) #b00000000000000000000000000000000)))))

(declare-fun b!153849 () Bool)

(assert (=> b!153849 (= e!103229 (arrayRangesEq!383 (buf!3624 bs1!10) (buf!3624 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!240063))))

(assert (= (and d!50618 (not res!128838)) b!153848))

(assert (= (and b!153848 res!128839) b!153849))

(declare-fun m!239757 () Bool)

(assert (=> b!153848 m!239757))

(declare-fun m!239759 () Bool)

(assert (=> b!153848 m!239759))

(declare-fun m!239761 () Bool)

(assert (=> b!153849 m!239761))

(assert (=> b!153728 d!50618))

(declare-fun d!50626 () Bool)

(assert (=> d!50626 (= (array_inv!2910 (buf!3624 bs1!10)) (bvsge (size!3121 (buf!3624 bs1!10)) #b00000000000000000000000000000000))))

(assert (=> b!153724 d!50626))

(declare-fun d!50632 () Bool)

(declare-datatypes ((tuple2!13650 0))(
  ( (tuple2!13651 (_1!7220 (_ BitVec 8)) (_2!7220 BitStream!5500)) )
))
(declare-fun lt!240179 () tuple2!13650)

(declare-fun readByte!0 (BitStream!5500) tuple2!13650)

(assert (=> d!50632 (= lt!240179 (readByte!0 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10))))))

(assert (=> d!50632 (= (readBytePure!0 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10))) (tuple2!13643 (_2!7220 lt!240179) (_1!7220 lt!240179)))))

(declare-fun bs!12382 () Bool)

(assert (= bs!12382 d!50632))

(declare-fun m!239767 () Bool)

(assert (=> bs!12382 m!239767))

(assert (=> b!153729 d!50632))

(declare-fun d!50636 () Bool)

(declare-fun lt!240180 () tuple2!13650)

(assert (=> d!50636 (= lt!240180 (readByte!0 bs1!10))))

(assert (=> d!50636 (= (readBytePure!0 bs1!10) (tuple2!13643 (_2!7220 lt!240180) (_1!7220 lt!240180)))))

(declare-fun bs!12383 () Bool)

(assert (= bs!12383 d!50636))

(declare-fun m!239769 () Bool)

(assert (=> bs!12383 m!239769))

(assert (=> b!153729 d!50636))

(declare-fun d!50638 () Bool)

(assert (=> d!50638 (= (inv!12 bs1!10) (invariant!0 (currentBit!6620 bs1!10) (currentByte!6625 bs1!10) (size!3121 (buf!3624 bs1!10))))))

(declare-fun bs!12384 () Bool)

(assert (= bs!12384 d!50638))

(assert (=> bs!12384 m!239719))

(assert (=> start!29884 d!50638))

(declare-fun d!50640 () Bool)

(assert (=> d!50640 (= (inv!12 bs2!18) (invariant!0 (currentBit!6620 bs2!18) (currentByte!6625 bs2!18) (size!3121 (buf!3624 bs2!18))))))

(declare-fun bs!12385 () Bool)

(assert (= bs!12385 d!50640))

(assert (=> bs!12385 m!239723))

(assert (=> start!29884 d!50640))

(declare-fun d!50642 () Bool)

(assert (=> d!50642 (= (array_inv!2910 (buf!3624 bs2!18)) (bvsge (size!3121 (buf!3624 bs2!18)) #b00000000000000000000000000000000))))

(assert (=> b!153730 d!50642))

(push 1)

(assert (not d!50616))

(assert (not d!50602))

(assert (not b!153849))

(assert (not d!50640))

(assert (not b!153837))

(assert (not d!50632))

(assert (not b!153843))

(assert (not d!50636))

(assert (not bm!2180))

(assert (not d!50638))

(assert (not b!153842))

(assert (not d!50592))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!50704 () Bool)

(declare-fun res!128895 () Bool)

(declare-fun e!103282 () Bool)

(assert (=> d!50704 (=> res!128895 e!103282)))

(assert (=> d!50704 (= res!128895 (= (_1!7219 lt!240172) (_2!7219 lt!240172)))))

(assert (=> d!50704 (= (arrayRangesEq!383 (buf!3624 bs1!10) (buf!3624 bs2!18) (_1!7219 lt!240172) (_2!7219 lt!240172)) e!103282)))

(declare-fun b!153909 () Bool)

(declare-fun e!103283 () Bool)

(assert (=> b!153909 (= e!103282 e!103283)))

(declare-fun res!128896 () Bool)

(assert (=> b!153909 (=> (not res!128896) (not e!103283))))

(assert (=> b!153909 (= res!128896 (= (select (arr!3944 (buf!3624 bs1!10)) (_1!7219 lt!240172)) (select (arr!3944 (buf!3624 bs2!18)) (_1!7219 lt!240172))))))

(declare-fun b!153910 () Bool)

(assert (=> b!153910 (= e!103283 (arrayRangesEq!383 (buf!3624 bs1!10) (buf!3624 bs2!18) (bvadd (_1!7219 lt!240172) #b00000000000000000000000000000001) (_2!7219 lt!240172)))))

(assert (= (and d!50704 (not res!128895)) b!153909))

(assert (= (and b!153909 res!128896) b!153910))

(declare-fun m!239875 () Bool)

(assert (=> b!153909 m!239875))

(declare-fun m!239877 () Bool)

(assert (=> b!153909 m!239877))

(declare-fun m!239879 () Bool)

(assert (=> b!153910 m!239879))

(assert (=> b!153837 d!50704))

(declare-fun d!50706 () Bool)

(assert (=> d!50706 (= (remainingBits!0 ((_ sign_extend 32) (size!3121 (buf!3624 bs1!10))) ((_ sign_extend 32) (currentByte!6625 bs1!10)) ((_ sign_extend 32) (currentBit!6620 bs1!10))) (bvsub (bvmul ((_ sign_extend 32) (size!3121 (buf!3624 bs1!10))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6625 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6620 bs1!10)))))))

(assert (=> d!50592 d!50706))

(declare-fun d!50708 () Bool)

(assert (=> d!50708 (= (invariant!0 (currentBit!6620 bs1!10) (currentByte!6625 bs1!10) (size!3121 (buf!3624 bs1!10))) (and (bvsge (currentBit!6620 bs1!10) #b00000000000000000000000000000000) (bvslt (currentBit!6620 bs1!10) #b00000000000000000000000000001000) (bvsge (currentByte!6625 bs1!10) #b00000000000000000000000000000000) (or (bvslt (currentByte!6625 bs1!10) (size!3121 (buf!3624 bs1!10))) (and (= (currentBit!6620 bs1!10) #b00000000000000000000000000000000) (= (currentByte!6625 bs1!10) (size!3121 (buf!3624 bs1!10)))))))))

(assert (=> d!50592 d!50708))

(declare-fun d!50710 () Bool)

(assert (=> d!50710 (= (invariant!0 (currentBit!6620 bs2!18) (currentByte!6625 bs2!18) (size!3121 (buf!3624 bs2!18))) (and (bvsge (currentBit!6620 bs2!18) #b00000000000000000000000000000000) (bvslt (currentBit!6620 bs2!18) #b00000000000000000000000000001000) (bvsge (currentByte!6625 bs2!18) #b00000000000000000000000000000000) (or (bvslt (currentByte!6625 bs2!18) (size!3121 (buf!3624 bs2!18))) (and (= (currentBit!6620 bs2!18) #b00000000000000000000000000000000) (= (currentByte!6625 bs2!18) (size!3121 (buf!3624 bs2!18)))))))))

(assert (=> d!50640 d!50710))

(assert (=> d!50638 d!50708))

(declare-fun d!50712 () Bool)

(assert (=> d!50712 (= (remainingBits!0 ((_ sign_extend 32) (size!3121 (buf!3624 bs2!18))) ((_ sign_extend 32) (currentByte!6625 bs2!18)) ((_ sign_extend 32) (currentBit!6620 bs2!18))) (bvsub (bvmul ((_ sign_extend 32) (size!3121 (buf!3624 bs2!18))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!6625 bs2!18)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6620 bs2!18)))))))

(assert (=> d!50602 d!50712))

(assert (=> d!50602 d!50710))

(declare-fun d!50714 () Bool)

(assert (=> d!50714 (= (select (arr!3944 (buf!3624 bs1!10)) (currentByte!6625 bs1!10)) (select (arr!3944 (buf!3624 bs2!18)) (currentByte!6625 bs1!10)))))

(assert (=> d!50714 true))

(declare-fun _$12!72 () Unit!9721)

(assert (=> d!50714 (= (choose!108 (buf!3624 bs1!10) (buf!3624 bs2!18) #b00000000000000000000000000000000 (currentByte!6625 bs1!10) lt!240063) _$12!72)))

(declare-fun bs!12395 () Bool)

(assert (= bs!12395 d!50714))

(assert (=> bs!12395 m!239631))

(assert (=> bs!12395 m!239633))

(assert (=> d!50616 d!50714))

(declare-fun d!50716 () Bool)

(assert (=> d!50716 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!240064) (tuple4!183 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!240064 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!240064 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!153842 d!50716))

(declare-fun d!50718 () Bool)

(declare-fun lt!240293 () (_ BitVec 8))

(declare-fun lt!240296 () (_ BitVec 8))

(assert (=> d!50718 (= lt!240293 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3944 (buf!3624 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10)))) (currentByte!6625 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10))))) ((_ sign_extend 24) lt!240296))))))

(assert (=> d!50718 (= lt!240296 ((_ extract 7 0) (currentBit!6620 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10)))))))

(declare-fun e!103288 () Bool)

(assert (=> d!50718 e!103288))

(declare-fun res!128902 () Bool)

(assert (=> d!50718 (=> (not res!128902) (not e!103288))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!50718 (= res!128902 (validate_offset_bits!1 ((_ sign_extend 32) (size!3121 (buf!3624 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10))))) ((_ sign_extend 32) (currentByte!6625 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10)))) ((_ sign_extend 32) (currentBit!6620 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10)))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-datatypes ((tuple2!13658 0))(
  ( (tuple2!13659 (_1!7225 Unit!9721) (_2!7225 (_ BitVec 8))) )
))
(declare-fun Unit!9743 () Unit!9721)

(declare-fun Unit!9744 () Unit!9721)

(assert (=> d!50718 (= (readByte!0 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10))) (tuple2!13651 (_2!7225 (ite (bvsgt ((_ sign_extend 24) lt!240296) #b00000000000000000000000000000000) (tuple2!13659 Unit!9743 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240293) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3944 (buf!3624 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10)))) (bvadd (currentByte!6625 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240296)))))))) (tuple2!13659 Unit!9744 lt!240293))) (BitStream!5501 (buf!3624 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10))) (bvadd (currentByte!6625 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10))) #b00000000000000000000000000000001) (currentBit!6620 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10))))))))

(declare-fun b!153915 () Bool)

(declare-fun e!103289 () Bool)

(assert (=> b!153915 (= e!103288 e!103289)))

(declare-fun res!128903 () Bool)

(assert (=> b!153915 (=> (not res!128903) (not e!103289))))

(declare-fun lt!240291 () tuple2!13650)

(assert (=> b!153915 (= res!128903 (= (buf!3624 (_2!7220 lt!240291)) (buf!3624 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10)))))))

(declare-fun lt!240297 () (_ BitVec 8))

(declare-fun lt!240292 () (_ BitVec 8))

(declare-fun Unit!9745 () Unit!9721)

(declare-fun Unit!9746 () Unit!9721)

(assert (=> b!153915 (= lt!240291 (tuple2!13651 (_2!7225 (ite (bvsgt ((_ sign_extend 24) lt!240297) #b00000000000000000000000000000000) (tuple2!13659 Unit!9745 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240292) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3944 (buf!3624 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10)))) (bvadd (currentByte!6625 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10))) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240297)))))))) (tuple2!13659 Unit!9746 lt!240292))) (BitStream!5501 (buf!3624 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10))) (bvadd (currentByte!6625 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10))) #b00000000000000000000000000000001) (currentBit!6620 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10))))))))

(assert (=> b!153915 (= lt!240292 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3944 (buf!3624 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10)))) (currentByte!6625 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10))))) ((_ sign_extend 24) lt!240297))))))

(assert (=> b!153915 (= lt!240297 ((_ extract 7 0) (currentBit!6620 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10)))))))

(declare-fun lt!240294 () (_ BitVec 64))

(declare-fun b!153916 () Bool)

(declare-fun lt!240295 () (_ BitVec 64))

(assert (=> b!153916 (= e!103289 (= (bitIndex!0 (size!3121 (buf!3624 (_2!7220 lt!240291))) (currentByte!6625 (_2!7220 lt!240291)) (currentBit!6620 (_2!7220 lt!240291))) (bvadd lt!240294 lt!240295)))))

(assert (=> b!153916 (or (not (= (bvand lt!240294 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240295 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!240294 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!240294 lt!240295) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!153916 (= lt!240295 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!153916 (= lt!240294 (bitIndex!0 (size!3121 (buf!3624 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10)))) (currentByte!6625 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10))) (currentBit!6620 (BitStream!5501 (buf!3624 bs2!18) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10)))))))

(assert (= (and d!50718 res!128902) b!153915))

(assert (= (and b!153915 res!128903) b!153916))

(declare-fun m!239881 () Bool)

(assert (=> d!50718 m!239881))

(declare-fun m!239883 () Bool)

(assert (=> d!50718 m!239883))

(declare-fun m!239885 () Bool)

(assert (=> d!50718 m!239885))

(assert (=> b!153915 m!239885))

(assert (=> b!153915 m!239881))

(declare-fun m!239887 () Bool)

(assert (=> b!153916 m!239887))

(declare-fun m!239889 () Bool)

(assert (=> b!153916 m!239889))

(assert (=> d!50632 d!50718))

(declare-fun d!50720 () Bool)

(assert (=> d!50720 (= (byteRangesEq!0 (select (arr!3944 (buf!3624 bs1!10)) (_4!91 lt!240172)) (select (arr!3944 (buf!3624 bs2!18)) (_4!91 lt!240172)) #b00000000000000000000000000000000 lt!240171) (or (= #b00000000000000000000000000000000 lt!240171) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3944 (buf!3624 bs1!10)) (_4!91 lt!240172))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!240171))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3944 (buf!3624 bs2!18)) (_4!91 lt!240172))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!240171))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!12396 () Bool)

(assert (= bs!12396 d!50720))

(declare-fun m!239891 () Bool)

(assert (=> bs!12396 m!239891))

(declare-fun m!239893 () Bool)

(assert (=> bs!12396 m!239893))

(assert (=> b!153843 d!50720))

(declare-fun d!50722 () Bool)

(declare-fun lt!240300 () (_ BitVec 8))

(declare-fun lt!240303 () (_ BitVec 8))

(assert (=> d!50722 (= lt!240300 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3944 (buf!3624 bs1!10)) (currentByte!6625 bs1!10))) ((_ sign_extend 24) lt!240303))))))

(assert (=> d!50722 (= lt!240303 ((_ extract 7 0) (currentBit!6620 bs1!10)))))

(declare-fun e!103290 () Bool)

(assert (=> d!50722 e!103290))

(declare-fun res!128904 () Bool)

(assert (=> d!50722 (=> (not res!128904) (not e!103290))))

(assert (=> d!50722 (= res!128904 (validate_offset_bits!1 ((_ sign_extend 32) (size!3121 (buf!3624 bs1!10))) ((_ sign_extend 32) (currentByte!6625 bs1!10)) ((_ sign_extend 32) (currentBit!6620 bs1!10)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun Unit!9747 () Unit!9721)

(declare-fun Unit!9748 () Unit!9721)

(assert (=> d!50722 (= (readByte!0 bs1!10) (tuple2!13651 (_2!7225 (ite (bvsgt ((_ sign_extend 24) lt!240303) #b00000000000000000000000000000000) (tuple2!13659 Unit!9747 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240300) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3944 (buf!3624 bs1!10)) (bvadd (currentByte!6625 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240303)))))))) (tuple2!13659 Unit!9748 lt!240300))) (BitStream!5501 (buf!3624 bs1!10) (bvadd (currentByte!6625 bs1!10) #b00000000000000000000000000000001) (currentBit!6620 bs1!10))))))

(declare-fun b!153917 () Bool)

(declare-fun e!103291 () Bool)

(assert (=> b!153917 (= e!103290 e!103291)))

(declare-fun res!128905 () Bool)

(assert (=> b!153917 (=> (not res!128905) (not e!103291))))

(declare-fun lt!240298 () tuple2!13650)

(assert (=> b!153917 (= res!128905 (= (buf!3624 (_2!7220 lt!240298)) (buf!3624 bs1!10)))))

(declare-fun lt!240304 () (_ BitVec 8))

(declare-fun lt!240299 () (_ BitVec 8))

(declare-fun Unit!9749 () Unit!9721)

(declare-fun Unit!9750 () Unit!9721)

(assert (=> b!153917 (= lt!240298 (tuple2!13651 (_2!7225 (ite (bvsgt ((_ sign_extend 24) lt!240304) #b00000000000000000000000000000000) (tuple2!13659 Unit!9749 ((_ extract 7 0) (bvor ((_ sign_extend 24) lt!240299) (bvlshr (bvand ((_ sign_extend 24) (select (arr!3944 (buf!3624 bs1!10)) (bvadd (currentByte!6625 bs1!10) #b00000000000000000000000000000001))) #b00000000000000000000000011111111) ((_ sign_extend 24) ((_ extract 7 0) (bvsub #b00000000000000000000000000001000 ((_ sign_extend 24) lt!240304)))))))) (tuple2!13659 Unit!9750 lt!240299))) (BitStream!5501 (buf!3624 bs1!10) (bvadd (currentByte!6625 bs1!10) #b00000000000000000000000000000001) (currentBit!6620 bs1!10))))))

(assert (=> b!153917 (= lt!240299 ((_ extract 7 0) (bvshl ((_ sign_extend 24) (select (arr!3944 (buf!3624 bs1!10)) (currentByte!6625 bs1!10))) ((_ sign_extend 24) lt!240304))))))

(assert (=> b!153917 (= lt!240304 ((_ extract 7 0) (currentBit!6620 bs1!10)))))

(declare-fun lt!240302 () (_ BitVec 64))

(declare-fun lt!240301 () (_ BitVec 64))

(declare-fun b!153918 () Bool)

(assert (=> b!153918 (= e!103291 (= (bitIndex!0 (size!3121 (buf!3624 (_2!7220 lt!240298))) (currentByte!6625 (_2!7220 lt!240298)) (currentBit!6620 (_2!7220 lt!240298))) (bvadd lt!240301 lt!240302)))))

(assert (=> b!153918 (or (not (= (bvand lt!240301 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!240302 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!240301 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!240301 lt!240302) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!153918 (= lt!240302 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!153918 (= lt!240301 (bitIndex!0 (size!3121 (buf!3624 bs1!10)) (currentByte!6625 bs1!10) (currentBit!6620 bs1!10)))))

(assert (= (and d!50722 res!128904) b!153917))

(assert (= (and b!153917 res!128905) b!153918))

(assert (=> d!50722 m!239631))

(declare-fun m!239895 () Bool)

(assert (=> d!50722 m!239895))

(declare-fun m!239897 () Bool)

(assert (=> d!50722 m!239897))

(assert (=> b!153917 m!239897))

(assert (=> b!153917 m!239631))

(declare-fun m!239899 () Bool)

(assert (=> b!153918 m!239899))

(assert (=> b!153918 m!239627))

(assert (=> d!50636 d!50722))

(declare-fun d!50724 () Bool)

(assert (=> d!50724 (= (byteRangesEq!0 (select (arr!3944 (buf!3624 bs1!10)) (_3!394 lt!240172)) (select (arr!3944 (buf!3624 bs2!18)) (_3!394 lt!240172)) lt!240173 (ite c!8199 lt!240171 #b00000000000000000000000000001000)) (or (= lt!240173 (ite c!8199 lt!240171 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3944 (buf!3624 bs1!10)) (_3!394 lt!240172))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8199 lt!240171 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!240173)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!3944 (buf!3624 bs2!18)) (_3!394 lt!240172))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!8199 lt!240171 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!240173)))) #b00000000000000000000000011111111))))))

(declare-fun bs!12397 () Bool)

(assert (= bs!12397 d!50724))

(declare-fun m!239901 () Bool)

(assert (=> bs!12397 m!239901))

(declare-fun m!239903 () Bool)

(assert (=> bs!12397 m!239903))

(assert (=> bm!2180 d!50724))

(declare-fun d!50726 () Bool)

(declare-fun res!128906 () Bool)

(declare-fun e!103292 () Bool)

(assert (=> d!50726 (=> res!128906 e!103292)))

(assert (=> d!50726 (= res!128906 (= (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!240063))))

(assert (=> d!50726 (= (arrayRangesEq!383 (buf!3624 bs1!10) (buf!3624 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!240063) e!103292)))

(declare-fun b!153919 () Bool)

(declare-fun e!103293 () Bool)

(assert (=> b!153919 (= e!103292 e!103293)))

(declare-fun res!128907 () Bool)

(assert (=> b!153919 (=> (not res!128907) (not e!103293))))

(assert (=> b!153919 (= res!128907 (= (select (arr!3944 (buf!3624 bs1!10)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (select (arr!3944 (buf!3624 bs2!18)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!153920 () Bool)

(assert (=> b!153920 (= e!103293 (arrayRangesEq!383 (buf!3624 bs1!10) (buf!3624 bs2!18) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!240063))))

(assert (= (and d!50726 (not res!128906)) b!153919))

(assert (= (and b!153919 res!128907) b!153920))

(declare-fun m!239905 () Bool)

(assert (=> b!153919 m!239905))

(declare-fun m!239907 () Bool)

(assert (=> b!153919 m!239907))

(declare-fun m!239909 () Bool)

(assert (=> b!153920 m!239909))

(assert (=> b!153849 d!50726))

(push 1)

(assert (not b!153910))

(assert (not d!50722))

(assert (not b!153920))

(assert (not b!153916))

(assert (not b!153918))

(assert (not d!50718))

(check-sat)

(pop 1)

(push 1)

(check-sat)

