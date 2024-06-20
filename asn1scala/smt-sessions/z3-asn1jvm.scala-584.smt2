; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16766 () Bool)

(assert start!16766)

(declare-fun b!82680 () Bool)

(declare-fun e!54712 () Bool)

(declare-datatypes ((array!3745 0))(
  ( (array!3746 (arr!2347 (Array (_ BitVec 32) (_ BitVec 8))) (size!1710 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2982 0))(
  ( (BitStream!2983 (buf!2100 array!3745) (currentByte!4136 (_ BitVec 32)) (currentBit!4131 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2982)

(declare-fun array_inv!1556 (array!3745) Bool)

(assert (=> b!82680 (= e!54712 (array_inv!1556 (buf!2100 b2!98)))))

(declare-fun b!82681 () Bool)

(declare-fun e!54714 () Bool)

(declare-fun e!54711 () Bool)

(assert (=> b!82681 (= e!54714 (not e!54711))))

(declare-fun res!68098 () Bool)

(assert (=> b!82681 (=> res!68098 e!54711)))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun lt!131659 () (_ BitVec 64))

(declare-fun lt!131660 () (_ BitVec 64))

(assert (=> b!82681 (= res!68098 (bvsgt lt!131660 (bvsub lt!131659 b1ValidateOffsetBits!11)))))

(declare-fun b1!98 () BitStream!2982)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82681 (= (remainingBits!0 ((_ sign_extend 32) (size!1710 (buf!2100 b1!98))) ((_ sign_extend 32) (currentByte!4136 b1!98)) ((_ sign_extend 32) (currentBit!4131 b1!98))) (bvsub lt!131659 lt!131660))))

(assert (=> b!82681 (= lt!131659 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1710 (buf!2100 b1!98)))))))

(declare-datatypes ((Unit!5529 0))(
  ( (Unit!5530) )
))
(declare-fun lt!131664 () Unit!5529)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2982) Unit!5529)

(assert (=> b!82681 (= lt!131664 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun res!68101 () Bool)

(declare-fun e!54717 () Bool)

(assert (=> start!16766 (=> (not res!68101) (not e!54717))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> start!16766 (= res!68101 (and (= (size!1710 (buf!2100 b1!98)) (size!1710 (buf!2100 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16766 e!54717))

(declare-fun e!54713 () Bool)

(declare-fun inv!12 (BitStream!2982) Bool)

(assert (=> start!16766 (and (inv!12 b1!98) e!54713)))

(assert (=> start!16766 (and (inv!12 b2!98) e!54712)))

(assert (=> start!16766 true))

(declare-fun b!82682 () Bool)

(assert (=> b!82682 (= e!54713 (array_inv!1556 (buf!2100 b1!98)))))

(declare-fun b!82683 () Bool)

(declare-fun res!68099 () Bool)

(assert (=> b!82683 (=> (not res!68099) (not e!54717))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82683 (= res!68099 (validate_offset_bits!1 ((_ sign_extend 32) (size!1710 (buf!2100 b1!98))) ((_ sign_extend 32) (currentByte!4136 b1!98)) ((_ sign_extend 32) (currentBit!4131 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82684 () Bool)

(declare-fun e!54716 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82684 (= e!54716 (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4131 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4136 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1710 (buf!2100 b2!98))))))))

(declare-fun b!82685 () Bool)

(assert (=> b!82685 (= e!54717 e!54714)))

(declare-fun res!68100 () Bool)

(assert (=> b!82685 (=> (not res!68100) (not e!54714))))

(declare-fun lt!131657 () (_ BitVec 64))

(declare-fun lt!131663 () (_ BitVec 64))

(assert (=> b!82685 (= res!68100 (= lt!131657 lt!131663))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82685 (= lt!131663 (bitIndex!0 (size!1710 (buf!2100 b2!98)) (currentByte!4136 b2!98) (currentBit!4131 b2!98)))))

(assert (=> b!82685 (= lt!131657 (bvadd lt!131660 b1b2Diff!1))))

(assert (=> b!82685 (= lt!131660 (bitIndex!0 (size!1710 (buf!2100 b1!98)) (currentByte!4136 b1!98) (currentBit!4131 b1!98)))))

(declare-fun b!82686 () Bool)

(assert (=> b!82686 (= e!54711 e!54716)))

(declare-fun res!68097 () Bool)

(assert (=> b!82686 (=> res!68097 e!54716)))

(declare-fun lt!131662 () (_ BitVec 64))

(declare-fun lt!131658 () (_ BitVec 64))

(assert (=> b!82686 (= res!68097 (or (not (= lt!131658 (bvsub lt!131662 lt!131657))) (bvsgt ((_ sign_extend 32) (size!1710 (buf!2100 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4136 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4131 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvslt ((_ sign_extend 32) (size!1710 (buf!2100 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4136 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4131 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!82686 (= lt!131658 (bvsub lt!131662 lt!131663))))

(assert (=> b!82686 (= lt!131658 (remainingBits!0 ((_ sign_extend 32) (size!1710 (buf!2100 b2!98))) ((_ sign_extend 32) (currentByte!4136 b2!98)) ((_ sign_extend 32) (currentBit!4131 b2!98))))))

(assert (=> b!82686 (= lt!131662 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1710 (buf!2100 b2!98)))))))

(declare-fun lt!131661 () Unit!5529)

(assert (=> b!82686 (= lt!131661 (remainingBitsBitIndexLemma!0 b2!98))))

(assert (= (and start!16766 res!68101) b!82683))

(assert (= (and b!82683 res!68099) b!82685))

(assert (= (and b!82685 res!68100) b!82681))

(assert (= (and b!82681 (not res!68098)) b!82686))

(assert (= (and b!82686 (not res!68097)) b!82684))

(assert (= start!16766 b!82682))

(assert (= start!16766 b!82680))

(declare-fun m!129165 () Bool)

(assert (=> b!82681 m!129165))

(declare-fun m!129167 () Bool)

(assert (=> b!82681 m!129167))

(declare-fun m!129169 () Bool)

(assert (=> b!82683 m!129169))

(declare-fun m!129171 () Bool)

(assert (=> b!82685 m!129171))

(declare-fun m!129173 () Bool)

(assert (=> b!82685 m!129173))

(declare-fun m!129175 () Bool)

(assert (=> b!82684 m!129175))

(declare-fun m!129177 () Bool)

(assert (=> b!82686 m!129177))

(declare-fun m!129179 () Bool)

(assert (=> b!82686 m!129179))

(declare-fun m!129181 () Bool)

(assert (=> b!82680 m!129181))

(declare-fun m!129183 () Bool)

(assert (=> start!16766 m!129183))

(declare-fun m!129185 () Bool)

(assert (=> start!16766 m!129185))

(declare-fun m!129187 () Bool)

(assert (=> b!82682 m!129187))

(check-sat (not b!82682) (not b!82686) (not b!82684) (not b!82681) (not start!16766) (not b!82685) (not b!82683) (not b!82680))
(check-sat)
(get-model)

(declare-fun d!26240 () Bool)

(assert (=> d!26240 (= (array_inv!1556 (buf!2100 b2!98)) (bvsge (size!1710 (buf!2100 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82680 d!26240))

(declare-fun d!26242 () Bool)

(assert (=> d!26242 (= (remainingBits!0 ((_ sign_extend 32) (size!1710 (buf!2100 b2!98))) ((_ sign_extend 32) (currentByte!4136 b2!98)) ((_ sign_extend 32) (currentBit!4131 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1710 (buf!2100 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4136 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4131 b2!98)))))))

(assert (=> b!82686 d!26242))

(declare-fun d!26244 () Bool)

(declare-fun lt!131703 () (_ BitVec 64))

(declare-fun lt!131699 () (_ BitVec 64))

(assert (=> d!26244 (= (remainingBits!0 ((_ sign_extend 32) (size!1710 (buf!2100 b2!98))) ((_ sign_extend 32) (currentByte!4136 b2!98)) ((_ sign_extend 32) (currentBit!4131 b2!98))) (bvsub lt!131703 lt!131699))))

(assert (=> d!26244 (or (= (bvand lt!131703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131699 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131703 lt!131699) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26244 (= lt!131699 (bitIndex!0 (size!1710 (buf!2100 b2!98)) (currentByte!4136 b2!98) (currentBit!4131 b2!98)))))

(declare-fun lt!131702 () (_ BitVec 64))

(declare-fun lt!131700 () (_ BitVec 64))

(assert (=> d!26244 (= lt!131703 (bvmul lt!131702 lt!131700))))

(assert (=> d!26244 (or (= lt!131702 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131700 (bvsdiv (bvmul lt!131702 lt!131700) lt!131702)))))

(assert (=> d!26244 (= lt!131700 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26244 (= lt!131702 ((_ sign_extend 32) (size!1710 (buf!2100 b2!98))))))

(declare-fun lt!131701 () Unit!5529)

(declare-fun choose!23 (BitStream!2982) Unit!5529)

(assert (=> d!26244 (= lt!131701 (choose!23 b2!98))))

(assert (=> d!26244 (= (remainingBitsBitIndexLemma!0 b2!98) lt!131701)))

(declare-fun bs!6437 () Bool)

(assert (= bs!6437 d!26244))

(assert (=> bs!6437 m!129177))

(assert (=> bs!6437 m!129171))

(declare-fun m!129213 () Bool)

(assert (=> bs!6437 m!129213))

(assert (=> b!82686 d!26244))

(declare-fun d!26246 () Bool)

(assert (=> d!26246 (= (remainingBits!0 ((_ sign_extend 32) (size!1710 (buf!2100 b1!98))) ((_ sign_extend 32) (currentByte!4136 b1!98)) ((_ sign_extend 32) (currentBit!4131 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1710 (buf!2100 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4136 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4131 b1!98)))))))

(assert (=> b!82681 d!26246))

(declare-fun d!26248 () Bool)

(declare-fun lt!131708 () (_ BitVec 64))

(declare-fun lt!131704 () (_ BitVec 64))

(assert (=> d!26248 (= (remainingBits!0 ((_ sign_extend 32) (size!1710 (buf!2100 b1!98))) ((_ sign_extend 32) (currentByte!4136 b1!98)) ((_ sign_extend 32) (currentBit!4131 b1!98))) (bvsub lt!131708 lt!131704))))

(assert (=> d!26248 (or (= (bvand lt!131708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131704 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131708 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131708 lt!131704) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26248 (= lt!131704 (bitIndex!0 (size!1710 (buf!2100 b1!98)) (currentByte!4136 b1!98) (currentBit!4131 b1!98)))))

(declare-fun lt!131707 () (_ BitVec 64))

(declare-fun lt!131705 () (_ BitVec 64))

(assert (=> d!26248 (= lt!131708 (bvmul lt!131707 lt!131705))))

(assert (=> d!26248 (or (= lt!131707 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131705 (bvsdiv (bvmul lt!131707 lt!131705) lt!131707)))))

(assert (=> d!26248 (= lt!131705 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26248 (= lt!131707 ((_ sign_extend 32) (size!1710 (buf!2100 b1!98))))))

(declare-fun lt!131706 () Unit!5529)

(assert (=> d!26248 (= lt!131706 (choose!23 b1!98))))

(assert (=> d!26248 (= (remainingBitsBitIndexLemma!0 b1!98) lt!131706)))

(declare-fun bs!6438 () Bool)

(assert (= bs!6438 d!26248))

(assert (=> bs!6438 m!129165))

(assert (=> bs!6438 m!129173))

(declare-fun m!129215 () Bool)

(assert (=> bs!6438 m!129215))

(assert (=> b!82681 d!26248))

(declare-fun d!26250 () Bool)

(assert (=> d!26250 (= (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4131 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4136 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1710 (buf!2100 b2!98))))) (and (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4131 b2!98))) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4131 b2!98))) #b00000000000000000000000000001000) (bvsge ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4136 b2!98))) #b00000000000000000000000000000000) (or (bvslt ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4136 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1710 (buf!2100 b2!98))))) (and (= ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4131 b2!98))) #b00000000000000000000000000000000) (= ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4136 b2!98))) ((_ extract 31 0) ((_ sign_extend 32) (size!1710 (buf!2100 b2!98)))))))))))

(assert (=> b!82684 d!26250))

(declare-fun d!26252 () Bool)

(declare-fun e!54744 () Bool)

(assert (=> d!26252 e!54744))

(declare-fun res!68121 () Bool)

(assert (=> d!26252 (=> (not res!68121) (not e!54744))))

(declare-fun lt!131723 () (_ BitVec 64))

(declare-fun lt!131722 () (_ BitVec 64))

(declare-fun lt!131726 () (_ BitVec 64))

(assert (=> d!26252 (= res!68121 (= lt!131726 (bvsub lt!131722 lt!131723)))))

(assert (=> d!26252 (or (= (bvand lt!131722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131723 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131722 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131722 lt!131723) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26252 (= lt!131723 (remainingBits!0 ((_ sign_extend 32) (size!1710 (buf!2100 b2!98))) ((_ sign_extend 32) (currentByte!4136 b2!98)) ((_ sign_extend 32) (currentBit!4131 b2!98))))))

(declare-fun lt!131721 () (_ BitVec 64))

(declare-fun lt!131724 () (_ BitVec 64))

(assert (=> d!26252 (= lt!131722 (bvmul lt!131721 lt!131724))))

(assert (=> d!26252 (or (= lt!131721 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131724 (bvsdiv (bvmul lt!131721 lt!131724) lt!131721)))))

(assert (=> d!26252 (= lt!131724 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26252 (= lt!131721 ((_ sign_extend 32) (size!1710 (buf!2100 b2!98))))))

(assert (=> d!26252 (= lt!131726 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4136 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4131 b2!98))))))

(assert (=> d!26252 (invariant!0 (currentBit!4131 b2!98) (currentByte!4136 b2!98) (size!1710 (buf!2100 b2!98)))))

(assert (=> d!26252 (= (bitIndex!0 (size!1710 (buf!2100 b2!98)) (currentByte!4136 b2!98) (currentBit!4131 b2!98)) lt!131726)))

(declare-fun b!82713 () Bool)

(declare-fun res!68122 () Bool)

(assert (=> b!82713 (=> (not res!68122) (not e!54744))))

(assert (=> b!82713 (= res!68122 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131726))))

(declare-fun b!82714 () Bool)

(declare-fun lt!131725 () (_ BitVec 64))

(assert (=> b!82714 (= e!54744 (bvsle lt!131726 (bvmul lt!131725 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82714 (or (= lt!131725 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131725 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131725)))))

(assert (=> b!82714 (= lt!131725 ((_ sign_extend 32) (size!1710 (buf!2100 b2!98))))))

(assert (= (and d!26252 res!68121) b!82713))

(assert (= (and b!82713 res!68122) b!82714))

(assert (=> d!26252 m!129177))

(declare-fun m!129217 () Bool)

(assert (=> d!26252 m!129217))

(assert (=> b!82685 d!26252))

(declare-fun d!26262 () Bool)

(declare-fun e!54745 () Bool)

(assert (=> d!26262 e!54745))

(declare-fun res!68123 () Bool)

(assert (=> d!26262 (=> (not res!68123) (not e!54745))))

(declare-fun lt!131729 () (_ BitVec 64))

(declare-fun lt!131732 () (_ BitVec 64))

(declare-fun lt!131728 () (_ BitVec 64))

(assert (=> d!26262 (= res!68123 (= lt!131732 (bvsub lt!131728 lt!131729)))))

(assert (=> d!26262 (or (= (bvand lt!131728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131729 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131728 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131728 lt!131729) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26262 (= lt!131729 (remainingBits!0 ((_ sign_extend 32) (size!1710 (buf!2100 b1!98))) ((_ sign_extend 32) (currentByte!4136 b1!98)) ((_ sign_extend 32) (currentBit!4131 b1!98))))))

(declare-fun lt!131727 () (_ BitVec 64))

(declare-fun lt!131730 () (_ BitVec 64))

(assert (=> d!26262 (= lt!131728 (bvmul lt!131727 lt!131730))))

(assert (=> d!26262 (or (= lt!131727 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131730 (bvsdiv (bvmul lt!131727 lt!131730) lt!131727)))))

(assert (=> d!26262 (= lt!131730 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26262 (= lt!131727 ((_ sign_extend 32) (size!1710 (buf!2100 b1!98))))))

(assert (=> d!26262 (= lt!131732 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4136 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4131 b1!98))))))

(assert (=> d!26262 (invariant!0 (currentBit!4131 b1!98) (currentByte!4136 b1!98) (size!1710 (buf!2100 b1!98)))))

(assert (=> d!26262 (= (bitIndex!0 (size!1710 (buf!2100 b1!98)) (currentByte!4136 b1!98) (currentBit!4131 b1!98)) lt!131732)))

(declare-fun b!82715 () Bool)

(declare-fun res!68124 () Bool)

(assert (=> b!82715 (=> (not res!68124) (not e!54745))))

(assert (=> b!82715 (= res!68124 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131732))))

(declare-fun b!82716 () Bool)

(declare-fun lt!131731 () (_ BitVec 64))

(assert (=> b!82716 (= e!54745 (bvsle lt!131732 (bvmul lt!131731 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82716 (or (= lt!131731 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131731 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131731)))))

(assert (=> b!82716 (= lt!131731 ((_ sign_extend 32) (size!1710 (buf!2100 b1!98))))))

(assert (= (and d!26262 res!68123) b!82715))

(assert (= (and b!82715 res!68124) b!82716))

(assert (=> d!26262 m!129165))

(declare-fun m!129219 () Bool)

(assert (=> d!26262 m!129219))

(assert (=> b!82685 d!26262))

(declare-fun d!26264 () Bool)

(assert (=> d!26264 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1710 (buf!2100 b1!98))) ((_ sign_extend 32) (currentByte!4136 b1!98)) ((_ sign_extend 32) (currentBit!4131 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1710 (buf!2100 b1!98))) ((_ sign_extend 32) (currentByte!4136 b1!98)) ((_ sign_extend 32) (currentBit!4131 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6439 () Bool)

(assert (= bs!6439 d!26264))

(assert (=> bs!6439 m!129165))

(assert (=> b!82683 d!26264))

(declare-fun d!26268 () Bool)

(assert (=> d!26268 (= (array_inv!1556 (buf!2100 b1!98)) (bvsge (size!1710 (buf!2100 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82682 d!26268))

(declare-fun d!26270 () Bool)

(assert (=> d!26270 (= (inv!12 b1!98) (invariant!0 (currentBit!4131 b1!98) (currentByte!4136 b1!98) (size!1710 (buf!2100 b1!98))))))

(declare-fun bs!6440 () Bool)

(assert (= bs!6440 d!26270))

(assert (=> bs!6440 m!129219))

(assert (=> start!16766 d!26270))

(declare-fun d!26272 () Bool)

(assert (=> d!26272 (= (inv!12 b2!98) (invariant!0 (currentBit!4131 b2!98) (currentByte!4136 b2!98) (size!1710 (buf!2100 b2!98))))))

(declare-fun bs!6441 () Bool)

(assert (= bs!6441 d!26272))

(assert (=> bs!6441 m!129217))

(assert (=> start!16766 d!26272))

(check-sat (not d!26270) (not d!26262) (not d!26248) (not d!26264) (not d!26244) (not d!26252) (not d!26272))
