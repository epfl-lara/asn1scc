; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69388 () Bool)

(assert start!69388)

(declare-fun res!255602 () Bool)

(declare-fun e!224385 () Bool)

(assert (=> start!69388 (=> (not res!255602) (not e!224385))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19090 0))(
  ( (array!19091 (arr!9358 (Array (_ BitVec 32) (_ BitVec 8))) (size!8278 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13660 0))(
  ( (BitStream!13661 (buf!7891 array!19090) (currentByte!14577 (_ BitVec 32)) (currentBit!14572 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13660)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13660)

(assert (=> start!69388 (= res!255602 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8278 (buf!7891 b1!97)) (size!8278 (buf!7891 b2!97)))))))

(assert (=> start!69388 e!224385))

(assert (=> start!69388 true))

(declare-fun e!224387 () Bool)

(declare-fun inv!12 (BitStream!13660) Bool)

(assert (=> start!69388 (and (inv!12 b1!97) e!224387)))

(declare-fun e!224389 () Bool)

(assert (=> start!69388 (and (inv!12 b2!97) e!224389)))

(declare-fun b!312034 () Bool)

(declare-fun res!255603 () Bool)

(assert (=> b!312034 (=> (not res!255603) (not e!224385))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312034 (= res!255603 (bvsle (bitIndex!0 (size!8278 (buf!7891 b2!97)) (currentByte!14577 b2!97) (currentBit!14572 b2!97)) (bvadd (bitIndex!0 (size!8278 (buf!7891 b1!97)) (currentByte!14577 b1!97) (currentBit!14572 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312035 () Bool)

(declare-fun array_inv!7830 (array!19090) Bool)

(assert (=> b!312035 (= e!224389 (array_inv!7830 (buf!7891 b2!97)))))

(declare-fun b!312036 () Bool)

(assert (=> b!312036 (= e!224387 (array_inv!7830 (buf!7891 b1!97)))))

(declare-fun b!312037 () Bool)

(declare-fun res!255605 () Bool)

(assert (=> b!312037 (=> (not res!255605) (not e!224385))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312037 (= res!255605 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8278 (buf!7891 b1!97))) ((_ sign_extend 32) (currentByte!14577 b1!97)) ((_ sign_extend 32) (currentBit!14572 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312038 () Bool)

(declare-fun res!255604 () Bool)

(assert (=> b!312038 (=> (not res!255604) (not e!224385))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312038 (= res!255604 (validate_offset_bits!1 ((_ sign_extend 32) (size!8278 (buf!7891 b1!97))) ((_ sign_extend 32) (currentByte!14577 b1!97)) ((_ sign_extend 32) (currentBit!14572 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312039 () Bool)

(assert (=> b!312039 (= e!224385 (bvslt (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8278 (buf!7891 b1!97)))) (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14577 b1!97))) ((_ sign_extend 32) (currentBit!14572 b1!97)))) b1ValidateOffsetBits!10))))

(assert (= (and start!69388 res!255602) b!312038))

(assert (= (and b!312038 res!255604) b!312034))

(assert (= (and b!312034 res!255603) b!312037))

(assert (= (and b!312037 res!255605) b!312039))

(assert (= start!69388 b!312036))

(assert (= start!69388 b!312035))

(declare-fun m!449765 () Bool)

(assert (=> b!312038 m!449765))

(declare-fun m!449767 () Bool)

(assert (=> b!312035 m!449767))

(declare-fun m!449769 () Bool)

(assert (=> start!69388 m!449769))

(declare-fun m!449771 () Bool)

(assert (=> start!69388 m!449771))

(declare-fun m!449773 () Bool)

(assert (=> b!312036 m!449773))

(declare-fun m!449775 () Bool)

(assert (=> b!312037 m!449775))

(declare-fun m!449777 () Bool)

(assert (=> b!312034 m!449777))

(declare-fun m!449779 () Bool)

(assert (=> b!312034 m!449779))

(push 1)

(assert (not b!312036))

(assert (not b!312038))

(assert (not b!312034))

(assert (not start!69388))

(assert (not b!312035))

(assert (not b!312037))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103580 () Bool)

(declare-fun e!224424 () Bool)

(assert (=> d!103580 e!224424))

(declare-fun res!255639 () Bool)

(assert (=> d!103580 (=> (not res!255639) (not e!224424))))

(declare-fun lt!441663 () (_ BitVec 64))

(declare-fun lt!441667 () (_ BitVec 64))

(declare-fun lt!441665 () (_ BitVec 64))

(assert (=> d!103580 (= res!255639 (= lt!441663 (bvsub lt!441667 lt!441665)))))

(assert (=> d!103580 (or (= (bvand lt!441667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441665 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441667 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441667 lt!441665) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103580 (= lt!441665 (remainingBits!0 ((_ sign_extend 32) (size!8278 (buf!7891 b2!97))) ((_ sign_extend 32) (currentByte!14577 b2!97)) ((_ sign_extend 32) (currentBit!14572 b2!97))))))

(declare-fun lt!441666 () (_ BitVec 64))

(declare-fun lt!441668 () (_ BitVec 64))

(assert (=> d!103580 (= lt!441667 (bvmul lt!441666 lt!441668))))

(assert (=> d!103580 (or (= lt!441666 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441668 (bvsdiv (bvmul lt!441666 lt!441668) lt!441666)))))

(assert (=> d!103580 (= lt!441668 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103580 (= lt!441666 ((_ sign_extend 32) (size!8278 (buf!7891 b2!97))))))

(assert (=> d!103580 (= lt!441663 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14577 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14572 b2!97))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103580 (invariant!0 (currentBit!14572 b2!97) (currentByte!14577 b2!97) (size!8278 (buf!7891 b2!97)))))

(assert (=> d!103580 (= (bitIndex!0 (size!8278 (buf!7891 b2!97)) (currentByte!14577 b2!97) (currentBit!14572 b2!97)) lt!441663)))

(declare-fun b!312084 () Bool)

(declare-fun res!255638 () Bool)

(assert (=> b!312084 (=> (not res!255638) (not e!224424))))

(assert (=> b!312084 (= res!255638 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441663))))

(declare-fun b!312085 () Bool)

(declare-fun lt!441664 () (_ BitVec 64))

(assert (=> b!312085 (= e!224424 (bvsle lt!441663 (bvmul lt!441664 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312085 (or (= lt!441664 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441664 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441664)))))

(assert (=> b!312085 (= lt!441664 ((_ sign_extend 32) (size!8278 (buf!7891 b2!97))))))

(assert (= (and d!103580 res!255639) b!312084))

(assert (= (and b!312084 res!255638) b!312085))

(declare-fun m!449817 () Bool)

(assert (=> d!103580 m!449817))

(declare-fun m!449819 () Bool)

(assert (=> d!103580 m!449819))

(assert (=> b!312034 d!103580))

(declare-fun d!103586 () Bool)

(declare-fun e!224425 () Bool)

(assert (=> d!103586 e!224425))

(declare-fun res!255641 () Bool)

(assert (=> d!103586 (=> (not res!255641) (not e!224425))))

(declare-fun lt!441669 () (_ BitVec 64))

(declare-fun lt!441673 () (_ BitVec 64))

(declare-fun lt!441671 () (_ BitVec 64))

(assert (=> d!103586 (= res!255641 (= lt!441669 (bvsub lt!441673 lt!441671)))))

(assert (=> d!103586 (or (= (bvand lt!441673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441671 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441673 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441673 lt!441671) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103586 (= lt!441671 (remainingBits!0 ((_ sign_extend 32) (size!8278 (buf!7891 b1!97))) ((_ sign_extend 32) (currentByte!14577 b1!97)) ((_ sign_extend 32) (currentBit!14572 b1!97))))))

(declare-fun lt!441672 () (_ BitVec 64))

(declare-fun lt!441674 () (_ BitVec 64))

(assert (=> d!103586 (= lt!441673 (bvmul lt!441672 lt!441674))))

(assert (=> d!103586 (or (= lt!441672 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441674 (bvsdiv (bvmul lt!441672 lt!441674) lt!441672)))))

(assert (=> d!103586 (= lt!441674 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103586 (= lt!441672 ((_ sign_extend 32) (size!8278 (buf!7891 b1!97))))))

(assert (=> d!103586 (= lt!441669 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14577 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14572 b1!97))))))

(assert (=> d!103586 (invariant!0 (currentBit!14572 b1!97) (currentByte!14577 b1!97) (size!8278 (buf!7891 b1!97)))))

(assert (=> d!103586 (= (bitIndex!0 (size!8278 (buf!7891 b1!97)) (currentByte!14577 b1!97) (currentBit!14572 b1!97)) lt!441669)))

(declare-fun b!312086 () Bool)

(declare-fun res!255640 () Bool)

(assert (=> b!312086 (=> (not res!255640) (not e!224425))))

(assert (=> b!312086 (= res!255640 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441669))))

(declare-fun b!312087 () Bool)

(declare-fun lt!441670 () (_ BitVec 64))

(assert (=> b!312087 (= e!224425 (bvsle lt!441669 (bvmul lt!441670 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312087 (or (= lt!441670 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441670 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441670)))))

(assert (=> b!312087 (= lt!441670 ((_ sign_extend 32) (size!8278 (buf!7891 b1!97))))))

(assert (= (and d!103586 res!255641) b!312086))

(assert (= (and b!312086 res!255640) b!312087))

(assert (=> d!103586 m!449775))

(declare-fun m!449821 () Bool)

(assert (=> d!103586 m!449821))

(assert (=> b!312034 d!103586))

(declare-fun d!103588 () Bool)

(assert (=> d!103588 (= (array_inv!7830 (buf!7891 b2!97)) (bvsge (size!8278 (buf!7891 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!312035 d!103588))

(declare-fun d!103592 () Bool)

(assert (=> d!103592 (= (array_inv!7830 (buf!7891 b1!97)) (bvsge (size!8278 (buf!7891 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!312036 d!103592))

(declare-fun d!103594 () Bool)

(assert (=> d!103594 (= (inv!12 b1!97) (invariant!0 (currentBit!14572 b1!97) (currentByte!14577 b1!97) (size!8278 (buf!7891 b1!97))))))

(declare-fun bs!26803 () Bool)

(assert (= bs!26803 d!103594))

(assert (=> bs!26803 m!449821))

(assert (=> start!69388 d!103594))

(declare-fun d!103600 () Bool)

(assert (=> d!103600 (= (inv!12 b2!97) (invariant!0 (currentBit!14572 b2!97) (currentByte!14577 b2!97) (size!8278 (buf!7891 b2!97))))))

(declare-fun bs!26804 () Bool)

(assert (= bs!26804 d!103600))

(assert (=> bs!26804 m!449819))

(assert (=> start!69388 d!103600))

(declare-fun d!103602 () Bool)

(assert (=> d!103602 (= (remainingBits!0 ((_ sign_extend 32) (size!8278 (buf!7891 b1!97))) ((_ sign_extend 32) (currentByte!14577 b1!97)) ((_ sign_extend 32) (currentBit!14572 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8278 (buf!7891 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14577 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14572 b1!97)))))))

(assert (=> b!312037 d!103602))

(declare-fun d!103608 () Bool)

(assert (=> d!103608 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8278 (buf!7891 b1!97))) ((_ sign_extend 32) (currentByte!14577 b1!97)) ((_ sign_extend 32) (currentBit!14572 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8278 (buf!7891 b1!97))) ((_ sign_extend 32) (currentByte!14577 b1!97)) ((_ sign_extend 32) (currentBit!14572 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26808 () Bool)

(assert (= bs!26808 d!103608))

(assert (=> bs!26808 m!449775))

(assert (=> b!312038 d!103608))

(push 1)

(assert (not d!103580))

(assert (not d!103594))

(assert (not d!103600))

(assert (not d!103608))

(assert (not d!103586))

(check-sat)

(pop 1)

(push 1)

(check-sat)

