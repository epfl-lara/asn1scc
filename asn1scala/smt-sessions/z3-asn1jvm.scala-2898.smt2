; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69426 () Bool)

(assert start!69426)

(declare-fun res!255677 () Bool)

(declare-fun e!224460 () Bool)

(assert (=> start!69426 (=> (not res!255677) (not e!224460))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-datatypes ((array!19101 0))(
  ( (array!19102 (arr!9362 (Array (_ BitVec 32) (_ BitVec 8))) (size!8282 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13668 0))(
  ( (BitStream!13669 (buf!7895 array!19101) (currentByte!14590 (_ BitVec 32)) (currentBit!14585 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13668)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun b2!97 () BitStream!13668)

(assert (=> start!69426 (= res!255677 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8282 (buf!7895 b1!97)) (size!8282 (buf!7895 b2!97)))))))

(assert (=> start!69426 e!224460))

(assert (=> start!69426 true))

(declare-fun e!224457 () Bool)

(declare-fun inv!12 (BitStream!13668) Bool)

(assert (=> start!69426 (and (inv!12 b1!97) e!224457)))

(declare-fun e!224458 () Bool)

(assert (=> start!69426 (and (inv!12 b2!97) e!224458)))

(declare-fun b!312130 () Bool)

(declare-fun res!255676 () Bool)

(assert (=> b!312130 (=> (not res!255676) (not e!224460))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312130 (= res!255676 (bvsle (bitIndex!0 (size!8282 (buf!7895 b2!97)) (currentByte!14590 b2!97) (currentBit!14585 b2!97)) (bvadd (bitIndex!0 (size!8282 (buf!7895 b1!97)) (currentByte!14590 b1!97) (currentBit!14585 b1!97)) advancedAtMostBits!9)))))

(declare-fun b!312131 () Bool)

(declare-fun res!255674 () Bool)

(assert (=> b!312131 (=> (not res!255674) (not e!224460))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312131 (= res!255674 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8282 (buf!7895 b1!97))) ((_ sign_extend 32) (currentByte!14590 b1!97)) ((_ sign_extend 32) (currentBit!14585 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312132 () Bool)

(declare-fun res!255675 () Bool)

(assert (=> b!312132 (=> (not res!255675) (not e!224460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312132 (= res!255675 (validate_offset_bits!1 ((_ sign_extend 32) (size!8282 (buf!7895 b1!97))) ((_ sign_extend 32) (currentByte!14590 b1!97)) ((_ sign_extend 32) (currentBit!14585 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312133 () Bool)

(declare-fun array_inv!7834 (array!19101) Bool)

(assert (=> b!312133 (= e!224457 (array_inv!7834 (buf!7895 b1!97)))))

(declare-fun b!312134 () Bool)

(declare-fun lt!441716 () (_ BitVec 64))

(assert (=> b!312134 (= e!224460 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8282 (buf!7895 b1!97)))) lt!441716) b1ValidateOffsetBits!10) (bvsgt (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14590 b2!97))) ((_ sign_extend 32) (currentBit!14585 b2!97))) (bvadd lt!441716 advancedAtMostBits!9))))))

(assert (=> b!312134 (= lt!441716 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14590 b1!97))) ((_ sign_extend 32) (currentBit!14585 b1!97))))))

(declare-fun b!312135 () Bool)

(assert (=> b!312135 (= e!224458 (array_inv!7834 (buf!7895 b2!97)))))

(assert (= (and start!69426 res!255677) b!312132))

(assert (= (and b!312132 res!255675) b!312130))

(assert (= (and b!312130 res!255676) b!312131))

(assert (= (and b!312131 res!255674) b!312134))

(assert (= start!69426 b!312133))

(assert (= start!69426 b!312135))

(declare-fun m!449847 () Bool)

(assert (=> b!312130 m!449847))

(declare-fun m!449849 () Bool)

(assert (=> b!312130 m!449849))

(declare-fun m!449851 () Bool)

(assert (=> b!312132 m!449851))

(declare-fun m!449853 () Bool)

(assert (=> b!312135 m!449853))

(declare-fun m!449855 () Bool)

(assert (=> b!312131 m!449855))

(declare-fun m!449857 () Bool)

(assert (=> start!69426 m!449857))

(declare-fun m!449859 () Bool)

(assert (=> start!69426 m!449859))

(declare-fun m!449861 () Bool)

(assert (=> b!312133 m!449861))

(check-sat (not b!312133) (not b!312132) (not start!69426) (not b!312130) (not b!312135) (not b!312131))
(check-sat)
(get-model)

(declare-fun d!103622 () Bool)

(assert (=> d!103622 (= (array_inv!7834 (buf!7895 b1!97)) (bvsge (size!8282 (buf!7895 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!312133 d!103622))

(declare-fun d!103624 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103624 (= (inv!12 b1!97) (invariant!0 (currentBit!14585 b1!97) (currentByte!14590 b1!97) (size!8282 (buf!7895 b1!97))))))

(declare-fun bs!26813 () Bool)

(assert (= bs!26813 d!103624))

(declare-fun m!449879 () Bool)

(assert (=> bs!26813 m!449879))

(assert (=> start!69426 d!103624))

(declare-fun d!103626 () Bool)

(assert (=> d!103626 (= (inv!12 b2!97) (invariant!0 (currentBit!14585 b2!97) (currentByte!14590 b2!97) (size!8282 (buf!7895 b2!97))))))

(declare-fun bs!26814 () Bool)

(assert (= bs!26814 d!103626))

(declare-fun m!449881 () Bool)

(assert (=> bs!26814 m!449881))

(assert (=> start!69426 d!103626))

(declare-fun d!103628 () Bool)

(assert (=> d!103628 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8282 (buf!7895 b1!97))) ((_ sign_extend 32) (currentByte!14590 b1!97)) ((_ sign_extend 32) (currentBit!14585 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8282 (buf!7895 b1!97))) ((_ sign_extend 32) (currentByte!14590 b1!97)) ((_ sign_extend 32) (currentBit!14585 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26815 () Bool)

(assert (= bs!26815 d!103628))

(assert (=> bs!26815 m!449855))

(assert (=> b!312132 d!103628))

(declare-fun d!103630 () Bool)

(assert (=> d!103630 (= (remainingBits!0 ((_ sign_extend 32) (size!8282 (buf!7895 b1!97))) ((_ sign_extend 32) (currentByte!14590 b1!97)) ((_ sign_extend 32) (currentBit!14585 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8282 (buf!7895 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14590 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14585 b1!97)))))))

(assert (=> b!312131 d!103630))

(declare-fun d!103632 () Bool)

(declare-fun e!224479 () Bool)

(assert (=> d!103632 e!224479))

(declare-fun res!255695 () Bool)

(assert (=> d!103632 (=> (not res!255695) (not e!224479))))

(declare-fun lt!441735 () (_ BitVec 64))

(declare-fun lt!441732 () (_ BitVec 64))

(declare-fun lt!441734 () (_ BitVec 64))

(assert (=> d!103632 (= res!255695 (= lt!441732 (bvsub lt!441734 lt!441735)))))

(assert (=> d!103632 (or (= (bvand lt!441734 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441735 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441734 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441734 lt!441735) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103632 (= lt!441735 (remainingBits!0 ((_ sign_extend 32) (size!8282 (buf!7895 b2!97))) ((_ sign_extend 32) (currentByte!14590 b2!97)) ((_ sign_extend 32) (currentBit!14585 b2!97))))))

(declare-fun lt!441736 () (_ BitVec 64))

(declare-fun lt!441733 () (_ BitVec 64))

(assert (=> d!103632 (= lt!441734 (bvmul lt!441736 lt!441733))))

(assert (=> d!103632 (or (= lt!441736 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441733 (bvsdiv (bvmul lt!441736 lt!441733) lt!441736)))))

(assert (=> d!103632 (= lt!441733 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103632 (= lt!441736 ((_ sign_extend 32) (size!8282 (buf!7895 b2!97))))))

(assert (=> d!103632 (= lt!441732 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14590 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14585 b2!97))))))

(assert (=> d!103632 (invariant!0 (currentBit!14585 b2!97) (currentByte!14590 b2!97) (size!8282 (buf!7895 b2!97)))))

(assert (=> d!103632 (= (bitIndex!0 (size!8282 (buf!7895 b2!97)) (currentByte!14590 b2!97) (currentBit!14585 b2!97)) lt!441732)))

(declare-fun b!312158 () Bool)

(declare-fun res!255694 () Bool)

(assert (=> b!312158 (=> (not res!255694) (not e!224479))))

(assert (=> b!312158 (= res!255694 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441732))))

(declare-fun b!312159 () Bool)

(declare-fun lt!441737 () (_ BitVec 64))

(assert (=> b!312159 (= e!224479 (bvsle lt!441732 (bvmul lt!441737 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312159 (or (= lt!441737 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441737 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441737)))))

(assert (=> b!312159 (= lt!441737 ((_ sign_extend 32) (size!8282 (buf!7895 b2!97))))))

(assert (= (and d!103632 res!255695) b!312158))

(assert (= (and b!312158 res!255694) b!312159))

(declare-fun m!449883 () Bool)

(assert (=> d!103632 m!449883))

(assert (=> d!103632 m!449881))

(assert (=> b!312130 d!103632))

(declare-fun d!103634 () Bool)

(declare-fun e!224480 () Bool)

(assert (=> d!103634 e!224480))

(declare-fun res!255697 () Bool)

(assert (=> d!103634 (=> (not res!255697) (not e!224480))))

(declare-fun lt!441741 () (_ BitVec 64))

(declare-fun lt!441740 () (_ BitVec 64))

(declare-fun lt!441738 () (_ BitVec 64))

(assert (=> d!103634 (= res!255697 (= lt!441738 (bvsub lt!441740 lt!441741)))))

(assert (=> d!103634 (or (= (bvand lt!441740 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441741 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441740 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441740 lt!441741) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103634 (= lt!441741 (remainingBits!0 ((_ sign_extend 32) (size!8282 (buf!7895 b1!97))) ((_ sign_extend 32) (currentByte!14590 b1!97)) ((_ sign_extend 32) (currentBit!14585 b1!97))))))

(declare-fun lt!441742 () (_ BitVec 64))

(declare-fun lt!441739 () (_ BitVec 64))

(assert (=> d!103634 (= lt!441740 (bvmul lt!441742 lt!441739))))

(assert (=> d!103634 (or (= lt!441742 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441739 (bvsdiv (bvmul lt!441742 lt!441739) lt!441742)))))

(assert (=> d!103634 (= lt!441739 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103634 (= lt!441742 ((_ sign_extend 32) (size!8282 (buf!7895 b1!97))))))

(assert (=> d!103634 (= lt!441738 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14590 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14585 b1!97))))))

(assert (=> d!103634 (invariant!0 (currentBit!14585 b1!97) (currentByte!14590 b1!97) (size!8282 (buf!7895 b1!97)))))

(assert (=> d!103634 (= (bitIndex!0 (size!8282 (buf!7895 b1!97)) (currentByte!14590 b1!97) (currentBit!14585 b1!97)) lt!441738)))

(declare-fun b!312160 () Bool)

(declare-fun res!255696 () Bool)

(assert (=> b!312160 (=> (not res!255696) (not e!224480))))

(assert (=> b!312160 (= res!255696 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441738))))

(declare-fun b!312161 () Bool)

(declare-fun lt!441743 () (_ BitVec 64))

(assert (=> b!312161 (= e!224480 (bvsle lt!441738 (bvmul lt!441743 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312161 (or (= lt!441743 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441743 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441743)))))

(assert (=> b!312161 (= lt!441743 ((_ sign_extend 32) (size!8282 (buf!7895 b1!97))))))

(assert (= (and d!103634 res!255697) b!312160))

(assert (= (and b!312160 res!255696) b!312161))

(assert (=> d!103634 m!449855))

(assert (=> d!103634 m!449879))

(assert (=> b!312130 d!103634))

(declare-fun d!103636 () Bool)

(assert (=> d!103636 (= (array_inv!7834 (buf!7895 b2!97)) (bvsge (size!8282 (buf!7895 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!312135 d!103636))

(check-sat (not d!103626) (not d!103624) (not d!103628) (not d!103634) (not d!103632))
(check-sat)
