; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17052 () Bool)

(assert start!17052)

(declare-fun b!83392 () Bool)

(declare-fun e!55435 () Bool)

(declare-fun e!55439 () Bool)

(assert (=> b!83392 (= e!55435 e!55439)))

(declare-fun res!68595 () Bool)

(assert (=> b!83392 (=> (not res!68595) (not e!55439))))

(declare-fun lt!132909 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-datatypes ((array!3829 0))(
  ( (array!3830 (arr!2380 (Array (_ BitVec 32) (_ BitVec 8))) (size!1743 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3048 0))(
  ( (BitStream!3049 (buf!2133 array!3829) (currentByte!4227 (_ BitVec 32)) (currentBit!4222 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3048)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83392 (= res!68595 (= (bvadd lt!132909 b1b2Diff!1) (bitIndex!0 (size!1743 (buf!2133 b2!98)) (currentByte!4227 b2!98) (currentBit!4222 b2!98))))))

(declare-fun b1!98 () BitStream!3048)

(assert (=> b!83392 (= lt!132909 (bitIndex!0 (size!1743 (buf!2133 b1!98)) (currentByte!4227 b1!98) (currentBit!4222 b1!98)))))

(declare-fun b!83393 () Bool)

(declare-fun e!55437 () Bool)

(declare-fun array_inv!1589 (array!3829) Bool)

(assert (=> b!83393 (= e!55437 (array_inv!1589 (buf!2133 b2!98)))))

(declare-fun b!83394 () Bool)

(declare-fun e!55440 () Bool)

(assert (=> b!83394 (= e!55440 (array_inv!1589 (buf!2133 b1!98)))))

(declare-fun b!83395 () Bool)

(declare-fun res!68596 () Bool)

(assert (=> b!83395 (=> (not res!68596) (not e!55435))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83395 (= res!68596 (validate_offset_bits!1 ((_ sign_extend 32) (size!1743 (buf!2133 b1!98))) ((_ sign_extend 32) (currentByte!4227 b1!98)) ((_ sign_extend 32) (currentBit!4222 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83391 () Bool)

(declare-fun lt!132911 () (_ BitVec 64))

(declare-fun lt!132910 () (_ BitVec 64))

(assert (=> b!83391 (= e!55439 (not (or (= lt!132910 (bvand lt!132909 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!132910 (bvand lt!132911 #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun lt!132912 () (_ BitVec 64))

(assert (=> b!83391 (= lt!132910 (bvand lt!132912 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83391 (= (remainingBits!0 ((_ sign_extend 32) (size!1743 (buf!2133 b1!98))) ((_ sign_extend 32) (currentByte!4227 b1!98)) ((_ sign_extend 32) (currentBit!4222 b1!98))) lt!132911)))

(assert (=> b!83391 (= lt!132911 (bvsub lt!132912 lt!132909))))

(assert (=> b!83391 (= lt!132912 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1743 (buf!2133 b1!98)))))))

(declare-datatypes ((Unit!5589 0))(
  ( (Unit!5590) )
))
(declare-fun lt!132908 () Unit!5589)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3048) Unit!5589)

(assert (=> b!83391 (= lt!132908 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun res!68594 () Bool)

(assert (=> start!17052 (=> (not res!68594) (not e!55435))))

(assert (=> start!17052 (= res!68594 (and (= (size!1743 (buf!2133 b1!98)) (size!1743 (buf!2133 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17052 e!55435))

(declare-fun inv!12 (BitStream!3048) Bool)

(assert (=> start!17052 (and (inv!12 b1!98) e!55440)))

(assert (=> start!17052 (and (inv!12 b2!98) e!55437)))

(assert (=> start!17052 true))

(assert (= (and start!17052 res!68594) b!83395))

(assert (= (and b!83395 res!68596) b!83392))

(assert (= (and b!83392 res!68595) b!83391))

(assert (= start!17052 b!83394))

(assert (= start!17052 b!83393))

(declare-fun m!129969 () Bool)

(assert (=> b!83393 m!129969))

(declare-fun m!129971 () Bool)

(assert (=> b!83391 m!129971))

(declare-fun m!129973 () Bool)

(assert (=> b!83391 m!129973))

(declare-fun m!129975 () Bool)

(assert (=> b!83392 m!129975))

(declare-fun m!129977 () Bool)

(assert (=> b!83392 m!129977))

(declare-fun m!129979 () Bool)

(assert (=> b!83395 m!129979))

(declare-fun m!129981 () Bool)

(assert (=> start!17052 m!129981))

(declare-fun m!129983 () Bool)

(assert (=> start!17052 m!129983))

(declare-fun m!129985 () Bool)

(assert (=> b!83394 m!129985))

(check-sat (not b!83395) (not b!83393) (not b!83394) (not b!83392) (not b!83391) (not start!17052))
(check-sat)
(get-model)

(declare-fun d!26636 () Bool)

(assert (=> d!26636 (= (array_inv!1589 (buf!2133 b2!98)) (bvsge (size!1743 (buf!2133 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83393 d!26636))

(declare-fun d!26638 () Bool)

(declare-fun e!55461 () Bool)

(assert (=> d!26638 e!55461))

(declare-fun res!68610 () Bool)

(assert (=> d!26638 (=> (not res!68610) (not e!55461))))

(declare-fun lt!132943 () (_ BitVec 64))

(declare-fun lt!132944 () (_ BitVec 64))

(declare-fun lt!132941 () (_ BitVec 64))

(assert (=> d!26638 (= res!68610 (= lt!132943 (bvsub lt!132941 lt!132944)))))

(assert (=> d!26638 (or (= (bvand lt!132941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132944 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132941 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132941 lt!132944) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26638 (= lt!132944 (remainingBits!0 ((_ sign_extend 32) (size!1743 (buf!2133 b2!98))) ((_ sign_extend 32) (currentByte!4227 b2!98)) ((_ sign_extend 32) (currentBit!4222 b2!98))))))

(declare-fun lt!132945 () (_ BitVec 64))

(declare-fun lt!132942 () (_ BitVec 64))

(assert (=> d!26638 (= lt!132941 (bvmul lt!132945 lt!132942))))

(assert (=> d!26638 (or (= lt!132945 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132942 (bvsdiv (bvmul lt!132945 lt!132942) lt!132945)))))

(assert (=> d!26638 (= lt!132942 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26638 (= lt!132945 ((_ sign_extend 32) (size!1743 (buf!2133 b2!98))))))

(assert (=> d!26638 (= lt!132943 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4227 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4222 b2!98))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26638 (invariant!0 (currentBit!4222 b2!98) (currentByte!4227 b2!98) (size!1743 (buf!2133 b2!98)))))

(assert (=> d!26638 (= (bitIndex!0 (size!1743 (buf!2133 b2!98)) (currentByte!4227 b2!98) (currentBit!4222 b2!98)) lt!132943)))

(declare-fun b!83415 () Bool)

(declare-fun res!68611 () Bool)

(assert (=> b!83415 (=> (not res!68611) (not e!55461))))

(assert (=> b!83415 (= res!68611 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132943))))

(declare-fun b!83416 () Bool)

(declare-fun lt!132940 () (_ BitVec 64))

(assert (=> b!83416 (= e!55461 (bvsle lt!132943 (bvmul lt!132940 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83416 (or (= lt!132940 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132940 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132940)))))

(assert (=> b!83416 (= lt!132940 ((_ sign_extend 32) (size!1743 (buf!2133 b2!98))))))

(assert (= (and d!26638 res!68610) b!83415))

(assert (= (and b!83415 res!68611) b!83416))

(declare-fun m!130009 () Bool)

(assert (=> d!26638 m!130009))

(declare-fun m!130011 () Bool)

(assert (=> d!26638 m!130011))

(assert (=> b!83392 d!26638))

(declare-fun d!26652 () Bool)

(declare-fun e!55462 () Bool)

(assert (=> d!26652 e!55462))

(declare-fun res!68612 () Bool)

(assert (=> d!26652 (=> (not res!68612) (not e!55462))))

(declare-fun lt!132950 () (_ BitVec 64))

(declare-fun lt!132949 () (_ BitVec 64))

(declare-fun lt!132947 () (_ BitVec 64))

(assert (=> d!26652 (= res!68612 (= lt!132949 (bvsub lt!132947 lt!132950)))))

(assert (=> d!26652 (or (= (bvand lt!132947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132950 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132947 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132947 lt!132950) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26652 (= lt!132950 (remainingBits!0 ((_ sign_extend 32) (size!1743 (buf!2133 b1!98))) ((_ sign_extend 32) (currentByte!4227 b1!98)) ((_ sign_extend 32) (currentBit!4222 b1!98))))))

(declare-fun lt!132951 () (_ BitVec 64))

(declare-fun lt!132948 () (_ BitVec 64))

(assert (=> d!26652 (= lt!132947 (bvmul lt!132951 lt!132948))))

(assert (=> d!26652 (or (= lt!132951 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132948 (bvsdiv (bvmul lt!132951 lt!132948) lt!132951)))))

(assert (=> d!26652 (= lt!132948 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26652 (= lt!132951 ((_ sign_extend 32) (size!1743 (buf!2133 b1!98))))))

(assert (=> d!26652 (= lt!132949 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4227 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4222 b1!98))))))

(assert (=> d!26652 (invariant!0 (currentBit!4222 b1!98) (currentByte!4227 b1!98) (size!1743 (buf!2133 b1!98)))))

(assert (=> d!26652 (= (bitIndex!0 (size!1743 (buf!2133 b1!98)) (currentByte!4227 b1!98) (currentBit!4222 b1!98)) lt!132949)))

(declare-fun b!83417 () Bool)

(declare-fun res!68613 () Bool)

(assert (=> b!83417 (=> (not res!68613) (not e!55462))))

(assert (=> b!83417 (= res!68613 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132949))))

(declare-fun b!83418 () Bool)

(declare-fun lt!132946 () (_ BitVec 64))

(assert (=> b!83418 (= e!55462 (bvsle lt!132949 (bvmul lt!132946 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83418 (or (= lt!132946 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132946 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132946)))))

(assert (=> b!83418 (= lt!132946 ((_ sign_extend 32) (size!1743 (buf!2133 b1!98))))))

(assert (= (and d!26652 res!68612) b!83417))

(assert (= (and b!83417 res!68613) b!83418))

(assert (=> d!26652 m!129971))

(declare-fun m!130013 () Bool)

(assert (=> d!26652 m!130013))

(assert (=> b!83392 d!26652))

(declare-fun d!26654 () Bool)

(assert (=> d!26654 (= (remainingBits!0 ((_ sign_extend 32) (size!1743 (buf!2133 b1!98))) ((_ sign_extend 32) (currentByte!4227 b1!98)) ((_ sign_extend 32) (currentBit!4222 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1743 (buf!2133 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4227 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4222 b1!98)))))))

(assert (=> b!83391 d!26654))

(declare-fun d!26656 () Bool)

(declare-fun lt!132977 () (_ BitVec 64))

(declare-fun lt!132980 () (_ BitVec 64))

(assert (=> d!26656 (= (remainingBits!0 ((_ sign_extend 32) (size!1743 (buf!2133 b1!98))) ((_ sign_extend 32) (currentByte!4227 b1!98)) ((_ sign_extend 32) (currentBit!4222 b1!98))) (bvsub lt!132977 lt!132980))))

(assert (=> d!26656 (or (= (bvand lt!132977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132980 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132977 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132977 lt!132980) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26656 (= lt!132980 (bitIndex!0 (size!1743 (buf!2133 b1!98)) (currentByte!4227 b1!98) (currentBit!4222 b1!98)))))

(declare-fun lt!132979 () (_ BitVec 64))

(declare-fun lt!132978 () (_ BitVec 64))

(assert (=> d!26656 (= lt!132977 (bvmul lt!132979 lt!132978))))

(assert (=> d!26656 (or (= lt!132979 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132978 (bvsdiv (bvmul lt!132979 lt!132978) lt!132979)))))

(assert (=> d!26656 (= lt!132978 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26656 (= lt!132979 ((_ sign_extend 32) (size!1743 (buf!2133 b1!98))))))

(declare-fun lt!132981 () Unit!5589)

(declare-fun choose!23 (BitStream!3048) Unit!5589)

(assert (=> d!26656 (= lt!132981 (choose!23 b1!98))))

(assert (=> d!26656 (= (remainingBitsBitIndexLemma!0 b1!98) lt!132981)))

(declare-fun bs!6557 () Bool)

(assert (= bs!6557 d!26656))

(assert (=> bs!6557 m!129971))

(assert (=> bs!6557 m!129977))

(declare-fun m!130017 () Bool)

(assert (=> bs!6557 m!130017))

(assert (=> b!83391 d!26656))

(declare-fun d!26670 () Bool)

(assert (=> d!26670 (= (inv!12 b1!98) (invariant!0 (currentBit!4222 b1!98) (currentByte!4227 b1!98) (size!1743 (buf!2133 b1!98))))))

(declare-fun bs!6558 () Bool)

(assert (= bs!6558 d!26670))

(assert (=> bs!6558 m!130013))

(assert (=> start!17052 d!26670))

(declare-fun d!26672 () Bool)

(assert (=> d!26672 (= (inv!12 b2!98) (invariant!0 (currentBit!4222 b2!98) (currentByte!4227 b2!98) (size!1743 (buf!2133 b2!98))))))

(declare-fun bs!6559 () Bool)

(assert (= bs!6559 d!26672))

(assert (=> bs!6559 m!130011))

(assert (=> start!17052 d!26672))

(declare-fun d!26674 () Bool)

(assert (=> d!26674 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1743 (buf!2133 b1!98))) ((_ sign_extend 32) (currentByte!4227 b1!98)) ((_ sign_extend 32) (currentBit!4222 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1743 (buf!2133 b1!98))) ((_ sign_extend 32) (currentByte!4227 b1!98)) ((_ sign_extend 32) (currentBit!4222 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6560 () Bool)

(assert (= bs!6560 d!26674))

(assert (=> bs!6560 m!129971))

(assert (=> b!83395 d!26674))

(declare-fun d!26676 () Bool)

(assert (=> d!26676 (= (array_inv!1589 (buf!2133 b1!98)) (bvsge (size!1743 (buf!2133 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83394 d!26676))

(check-sat (not d!26656) (not d!26672) (not d!26670) (not d!26638) (not d!26674) (not d!26652))
