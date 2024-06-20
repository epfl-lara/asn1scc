; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69424 () Bool)

(assert start!69424)

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun b!312112 () Bool)

(declare-fun e!224446 () Bool)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-datatypes ((array!19099 0))(
  ( (array!19100 (arr!9361 (Array (_ BitVec 32) (_ BitVec 8))) (size!8281 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13666 0))(
  ( (BitStream!13667 (buf!7894 array!19099) (currentByte!14589 (_ BitVec 32)) (currentBit!14584 (_ BitVec 32))) )
))
(declare-fun b2!97 () BitStream!13666)

(declare-fun b1!97 () BitStream!13666)

(declare-fun lt!441713 () (_ BitVec 64))

(assert (=> b!312112 (= e!224446 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8281 (buf!7894 b1!97)))) lt!441713) b1ValidateOffsetBits!10) (bvsgt (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14589 b2!97))) ((_ sign_extend 32) (currentBit!14584 b2!97))) (bvadd lt!441713 advancedAtMostBits!9))))))

(assert (=> b!312112 (= lt!441713 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14589 b1!97))) ((_ sign_extend 32) (currentBit!14584 b1!97))))))

(declare-fun b!312113 () Bool)

(declare-fun res!255663 () Bool)

(assert (=> b!312113 (=> (not res!255663) (not e!224446))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312113 (= res!255663 (validate_offset_bits!1 ((_ sign_extend 32) (size!8281 (buf!7894 b1!97))) ((_ sign_extend 32) (currentByte!14589 b1!97)) ((_ sign_extend 32) (currentBit!14584 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun res!255665 () Bool)

(assert (=> start!69424 (=> (not res!255665) (not e!224446))))

(assert (=> start!69424 (= res!255665 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8281 (buf!7894 b1!97)) (size!8281 (buf!7894 b2!97)))))))

(assert (=> start!69424 e!224446))

(assert (=> start!69424 true))

(declare-fun e!224442 () Bool)

(declare-fun inv!12 (BitStream!13666) Bool)

(assert (=> start!69424 (and (inv!12 b1!97) e!224442)))

(declare-fun e!224445 () Bool)

(assert (=> start!69424 (and (inv!12 b2!97) e!224445)))

(declare-fun b!312114 () Bool)

(declare-fun res!255664 () Bool)

(assert (=> b!312114 (=> (not res!255664) (not e!224446))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312114 (= res!255664 (bvsle (bitIndex!0 (size!8281 (buf!7894 b2!97)) (currentByte!14589 b2!97) (currentBit!14584 b2!97)) (bvadd (bitIndex!0 (size!8281 (buf!7894 b1!97)) (currentByte!14589 b1!97) (currentBit!14584 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312115 () Bool)

(declare-fun res!255662 () Bool)

(assert (=> b!312115 (=> (not res!255662) (not e!224446))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312115 (= res!255662 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8281 (buf!7894 b1!97))) ((_ sign_extend 32) (currentByte!14589 b1!97)) ((_ sign_extend 32) (currentBit!14584 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312116 () Bool)

(declare-fun array_inv!7833 (array!19099) Bool)

(assert (=> b!312116 (= e!224442 (array_inv!7833 (buf!7894 b1!97)))))

(declare-fun b!312117 () Bool)

(assert (=> b!312117 (= e!224445 (array_inv!7833 (buf!7894 b2!97)))))

(assert (= (and start!69424 res!255665) b!312113))

(assert (= (and b!312113 res!255663) b!312114))

(assert (= (and b!312114 res!255664) b!312115))

(assert (= (and b!312115 res!255662) b!312112))

(assert (= start!69424 b!312116))

(assert (= start!69424 b!312117))

(declare-fun m!449831 () Bool)

(assert (=> start!69424 m!449831))

(declare-fun m!449833 () Bool)

(assert (=> start!69424 m!449833))

(declare-fun m!449835 () Bool)

(assert (=> b!312115 m!449835))

(declare-fun m!449837 () Bool)

(assert (=> b!312117 m!449837))

(declare-fun m!449839 () Bool)

(assert (=> b!312116 m!449839))

(declare-fun m!449841 () Bool)

(assert (=> b!312114 m!449841))

(declare-fun m!449843 () Bool)

(assert (=> b!312114 m!449843))

(declare-fun m!449845 () Bool)

(assert (=> b!312113 m!449845))

(push 1)

(assert (not start!69424))

(assert (not b!312115))

(assert (not b!312113))

(assert (not b!312116))

(assert (not b!312114))

(assert (not b!312117))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103638 () Bool)

(assert (=> d!103638 (= (array_inv!7833 (buf!7894 b2!97)) (bvsge (size!8281 (buf!7894 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!312117 d!103638))

(declare-fun d!103640 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103640 (= (inv!12 b1!97) (invariant!0 (currentBit!14584 b1!97) (currentByte!14589 b1!97) (size!8281 (buf!7894 b1!97))))))

(declare-fun bs!26816 () Bool)

(assert (= bs!26816 d!103640))

(declare-fun m!449885 () Bool)

(assert (=> bs!26816 m!449885))

(assert (=> start!69424 d!103640))

(declare-fun d!103642 () Bool)

(assert (=> d!103642 (= (inv!12 b2!97) (invariant!0 (currentBit!14584 b2!97) (currentByte!14589 b2!97) (size!8281 (buf!7894 b2!97))))))

(declare-fun bs!26817 () Bool)

(assert (= bs!26817 d!103642))

(declare-fun m!449887 () Bool)

(assert (=> bs!26817 m!449887))

(assert (=> start!69424 d!103642))

(declare-fun d!103644 () Bool)

(assert (=> d!103644 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8281 (buf!7894 b1!97))) ((_ sign_extend 32) (currentByte!14589 b1!97)) ((_ sign_extend 32) (currentBit!14584 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8281 (buf!7894 b1!97))) ((_ sign_extend 32) (currentByte!14589 b1!97)) ((_ sign_extend 32) (currentBit!14584 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26818 () Bool)

(assert (= bs!26818 d!103644))

(assert (=> bs!26818 m!449835))

(assert (=> b!312113 d!103644))

(declare-fun d!103646 () Bool)

(declare-fun e!224483 () Bool)

(assert (=> d!103646 e!224483))

(declare-fun res!255702 () Bool)

(assert (=> d!103646 (=> (not res!255702) (not e!224483))))

(declare-fun lt!441757 () (_ BitVec 64))

(declare-fun lt!441756 () (_ BitVec 64))

(declare-fun lt!441761 () (_ BitVec 64))

(assert (=> d!103646 (= res!255702 (= lt!441756 (bvsub lt!441757 lt!441761)))))

(assert (=> d!103646 (or (= (bvand lt!441757 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441761 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441757 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441757 lt!441761) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103646 (= lt!441761 (remainingBits!0 ((_ sign_extend 32) (size!8281 (buf!7894 b2!97))) ((_ sign_extend 32) (currentByte!14589 b2!97)) ((_ sign_extend 32) (currentBit!14584 b2!97))))))

(declare-fun lt!441758 () (_ BitVec 64))

(declare-fun lt!441760 () (_ BitVec 64))

(assert (=> d!103646 (= lt!441757 (bvmul lt!441758 lt!441760))))

(assert (=> d!103646 (or (= lt!441758 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441760 (bvsdiv (bvmul lt!441758 lt!441760) lt!441758)))))

(assert (=> d!103646 (= lt!441760 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103646 (= lt!441758 ((_ sign_extend 32) (size!8281 (buf!7894 b2!97))))))

(assert (=> d!103646 (= lt!441756 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14589 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14584 b2!97))))))

(assert (=> d!103646 (invariant!0 (currentBit!14584 b2!97) (currentByte!14589 b2!97) (size!8281 (buf!7894 b2!97)))))

(assert (=> d!103646 (= (bitIndex!0 (size!8281 (buf!7894 b2!97)) (currentByte!14589 b2!97) (currentBit!14584 b2!97)) lt!441756)))

(declare-fun b!312166 () Bool)

(declare-fun res!255703 () Bool)

(assert (=> b!312166 (=> (not res!255703) (not e!224483))))

(assert (=> b!312166 (= res!255703 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441756))))

(declare-fun b!312167 () Bool)

(declare-fun lt!441759 () (_ BitVec 64))

(assert (=> b!312167 (= e!224483 (bvsle lt!441756 (bvmul lt!441759 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312167 (or (= lt!441759 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441759 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441759)))))

(assert (=> b!312167 (= lt!441759 ((_ sign_extend 32) (size!8281 (buf!7894 b2!97))))))

(assert (= (and d!103646 res!255702) b!312166))

(assert (= (and b!312166 res!255703) b!312167))

(declare-fun m!449889 () Bool)

(assert (=> d!103646 m!449889))

(assert (=> d!103646 m!449887))

(assert (=> b!312114 d!103646))

(declare-fun d!103648 () Bool)

(declare-fun e!224484 () Bool)

(assert (=> d!103648 e!224484))

(declare-fun res!255704 () Bool)

(assert (=> d!103648 (=> (not res!255704) (not e!224484))))

(declare-fun lt!441767 () (_ BitVec 64))

(declare-fun lt!441763 () (_ BitVec 64))

(declare-fun lt!441762 () (_ BitVec 64))

(assert (=> d!103648 (= res!255704 (= lt!441762 (bvsub lt!441763 lt!441767)))))

(assert (=> d!103648 (or (= (bvand lt!441763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441767 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441763 lt!441767) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103648 (= lt!441767 (remainingBits!0 ((_ sign_extend 32) (size!8281 (buf!7894 b1!97))) ((_ sign_extend 32) (currentByte!14589 b1!97)) ((_ sign_extend 32) (currentBit!14584 b1!97))))))

(declare-fun lt!441764 () (_ BitVec 64))

(declare-fun lt!441766 () (_ BitVec 64))

(assert (=> d!103648 (= lt!441763 (bvmul lt!441764 lt!441766))))

(assert (=> d!103648 (or (= lt!441764 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441766 (bvsdiv (bvmul lt!441764 lt!441766) lt!441764)))))

(assert (=> d!103648 (= lt!441766 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103648 (= lt!441764 ((_ sign_extend 32) (size!8281 (buf!7894 b1!97))))))

(assert (=> d!103648 (= lt!441762 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14589 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14584 b1!97))))))

(assert (=> d!103648 (invariant!0 (currentBit!14584 b1!97) (currentByte!14589 b1!97) (size!8281 (buf!7894 b1!97)))))

(assert (=> d!103648 (= (bitIndex!0 (size!8281 (buf!7894 b1!97)) (currentByte!14589 b1!97) (currentBit!14584 b1!97)) lt!441762)))

(declare-fun b!312168 () Bool)

(declare-fun res!255705 () Bool)

(assert (=> b!312168 (=> (not res!255705) (not e!224484))))

(assert (=> b!312168 (= res!255705 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441762))))

(declare-fun b!312169 () Bool)

(declare-fun lt!441765 () (_ BitVec 64))

(assert (=> b!312169 (= e!224484 (bvsle lt!441762 (bvmul lt!441765 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312169 (or (= lt!441765 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441765 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441765)))))

(assert (=> b!312169 (= lt!441765 ((_ sign_extend 32) (size!8281 (buf!7894 b1!97))))))

(assert (= (and d!103648 res!255704) b!312168))

(assert (= (and b!312168 res!255705) b!312169))

(assert (=> d!103648 m!449835))

(assert (=> d!103648 m!449885))

(assert (=> b!312114 d!103648))

(declare-fun d!103650 () Bool)

(assert (=> d!103650 (= (remainingBits!0 ((_ sign_extend 32) (size!8281 (buf!7894 b1!97))) ((_ sign_extend 32) (currentByte!14589 b1!97)) ((_ sign_extend 32) (currentBit!14584 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8281 (buf!7894 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14589 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14584 b1!97)))))))

(assert (=> b!312115 d!103650))

(declare-fun d!103652 () Bool)

(assert (=> d!103652 (= (array_inv!7833 (buf!7894 b1!97)) (bvsge (size!8281 (buf!7894 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!312116 d!103652))

(push 1)

(assert (not d!103646))

(assert (not d!103648))

(assert (not d!103642))

(assert (not d!103644))

(assert (not d!103640))

(check-sat)

(pop 1)

(push 1)

(check-sat)

