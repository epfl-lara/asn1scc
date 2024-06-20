; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16520 () Bool)

(assert start!16520)

(declare-fun res!67726 () Bool)

(declare-fun e!54220 () Bool)

(assert (=> start!16520 (=> (not res!67726) (not e!54220))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3690 0))(
  ( (array!3691 (arr!2327 (Array (_ BitVec 32) (_ BitVec 8))) (size!1690 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2942 0))(
  ( (BitStream!2943 (buf!2080 array!3690) (currentByte!4060 (_ BitVec 32)) (currentBit!4055 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2942)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!2942)

(assert (=> start!16520 (= res!67726 (and (= (size!1690 (buf!2080 b1!98)) (size!1690 (buf!2080 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16520 e!54220))

(declare-fun e!54221 () Bool)

(declare-fun inv!12 (BitStream!2942) Bool)

(assert (=> start!16520 (and (inv!12 b1!98) e!54221)))

(declare-fun e!54217 () Bool)

(assert (=> start!16520 (and (inv!12 b2!98) e!54217)))

(assert (=> start!16520 true))

(declare-fun b!82170 () Bool)

(declare-fun array_inv!1536 (array!3690) Bool)

(assert (=> b!82170 (= e!54221 (array_inv!1536 (buf!2080 b1!98)))))

(declare-fun b!82171 () Bool)

(assert (=> b!82171 (= e!54217 (array_inv!1536 (buf!2080 b2!98)))))

(declare-fun b!82172 () Bool)

(declare-fun res!67724 () Bool)

(assert (=> b!82172 (=> (not res!67724) (not e!54220))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82172 (= res!67724 (validate_offset_bits!1 ((_ sign_extend 32) (size!1690 (buf!2080 b1!98))) ((_ sign_extend 32) (currentByte!4060 b1!98)) ((_ sign_extend 32) (currentBit!4055 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82173 () Bool)

(declare-fun e!54218 () Bool)

(assert (=> b!82173 (= e!54220 e!54218)))

(declare-fun res!67725 () Bool)

(assert (=> b!82173 (=> (not res!67725) (not e!54218))))

(declare-fun lt!130647 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82173 (= res!67725 (= (bvadd lt!130647 b1b2Diff!1) (bitIndex!0 (size!1690 (buf!2080 b2!98)) (currentByte!4060 b2!98) (currentBit!4055 b2!98))))))

(assert (=> b!82173 (= lt!130647 (bitIndex!0 (size!1690 (buf!2080 b1!98)) (currentByte!4060 b1!98) (currentBit!4055 b1!98)))))

(declare-fun b!82174 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82174 (= e!54218 (not (invariant!0 (currentBit!4055 b1!98) (currentByte!4060 b1!98) (size!1690 (buf!2080 b1!98)))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82174 (= (remainingBits!0 ((_ sign_extend 32) (size!1690 (buf!2080 b1!98))) ((_ sign_extend 32) (currentByte!4060 b1!98)) ((_ sign_extend 32) (currentBit!4055 b1!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1690 (buf!2080 b1!98)))) lt!130647))))

(declare-datatypes ((Unit!5489 0))(
  ( (Unit!5490) )
))
(declare-fun lt!130646 () Unit!5489)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2942) Unit!5489)

(assert (=> b!82174 (= lt!130646 (remainingBitsBitIndexLemma!0 b1!98))))

(assert (= (and start!16520 res!67726) b!82172))

(assert (= (and b!82172 res!67724) b!82173))

(assert (= (and b!82173 res!67725) b!82174))

(assert (= start!16520 b!82170))

(assert (= start!16520 b!82171))

(declare-fun m!128605 () Bool)

(assert (=> b!82170 m!128605))

(declare-fun m!128607 () Bool)

(assert (=> b!82171 m!128607))

(declare-fun m!128609 () Bool)

(assert (=> start!16520 m!128609))

(declare-fun m!128611 () Bool)

(assert (=> start!16520 m!128611))

(declare-fun m!128613 () Bool)

(assert (=> b!82173 m!128613))

(declare-fun m!128615 () Bool)

(assert (=> b!82173 m!128615))

(declare-fun m!128617 () Bool)

(assert (=> b!82172 m!128617))

(declare-fun m!128619 () Bool)

(assert (=> b!82174 m!128619))

(declare-fun m!128621 () Bool)

(assert (=> b!82174 m!128621))

(declare-fun m!128623 () Bool)

(assert (=> b!82174 m!128623))

(push 1)

(assert (not start!16520))

(assert (not b!82173))

(assert (not b!82174))

(assert (not b!82171))

(assert (not b!82172))

(assert (not b!82170))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25880 () Bool)

(assert (=> d!25880 (= (array_inv!1536 (buf!2080 b1!98)) (bvsge (size!1690 (buf!2080 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82170 d!25880))

(declare-fun d!25886 () Bool)

(assert (=> d!25886 (= (array_inv!1536 (buf!2080 b2!98)) (bvsge (size!1690 (buf!2080 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82171 d!25886))

(declare-fun d!25888 () Bool)

(assert (=> d!25888 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1690 (buf!2080 b1!98))) ((_ sign_extend 32) (currentByte!4060 b1!98)) ((_ sign_extend 32) (currentBit!4055 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1690 (buf!2080 b1!98))) ((_ sign_extend 32) (currentByte!4060 b1!98)) ((_ sign_extend 32) (currentBit!4055 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6342 () Bool)

(assert (= bs!6342 d!25888))

(assert (=> bs!6342 m!128621))

(assert (=> b!82172 d!25888))

(declare-fun d!25898 () Bool)

(declare-fun e!54229 () Bool)

(assert (=> d!25898 e!54229))

(declare-fun res!67739 () Bool)

(assert (=> d!25898 (=> (not res!67739) (not e!54229))))

(declare-fun lt!130719 () (_ BitVec 64))

(declare-fun lt!130715 () (_ BitVec 64))

(declare-fun lt!130716 () (_ BitVec 64))

(assert (=> d!25898 (= res!67739 (= lt!130719 (bvsub lt!130715 lt!130716)))))

(assert (=> d!25898 (or (= (bvand lt!130715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130716 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130715 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130715 lt!130716) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25898 (= lt!130716 (remainingBits!0 ((_ sign_extend 32) (size!1690 (buf!2080 b2!98))) ((_ sign_extend 32) (currentByte!4060 b2!98)) ((_ sign_extend 32) (currentBit!4055 b2!98))))))

(declare-fun lt!130718 () (_ BitVec 64))

(declare-fun lt!130717 () (_ BitVec 64))

(assert (=> d!25898 (= lt!130715 (bvmul lt!130718 lt!130717))))

(assert (=> d!25898 (or (= lt!130718 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130717 (bvsdiv (bvmul lt!130718 lt!130717) lt!130718)))))

(assert (=> d!25898 (= lt!130717 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25898 (= lt!130718 ((_ sign_extend 32) (size!1690 (buf!2080 b2!98))))))

(assert (=> d!25898 (= lt!130719 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4060 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4055 b2!98))))))

(assert (=> d!25898 (invariant!0 (currentBit!4055 b2!98) (currentByte!4060 b2!98) (size!1690 (buf!2080 b2!98)))))

(assert (=> d!25898 (= (bitIndex!0 (size!1690 (buf!2080 b2!98)) (currentByte!4060 b2!98) (currentBit!4055 b2!98)) lt!130719)))

(declare-fun b!82189 () Bool)

(declare-fun res!67740 () Bool)

(assert (=> b!82189 (=> (not res!67740) (not e!54229))))

(assert (=> b!82189 (= res!67740 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130719))))

(declare-fun b!82190 () Bool)

(declare-fun lt!130714 () (_ BitVec 64))

(assert (=> b!82190 (= e!54229 (bvsle lt!130719 (bvmul lt!130714 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82190 (or (= lt!130714 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130714 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130714)))))

(assert (=> b!82190 (= lt!130714 ((_ sign_extend 32) (size!1690 (buf!2080 b2!98))))))

(assert (= (and d!25898 res!67739) b!82189))

(assert (= (and b!82189 res!67740) b!82190))

(declare-fun m!128635 () Bool)

(assert (=> d!25898 m!128635))

(declare-fun m!128637 () Bool)

(assert (=> d!25898 m!128637))

(assert (=> b!82173 d!25898))

(declare-fun d!25916 () Bool)

(declare-fun e!54230 () Bool)

(assert (=> d!25916 e!54230))

(declare-fun res!67741 () Bool)

(assert (=> d!25916 (=> (not res!67741) (not e!54230))))

(declare-fun lt!130721 () (_ BitVec 64))

(declare-fun lt!130725 () (_ BitVec 64))

(declare-fun lt!130722 () (_ BitVec 64))

(assert (=> d!25916 (= res!67741 (= lt!130725 (bvsub lt!130721 lt!130722)))))

(assert (=> d!25916 (or (= (bvand lt!130721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130722 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130721 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130721 lt!130722) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25916 (= lt!130722 (remainingBits!0 ((_ sign_extend 32) (size!1690 (buf!2080 b1!98))) ((_ sign_extend 32) (currentByte!4060 b1!98)) ((_ sign_extend 32) (currentBit!4055 b1!98))))))

(declare-fun lt!130724 () (_ BitVec 64))

(declare-fun lt!130723 () (_ BitVec 64))

(assert (=> d!25916 (= lt!130721 (bvmul lt!130724 lt!130723))))

(assert (=> d!25916 (or (= lt!130724 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130723 (bvsdiv (bvmul lt!130724 lt!130723) lt!130724)))))

(assert (=> d!25916 (= lt!130723 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25916 (= lt!130724 ((_ sign_extend 32) (size!1690 (buf!2080 b1!98))))))

(assert (=> d!25916 (= lt!130725 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4060 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4055 b1!98))))))

(assert (=> d!25916 (invariant!0 (currentBit!4055 b1!98) (currentByte!4060 b1!98) (size!1690 (buf!2080 b1!98)))))

(assert (=> d!25916 (= (bitIndex!0 (size!1690 (buf!2080 b1!98)) (currentByte!4060 b1!98) (currentBit!4055 b1!98)) lt!130725)))

(declare-fun b!82191 () Bool)

(declare-fun res!67742 () Bool)

(assert (=> b!82191 (=> (not res!67742) (not e!54230))))

(assert (=> b!82191 (= res!67742 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130725))))

(declare-fun b!82192 () Bool)

(declare-fun lt!130720 () (_ BitVec 64))

(assert (=> b!82192 (= e!54230 (bvsle lt!130725 (bvmul lt!130720 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82192 (or (= lt!130720 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130720 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130720)))))

(assert (=> b!82192 (= lt!130720 ((_ sign_extend 32) (size!1690 (buf!2080 b1!98))))))

(assert (= (and d!25916 res!67741) b!82191))

(assert (= (and b!82191 res!67742) b!82192))

(assert (=> d!25916 m!128621))

(assert (=> d!25916 m!128619))

(assert (=> b!82173 d!25916))

(declare-fun d!25918 () Bool)

(assert (=> d!25918 (= (invariant!0 (currentBit!4055 b1!98) (currentByte!4060 b1!98) (size!1690 (buf!2080 b1!98))) (and (bvsge (currentBit!4055 b1!98) #b00000000000000000000000000000000) (bvslt (currentBit!4055 b1!98) #b00000000000000000000000000001000) (bvsge (currentByte!4060 b1!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!4060 b1!98) (size!1690 (buf!2080 b1!98))) (and (= (currentBit!4055 b1!98) #b00000000000000000000000000000000) (= (currentByte!4060 b1!98) (size!1690 (buf!2080 b1!98)))))))))

(assert (=> b!82174 d!25918))

(declare-fun d!25920 () Bool)

(assert (=> d!25920 (= (remainingBits!0 ((_ sign_extend 32) (size!1690 (buf!2080 b1!98))) ((_ sign_extend 32) (currentByte!4060 b1!98)) ((_ sign_extend 32) (currentBit!4055 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1690 (buf!2080 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4060 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4055 b1!98)))))))

(assert (=> b!82174 d!25920))

(declare-fun d!25922 () Bool)

(declare-fun lt!130751 () (_ BitVec 64))

(declare-fun lt!130752 () (_ BitVec 64))

(assert (=> d!25922 (= (remainingBits!0 ((_ sign_extend 32) (size!1690 (buf!2080 b1!98))) ((_ sign_extend 32) (currentByte!4060 b1!98)) ((_ sign_extend 32) (currentBit!4055 b1!98))) (bvsub lt!130751 lt!130752))))

(assert (=> d!25922 (or (= (bvand lt!130751 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130752 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130751 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130751 lt!130752) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25922 (= lt!130752 (bitIndex!0 (size!1690 (buf!2080 b1!98)) (currentByte!4060 b1!98) (currentBit!4055 b1!98)))))

(declare-fun lt!130750 () (_ BitVec 64))

(declare-fun lt!130748 () (_ BitVec 64))

(assert (=> d!25922 (= lt!130751 (bvmul lt!130750 lt!130748))))

(assert (=> d!25922 (or (= lt!130750 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130748 (bvsdiv (bvmul lt!130750 lt!130748) lt!130750)))))

(assert (=> d!25922 (= lt!130748 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25922 (= lt!130750 ((_ sign_extend 32) (size!1690 (buf!2080 b1!98))))))

(declare-fun lt!130749 () Unit!5489)

(declare-fun choose!23 (BitStream!2942) Unit!5489)

(assert (=> d!25922 (= lt!130749 (choose!23 b1!98))))

(assert (=> d!25922 (= (remainingBitsBitIndexLemma!0 b1!98) lt!130749)))

(declare-fun bs!6348 () Bool)

(assert (= bs!6348 d!25922))

(assert (=> bs!6348 m!128621))

(assert (=> bs!6348 m!128615))

(declare-fun m!128639 () Bool)

(assert (=> bs!6348 m!128639))

(assert (=> b!82174 d!25922))

(declare-fun d!25924 () Bool)

(assert (=> d!25924 (= (inv!12 b1!98) (invariant!0 (currentBit!4055 b1!98) (currentByte!4060 b1!98) (size!1690 (buf!2080 b1!98))))))

(declare-fun bs!6349 () Bool)

(assert (= bs!6349 d!25924))

(assert (=> bs!6349 m!128619))

(assert (=> start!16520 d!25924))

(declare-fun d!25930 () Bool)

(assert (=> d!25930 (= (inv!12 b2!98) (invariant!0 (currentBit!4055 b2!98) (currentByte!4060 b2!98) (size!1690 (buf!2080 b2!98))))))

(declare-fun bs!6350 () Bool)

(assert (= bs!6350 d!25930))

(assert (=> bs!6350 m!128637))

(assert (=> start!16520 d!25930))

(push 1)

