; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16516 () Bool)

(assert start!16516)

(declare-fun b!82140 () Bool)

(declare-fun e!54184 () Bool)

(declare-datatypes ((array!3686 0))(
  ( (array!3687 (arr!2325 (Array (_ BitVec 32) (_ BitVec 8))) (size!1688 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2938 0))(
  ( (BitStream!2939 (buf!2078 array!3686) (currentByte!4058 (_ BitVec 32)) (currentBit!4053 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!2938)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!82140 (= e!54184 (not (invariant!0 (currentBit!4053 b1!98) (currentByte!4058 b1!98) (size!1688 (buf!2078 b1!98)))))))

(declare-fun lt!130634 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82140 (= (remainingBits!0 ((_ sign_extend 32) (size!1688 (buf!2078 b1!98))) ((_ sign_extend 32) (currentByte!4058 b1!98)) ((_ sign_extend 32) (currentBit!4053 b1!98))) (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1688 (buf!2078 b1!98)))) lt!130634))))

(declare-datatypes ((Unit!5485 0))(
  ( (Unit!5486) )
))
(declare-fun lt!130635 () Unit!5485)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2938) Unit!5485)

(assert (=> b!82140 (= lt!130635 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82141 () Bool)

(declare-fun e!54186 () Bool)

(assert (=> b!82141 (= e!54186 e!54184)))

(declare-fun res!67707 () Bool)

(assert (=> b!82141 (=> (not res!67707) (not e!54184))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b2!98 () BitStream!2938)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82141 (= res!67707 (= (bvadd lt!130634 b1b2Diff!1) (bitIndex!0 (size!1688 (buf!2078 b2!98)) (currentByte!4058 b2!98) (currentBit!4053 b2!98))))))

(assert (=> b!82141 (= lt!130634 (bitIndex!0 (size!1688 (buf!2078 b1!98)) (currentByte!4058 b1!98) (currentBit!4053 b1!98)))))

(declare-fun b!82142 () Bool)

(declare-fun res!67708 () Bool)

(assert (=> b!82142 (=> (not res!67708) (not e!54186))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82142 (= res!67708 (validate_offset_bits!1 ((_ sign_extend 32) (size!1688 (buf!2078 b1!98))) ((_ sign_extend 32) (currentByte!4058 b1!98)) ((_ sign_extend 32) (currentBit!4053 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82143 () Bool)

(declare-fun e!54185 () Bool)

(declare-fun array_inv!1534 (array!3686) Bool)

(assert (=> b!82143 (= e!54185 (array_inv!1534 (buf!2078 b1!98)))))

(declare-fun b!82144 () Bool)

(declare-fun e!54182 () Bool)

(assert (=> b!82144 (= e!54182 (array_inv!1534 (buf!2078 b2!98)))))

(declare-fun res!67706 () Bool)

(assert (=> start!16516 (=> (not res!67706) (not e!54186))))

(assert (=> start!16516 (= res!67706 (and (= (size!1688 (buf!2078 b1!98)) (size!1688 (buf!2078 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16516 e!54186))

(declare-fun inv!12 (BitStream!2938) Bool)

(assert (=> start!16516 (and (inv!12 b1!98) e!54185)))

(assert (=> start!16516 (and (inv!12 b2!98) e!54182)))

(assert (=> start!16516 true))

(assert (= (and start!16516 res!67706) b!82142))

(assert (= (and b!82142 res!67708) b!82141))

(assert (= (and b!82141 res!67707) b!82140))

(assert (= start!16516 b!82143))

(assert (= start!16516 b!82144))

(declare-fun m!128565 () Bool)

(assert (=> start!16516 m!128565))

(declare-fun m!128567 () Bool)

(assert (=> start!16516 m!128567))

(declare-fun m!128569 () Bool)

(assert (=> b!82140 m!128569))

(declare-fun m!128571 () Bool)

(assert (=> b!82140 m!128571))

(declare-fun m!128573 () Bool)

(assert (=> b!82140 m!128573))

(declare-fun m!128575 () Bool)

(assert (=> b!82141 m!128575))

(declare-fun m!128577 () Bool)

(assert (=> b!82141 m!128577))

(declare-fun m!128579 () Bool)

(assert (=> b!82143 m!128579))

(declare-fun m!128581 () Bool)

(assert (=> b!82142 m!128581))

(declare-fun m!128583 () Bool)

(assert (=> b!82144 m!128583))

(push 1)

(assert (not b!82144))

(assert (not b!82141))

(assert (not b!82143))

(assert (not start!16516))

(assert (not b!82140))

(assert (not b!82142))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!25884 () Bool)

(assert (=> d!25884 (= (array_inv!1534 (buf!2078 b2!98)) (bvsge (size!1688 (buf!2078 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82144 d!25884))

(declare-fun d!25890 () Bool)

(assert (=> d!25890 (= (inv!12 b1!98) (invariant!0 (currentBit!4053 b1!98) (currentByte!4058 b1!98) (size!1688 (buf!2078 b1!98))))))

(declare-fun bs!6343 () Bool)

(assert (= bs!6343 d!25890))

(assert (=> bs!6343 m!128569))

(assert (=> start!16516 d!25890))

(declare-fun d!25900 () Bool)

(assert (=> d!25900 (= (inv!12 b2!98) (invariant!0 (currentBit!4053 b2!98) (currentByte!4058 b2!98) (size!1688 (buf!2078 b2!98))))))

(declare-fun bs!6344 () Bool)

(assert (= bs!6344 d!25900))

(declare-fun m!128629 () Bool)

(assert (=> bs!6344 m!128629))

(assert (=> start!16516 d!25900))

(declare-fun d!25902 () Bool)

(assert (=> d!25902 (= (invariant!0 (currentBit!4053 b1!98) (currentByte!4058 b1!98) (size!1688 (buf!2078 b1!98))) (and (bvsge (currentBit!4053 b1!98) #b00000000000000000000000000000000) (bvslt (currentBit!4053 b1!98) #b00000000000000000000000000001000) (bvsge (currentByte!4058 b1!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!4058 b1!98) (size!1688 (buf!2078 b1!98))) (and (= (currentBit!4053 b1!98) #b00000000000000000000000000000000) (= (currentByte!4058 b1!98) (size!1688 (buf!2078 b1!98)))))))))

(assert (=> b!82140 d!25902))

(declare-fun d!25906 () Bool)

(assert (=> d!25906 (= (remainingBits!0 ((_ sign_extend 32) (size!1688 (buf!2078 b1!98))) ((_ sign_extend 32) (currentByte!4058 b1!98)) ((_ sign_extend 32) (currentBit!4053 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1688 (buf!2078 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4058 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4053 b1!98)))))))

(assert (=> b!82140 d!25906))

(declare-fun d!25910 () Bool)

(declare-fun lt!130710 () (_ BitVec 64))

(declare-fun lt!130712 () (_ BitVec 64))

(assert (=> d!25910 (= (remainingBits!0 ((_ sign_extend 32) (size!1688 (buf!2078 b1!98))) ((_ sign_extend 32) (currentByte!4058 b1!98)) ((_ sign_extend 32) (currentBit!4053 b1!98))) (bvsub lt!130710 lt!130712))))

(assert (=> d!25910 (or (= (bvand lt!130710 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130712 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130710 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130710 lt!130712) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25910 (= lt!130712 (bitIndex!0 (size!1688 (buf!2078 b1!98)) (currentByte!4058 b1!98) (currentBit!4053 b1!98)))))

(declare-fun lt!130711 () (_ BitVec 64))

(declare-fun lt!130713 () (_ BitVec 64))

(assert (=> d!25910 (= lt!130710 (bvmul lt!130711 lt!130713))))

(assert (=> d!25910 (or (= lt!130711 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130713 (bvsdiv (bvmul lt!130711 lt!130713) lt!130711)))))

(assert (=> d!25910 (= lt!130713 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25910 (= lt!130711 ((_ sign_extend 32) (size!1688 (buf!2078 b1!98))))))

(declare-fun lt!130709 () Unit!5485)

(declare-fun choose!23 (BitStream!2938) Unit!5485)

(assert (=> d!25910 (= lt!130709 (choose!23 b1!98))))

(assert (=> d!25910 (= (remainingBitsBitIndexLemma!0 b1!98) lt!130709)))

(declare-fun bs!6346 () Bool)

(assert (= bs!6346 d!25910))

(assert (=> bs!6346 m!128571))

(assert (=> bs!6346 m!128577))

(declare-fun m!128633 () Bool)

(assert (=> bs!6346 m!128633))

(assert (=> b!82140 d!25910))

(declare-fun d!25914 () Bool)

(declare-fun e!54233 () Bool)

(assert (=> d!25914 e!54233))

(declare-fun res!67747 () Bool)

(assert (=> d!25914 (=> (not res!67747) (not e!54233))))

(declare-fun lt!130756 () (_ BitVec 64))

(declare-fun lt!130754 () (_ BitVec 64))

(declare-fun lt!130755 () (_ BitVec 64))

(assert (=> d!25914 (= res!67747 (= lt!130755 (bvsub lt!130756 lt!130754)))))

(assert (=> d!25914 (or (= (bvand lt!130756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130754 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130756 lt!130754) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25914 (= lt!130754 (remainingBits!0 ((_ sign_extend 32) (size!1688 (buf!2078 b2!98))) ((_ sign_extend 32) (currentByte!4058 b2!98)) ((_ sign_extend 32) (currentBit!4053 b2!98))))))

(declare-fun lt!130757 () (_ BitVec 64))

(declare-fun lt!130753 () (_ BitVec 64))

(assert (=> d!25914 (= lt!130756 (bvmul lt!130757 lt!130753))))

(assert (=> d!25914 (or (= lt!130757 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130753 (bvsdiv (bvmul lt!130757 lt!130753) lt!130757)))))

(assert (=> d!25914 (= lt!130753 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25914 (= lt!130757 ((_ sign_extend 32) (size!1688 (buf!2078 b2!98))))))

(assert (=> d!25914 (= lt!130755 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4058 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4053 b2!98))))))

(assert (=> d!25914 (invariant!0 (currentBit!4053 b2!98) (currentByte!4058 b2!98) (size!1688 (buf!2078 b2!98)))))

(assert (=> d!25914 (= (bitIndex!0 (size!1688 (buf!2078 b2!98)) (currentByte!4058 b2!98) (currentBit!4053 b2!98)) lt!130755)))

(declare-fun b!82198 () Bool)

(declare-fun res!67748 () Bool)

(assert (=> b!82198 (=> (not res!67748) (not e!54233))))

(assert (=> b!82198 (= res!67748 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130755))))

(declare-fun b!82199 () Bool)

(declare-fun lt!130758 () (_ BitVec 64))

(assert (=> b!82199 (= e!54233 (bvsle lt!130755 (bvmul lt!130758 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82199 (or (= lt!130758 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130758 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130758)))))

(assert (=> b!82199 (= lt!130758 ((_ sign_extend 32) (size!1688 (buf!2078 b2!98))))))

(assert (= (and d!25914 res!67747) b!82198))

(assert (= (and b!82198 res!67748) b!82199))

(declare-fun m!128641 () Bool)

(assert (=> d!25914 m!128641))

(assert (=> d!25914 m!128629))

(assert (=> b!82141 d!25914))

(declare-fun d!25926 () Bool)

(declare-fun e!54234 () Bool)

(assert (=> d!25926 e!54234))

(declare-fun res!67749 () Bool)

(assert (=> d!25926 (=> (not res!67749) (not e!54234))))

(declare-fun lt!130760 () (_ BitVec 64))

(declare-fun lt!130761 () (_ BitVec 64))

(declare-fun lt!130762 () (_ BitVec 64))

(assert (=> d!25926 (= res!67749 (= lt!130761 (bvsub lt!130762 lt!130760)))))

(assert (=> d!25926 (or (= (bvand lt!130762 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!130760 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!130762 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!130762 lt!130760) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!25926 (= lt!130760 (remainingBits!0 ((_ sign_extend 32) (size!1688 (buf!2078 b1!98))) ((_ sign_extend 32) (currentByte!4058 b1!98)) ((_ sign_extend 32) (currentBit!4053 b1!98))))))

(declare-fun lt!130763 () (_ BitVec 64))

(declare-fun lt!130759 () (_ BitVec 64))

(assert (=> d!25926 (= lt!130762 (bvmul lt!130763 lt!130759))))

(assert (=> d!25926 (or (= lt!130763 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!130759 (bvsdiv (bvmul lt!130763 lt!130759) lt!130763)))))

(assert (=> d!25926 (= lt!130759 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!25926 (= lt!130763 ((_ sign_extend 32) (size!1688 (buf!2078 b1!98))))))

(assert (=> d!25926 (= lt!130761 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4058 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4053 b1!98))))))

(assert (=> d!25926 (invariant!0 (currentBit!4053 b1!98) (currentByte!4058 b1!98) (size!1688 (buf!2078 b1!98)))))

(assert (=> d!25926 (= (bitIndex!0 (size!1688 (buf!2078 b1!98)) (currentByte!4058 b1!98) (currentBit!4053 b1!98)) lt!130761)))

(declare-fun b!82200 () Bool)

(declare-fun res!67750 () Bool)

(assert (=> b!82200 (=> (not res!67750) (not e!54234))))

(assert (=> b!82200 (= res!67750 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!130761))))

(declare-fun b!82201 () Bool)

(declare-fun lt!130764 () (_ BitVec 64))

(assert (=> b!82201 (= e!54234 (bvsle lt!130761 (bvmul lt!130764 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82201 (or (= lt!130764 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!130764 #b0000000000000000000000000000000000000000000000000000000000001000) lt!130764)))))

(assert (=> b!82201 (= lt!130764 ((_ sign_extend 32) (size!1688 (buf!2078 b1!98))))))

(assert (= (and d!25926 res!67749) b!82200))

(assert (= (and b!82200 res!67750) b!82201))

(assert (=> d!25926 m!128571))

(assert (=> d!25926 m!128569))

(assert (=> b!82141 d!25926))

(declare-fun d!25928 () Bool)

(assert (=> d!25928 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1688 (buf!2078 b1!98))) ((_ sign_extend 32) (currentByte!4058 b1!98)) ((_ sign_extend 32) (currentBit!4053 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1688 (buf!2078 b1!98))) ((_ sign_extend 32) (currentByte!4058 b1!98)) ((_ sign_extend 32) (currentBit!4053 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6351 () Bool)

(assert (= bs!6351 d!25928))

(assert (=> bs!6351 m!128571))

(assert (=> b!82142 d!25928))

(declare-fun d!25932 () Bool)

(assert (=> d!25932 (= (array_inv!1534 (buf!2078 b1!98)) (bvsge (size!1688 (buf!2078 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82143 d!25932))

(push 1)

(assert (not d!25900))

(assert (not d!25910))

(assert (not d!25890))

(assert (not d!25926))

(assert (not d!25928))

(assert (not d!25914))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

