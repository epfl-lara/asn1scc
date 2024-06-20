; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!57310 () Bool)

(assert start!57310)

(declare-fun b!262679 () Bool)

(declare-fun e!182940 () Bool)

(declare-datatypes ((array!14652 0))(
  ( (array!14653 (arr!7383 (Array (_ BitVec 32) (_ BitVec 8))) (size!6396 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11606 0))(
  ( (BitStream!11607 (buf!6864 array!14652) (currentByte!12707 (_ BitVec 32)) (currentBit!12702 (_ BitVec 32))) )
))
(declare-fun w2!580 () BitStream!11606)

(declare-fun array_inv!6120 (array!14652) Bool)

(assert (=> b!262679 (= e!182940 (array_inv!6120 (buf!6864 w2!580)))))

(declare-fun e!182942 () Bool)

(declare-fun lt!404297 () (_ BitVec 64))

(declare-fun b!262677 () Bool)

(declare-fun w1!584 () BitStream!11606)

(assert (=> b!262677 (= e!182942 (or (bvsgt (size!6396 (buf!6864 w1!584)) (size!6396 (buf!6864 w2!580))) (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404297) (bvsle lt!404297 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6396 (buf!6864 w1!584))))))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!262677 (= lt!404297 (bitIndex!0 (size!6396 (buf!6864 w1!584)) (currentByte!12707 w1!584) (currentBit!12702 w1!584)))))

(declare-fun res!219801 () Bool)

(declare-fun e!182941 () Bool)

(assert (=> start!57310 (=> (not res!219801) (not e!182941))))

(declare-fun isPrefixOf!0 (BitStream!11606 BitStream!11606) Bool)

(assert (=> start!57310 (= res!219801 (isPrefixOf!0 w1!584 w2!580))))

(assert (=> start!57310 e!182941))

(declare-fun e!182938 () Bool)

(declare-fun inv!12 (BitStream!11606) Bool)

(assert (=> start!57310 (and (inv!12 w1!584) e!182938)))

(assert (=> start!57310 (and (inv!12 w2!580) e!182940)))

(declare-fun b!262676 () Bool)

(assert (=> b!262676 (= e!182941 (not e!182942))))

(declare-fun res!219802 () Bool)

(assert (=> b!262676 (=> res!219802 e!182942)))

(assert (=> b!262676 (= res!219802 (= (size!6396 (buf!6864 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!262676 (isPrefixOf!0 w2!580 w2!580)))

(declare-datatypes ((Unit!18735 0))(
  ( (Unit!18736) )
))
(declare-fun lt!404295 () Unit!18735)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!11606) Unit!18735)

(assert (=> b!262676 (= lt!404295 (lemmaIsPrefixRefl!0 w2!580))))

(declare-fun lt!404293 () BitStream!11606)

(assert (=> b!262676 (isPrefixOf!0 lt!404293 lt!404293)))

(declare-fun lt!404294 () Unit!18735)

(assert (=> b!262676 (= lt!404294 (lemmaIsPrefixRefl!0 lt!404293))))

(assert (=> b!262676 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404296 () Unit!18735)

(assert (=> b!262676 (= lt!404296 (lemmaIsPrefixRefl!0 w1!584))))

(assert (=> b!262676 (= lt!404293 (BitStream!11607 (buf!6864 w2!580) (currentByte!12707 w1!584) (currentBit!12702 w1!584)))))

(declare-fun b!262678 () Bool)

(assert (=> b!262678 (= e!182938 (array_inv!6120 (buf!6864 w1!584)))))

(assert (= (and start!57310 res!219801) b!262676))

(assert (= (and b!262676 (not res!219802)) b!262677))

(assert (= start!57310 b!262678))

(assert (= start!57310 b!262679))

(declare-fun m!392831 () Bool)

(assert (=> start!57310 m!392831))

(declare-fun m!392833 () Bool)

(assert (=> start!57310 m!392833))

(declare-fun m!392835 () Bool)

(assert (=> start!57310 m!392835))

(declare-fun m!392837 () Bool)

(assert (=> b!262678 m!392837))

(declare-fun m!392839 () Bool)

(assert (=> b!262677 m!392839))

(declare-fun m!392841 () Bool)

(assert (=> b!262676 m!392841))

(declare-fun m!392843 () Bool)

(assert (=> b!262676 m!392843))

(declare-fun m!392845 () Bool)

(assert (=> b!262676 m!392845))

(declare-fun m!392847 () Bool)

(assert (=> b!262676 m!392847))

(declare-fun m!392849 () Bool)

(assert (=> b!262676 m!392849))

(declare-fun m!392851 () Bool)

(assert (=> b!262676 m!392851))

(declare-fun m!392853 () Bool)

(assert (=> b!262679 m!392853))

(push 1)

(assert (not start!57310))

(assert (not b!262677))

(assert (not b!262678))

(assert (not b!262679))

(assert (not b!262676))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!88646 () Bool)

(assert (=> d!88646 (= (array_inv!6120 (buf!6864 w2!580)) (bvsge (size!6396 (buf!6864 w2!580)) #b00000000000000000000000000000000))))

(assert (=> b!262679 d!88646))

(declare-fun d!88650 () Bool)

(assert (=> d!88650 (= (array_inv!6120 (buf!6864 w1!584)) (bvsge (size!6396 (buf!6864 w1!584)) #b00000000000000000000000000000000))))

(assert (=> b!262678 d!88650))

(declare-fun d!88652 () Bool)

(declare-fun e!182972 () Bool)

(assert (=> d!88652 e!182972))

(declare-fun res!219847 () Bool)

(assert (=> d!88652 (=> (not res!219847) (not e!182972))))

(declare-fun lt!404335 () (_ BitVec 64))

(declare-fun lt!404337 () (_ BitVec 64))

(declare-fun lt!404336 () (_ BitVec 64))

(assert (=> d!88652 (= res!219847 (= lt!404337 (bvsub lt!404335 lt!404336)))))

(assert (=> d!88652 (or (= (bvand lt!404335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!404336 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!404335 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!404335 lt!404336) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!88652 (= lt!404336 (remainingBits!0 ((_ sign_extend 32) (size!6396 (buf!6864 w1!584))) ((_ sign_extend 32) (currentByte!12707 w1!584)) ((_ sign_extend 32) (currentBit!12702 w1!584))))))

(declare-fun lt!404334 () (_ BitVec 64))

(declare-fun lt!404332 () (_ BitVec 64))

(assert (=> d!88652 (= lt!404335 (bvmul lt!404334 lt!404332))))

(assert (=> d!88652 (or (= lt!404334 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!404332 (bvsdiv (bvmul lt!404334 lt!404332) lt!404334)))))

(assert (=> d!88652 (= lt!404332 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!88652 (= lt!404334 ((_ sign_extend 32) (size!6396 (buf!6864 w1!584))))))

(assert (=> d!88652 (= lt!404337 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12707 w1!584)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12702 w1!584))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!88652 (invariant!0 (currentBit!12702 w1!584) (currentByte!12707 w1!584) (size!6396 (buf!6864 w1!584)))))

(assert (=> d!88652 (= (bitIndex!0 (size!6396 (buf!6864 w1!584)) (currentByte!12707 w1!584) (currentBit!12702 w1!584)) lt!404337)))

(declare-fun b!262724 () Bool)

(declare-fun res!219848 () Bool)

(assert (=> b!262724 (=> (not res!219848) (not e!182972))))

(assert (=> b!262724 (= res!219848 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!404337))))

(declare-fun b!262725 () Bool)

(declare-fun lt!404333 () (_ BitVec 64))

(assert (=> b!262725 (= e!182972 (bvsle lt!404337 (bvmul lt!404333 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!262725 (or (= lt!404333 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!404333 #b0000000000000000000000000000000000000000000000000000000000001000) lt!404333)))))

(assert (=> b!262725 (= lt!404333 ((_ sign_extend 32) (size!6396 (buf!6864 w1!584))))))

(assert (= (and d!88652 res!219847) b!262724))

(assert (= (and b!262724 res!219848) b!262725))

(declare-fun m!392899 () Bool)

(assert (=> d!88652 m!392899))

(declare-fun m!392901 () Bool)

(assert (=> d!88652 m!392901))

(assert (=> b!262677 d!88652))

(declare-fun d!88678 () Bool)

(assert (=> d!88678 (isPrefixOf!0 w1!584 w1!584)))

(declare-fun lt!404346 () Unit!18735)

(declare-fun choose!11 (BitStream!11606) Unit!18735)

(assert (=> d!88678 (= lt!404346 (choose!11 w1!584))))

(assert (=> d!88678 (= (lemmaIsPrefixRefl!0 w1!584) lt!404346)))

(declare-fun bs!22492 () Bool)

(assert (= bs!22492 d!88678))

(assert (=> bs!22492 m!392845))

(declare-fun m!392905 () Bool)

(assert (=> bs!22492 m!392905))

(assert (=> b!262676 d!88678))

(declare-fun d!88682 () Bool)

(declare-fun res!219865 () Bool)

(declare-fun e!182981 () Bool)

(assert (=> d!88682 (=> (not res!219865) (not e!182981))))

(assert (=> d!88682 (= res!219865 (= (size!6396 (buf!6864 lt!404293)) (size!6396 (buf!6864 lt!404293))))))

(assert (=> d!88682 (= (isPrefixOf!0 lt!404293 lt!404293) e!182981)))

(declare-fun b!262740 () Bool)

(declare-fun res!219863 () Bool)

(assert (=> b!262740 (=> (not res!219863) (not e!182981))))

(assert (=> b!262740 (= res!219863 (bvsle (bitIndex!0 (size!6396 (buf!6864 lt!404293)) (currentByte!12707 lt!404293) (currentBit!12702 lt!404293)) (bitIndex!0 (size!6396 (buf!6864 lt!404293)) (currentByte!12707 lt!404293) (currentBit!12702 lt!404293))))))

(declare-fun b!262741 () Bool)

(declare-fun e!182982 () Bool)

(assert (=> b!262741 (= e!182981 e!182982)))

(declare-fun res!219864 () Bool)

(assert (=> b!262741 (=> res!219864 e!182982)))

(assert (=> b!262741 (= res!219864 (= (size!6396 (buf!6864 lt!404293)) #b00000000000000000000000000000000))))

(declare-fun b!262742 () Bool)

(declare-fun arrayBitRangesEq!0 (array!14652 array!14652 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!262742 (= e!182982 (arrayBitRangesEq!0 (buf!6864 lt!404293) (buf!6864 lt!404293) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6396 (buf!6864 lt!404293)) (currentByte!12707 lt!404293) (currentBit!12702 lt!404293))))))

(assert (= (and d!88682 res!219865) b!262740))

(assert (= (and b!262740 res!219863) b!262741))

(assert (= (and b!262741 (not res!219864)) b!262742))

(declare-fun m!392909 () Bool)

(assert (=> b!262740 m!392909))

(assert (=> b!262740 m!392909))

(assert (=> b!262742 m!392909))

(assert (=> b!262742 m!392909))

(declare-fun m!392911 () Bool)

(assert (=> b!262742 m!392911))

(assert (=> b!262676 d!88682))

(declare-fun d!88686 () Bool)

(assert (=> d!88686 (isPrefixOf!0 lt!404293 lt!404293)))

(declare-fun lt!404365 () Unit!18735)

(assert (=> d!88686 (= lt!404365 (choose!11 lt!404293))))

(assert (=> d!88686 (= (lemmaIsPrefixRefl!0 lt!404293) lt!404365)))

(declare-fun bs!22493 () Bool)

(assert (= bs!22493 d!88686))

(assert (=> bs!22493 m!392843))

(declare-fun m!392913 () Bool)

(assert (=> bs!22493 m!392913))

(assert (=> b!262676 d!88686))

(declare-fun d!88688 () Bool)

(assert (=> d!88688 (isPrefixOf!0 w2!580 w2!580)))

(declare-fun lt!404366 () Unit!18735)

(assert (=> d!88688 (= lt!404366 (choose!11 w2!580))))

(assert (=> d!88688 (= (lemmaIsPrefixRefl!0 w2!580) lt!404366)))

(declare-fun bs!22494 () Bool)

(assert (= bs!22494 d!88688))

(assert (=> bs!22494 m!392849))

(declare-fun m!392915 () Bool)

(assert (=> bs!22494 m!392915))

(assert (=> b!262676 d!88688))

(declare-fun d!88690 () Bool)

(declare-fun res!219868 () Bool)

(declare-fun e!182983 () Bool)

(assert (=> d!88690 (=> (not res!219868) (not e!182983))))

(assert (=> d!88690 (= res!219868 (= (size!6396 (buf!6864 w1!584)) (size!6396 (buf!6864 w1!584))))))

(assert (=> d!88690 (= (isPrefixOf!0 w1!584 w1!584) e!182983)))

(declare-fun b!262743 () Bool)

(declare-fun res!219866 () Bool)

(assert (=> b!262743 (=> (not res!219866) (not e!182983))))

(assert (=> b!262743 (= res!219866 (bvsle (bitIndex!0 (size!6396 (buf!6864 w1!584)) (currentByte!12707 w1!584) (currentBit!12702 w1!584)) (bitIndex!0 (size!6396 (buf!6864 w1!584)) (currentByte!12707 w1!584) (currentBit!12702 w1!584))))))

(declare-fun b!262744 () Bool)

(declare-fun e!182984 () Bool)

(assert (=> b!262744 (= e!182983 e!182984)))

(declare-fun res!219867 () Bool)

(assert (=> b!262744 (=> res!219867 e!182984)))

(assert (=> b!262744 (= res!219867 (= (size!6396 (buf!6864 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262745 () Bool)

(assert (=> b!262745 (= e!182984 (arrayBitRangesEq!0 (buf!6864 w1!584) (buf!6864 w1!584) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6396 (buf!6864 w1!584)) (currentByte!12707 w1!584) (currentBit!12702 w1!584))))))

(assert (= (and d!88690 res!219868) b!262743))

(assert (= (and b!262743 res!219866) b!262744))

(assert (= (and b!262744 (not res!219867)) b!262745))

(assert (=> b!262743 m!392839))

(assert (=> b!262743 m!392839))

(assert (=> b!262745 m!392839))

(assert (=> b!262745 m!392839))

(declare-fun m!392917 () Bool)

(assert (=> b!262745 m!392917))

(assert (=> b!262676 d!88690))

(declare-fun d!88692 () Bool)

(declare-fun res!219871 () Bool)

(declare-fun e!182985 () Bool)

(assert (=> d!88692 (=> (not res!219871) (not e!182985))))

(assert (=> d!88692 (= res!219871 (= (size!6396 (buf!6864 w2!580)) (size!6396 (buf!6864 w2!580))))))

(assert (=> d!88692 (= (isPrefixOf!0 w2!580 w2!580) e!182985)))

(declare-fun b!262746 () Bool)

(declare-fun res!219869 () Bool)

(assert (=> b!262746 (=> (not res!219869) (not e!182985))))

(assert (=> b!262746 (= res!219869 (bvsle (bitIndex!0 (size!6396 (buf!6864 w2!580)) (currentByte!12707 w2!580) (currentBit!12702 w2!580)) (bitIndex!0 (size!6396 (buf!6864 w2!580)) (currentByte!12707 w2!580) (currentBit!12702 w2!580))))))

(declare-fun b!262747 () Bool)

(declare-fun e!182986 () Bool)

(assert (=> b!262747 (= e!182985 e!182986)))

(declare-fun res!219870 () Bool)

(assert (=> b!262747 (=> res!219870 e!182986)))

(assert (=> b!262747 (= res!219870 (= (size!6396 (buf!6864 w2!580)) #b00000000000000000000000000000000))))

(declare-fun b!262748 () Bool)

(assert (=> b!262748 (= e!182986 (arrayBitRangesEq!0 (buf!6864 w2!580) (buf!6864 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6396 (buf!6864 w2!580)) (currentByte!12707 w2!580) (currentBit!12702 w2!580))))))

(assert (= (and d!88692 res!219871) b!262746))

(assert (= (and b!262746 res!219869) b!262747))

(assert (= (and b!262747 (not res!219870)) b!262748))

(declare-fun m!392919 () Bool)

(assert (=> b!262746 m!392919))

(assert (=> b!262746 m!392919))

(assert (=> b!262748 m!392919))

(assert (=> b!262748 m!392919))

(declare-fun m!392921 () Bool)

(assert (=> b!262748 m!392921))

(assert (=> b!262676 d!88692))

(declare-fun d!88694 () Bool)

(declare-fun res!219874 () Bool)

(declare-fun e!182987 () Bool)

(assert (=> d!88694 (=> (not res!219874) (not e!182987))))

(assert (=> d!88694 (= res!219874 (= (size!6396 (buf!6864 w1!584)) (size!6396 (buf!6864 w2!580))))))

(assert (=> d!88694 (= (isPrefixOf!0 w1!584 w2!580) e!182987)))

(declare-fun b!262749 () Bool)

(declare-fun res!219872 () Bool)

(assert (=> b!262749 (=> (not res!219872) (not e!182987))))

(assert (=> b!262749 (= res!219872 (bvsle (bitIndex!0 (size!6396 (buf!6864 w1!584)) (currentByte!12707 w1!584) (currentBit!12702 w1!584)) (bitIndex!0 (size!6396 (buf!6864 w2!580)) (currentByte!12707 w2!580) (currentBit!12702 w2!580))))))

(declare-fun b!262750 () Bool)

(declare-fun e!182988 () Bool)

(assert (=> b!262750 (= e!182987 e!182988)))

(declare-fun res!219873 () Bool)

(assert (=> b!262750 (=> res!219873 e!182988)))

(assert (=> b!262750 (= res!219873 (= (size!6396 (buf!6864 w1!584)) #b00000000000000000000000000000000))))

(declare-fun b!262751 () Bool)

(assert (=> b!262751 (= e!182988 (arrayBitRangesEq!0 (buf!6864 w1!584) (buf!6864 w2!580) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!6396 (buf!6864 w1!584)) (currentByte!12707 w1!584) (currentBit!12702 w1!584))))))

(assert (= (and d!88694 res!219874) b!262749))

(assert (= (and b!262749 res!219872) b!262750))

(assert (= (and b!262750 (not res!219873)) b!262751))

(assert (=> b!262749 m!392839))

(assert (=> b!262749 m!392919))

(assert (=> b!262751 m!392839))

(assert (=> b!262751 m!392839))

(declare-fun m!392923 () Bool)

(assert (=> b!262751 m!392923))

(assert (=> start!57310 d!88694))

(declare-fun d!88696 () Bool)

(assert (=> d!88696 (= (inv!12 w1!584) (invariant!0 (currentBit!12702 w1!584) (currentByte!12707 w1!584) (size!6396 (buf!6864 w1!584))))))

(declare-fun bs!22495 () Bool)

(assert (= bs!22495 d!88696))

(assert (=> bs!22495 m!392901))

(assert (=> start!57310 d!88696))

(declare-fun d!88698 () Bool)

(assert (=> d!88698 (= (inv!12 w2!580) (invariant!0 (currentBit!12702 w2!580) (currentByte!12707 w2!580) (size!6396 (buf!6864 w2!580))))))

(declare-fun bs!22496 () Bool)

(assert (= bs!22496 d!88698))

(declare-fun m!392925 () Bool)

(assert (=> bs!22496 m!392925))

(assert (=> start!57310 d!88698))

(push 1)

(assert (not b!262742))

(assert (not b!262749))

(assert (not d!88696))

(assert (not b!262748))

(assert (not d!88686))

(assert (not b!262746))

(assert (not b!262740))

(assert (not d!88652))

(assert (not d!88698))

(assert (not b!262743))

(assert (not b!262751))

(assert (not b!262745))

(assert (not d!88688))

(assert (not d!88678))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

