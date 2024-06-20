; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16818 () Bool)

(assert start!16818)

(declare-fun b!82801 () Bool)

(declare-fun e!54837 () Bool)

(declare-datatypes ((array!3758 0))(
  ( (array!3759 (arr!2352 (Array (_ BitVec 32) (_ BitVec 8))) (size!1715 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2992 0))(
  ( (BitStream!2993 (buf!2105 array!3758) (currentByte!4153 (_ BitVec 32)) (currentBit!4148 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2992)

(declare-fun array_inv!1561 (array!3758) Bool)

(assert (=> b!82801 (= e!54837 (array_inv!1561 (buf!2105 b2!98)))))

(declare-fun b!82802 () Bool)

(declare-fun res!68186 () Bool)

(declare-fun e!54832 () Bool)

(assert (=> b!82802 (=> (not res!68186) (not e!54832))))

(declare-fun b1!98 () BitStream!2992)

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82802 (= res!68186 (validate_offset_bits!1 ((_ sign_extend 32) (size!1715 (buf!2105 b1!98))) ((_ sign_extend 32) (currentByte!4153 b1!98)) ((_ sign_extend 32) (currentBit!4148 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82803 () Bool)

(declare-fun e!54834 () Bool)

(assert (=> b!82803 (= e!54832 e!54834)))

(declare-fun res!68188 () Bool)

(assert (=> b!82803 (=> (not res!68188) (not e!54834))))

(declare-fun lt!131913 () (_ BitVec 64))

(declare-fun lt!131909 () (_ BitVec 64))

(assert (=> b!82803 (= res!68188 (= lt!131913 lt!131909))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82803 (= lt!131909 (bitIndex!0 (size!1715 (buf!2105 b2!98)) (currentByte!4153 b2!98) (currentBit!4148 b2!98)))))

(declare-fun lt!131915 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> b!82803 (= lt!131913 (bvadd lt!131915 b1b2Diff!1))))

(assert (=> b!82803 (= lt!131915 (bitIndex!0 (size!1715 (buf!2105 b1!98)) (currentByte!4153 b1!98) (currentBit!4148 b1!98)))))

(declare-fun res!68187 () Bool)

(assert (=> start!16818 (=> (not res!68187) (not e!54832))))

(assert (=> start!16818 (= res!68187 (and (= (size!1715 (buf!2105 b1!98)) (size!1715 (buf!2105 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16818 e!54832))

(declare-fun e!54831 () Bool)

(declare-fun inv!12 (BitStream!2992) Bool)

(assert (=> start!16818 (and (inv!12 b1!98) e!54831)))

(assert (=> start!16818 (and (inv!12 b2!98) e!54837)))

(assert (=> start!16818 true))

(declare-fun b!82804 () Bool)

(declare-fun e!54836 () Bool)

(assert (=> b!82804 (= e!54834 (not e!54836))))

(declare-fun res!68185 () Bool)

(assert (=> b!82804 (=> res!68185 e!54836)))

(declare-fun lt!131912 () (_ BitVec 64))

(assert (=> b!82804 (= res!68185 (bvsgt lt!131915 (bvsub lt!131912 b1ValidateOffsetBits!11)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82804 (= (remainingBits!0 ((_ sign_extend 32) (size!1715 (buf!2105 b1!98))) ((_ sign_extend 32) (currentByte!4153 b1!98)) ((_ sign_extend 32) (currentBit!4148 b1!98))) (bvsub lt!131912 lt!131915))))

(assert (=> b!82804 (= lt!131912 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1715 (buf!2105 b1!98)))))))

(declare-datatypes ((Unit!5539 0))(
  ( (Unit!5540) )
))
(declare-fun lt!131911 () Unit!5539)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2992) Unit!5539)

(assert (=> b!82804 (= lt!131911 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82805 () Bool)

(assert (=> b!82805 (= e!54831 (array_inv!1561 (buf!2105 b1!98)))))

(declare-fun b!82806 () Bool)

(declare-fun lt!131914 () (_ BitVec 64))

(declare-fun lt!131916 () (_ BitVec 64))

(assert (=> b!82806 (= e!54836 (or (not (= lt!131914 (bvsub lt!131916 lt!131913))) (bvslt lt!131914 (bvsub b1ValidateOffsetBits!11 b1b2Diff!1)) (bvsgt ((_ sign_extend 32) (size!1715 (buf!2105 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4153 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4148 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!1715 (buf!2105 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4153 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4148 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!82806 (= lt!131914 (bvsub lt!131916 lt!131909))))

(assert (=> b!82806 (= lt!131914 (remainingBits!0 ((_ sign_extend 32) (size!1715 (buf!2105 b2!98))) ((_ sign_extend 32) (currentByte!4153 b2!98)) ((_ sign_extend 32) (currentBit!4148 b2!98))))))

(assert (=> b!82806 (= lt!131916 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1715 (buf!2105 b2!98)))))))

(declare-fun lt!131910 () Unit!5539)

(assert (=> b!82806 (= lt!131910 (remainingBitsBitIndexLemma!0 b2!98))))

(assert (= (and start!16818 res!68187) b!82802))

(assert (= (and b!82802 res!68186) b!82803))

(assert (= (and b!82803 res!68188) b!82804))

(assert (= (and b!82804 (not res!68185)) b!82806))

(assert (= start!16818 b!82805))

(assert (= start!16818 b!82801))

(declare-fun m!129303 () Bool)

(assert (=> b!82801 m!129303))

(declare-fun m!129305 () Bool)

(assert (=> b!82803 m!129305))

(declare-fun m!129307 () Bool)

(assert (=> b!82803 m!129307))

(declare-fun m!129309 () Bool)

(assert (=> start!16818 m!129309))

(declare-fun m!129311 () Bool)

(assert (=> start!16818 m!129311))

(declare-fun m!129313 () Bool)

(assert (=> b!82806 m!129313))

(declare-fun m!129315 () Bool)

(assert (=> b!82806 m!129315))

(declare-fun m!129317 () Bool)

(assert (=> b!82805 m!129317))

(declare-fun m!129319 () Bool)

(assert (=> b!82804 m!129319))

(declare-fun m!129321 () Bool)

(assert (=> b!82804 m!129321))

(declare-fun m!129323 () Bool)

(assert (=> b!82802 m!129323))

(push 1)

(assert (not b!82803))

(assert (not b!82804))

(assert (not b!82801))

(assert (not b!82805))

(assert (not b!82806))

(assert (not b!82802))

(assert (not start!16818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26338 () Bool)

(assert (=> d!26338 (= (array_inv!1561 (buf!2105 b1!98)) (bvsge (size!1715 (buf!2105 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82805 d!26338))

(declare-fun d!26340 () Bool)

(assert (=> d!26340 (= (array_inv!1561 (buf!2105 b2!98)) (bvsge (size!1715 (buf!2105 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82801 d!26340))

(declare-fun d!26342 () Bool)

(assert (=> d!26342 (= (remainingBits!0 ((_ sign_extend 32) (size!1715 (buf!2105 b2!98))) ((_ sign_extend 32) (currentByte!4153 b2!98)) ((_ sign_extend 32) (currentBit!4148 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1715 (buf!2105 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4153 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4148 b2!98)))))))

(assert (=> b!82806 d!26342))

(declare-fun d!26344 () Bool)

(declare-fun lt!132020 () (_ BitVec 64))

(declare-fun lt!132021 () (_ BitVec 64))

(assert (=> d!26344 (= (remainingBits!0 ((_ sign_extend 32) (size!1715 (buf!2105 b2!98))) ((_ sign_extend 32) (currentByte!4153 b2!98)) ((_ sign_extend 32) (currentBit!4148 b2!98))) (bvsub lt!132020 lt!132021))))

(assert (=> d!26344 (or (= (bvand lt!132020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132021 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132020 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132020 lt!132021) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26344 (= lt!132021 (bitIndex!0 (size!1715 (buf!2105 b2!98)) (currentByte!4153 b2!98) (currentBit!4148 b2!98)))))

(declare-fun lt!132022 () (_ BitVec 64))

(declare-fun lt!132023 () (_ BitVec 64))

(assert (=> d!26344 (= lt!132020 (bvmul lt!132022 lt!132023))))

(assert (=> d!26344 (or (= lt!132022 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132023 (bvsdiv (bvmul lt!132022 lt!132023) lt!132022)))))

(assert (=> d!26344 (= lt!132023 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26344 (= lt!132022 ((_ sign_extend 32) (size!1715 (buf!2105 b2!98))))))

(declare-fun lt!132019 () Unit!5539)

(declare-fun choose!23 (BitStream!2992) Unit!5539)

(assert (=> d!26344 (= lt!132019 (choose!23 b2!98))))

(assert (=> d!26344 (= (remainingBitsBitIndexLemma!0 b2!98) lt!132019)))

(declare-fun bs!6463 () Bool)

(assert (= bs!6463 d!26344))

(assert (=> bs!6463 m!129313))

(assert (=> bs!6463 m!129305))

(declare-fun m!129377 () Bool)

(assert (=> bs!6463 m!129377))

(assert (=> b!82806 d!26344))

(declare-fun d!26346 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26346 (= (inv!12 b1!98) (invariant!0 (currentBit!4148 b1!98) (currentByte!4153 b1!98) (size!1715 (buf!2105 b1!98))))))

(declare-fun bs!6464 () Bool)

(assert (= bs!6464 d!26346))

(declare-fun m!129379 () Bool)

(assert (=> bs!6464 m!129379))

(assert (=> start!16818 d!26346))

(declare-fun d!26348 () Bool)

(assert (=> d!26348 (= (inv!12 b2!98) (invariant!0 (currentBit!4148 b2!98) (currentByte!4153 b2!98) (size!1715 (buf!2105 b2!98))))))

(declare-fun bs!6465 () Bool)

(assert (= bs!6465 d!26348))

(declare-fun m!129381 () Bool)

(assert (=> bs!6465 m!129381))

(assert (=> start!16818 d!26348))

(declare-fun d!26350 () Bool)

(assert (=> d!26350 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1715 (buf!2105 b1!98))) ((_ sign_extend 32) (currentByte!4153 b1!98)) ((_ sign_extend 32) (currentBit!4148 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1715 (buf!2105 b1!98))) ((_ sign_extend 32) (currentByte!4153 b1!98)) ((_ sign_extend 32) (currentBit!4148 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6466 () Bool)

(assert (= bs!6466 d!26350))

(assert (=> bs!6466 m!129319))

(assert (=> b!82802 d!26350))

(declare-fun d!26352 () Bool)

(assert (=> d!26352 (= (remainingBits!0 ((_ sign_extend 32) (size!1715 (buf!2105 b1!98))) ((_ sign_extend 32) (currentByte!4153 b1!98)) ((_ sign_extend 32) (currentBit!4148 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1715 (buf!2105 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4153 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4148 b1!98)))))))

(assert (=> b!82804 d!26352))

(declare-fun d!26354 () Bool)

(declare-fun lt!132025 () (_ BitVec 64))

(declare-fun lt!132026 () (_ BitVec 64))

(assert (=> d!26354 (= (remainingBits!0 ((_ sign_extend 32) (size!1715 (buf!2105 b1!98))) ((_ sign_extend 32) (currentByte!4153 b1!98)) ((_ sign_extend 32) (currentBit!4148 b1!98))) (bvsub lt!132025 lt!132026))))

(assert (=> d!26354 (or (= (bvand lt!132025 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132026 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132025 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132025 lt!132026) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26354 (= lt!132026 (bitIndex!0 (size!1715 (buf!2105 b1!98)) (currentByte!4153 b1!98) (currentBit!4148 b1!98)))))

(declare-fun lt!132027 () (_ BitVec 64))

(declare-fun lt!132028 () (_ BitVec 64))

(assert (=> d!26354 (= lt!132025 (bvmul lt!132027 lt!132028))))

(assert (=> d!26354 (or (= lt!132027 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132028 (bvsdiv (bvmul lt!132027 lt!132028) lt!132027)))))

(assert (=> d!26354 (= lt!132028 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26354 (= lt!132027 ((_ sign_extend 32) (size!1715 (buf!2105 b1!98))))))

(declare-fun lt!132024 () Unit!5539)

(assert (=> d!26354 (= lt!132024 (choose!23 b1!98))))

(assert (=> d!26354 (= (remainingBitsBitIndexLemma!0 b1!98) lt!132024)))

(declare-fun bs!6467 () Bool)

(assert (= bs!6467 d!26354))

(assert (=> bs!6467 m!129319))

(assert (=> bs!6467 m!129307))

(declare-fun m!129383 () Bool)

(assert (=> bs!6467 m!129383))

(assert (=> b!82804 d!26354))

(declare-fun d!26356 () Bool)

(declare-fun e!54886 () Bool)

(assert (=> d!26356 e!54886))

(declare-fun res!68226 () Bool)

(assert (=> d!26356 (=> (not res!68226) (not e!54886))))

(declare-fun lt!132045 () (_ BitVec 64))

(declare-fun lt!132046 () (_ BitVec 64))

(declare-fun lt!132044 () (_ BitVec 64))

(assert (=> d!26356 (= res!68226 (= lt!132044 (bvsub lt!132045 lt!132046)))))

(assert (=> d!26356 (or (= (bvand lt!132045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132046 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132045 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132045 lt!132046) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26356 (= lt!132046 (remainingBits!0 ((_ sign_extend 32) (size!1715 (buf!2105 b2!98))) ((_ sign_extend 32) (currentByte!4153 b2!98)) ((_ sign_extend 32) (currentBit!4148 b2!98))))))

(declare-fun lt!132043 () (_ BitVec 64))

(declare-fun lt!132041 () (_ BitVec 64))

(assert (=> d!26356 (= lt!132045 (bvmul lt!132043 lt!132041))))

(assert (=> d!26356 (or (= lt!132043 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132041 (bvsdiv (bvmul lt!132043 lt!132041) lt!132043)))))

(assert (=> d!26356 (= lt!132041 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26356 (= lt!132043 ((_ sign_extend 32) (size!1715 (buf!2105 b2!98))))))

(assert (=> d!26356 (= lt!132044 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4153 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4148 b2!98))))))

(assert (=> d!26356 (invariant!0 (currentBit!4148 b2!98) (currentByte!4153 b2!98) (size!1715 (buf!2105 b2!98)))))

(assert (=> d!26356 (= (bitIndex!0 (size!1715 (buf!2105 b2!98)) (currentByte!4153 b2!98) (currentBit!4148 b2!98)) lt!132044)))

(declare-fun b!82857 () Bool)

(declare-fun res!68225 () Bool)

(assert (=> b!82857 (=> (not res!68225) (not e!54886))))

(assert (=> b!82857 (= res!68225 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132044))))

(declare-fun b!82858 () Bool)

(declare-fun lt!132042 () (_ BitVec 64))

(assert (=> b!82858 (= e!54886 (bvsle lt!132044 (bvmul lt!132042 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82858 (or (= lt!132042 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132042 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132042)))))

(assert (=> b!82858 (= lt!132042 ((_ sign_extend 32) (size!1715 (buf!2105 b2!98))))))

(assert (= (and d!26356 res!68226) b!82857))

(assert (= (and b!82857 res!68225) b!82858))

(assert (=> d!26356 m!129313))

(assert (=> d!26356 m!129381))

(assert (=> b!82803 d!26356))

(declare-fun d!26358 () Bool)

(declare-fun e!54887 () Bool)

(assert (=> d!26358 e!54887))

(declare-fun res!68228 () Bool)

(assert (=> d!26358 (=> (not res!68228) (not e!54887))))

(declare-fun lt!132051 () (_ BitVec 64))

(declare-fun lt!132052 () (_ BitVec 64))

(declare-fun lt!132050 () (_ BitVec 64))

(assert (=> d!26358 (= res!68228 (= lt!132050 (bvsub lt!132051 lt!132052)))))

(assert (=> d!26358 (or (= (bvand lt!132051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132052 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132051 lt!132052) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26358 (= lt!132052 (remainingBits!0 ((_ sign_extend 32) (size!1715 (buf!2105 b1!98))) ((_ sign_extend 32) (currentByte!4153 b1!98)) ((_ sign_extend 32) (currentBit!4148 b1!98))))))

(declare-fun lt!132049 () (_ BitVec 64))

(declare-fun lt!132047 () (_ BitVec 64))

(assert (=> d!26358 (= lt!132051 (bvmul lt!132049 lt!132047))))

(assert (=> d!26358 (or (= lt!132049 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132047 (bvsdiv (bvmul lt!132049 lt!132047) lt!132049)))))

(assert (=> d!26358 (= lt!132047 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26358 (= lt!132049 ((_ sign_extend 32) (size!1715 (buf!2105 b1!98))))))

(assert (=> d!26358 (= lt!132050 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4153 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4148 b1!98))))))

(assert (=> d!26358 (invariant!0 (currentBit!4148 b1!98) (currentByte!4153 b1!98) (size!1715 (buf!2105 b1!98)))))

(assert (=> d!26358 (= (bitIndex!0 (size!1715 (buf!2105 b1!98)) (currentByte!4153 b1!98) (currentBit!4148 b1!98)) lt!132050)))

(declare-fun b!82859 () Bool)

(declare-fun res!68227 () Bool)

(assert (=> b!82859 (=> (not res!68227) (not e!54887))))

(assert (=> b!82859 (= res!68227 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132050))))

(declare-fun b!82860 () Bool)

(declare-fun lt!132048 () (_ BitVec 64))

(assert (=> b!82860 (= e!54887 (bvsle lt!132050 (bvmul lt!132048 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82860 (or (= lt!132048 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132048 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132048)))))

(assert (=> b!82860 (= lt!132048 ((_ sign_extend 32) (size!1715 (buf!2105 b1!98))))))

(assert (= (and d!26358 res!68228) b!82859))

(assert (= (and b!82859 res!68227) b!82860))

(assert (=> d!26358 m!129319))

(assert (=> d!26358 m!129379))

(assert (=> b!82803 d!26358))

(push 1)

(assert (not d!26344))

(assert (not d!26348))

(assert (not d!26350))

(assert (not d!26354))

(assert (not d!26358))

(assert (not d!26346))

(assert (not d!26356))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!26354 d!26352))

(assert (=> d!26354 d!26358))

(declare-fun d!26382 () Bool)

(assert (=> d!26382 (= (remainingBits!0 ((_ sign_extend 32) (size!1715 (buf!2105 b1!98))) ((_ sign_extend 32) (currentByte!4153 b1!98)) ((_ sign_extend 32) (currentBit!4148 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1715 (buf!2105 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bitIndex!0 (size!1715 (buf!2105 b1!98)) (currentByte!4153 b1!98) (currentBit!4148 b1!98))))))

(assert (=> d!26382 true))

(declare-fun _$4!38 () Unit!5539)

(assert (=> d!26382 (= (choose!23 b1!98) _$4!38)))

(declare-fun bs!6473 () Bool)

(assert (= bs!6473 d!26382))

(assert (=> bs!6473 m!129319))

(assert (=> bs!6473 m!129307))

(assert (=> d!26354 d!26382))

(declare-fun d!26384 () Bool)

(assert (=> d!26384 (= (invariant!0 (currentBit!4148 b2!98) (currentByte!4153 b2!98) (size!1715 (buf!2105 b2!98))) (and (bvsge (currentBit!4148 b2!98) #b00000000000000000000000000000000) (bvslt (currentBit!4148 b2!98) #b00000000000000000000000000001000) (bvsge (currentByte!4153 b2!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!4153 b2!98) (size!1715 (buf!2105 b2!98))) (and (= (currentBit!4148 b2!98) #b00000000000000000000000000000000) (= (currentByte!4153 b2!98) (size!1715 (buf!2105 b2!98)))))))))

(assert (=> d!26348 d!26384))

(assert (=> d!26350 d!26352))

(assert (=> d!26356 d!26342))

(assert (=> d!26356 d!26384))

(assert (=> d!26344 d!26342))

(assert (=> d!26344 d!26356))

(declare-fun d!26386 () Bool)

(assert (=> d!26386 (= (remainingBits!0 ((_ sign_extend 32) (size!1715 (buf!2105 b2!98))) ((_ sign_extend 32) (currentByte!4153 b2!98)) ((_ sign_extend 32) (currentBit!4148 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1715 (buf!2105 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bitIndex!0 (size!1715 (buf!2105 b2!98)) (currentByte!4153 b2!98) (currentBit!4148 b2!98))))))

(assert (=> d!26386 true))

(declare-fun _$4!39 () Unit!5539)

(assert (=> d!26386 (= (choose!23 b2!98) _$4!39)))

(declare-fun bs!6474 () Bool)

(assert (= bs!6474 d!26386))

(assert (=> bs!6474 m!129313))

(assert (=> bs!6474 m!129305))

(assert (=> d!26344 d!26386))

(declare-fun d!26388 () Bool)

(assert (=> d!26388 (= (invariant!0 (currentBit!4148 b1!98) (currentByte!4153 b1!98) (size!1715 (buf!2105 b1!98))) (and (bvsge (currentBit!4148 b1!98) #b00000000000000000000000000000000) (bvslt (currentBit!4148 b1!98) #b00000000000000000000000000001000) (bvsge (currentByte!4153 b1!98) #b00000000000000000000000000000000) (or (bvslt (currentByte!4153 b1!98) (size!1715 (buf!2105 b1!98))) (and (= (currentBit!4148 b1!98) #b00000000000000000000000000000000) (= (currentByte!4153 b1!98) (size!1715 (buf!2105 b1!98)))))))))

(assert (=> d!26346 d!26388))

(assert (=> d!26358 d!26352))

(assert (=> d!26358 d!26388))

(push 1)

(assert (not d!26386))

(assert (not d!26382))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

