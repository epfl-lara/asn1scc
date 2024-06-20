; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18672 () Bool)

(assert start!18672)

(declare-fun b!92773 () Bool)

(declare-fun res!76577 () Bool)

(declare-fun e!60959 () Bool)

(assert (=> b!92773 (=> (not res!76577) (not e!60959))))

(declare-datatypes ((array!4344 0))(
  ( (array!4345 (arr!2589 (Array (_ BitVec 32) (_ BitVec 8))) (size!1966 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3466 0))(
  ( (BitStream!3467 (buf!2342 array!4344) (currentByte!4667 (_ BitVec 32)) (currentBit!4662 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3466)

(declare-fun base!8 () BitStream!3466)

(declare-fun isPrefixOf!0 (BitStream!3466 BitStream!3466) Bool)

(assert (=> b!92773 (= res!76577 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!92774 () Bool)

(declare-fun res!76575 () Bool)

(assert (=> b!92774 (=> (not res!76575) (not e!60959))))

(declare-fun bitStream2!8 () BitStream!3466)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!92774 (= res!76575 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1966 (buf!2342 bitStream1!8)) (currentByte!4667 bitStream1!8) (currentBit!4662 bitStream1!8))) (bitIndex!0 (size!1966 (buf!2342 bitStream2!8)) (currentByte!4667 bitStream2!8) (currentBit!4662 bitStream2!8))))))

(declare-fun b!92775 () Bool)

(declare-fun res!76576 () Bool)

(assert (=> b!92775 (=> (not res!76576) (not e!60959))))

(declare-fun nBits!484 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!92775 (= res!76576 (validate_offset_bits!1 ((_ sign_extend 32) (size!1966 (buf!2342 bitStream1!8))) ((_ sign_extend 32) (currentByte!4667 bitStream1!8)) ((_ sign_extend 32) (currentBit!4662 bitStream1!8)) nBits!484))))

(declare-fun b!92776 () Bool)

(declare-fun e!60957 () Bool)

(declare-fun array_inv!1798 (array!4344) Bool)

(assert (=> b!92776 (= e!60957 (array_inv!1798 (buf!2342 bitStream1!8)))))

(declare-fun b!92777 () Bool)

(declare-fun e!60954 () Bool)

(assert (=> b!92777 (= e!60954 (array_inv!1798 (buf!2342 bitStream2!8)))))

(declare-fun b!92778 () Bool)

(declare-fun e!60956 () Bool)

(assert (=> b!92778 (= e!60956 (array_inv!1798 (buf!2342 base!8)))))

(declare-fun res!76580 () Bool)

(assert (=> start!18672 (=> (not res!76580) (not e!60959))))

(assert (=> start!18672 (= res!76580 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18672 e!60959))

(assert (=> start!18672 true))

(declare-fun inv!12 (BitStream!3466) Bool)

(assert (=> start!18672 (and (inv!12 bitStream1!8) e!60957)))

(assert (=> start!18672 (and (inv!12 bitStream2!8) e!60954)))

(assert (=> start!18672 (and (inv!12 base!8) e!60956)))

(declare-fun b!92779 () Bool)

(declare-fun res!76579 () Bool)

(assert (=> b!92779 (=> (not res!76579) (not e!60959))))

(assert (=> b!92779 (= res!76579 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!92780 () Bool)

(declare-fun res!76572 () Bool)

(assert (=> b!92780 (=> (not res!76572) (not e!60959))))

(assert (=> b!92780 (= res!76572 (bvslt (bitIndex!0 (size!1966 (buf!2342 base!8)) (currentByte!4667 base!8) (currentBit!4662 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!92781 () Bool)

(declare-fun res!76574 () Bool)

(assert (=> b!92781 (=> (not res!76574) (not e!60959))))

(declare-datatypes ((List!839 0))(
  ( (Nil!836) (Cons!835 (h!954 Bool) (t!1589 List!839)) )
))
(declare-fun listBits!13 () List!839)

(declare-fun length!430 (List!839) Int)

(assert (=> b!92781 (= res!76574 (> (length!430 listBits!13) 0))))

(declare-fun b!92782 () Bool)

(declare-fun res!76573 () Bool)

(assert (=> b!92782 (=> (not res!76573) (not e!60959))))

(assert (=> b!92782 (= res!76573 (and (= (buf!2342 bitStream1!8) (buf!2342 bitStream2!8)) (= (buf!2342 bitStream1!8) (buf!2342 base!8))))))

(declare-fun b!92783 () Bool)

(declare-fun res!76578 () Bool)

(assert (=> b!92783 (=> (not res!76578) (not e!60959))))

(assert (=> b!92783 (= res!76578 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!92784 () Bool)

(assert (=> b!92784 (= e!60959 (and (bvsle ((_ sign_extend 32) (size!1966 (buf!2342 bitStream2!8))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4667 bitStream2!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4662 bitStream2!8)) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) (size!1966 (buf!2342 bitStream2!8))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentByte!4667 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) (currentBit!4662 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!18672 res!76580) b!92781))

(assert (= (and b!92781 res!76574) b!92773))

(assert (= (and b!92773 res!76577) b!92779))

(assert (= (and b!92779 res!76579) b!92783))

(assert (= (and b!92783 res!76578) b!92782))

(assert (= (and b!92782 res!76573) b!92780))

(assert (= (and b!92780 res!76572) b!92774))

(assert (= (and b!92774 res!76575) b!92775))

(assert (= (and b!92775 res!76576) b!92784))

(assert (= start!18672 b!92776))

(assert (= start!18672 b!92777))

(assert (= start!18672 b!92778))

(declare-fun m!136673 () Bool)

(assert (=> start!18672 m!136673))

(declare-fun m!136675 () Bool)

(assert (=> start!18672 m!136675))

(declare-fun m!136677 () Bool)

(assert (=> start!18672 m!136677))

(declare-fun m!136679 () Bool)

(assert (=> b!92780 m!136679))

(declare-fun m!136681 () Bool)

(assert (=> b!92776 m!136681))

(declare-fun m!136683 () Bool)

(assert (=> b!92773 m!136683))

(declare-fun m!136685 () Bool)

(assert (=> b!92779 m!136685))

(declare-fun m!136687 () Bool)

(assert (=> b!92778 m!136687))

(declare-fun m!136689 () Bool)

(assert (=> b!92777 m!136689))

(declare-fun m!136691 () Bool)

(assert (=> b!92783 m!136691))

(declare-fun m!136693 () Bool)

(assert (=> b!92781 m!136693))

(declare-fun m!136695 () Bool)

(assert (=> b!92775 m!136695))

(declare-fun m!136697 () Bool)

(assert (=> b!92774 m!136697))

(declare-fun m!136699 () Bool)

(assert (=> b!92774 m!136699))

(push 1)

(assert (not b!92778))

(assert (not b!92775))

(assert (not b!92777))

(assert (not start!18672))

(assert (not b!92776))

(assert (not b!92774))

(assert (not b!92780))

(assert (not b!92773))

(assert (not b!92779))

(assert (not b!92781))

(assert (not b!92783))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!28918 () Bool)

(declare-fun size!1970 (List!839) Int)

(assert (=> d!28918 (= (length!430 listBits!13) (size!1970 listBits!13))))

(declare-fun bs!7120 () Bool)

(assert (= bs!7120 d!28918))

(declare-fun m!136777 () Bool)

(assert (=> bs!7120 m!136777))

(assert (=> b!92781 d!28918))

(declare-fun d!28920 () Bool)

(assert (=> d!28920 (= (array_inv!1798 (buf!2342 bitStream1!8)) (bvsge (size!1966 (buf!2342 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!92776 d!28920))

(declare-fun d!28922 () Bool)

(declare-fun e!61020 () Bool)

(assert (=> d!28922 e!61020))

(declare-fun res!76665 () Bool)

(assert (=> d!28922 (=> (not res!76665) (not e!61020))))

(declare-fun lt!138276 () (_ BitVec 64))

(declare-fun lt!138275 () (_ BitVec 64))

(declare-fun lt!138272 () (_ BitVec 64))

(assert (=> d!28922 (= res!76665 (= lt!138275 (bvsub lt!138272 lt!138276)))))

(assert (=> d!28922 (or (= (bvand lt!138272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138276 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138272 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138272 lt!138276) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!28922 (= lt!138276 (remainingBits!0 ((_ sign_extend 32) (size!1966 (buf!2342 base!8))) ((_ sign_extend 32) (currentByte!4667 base!8)) ((_ sign_extend 32) (currentBit!4662 base!8))))))

(declare-fun lt!138271 () (_ BitVec 64))

(declare-fun lt!138273 () (_ BitVec 64))

(assert (=> d!28922 (= lt!138272 (bvmul lt!138271 lt!138273))))

(assert (=> d!28922 (or (= lt!138271 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138273 (bvsdiv (bvmul lt!138271 lt!138273) lt!138271)))))

(assert (=> d!28922 (= lt!138273 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28922 (= lt!138271 ((_ sign_extend 32) (size!1966 (buf!2342 base!8))))))

(assert (=> d!28922 (= lt!138275 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4667 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4662 base!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!28922 (invariant!0 (currentBit!4662 base!8) (currentByte!4667 base!8) (size!1966 (buf!2342 base!8)))))

(assert (=> d!28922 (= (bitIndex!0 (size!1966 (buf!2342 base!8)) (currentByte!4667 base!8) (currentBit!4662 base!8)) lt!138275)))

(declare-fun b!92886 () Bool)

(declare-fun res!76664 () Bool)

(assert (=> b!92886 (=> (not res!76664) (not e!61020))))

(assert (=> b!92886 (= res!76664 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138275))))

(declare-fun b!92887 () Bool)

(declare-fun lt!138274 () (_ BitVec 64))

(assert (=> b!92887 (= e!61020 (bvsle lt!138275 (bvmul lt!138274 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92887 (or (= lt!138274 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138274 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138274)))))

(assert (=> b!92887 (= lt!138274 ((_ sign_extend 32) (size!1966 (buf!2342 base!8))))))

(assert (= (and d!28922 res!76665) b!92886))

(assert (= (and b!92886 res!76664) b!92887))

(declare-fun m!136779 () Bool)

(assert (=> d!28922 m!136779))

(declare-fun m!136781 () Bool)

(assert (=> d!28922 m!136781))

(assert (=> b!92780 d!28922))

(declare-fun d!28924 () Bool)

(assert (=> d!28924 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4662 bitStream1!8) (currentByte!4667 bitStream1!8) (size!1966 (buf!2342 bitStream1!8))))))

(declare-fun bs!7121 () Bool)

(assert (= bs!7121 d!28924))

(declare-fun m!136783 () Bool)

(assert (=> bs!7121 m!136783))

(assert (=> start!18672 d!28924))

(declare-fun d!28926 () Bool)

(assert (=> d!28926 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4662 bitStream2!8) (currentByte!4667 bitStream2!8) (size!1966 (buf!2342 bitStream2!8))))))

(declare-fun bs!7122 () Bool)

(assert (= bs!7122 d!28926))

(declare-fun m!136785 () Bool)

(assert (=> bs!7122 m!136785))

(assert (=> start!18672 d!28926))

(declare-fun d!28928 () Bool)

(assert (=> d!28928 (= (inv!12 base!8) (invariant!0 (currentBit!4662 base!8) (currentByte!4667 base!8) (size!1966 (buf!2342 base!8))))))

(declare-fun bs!7123 () Bool)

(assert (= bs!7123 d!28928))

(assert (=> bs!7123 m!136781))

(assert (=> start!18672 d!28928))

(declare-fun d!28932 () Bool)

(assert (=> d!28932 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1966 (buf!2342 bitStream1!8))) ((_ sign_extend 32) (currentByte!4667 bitStream1!8)) ((_ sign_extend 32) (currentBit!4662 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1966 (buf!2342 bitStream1!8))) ((_ sign_extend 32) (currentByte!4667 bitStream1!8)) ((_ sign_extend 32) (currentBit!4662 bitStream1!8))) nBits!484))))

(declare-fun bs!7125 () Bool)

(assert (= bs!7125 d!28932))

(declare-fun m!136789 () Bool)

(assert (=> bs!7125 m!136789))

(assert (=> b!92775 d!28932))

(declare-fun d!28936 () Bool)

(declare-fun res!76683 () Bool)

(declare-fun e!61031 () Bool)

(assert (=> d!28936 (=> (not res!76683) (not e!61031))))

(assert (=> d!28936 (= res!76683 (= (size!1966 (buf!2342 bitStream1!8)) (size!1966 (buf!2342 base!8))))))

(assert (=> d!28936 (= (isPrefixOf!0 bitStream1!8 base!8) e!61031)))

(declare-fun b!92903 () Bool)

(declare-fun res!76681 () Bool)

(assert (=> b!92903 (=> (not res!76681) (not e!61031))))

(assert (=> b!92903 (= res!76681 (bvsle (bitIndex!0 (size!1966 (buf!2342 bitStream1!8)) (currentByte!4667 bitStream1!8) (currentBit!4662 bitStream1!8)) (bitIndex!0 (size!1966 (buf!2342 base!8)) (currentByte!4667 base!8) (currentBit!4662 base!8))))))

(declare-fun b!92904 () Bool)

(declare-fun e!61032 () Bool)

(assert (=> b!92904 (= e!61031 e!61032)))

(declare-fun res!76682 () Bool)

(assert (=> b!92904 (=> res!76682 e!61032)))

(assert (=> b!92904 (= res!76682 (= (size!1966 (buf!2342 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92905 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4344 array!4344 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!92905 (= e!61032 (arrayBitRangesEq!0 (buf!2342 bitStream1!8) (buf!2342 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1966 (buf!2342 bitStream1!8)) (currentByte!4667 bitStream1!8) (currentBit!4662 bitStream1!8))))))

(assert (= (and d!28936 res!76683) b!92903))

(assert (= (and b!92903 res!76681) b!92904))

(assert (= (and b!92904 (not res!76682)) b!92905))

(assert (=> b!92903 m!136697))

(assert (=> b!92903 m!136679))

(assert (=> b!92905 m!136697))

(assert (=> b!92905 m!136697))

(declare-fun m!136793 () Bool)

(assert (=> b!92905 m!136793))

(assert (=> b!92773 d!28936))

(declare-fun d!28940 () Bool)

(declare-fun res!76689 () Bool)

(declare-fun e!61035 () Bool)

(assert (=> d!28940 (=> (not res!76689) (not e!61035))))

(assert (=> d!28940 (= res!76689 (= (size!1966 (buf!2342 bitStream2!8)) (size!1966 (buf!2342 base!8))))))

(assert (=> d!28940 (= (isPrefixOf!0 bitStream2!8 base!8) e!61035)))

(declare-fun b!92909 () Bool)

(declare-fun res!76687 () Bool)

(assert (=> b!92909 (=> (not res!76687) (not e!61035))))

(assert (=> b!92909 (= res!76687 (bvsle (bitIndex!0 (size!1966 (buf!2342 bitStream2!8)) (currentByte!4667 bitStream2!8) (currentBit!4662 bitStream2!8)) (bitIndex!0 (size!1966 (buf!2342 base!8)) (currentByte!4667 base!8) (currentBit!4662 base!8))))))

(declare-fun b!92910 () Bool)

(declare-fun e!61036 () Bool)

(assert (=> b!92910 (= e!61035 e!61036)))

(declare-fun res!76688 () Bool)

(assert (=> b!92910 (=> res!76688 e!61036)))

(assert (=> b!92910 (= res!76688 (= (size!1966 (buf!2342 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!92911 () Bool)

(assert (=> b!92911 (= e!61036 (arrayBitRangesEq!0 (buf!2342 bitStream2!8) (buf!2342 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1966 (buf!2342 bitStream2!8)) (currentByte!4667 bitStream2!8) (currentBit!4662 bitStream2!8))))))

(assert (= (and d!28940 res!76689) b!92909))

(assert (= (and b!92909 res!76687) b!92910))

(assert (= (and b!92910 (not res!76688)) b!92911))

(assert (=> b!92909 m!136699))

(assert (=> b!92909 m!136679))

(assert (=> b!92911 m!136699))

(assert (=> b!92911 m!136699))

(declare-fun m!136797 () Bool)

(assert (=> b!92911 m!136797))

(assert (=> b!92779 d!28940))

(declare-fun d!28944 () Bool)

(declare-fun e!61037 () Bool)

(assert (=> d!28944 e!61037))

(declare-fun res!76691 () Bool)

(assert (=> d!28944 (=> (not res!76691) (not e!61037))))

(declare-fun lt!138282 () (_ BitVec 64))

(declare-fun lt!138278 () (_ BitVec 64))

(declare-fun lt!138281 () (_ BitVec 64))

(assert (=> d!28944 (= res!76691 (= lt!138281 (bvsub lt!138278 lt!138282)))))

(assert (=> d!28944 (or (= (bvand lt!138278 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138282 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138278 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138278 lt!138282) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28944 (= lt!138282 (remainingBits!0 ((_ sign_extend 32) (size!1966 (buf!2342 bitStream1!8))) ((_ sign_extend 32) (currentByte!4667 bitStream1!8)) ((_ sign_extend 32) (currentBit!4662 bitStream1!8))))))

(declare-fun lt!138277 () (_ BitVec 64))

(declare-fun lt!138279 () (_ BitVec 64))

(assert (=> d!28944 (= lt!138278 (bvmul lt!138277 lt!138279))))

(assert (=> d!28944 (or (= lt!138277 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138279 (bvsdiv (bvmul lt!138277 lt!138279) lt!138277)))))

(assert (=> d!28944 (= lt!138279 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28944 (= lt!138277 ((_ sign_extend 32) (size!1966 (buf!2342 bitStream1!8))))))

(assert (=> d!28944 (= lt!138281 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4667 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4662 bitStream1!8))))))

(assert (=> d!28944 (invariant!0 (currentBit!4662 bitStream1!8) (currentByte!4667 bitStream1!8) (size!1966 (buf!2342 bitStream1!8)))))

(assert (=> d!28944 (= (bitIndex!0 (size!1966 (buf!2342 bitStream1!8)) (currentByte!4667 bitStream1!8) (currentBit!4662 bitStream1!8)) lt!138281)))

(declare-fun b!92912 () Bool)

(declare-fun res!76690 () Bool)

(assert (=> b!92912 (=> (not res!76690) (not e!61037))))

(assert (=> b!92912 (= res!76690 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138281))))

(declare-fun b!92913 () Bool)

(declare-fun lt!138280 () (_ BitVec 64))

(assert (=> b!92913 (= e!61037 (bvsle lt!138281 (bvmul lt!138280 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92913 (or (= lt!138280 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138280 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138280)))))

(assert (=> b!92913 (= lt!138280 ((_ sign_extend 32) (size!1966 (buf!2342 bitStream1!8))))))

(assert (= (and d!28944 res!76691) b!92912))

(assert (= (and b!92912 res!76690) b!92913))

(assert (=> d!28944 m!136789))

(assert (=> d!28944 m!136783))

(assert (=> b!92774 d!28944))

(declare-fun d!28948 () Bool)

(declare-fun e!61038 () Bool)

(assert (=> d!28948 e!61038))

(declare-fun res!76693 () Bool)

(assert (=> d!28948 (=> (not res!76693) (not e!61038))))

(declare-fun lt!138287 () (_ BitVec 64))

(declare-fun lt!138284 () (_ BitVec 64))

(declare-fun lt!138288 () (_ BitVec 64))

(assert (=> d!28948 (= res!76693 (= lt!138287 (bvsub lt!138284 lt!138288)))))

(assert (=> d!28948 (or (= (bvand lt!138284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138288 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138284 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138284 lt!138288) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!28948 (= lt!138288 (remainingBits!0 ((_ sign_extend 32) (size!1966 (buf!2342 bitStream2!8))) ((_ sign_extend 32) (currentByte!4667 bitStream2!8)) ((_ sign_extend 32) (currentBit!4662 bitStream2!8))))))

(declare-fun lt!138283 () (_ BitVec 64))

(declare-fun lt!138285 () (_ BitVec 64))

(assert (=> d!28948 (= lt!138284 (bvmul lt!138283 lt!138285))))

(assert (=> d!28948 (or (= lt!138283 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138285 (bvsdiv (bvmul lt!138283 lt!138285) lt!138283)))))

(assert (=> d!28948 (= lt!138285 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!28948 (= lt!138283 ((_ sign_extend 32) (size!1966 (buf!2342 bitStream2!8))))))

(assert (=> d!28948 (= lt!138287 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4667 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4662 bitStream2!8))))))

(assert (=> d!28948 (invariant!0 (currentBit!4662 bitStream2!8) (currentByte!4667 bitStream2!8) (size!1966 (buf!2342 bitStream2!8)))))

(assert (=> d!28948 (= (bitIndex!0 (size!1966 (buf!2342 bitStream2!8)) (currentByte!4667 bitStream2!8) (currentBit!4662 bitStream2!8)) lt!138287)))

(declare-fun b!92914 () Bool)

(declare-fun res!76692 () Bool)

(assert (=> b!92914 (=> (not res!76692) (not e!61038))))

(assert (=> b!92914 (= res!76692 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138287))))

(declare-fun b!92915 () Bool)

(declare-fun lt!138286 () (_ BitVec 64))

(assert (=> b!92915 (= e!61038 (bvsle lt!138287 (bvmul lt!138286 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!92915 (or (= lt!138286 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138286 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138286)))))

(assert (=> b!92915 (= lt!138286 ((_ sign_extend 32) (size!1966 (buf!2342 bitStream2!8))))))

(assert (= (and d!28948 res!76693) b!92914))

(assert (= (and b!92914 res!76692) b!92915))

(declare-fun m!136799 () Bool)

(assert (=> d!28948 m!136799))

(assert (=> d!28948 m!136785))

(assert (=> b!92774 d!28948))

(declare-fun d!28950 () Bool)

(assert (=> d!28950 (= (array_inv!1798 (buf!2342 bitStream2!8)) (bvsge (size!1966 (buf!2342 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!92777 d!28950))

(declare-fun d!28952 () Bool)

(declare-fun res!76696 () Bool)

(declare-fun e!61039 () Bool)

(assert (=> d!28952 (=> (not res!76696) (not e!61039))))

(assert (=> d!28952 (= res!76696 (= (size!1966 (buf!2342 bitStream1!8)) (size!1966 (buf!2342 bitStream2!8))))))

(assert (=> d!28952 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!61039)))

(declare-fun b!92916 () Bool)

(declare-fun res!76694 () Bool)

(assert (=> b!92916 (=> (not res!76694) (not e!61039))))

(assert (=> b!92916 (= res!76694 (bvsle (bitIndex!0 (size!1966 (buf!2342 bitStream1!8)) (currentByte!4667 bitStream1!8) (currentBit!4662 bitStream1!8)) (bitIndex!0 (size!1966 (buf!2342 bitStream2!8)) (currentByte!4667 bitStream2!8) (currentBit!4662 bitStream2!8))))))

(declare-fun b!92917 () Bool)

(declare-fun e!61040 () Bool)

(assert (=> b!92917 (= e!61039 e!61040)))

(declare-fun res!76695 () Bool)

(assert (=> b!92917 (=> res!76695 e!61040)))

(assert (=> b!92917 (= res!76695 (= (size!1966 (buf!2342 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!92918 () Bool)

(assert (=> b!92918 (= e!61040 (arrayBitRangesEq!0 (buf!2342 bitStream1!8) (buf!2342 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1966 (buf!2342 bitStream1!8)) (currentByte!4667 bitStream1!8) (currentBit!4662 bitStream1!8))))))

(assert (= (and d!28952 res!76696) b!92916))

(assert (= (and b!92916 res!76694) b!92917))

(assert (= (and b!92917 (not res!76695)) b!92918))

(assert (=> b!92916 m!136697))

(assert (=> b!92916 m!136699))

(assert (=> b!92918 m!136697))

(assert (=> b!92918 m!136697))

(declare-fun m!136803 () Bool)

(assert (=> b!92918 m!136803))

(assert (=> b!92783 d!28952))

(declare-fun d!28958 () Bool)

(assert (=> d!28958 (= (array_inv!1798 (buf!2342 base!8)) (bvsge (size!1966 (buf!2342 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!92778 d!28958))

(push 1)

(assert (not b!92903))

(assert (not d!28948))

(assert (not d!28924))

(assert (not d!28926))

(assert (not d!28918))

(assert (not d!28928))

(assert (not b!92911))

(assert (not b!92905))

(assert (not d!28944))

(assert (not d!28922))

(assert (not b!92909))

(assert (not d!28932))

(assert (not b!92916))

(assert (not b!92918))

(check-sat)

(pop 1)

(push 1)

(check-sat)

