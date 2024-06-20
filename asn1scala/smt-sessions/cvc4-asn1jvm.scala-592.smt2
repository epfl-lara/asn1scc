; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16976 () Bool)

(assert start!16976)

(declare-fun res!68491 () Bool)

(declare-fun e!55283 () Bool)

(assert (=> start!16976 (=> (not res!68491) (not e!55283))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3807 0))(
  ( (array!3808 (arr!2372 (Array (_ BitVec 32) (_ BitVec 8))) (size!1735 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3032 0))(
  ( (BitStream!3033 (buf!2125 array!3807) (currentByte!4204 (_ BitVec 32)) (currentBit!4199 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3032)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun b1!98 () BitStream!3032)

(assert (=> start!16976 (= res!68491 (and (= (size!1735 (buf!2125 b1!98)) (size!1735 (buf!2125 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16976 e!55283))

(declare-fun e!55281 () Bool)

(declare-fun inv!12 (BitStream!3032) Bool)

(assert (=> start!16976 (and (inv!12 b1!98) e!55281)))

(declare-fun e!55284 () Bool)

(assert (=> start!16976 (and (inv!12 b2!98) e!55284)))

(assert (=> start!16976 true))

(declare-fun b!83234 () Bool)

(declare-fun array_inv!1581 (array!3807) Bool)

(assert (=> b!83234 (= e!55281 (array_inv!1581 (buf!2125 b1!98)))))

(declare-fun b!83235 () Bool)

(assert (=> b!83235 (= e!55284 (array_inv!1581 (buf!2125 b2!98)))))

(declare-fun lt!132650 () (_ BitVec 64))

(declare-fun b!83236 () Bool)

(declare-fun lt!132644 () (_ BitVec 64))

(declare-fun lt!132648 () (_ BitVec 64))

(declare-fun e!55278 () Bool)

(assert (=> b!83236 (= e!55278 (or (not (= lt!132648 (bvsub lt!132650 lt!132644))) (bvsge lt!132648 (bvsub b1ValidateOffsetBits!11 b1b2Diff!1))))))

(declare-fun lt!132651 () (_ BitVec 64))

(assert (=> b!83236 (= lt!132648 (bvsub lt!132650 lt!132651))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83236 (= lt!132648 (remainingBits!0 ((_ sign_extend 32) (size!1735 (buf!2125 b2!98))) ((_ sign_extend 32) (currentByte!4204 b2!98)) ((_ sign_extend 32) (currentBit!4199 b2!98))))))

(assert (=> b!83236 (= lt!132650 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1735 (buf!2125 b2!98)))))))

(declare-datatypes ((Unit!5579 0))(
  ( (Unit!5580) )
))
(declare-fun lt!132646 () Unit!5579)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3032) Unit!5579)

(assert (=> b!83236 (= lt!132646 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!83237 () Bool)

(declare-fun e!55282 () Bool)

(assert (=> b!83237 (= e!55283 e!55282)))

(declare-fun res!68488 () Bool)

(assert (=> b!83237 (=> (not res!68488) (not e!55282))))

(assert (=> b!83237 (= res!68488 (= lt!132644 lt!132651))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83237 (= lt!132651 (bitIndex!0 (size!1735 (buf!2125 b2!98)) (currentByte!4204 b2!98) (currentBit!4199 b2!98)))))

(declare-fun lt!132645 () (_ BitVec 64))

(assert (=> b!83237 (= lt!132644 (bvadd lt!132645 b1b2Diff!1))))

(assert (=> b!83237 (= lt!132645 (bitIndex!0 (size!1735 (buf!2125 b1!98)) (currentByte!4204 b1!98) (currentBit!4199 b1!98)))))

(declare-fun b!83238 () Bool)

(assert (=> b!83238 (= e!55282 (not e!55278))))

(declare-fun res!68489 () Bool)

(assert (=> b!83238 (=> res!68489 e!55278)))

(declare-fun lt!132647 () (_ BitVec 64))

(assert (=> b!83238 (= res!68489 (bvsgt lt!132645 (bvsub lt!132647 b1ValidateOffsetBits!11)))))

(assert (=> b!83238 (= (remainingBits!0 ((_ sign_extend 32) (size!1735 (buf!2125 b1!98))) ((_ sign_extend 32) (currentByte!4204 b1!98)) ((_ sign_extend 32) (currentBit!4199 b1!98))) (bvsub lt!132647 lt!132645))))

(assert (=> b!83238 (= lt!132647 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1735 (buf!2125 b1!98)))))))

(declare-fun lt!132649 () Unit!5579)

(assert (=> b!83238 (= lt!132649 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83239 () Bool)

(declare-fun res!68490 () Bool)

(assert (=> b!83239 (=> (not res!68490) (not e!55283))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83239 (= res!68490 (validate_offset_bits!1 ((_ sign_extend 32) (size!1735 (buf!2125 b1!98))) ((_ sign_extend 32) (currentByte!4204 b1!98)) ((_ sign_extend 32) (currentBit!4199 b1!98)) b1ValidateOffsetBits!11))))

(assert (= (and start!16976 res!68491) b!83239))

(assert (= (and b!83239 res!68490) b!83237))

(assert (= (and b!83237 res!68488) b!83238))

(assert (= (and b!83238 (not res!68489)) b!83236))

(assert (= start!16976 b!83234))

(assert (= start!16976 b!83235))

(declare-fun m!129797 () Bool)

(assert (=> b!83235 m!129797))

(declare-fun m!129799 () Bool)

(assert (=> b!83239 m!129799))

(declare-fun m!129801 () Bool)

(assert (=> b!83237 m!129801))

(declare-fun m!129803 () Bool)

(assert (=> b!83237 m!129803))

(declare-fun m!129805 () Bool)

(assert (=> b!83238 m!129805))

(declare-fun m!129807 () Bool)

(assert (=> b!83238 m!129807))

(declare-fun m!129809 () Bool)

(assert (=> start!16976 m!129809))

(declare-fun m!129811 () Bool)

(assert (=> start!16976 m!129811))

(declare-fun m!129813 () Bool)

(assert (=> b!83234 m!129813))

(declare-fun m!129815 () Bool)

(assert (=> b!83236 m!129815))

(declare-fun m!129817 () Bool)

(assert (=> b!83236 m!129817))

(push 1)

(assert (not start!16976))

(assert (not b!83235))

(assert (not b!83234))

(assert (not b!83237))

(assert (not b!83238))

(assert (not b!83236))

(assert (not b!83239))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26550 () Bool)

(assert (=> d!26550 (= (array_inv!1581 (buf!2125 b1!98)) (bvsge (size!1735 (buf!2125 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83234 d!26550))

(declare-fun d!26552 () Bool)

(assert (=> d!26552 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1735 (buf!2125 b1!98))) ((_ sign_extend 32) (currentByte!4204 b1!98)) ((_ sign_extend 32) (currentBit!4199 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1735 (buf!2125 b1!98))) ((_ sign_extend 32) (currentByte!4204 b1!98)) ((_ sign_extend 32) (currentBit!4199 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6525 () Bool)

(assert (= bs!6525 d!26552))

(assert (=> bs!6525 m!129805))

(assert (=> b!83239 d!26552))

(declare-fun d!26554 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26554 (= (inv!12 b1!98) (invariant!0 (currentBit!4199 b1!98) (currentByte!4204 b1!98) (size!1735 (buf!2125 b1!98))))))

(declare-fun bs!6526 () Bool)

(assert (= bs!6526 d!26554))

(declare-fun m!129827 () Bool)

(assert (=> bs!6526 m!129827))

(assert (=> start!16976 d!26554))

(declare-fun d!26556 () Bool)

(assert (=> d!26556 (= (inv!12 b2!98) (invariant!0 (currentBit!4199 b2!98) (currentByte!4204 b2!98) (size!1735 (buf!2125 b2!98))))))

(declare-fun bs!6527 () Bool)

(assert (= bs!6527 d!26556))

(declare-fun m!129829 () Bool)

(assert (=> bs!6527 m!129829))

(assert (=> start!16976 d!26556))

(declare-fun d!26558 () Bool)

(assert (=> d!26558 (= (remainingBits!0 ((_ sign_extend 32) (size!1735 (buf!2125 b1!98))) ((_ sign_extend 32) (currentByte!4204 b1!98)) ((_ sign_extend 32) (currentBit!4199 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1735 (buf!2125 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4204 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4199 b1!98)))))))

(assert (=> b!83238 d!26558))

(declare-fun d!26560 () Bool)

(declare-fun lt!132707 () (_ BitVec 64))

(declare-fun lt!132706 () (_ BitVec 64))

(assert (=> d!26560 (= (remainingBits!0 ((_ sign_extend 32) (size!1735 (buf!2125 b1!98))) ((_ sign_extend 32) (currentByte!4204 b1!98)) ((_ sign_extend 32) (currentBit!4199 b1!98))) (bvsub lt!132707 lt!132706))))

(assert (=> d!26560 (or (= (bvand lt!132707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132706 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132707 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132707 lt!132706) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26560 (= lt!132706 (bitIndex!0 (size!1735 (buf!2125 b1!98)) (currentByte!4204 b1!98) (currentBit!4199 b1!98)))))

(declare-fun lt!132709 () (_ BitVec 64))

(declare-fun lt!132708 () (_ BitVec 64))

(assert (=> d!26560 (= lt!132707 (bvmul lt!132709 lt!132708))))

(assert (=> d!26560 (or (= lt!132709 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132708 (bvsdiv (bvmul lt!132709 lt!132708) lt!132709)))))

(assert (=> d!26560 (= lt!132708 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26560 (= lt!132709 ((_ sign_extend 32) (size!1735 (buf!2125 b1!98))))))

(declare-fun lt!132710 () Unit!5579)

(declare-fun choose!23 (BitStream!3032) Unit!5579)

(assert (=> d!26560 (= lt!132710 (choose!23 b1!98))))

(assert (=> d!26560 (= (remainingBitsBitIndexLemma!0 b1!98) lt!132710)))

(declare-fun bs!6528 () Bool)

(assert (= bs!6528 d!26560))

(assert (=> bs!6528 m!129805))

(assert (=> bs!6528 m!129803))

(declare-fun m!129831 () Bool)

(assert (=> bs!6528 m!129831))

(assert (=> b!83238 d!26560))

(declare-fun d!26566 () Bool)

(declare-fun e!55291 () Bool)

(assert (=> d!26566 e!55291))

(declare-fun res!68505 () Bool)

(assert (=> d!26566 (=> (not res!68505) (not e!55291))))

(declare-fun lt!132746 () (_ BitVec 64))

(declare-fun lt!132744 () (_ BitVec 64))

(declare-fun lt!132747 () (_ BitVec 64))

(assert (=> d!26566 (= res!68505 (= lt!132746 (bvsub lt!132744 lt!132747)))))

(assert (=> d!26566 (or (= (bvand lt!132744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132747 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132744 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132744 lt!132747) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26566 (= lt!132747 (remainingBits!0 ((_ sign_extend 32) (size!1735 (buf!2125 b2!98))) ((_ sign_extend 32) (currentByte!4204 b2!98)) ((_ sign_extend 32) (currentBit!4199 b2!98))))))

(declare-fun lt!132743 () (_ BitVec 64))

(declare-fun lt!132745 () (_ BitVec 64))

(assert (=> d!26566 (= lt!132744 (bvmul lt!132743 lt!132745))))

(assert (=> d!26566 (or (= lt!132743 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132745 (bvsdiv (bvmul lt!132743 lt!132745) lt!132743)))))

(assert (=> d!26566 (= lt!132745 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26566 (= lt!132743 ((_ sign_extend 32) (size!1735 (buf!2125 b2!98))))))

(assert (=> d!26566 (= lt!132746 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4204 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4199 b2!98))))))

(assert (=> d!26566 (invariant!0 (currentBit!4199 b2!98) (currentByte!4204 b2!98) (size!1735 (buf!2125 b2!98)))))

(assert (=> d!26566 (= (bitIndex!0 (size!1735 (buf!2125 b2!98)) (currentByte!4204 b2!98) (currentBit!4199 b2!98)) lt!132746)))

(declare-fun b!83255 () Bool)

(declare-fun res!68504 () Bool)

(assert (=> b!83255 (=> (not res!68504) (not e!55291))))

(assert (=> b!83255 (= res!68504 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132746))))

(declare-fun b!83256 () Bool)

(declare-fun lt!132748 () (_ BitVec 64))

(assert (=> b!83256 (= e!55291 (bvsle lt!132746 (bvmul lt!132748 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83256 (or (= lt!132748 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132748 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132748)))))

(assert (=> b!83256 (= lt!132748 ((_ sign_extend 32) (size!1735 (buf!2125 b2!98))))))

(assert (= (and d!26566 res!68505) b!83255))

(assert (= (and b!83255 res!68504) b!83256))

(assert (=> d!26566 m!129815))

(assert (=> d!26566 m!129829))

(assert (=> b!83237 d!26566))

(declare-fun d!26580 () Bool)

(declare-fun e!55292 () Bool)

(assert (=> d!26580 e!55292))

(declare-fun res!68507 () Bool)

(assert (=> d!26580 (=> (not res!68507) (not e!55292))))

(declare-fun lt!132752 () (_ BitVec 64))

(declare-fun lt!132753 () (_ BitVec 64))

(declare-fun lt!132750 () (_ BitVec 64))

(assert (=> d!26580 (= res!68507 (= lt!132752 (bvsub lt!132750 lt!132753)))))

(assert (=> d!26580 (or (= (bvand lt!132750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132753 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132750 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132750 lt!132753) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26580 (= lt!132753 (remainingBits!0 ((_ sign_extend 32) (size!1735 (buf!2125 b1!98))) ((_ sign_extend 32) (currentByte!4204 b1!98)) ((_ sign_extend 32) (currentBit!4199 b1!98))))))

(declare-fun lt!132749 () (_ BitVec 64))

(declare-fun lt!132751 () (_ BitVec 64))

(assert (=> d!26580 (= lt!132750 (bvmul lt!132749 lt!132751))))

(assert (=> d!26580 (or (= lt!132749 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132751 (bvsdiv (bvmul lt!132749 lt!132751) lt!132749)))))

(assert (=> d!26580 (= lt!132751 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26580 (= lt!132749 ((_ sign_extend 32) (size!1735 (buf!2125 b1!98))))))

(assert (=> d!26580 (= lt!132752 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4204 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4199 b1!98))))))

(assert (=> d!26580 (invariant!0 (currentBit!4199 b1!98) (currentByte!4204 b1!98) (size!1735 (buf!2125 b1!98)))))

(assert (=> d!26580 (= (bitIndex!0 (size!1735 (buf!2125 b1!98)) (currentByte!4204 b1!98) (currentBit!4199 b1!98)) lt!132752)))

(declare-fun b!83257 () Bool)

(declare-fun res!68506 () Bool)

(assert (=> b!83257 (=> (not res!68506) (not e!55292))))

(assert (=> b!83257 (= res!68506 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132752))))

(declare-fun b!83258 () Bool)

(declare-fun lt!132754 () (_ BitVec 64))

(assert (=> b!83258 (= e!55292 (bvsle lt!132752 (bvmul lt!132754 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83258 (or (= lt!132754 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132754 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132754)))))

(assert (=> b!83258 (= lt!132754 ((_ sign_extend 32) (size!1735 (buf!2125 b1!98))))))

(assert (= (and d!26580 res!68507) b!83257))

(assert (= (and b!83257 res!68506) b!83258))

(assert (=> d!26580 m!129805))

(assert (=> d!26580 m!129827))

(assert (=> b!83237 d!26580))

(declare-fun d!26582 () Bool)

(assert (=> d!26582 (= (remainingBits!0 ((_ sign_extend 32) (size!1735 (buf!2125 b2!98))) ((_ sign_extend 32) (currentByte!4204 b2!98)) ((_ sign_extend 32) (currentBit!4199 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1735 (buf!2125 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4204 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4199 b2!98)))))))

(assert (=> b!83236 d!26582))

(declare-fun d!26584 () Bool)

(declare-fun lt!132756 () (_ BitVec 64))

(declare-fun lt!132755 () (_ BitVec 64))

(assert (=> d!26584 (= (remainingBits!0 ((_ sign_extend 32) (size!1735 (buf!2125 b2!98))) ((_ sign_extend 32) (currentByte!4204 b2!98)) ((_ sign_extend 32) (currentBit!4199 b2!98))) (bvsub lt!132756 lt!132755))))

(assert (=> d!26584 (or (= (bvand lt!132756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132755 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132756 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132756 lt!132755) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26584 (= lt!132755 (bitIndex!0 (size!1735 (buf!2125 b2!98)) (currentByte!4204 b2!98) (currentBit!4199 b2!98)))))

(declare-fun lt!132758 () (_ BitVec 64))

(declare-fun lt!132757 () (_ BitVec 64))

(assert (=> d!26584 (= lt!132756 (bvmul lt!132758 lt!132757))))

(assert (=> d!26584 (or (= lt!132758 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132757 (bvsdiv (bvmul lt!132758 lt!132757) lt!132758)))))

(assert (=> d!26584 (= lt!132757 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26584 (= lt!132758 ((_ sign_extend 32) (size!1735 (buf!2125 b2!98))))))

(declare-fun lt!132759 () Unit!5579)

(assert (=> d!26584 (= lt!132759 (choose!23 b2!98))))

(assert (=> d!26584 (= (remainingBitsBitIndexLemma!0 b2!98) lt!132759)))

(declare-fun bs!6533 () Bool)

(assert (= bs!6533 d!26584))

(assert (=> bs!6533 m!129815))

(assert (=> bs!6533 m!129801))

(declare-fun m!129841 () Bool)

(assert (=> bs!6533 m!129841))

(assert (=> b!83236 d!26584))

(declare-fun d!26586 () Bool)

(assert (=> d!26586 (= (array_inv!1581 (buf!2125 b2!98)) (bvsge (size!1735 (buf!2125 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83235 d!26586))

(push 1)

(assert (not d!26552))

(assert (not d!26580))

(assert (not d!26584))

(assert (not d!26554))

(assert (not d!26556))

(assert (not d!26560))

(assert (not d!26566))

(check-sat)

(pop 1)

(push 1)

(check-sat)

