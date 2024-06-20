; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69428 () Bool)

(assert start!69428)

(declare-fun b!312148 () Bool)

(declare-fun res!255688 () Bool)

(declare-fun e!224475 () Bool)

(assert (=> b!312148 (=> (not res!255688) (not e!224475))))

(declare-datatypes ((array!19103 0))(
  ( (array!19104 (arr!9363 (Array (_ BitVec 32) (_ BitVec 8))) (size!8283 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13670 0))(
  ( (BitStream!13671 (buf!7896 array!19103) (currentByte!14591 (_ BitVec 32)) (currentBit!14586 (_ BitVec 32))) )
))
(declare-fun b1!97 () BitStream!13670)

(declare-fun b1ValidateOffsetBits!10 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!312148 (= res!255688 (validate_offset_bits!1 ((_ sign_extend 32) (size!8283 (buf!7896 b1!97))) ((_ sign_extend 32) (currentByte!14591 b1!97)) ((_ sign_extend 32) (currentBit!14586 b1!97)) b1ValidateOffsetBits!10))))

(declare-fun b!312149 () Bool)

(declare-fun e!224472 () Bool)

(declare-fun b2!97 () BitStream!13670)

(declare-fun array_inv!7835 (array!19103) Bool)

(assert (=> b!312149 (= e!224472 (array_inv!7835 (buf!7896 b2!97)))))

(declare-fun b!312150 () Bool)

(declare-fun res!255689 () Bool)

(assert (=> b!312150 (=> (not res!255689) (not e!224475))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!312150 (= res!255689 (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8283 (buf!7896 b1!97))) ((_ sign_extend 32) (currentByte!14591 b1!97)) ((_ sign_extend 32) (currentBit!14586 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun b!312151 () Bool)

(declare-fun e!224473 () Bool)

(assert (=> b!312151 (= e!224473 (array_inv!7835 (buf!7896 b1!97)))))

(declare-fun b!312152 () Bool)

(declare-fun res!255687 () Bool)

(assert (=> b!312152 (=> (not res!255687) (not e!224475))))

(declare-fun advancedAtMostBits!9 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!312152 (= res!255687 (bvsle (bitIndex!0 (size!8283 (buf!7896 b2!97)) (currentByte!14591 b2!97) (currentBit!14586 b2!97)) (bvadd (bitIndex!0 (size!8283 (buf!7896 b1!97)) (currentByte!14591 b1!97) (currentBit!14586 b1!97)) advancedAtMostBits!9)))))

(declare-fun lt!441719 () (_ BitVec 64))

(declare-fun b!312153 () Bool)

(assert (=> b!312153 (= e!224475 (and (bvsge (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!8283 (buf!7896 b1!97)))) lt!441719) b1ValidateOffsetBits!10) (bvsgt (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14591 b2!97))) ((_ sign_extend 32) (currentBit!14586 b2!97))) (bvadd lt!441719 advancedAtMostBits!9))))))

(assert (=> b!312153 (= lt!441719 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!14591 b1!97))) ((_ sign_extend 32) (currentBit!14586 b1!97))))))

(declare-fun res!255686 () Bool)

(assert (=> start!69428 (=> (not res!255686) (not e!224475))))

(assert (=> start!69428 (= res!255686 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 advancedAtMostBits!9) (bvsle advancedAtMostBits!9 b1ValidateOffsetBits!10) (= (size!8283 (buf!7896 b1!97)) (size!8283 (buf!7896 b2!97)))))))

(assert (=> start!69428 e!224475))

(assert (=> start!69428 true))

(declare-fun inv!12 (BitStream!13670) Bool)

(assert (=> start!69428 (and (inv!12 b1!97) e!224473)))

(assert (=> start!69428 (and (inv!12 b2!97) e!224472)))

(assert (= (and start!69428 res!255686) b!312148))

(assert (= (and b!312148 res!255688) b!312152))

(assert (= (and b!312152 res!255687) b!312150))

(assert (= (and b!312150 res!255689) b!312153))

(assert (= start!69428 b!312151))

(assert (= start!69428 b!312149))

(declare-fun m!449863 () Bool)

(assert (=> b!312148 m!449863))

(declare-fun m!449865 () Bool)

(assert (=> b!312152 m!449865))

(declare-fun m!449867 () Bool)

(assert (=> b!312152 m!449867))

(declare-fun m!449869 () Bool)

(assert (=> b!312149 m!449869))

(declare-fun m!449871 () Bool)

(assert (=> b!312151 m!449871))

(declare-fun m!449873 () Bool)

(assert (=> start!69428 m!449873))

(declare-fun m!449875 () Bool)

(assert (=> start!69428 m!449875))

(declare-fun m!449877 () Bool)

(assert (=> b!312150 m!449877))

(push 1)

(assert (not b!312152))

(assert (not b!312149))

(assert (not b!312148))

(assert (not b!312151))

(assert (not b!312150))

(assert (not start!69428))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!103654 () Bool)

(assert (=> d!103654 (= (remainingBits!0 ((_ sign_extend 32) (size!8283 (buf!7896 b1!97))) ((_ sign_extend 32) (currentByte!14591 b1!97)) ((_ sign_extend 32) (currentBit!14586 b1!97))) (bvsub (bvmul ((_ sign_extend 32) (size!8283 (buf!7896 b1!97))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!14591 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14586 b1!97)))))))

(assert (=> b!312150 d!103654))

(declare-fun d!103656 () Bool)

(assert (=> d!103656 (= (array_inv!7835 (buf!7896 b2!97)) (bvsge (size!8283 (buf!7896 b2!97)) #b00000000000000000000000000000000))))

(assert (=> b!312149 d!103656))

(declare-fun d!103658 () Bool)

(assert (=> d!103658 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!8283 (buf!7896 b1!97))) ((_ sign_extend 32) (currentByte!14591 b1!97)) ((_ sign_extend 32) (currentBit!14586 b1!97)) b1ValidateOffsetBits!10) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!8283 (buf!7896 b1!97))) ((_ sign_extend 32) (currentByte!14591 b1!97)) ((_ sign_extend 32) (currentBit!14586 b1!97))) b1ValidateOffsetBits!10))))

(declare-fun bs!26819 () Bool)

(assert (= bs!26819 d!103658))

(assert (=> bs!26819 m!449877))

(assert (=> b!312148 d!103658))

(declare-fun d!103660 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!103660 (= (inv!12 b1!97) (invariant!0 (currentBit!14586 b1!97) (currentByte!14591 b1!97) (size!8283 (buf!7896 b1!97))))))

(declare-fun bs!26820 () Bool)

(assert (= bs!26820 d!103660))

(declare-fun m!449891 () Bool)

(assert (=> bs!26820 m!449891))

(assert (=> start!69428 d!103660))

(declare-fun d!103662 () Bool)

(assert (=> d!103662 (= (inv!12 b2!97) (invariant!0 (currentBit!14586 b2!97) (currentByte!14591 b2!97) (size!8283 (buf!7896 b2!97))))))

(declare-fun bs!26821 () Bool)

(assert (= bs!26821 d!103662))

(declare-fun m!449893 () Bool)

(assert (=> bs!26821 m!449893))

(assert (=> start!69428 d!103662))

(declare-fun d!103664 () Bool)

(declare-fun e!224487 () Bool)

(assert (=> d!103664 e!224487))

(declare-fun res!255711 () Bool)

(assert (=> d!103664 (=> (not res!255711) (not e!224487))))

(declare-fun lt!441781 () (_ BitVec 64))

(declare-fun lt!441783 () (_ BitVec 64))

(declare-fun lt!441782 () (_ BitVec 64))

(assert (=> d!103664 (= res!255711 (= lt!441782 (bvsub lt!441783 lt!441781)))))

(assert (=> d!103664 (or (= (bvand lt!441783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441781 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441783 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441783 lt!441781) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103664 (= lt!441781 (remainingBits!0 ((_ sign_extend 32) (size!8283 (buf!7896 b2!97))) ((_ sign_extend 32) (currentByte!14591 b2!97)) ((_ sign_extend 32) (currentBit!14586 b2!97))))))

(declare-fun lt!441784 () (_ BitVec 64))

(declare-fun lt!441780 () (_ BitVec 64))

(assert (=> d!103664 (= lt!441783 (bvmul lt!441784 lt!441780))))

(assert (=> d!103664 (or (= lt!441784 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441780 (bvsdiv (bvmul lt!441784 lt!441780) lt!441784)))))

(assert (=> d!103664 (= lt!441780 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103664 (= lt!441784 ((_ sign_extend 32) (size!8283 (buf!7896 b2!97))))))

(assert (=> d!103664 (= lt!441782 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14591 b2!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14586 b2!97))))))

(assert (=> d!103664 (invariant!0 (currentBit!14586 b2!97) (currentByte!14591 b2!97) (size!8283 (buf!7896 b2!97)))))

(assert (=> d!103664 (= (bitIndex!0 (size!8283 (buf!7896 b2!97)) (currentByte!14591 b2!97) (currentBit!14586 b2!97)) lt!441782)))

(declare-fun b!312174 () Bool)

(declare-fun res!255710 () Bool)

(assert (=> b!312174 (=> (not res!255710) (not e!224487))))

(assert (=> b!312174 (= res!255710 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441782))))

(declare-fun b!312175 () Bool)

(declare-fun lt!441785 () (_ BitVec 64))

(assert (=> b!312175 (= e!224487 (bvsle lt!441782 (bvmul lt!441785 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312175 (or (= lt!441785 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441785 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441785)))))

(assert (=> b!312175 (= lt!441785 ((_ sign_extend 32) (size!8283 (buf!7896 b2!97))))))

(assert (= (and d!103664 res!255711) b!312174))

(assert (= (and b!312174 res!255710) b!312175))

(declare-fun m!449895 () Bool)

(assert (=> d!103664 m!449895))

(assert (=> d!103664 m!449893))

(assert (=> b!312152 d!103664))

(declare-fun d!103666 () Bool)

(declare-fun e!224488 () Bool)

(assert (=> d!103666 e!224488))

(declare-fun res!255713 () Bool)

(assert (=> d!103666 (=> (not res!255713) (not e!224488))))

(declare-fun lt!441789 () (_ BitVec 64))

(declare-fun lt!441788 () (_ BitVec 64))

(declare-fun lt!441787 () (_ BitVec 64))

(assert (=> d!103666 (= res!255713 (= lt!441788 (bvsub lt!441789 lt!441787)))))

(assert (=> d!103666 (or (= (bvand lt!441789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!441787 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!441789 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!441789 lt!441787) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!103666 (= lt!441787 (remainingBits!0 ((_ sign_extend 32) (size!8283 (buf!7896 b1!97))) ((_ sign_extend 32) (currentByte!14591 b1!97)) ((_ sign_extend 32) (currentBit!14586 b1!97))))))

(declare-fun lt!441790 () (_ BitVec 64))

(declare-fun lt!441786 () (_ BitVec 64))

(assert (=> d!103666 (= lt!441789 (bvmul lt!441790 lt!441786))))

(assert (=> d!103666 (or (= lt!441790 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!441786 (bvsdiv (bvmul lt!441790 lt!441786) lt!441790)))))

(assert (=> d!103666 (= lt!441786 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!103666 (= lt!441790 ((_ sign_extend 32) (size!8283 (buf!7896 b1!97))))))

(assert (=> d!103666 (= lt!441788 (bvadd (bvmul ((_ sign_extend 32) (currentByte!14591 b1!97)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!14586 b1!97))))))

(assert (=> d!103666 (invariant!0 (currentBit!14586 b1!97) (currentByte!14591 b1!97) (size!8283 (buf!7896 b1!97)))))

(assert (=> d!103666 (= (bitIndex!0 (size!8283 (buf!7896 b1!97)) (currentByte!14591 b1!97) (currentBit!14586 b1!97)) lt!441788)))

(declare-fun b!312176 () Bool)

(declare-fun res!255712 () Bool)

(assert (=> b!312176 (=> (not res!255712) (not e!224488))))

(assert (=> b!312176 (= res!255712 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!441788))))

(declare-fun b!312177 () Bool)

(declare-fun lt!441791 () (_ BitVec 64))

(assert (=> b!312177 (= e!224488 (bvsle lt!441788 (bvmul lt!441791 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!312177 (or (= lt!441791 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!441791 #b0000000000000000000000000000000000000000000000000000000000001000) lt!441791)))))

(assert (=> b!312177 (= lt!441791 ((_ sign_extend 32) (size!8283 (buf!7896 b1!97))))))

(assert (= (and d!103666 res!255713) b!312176))

(assert (= (and b!312176 res!255712) b!312177))

(assert (=> d!103666 m!449877))

(assert (=> d!103666 m!449891))

(assert (=> b!312152 d!103666))

(declare-fun d!103668 () Bool)

(assert (=> d!103668 (= (array_inv!7835 (buf!7896 b1!97)) (bvsge (size!8283 (buf!7896 b1!97)) #b00000000000000000000000000000000))))

(assert (=> b!312151 d!103668))

(push 1)

(assert (not d!103662))

(assert (not d!103664))

(assert (not d!103666))

(assert (not d!103658))

(assert (not d!103660))

(check-sat)

(pop 1)

(push 1)

(check-sat)

