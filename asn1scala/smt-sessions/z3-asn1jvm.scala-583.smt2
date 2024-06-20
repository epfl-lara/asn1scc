; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16720 () Bool)

(assert start!16720)

(declare-fun lt!131454 () (_ BitVec 64))

(declare-fun e!54636 () Bool)

(declare-fun b!82593 () Bool)

(declare-datatypes ((array!3736 0))(
  ( (array!3737 (arr!2344 (Array (_ BitVec 32) (_ BitVec 8))) (size!1707 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2976 0))(
  ( (BitStream!2977 (buf!2097 array!3736) (currentByte!4123 (_ BitVec 32)) (currentBit!4118 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!2976)

(declare-fun lt!131453 () (_ BitVec 64))

(declare-fun lt!131458 () (_ BitVec 64))

(assert (=> b!82593 (= e!54636 (or (not (= lt!131454 (bvsub lt!131458 lt!131453))) (bvsgt ((_ sign_extend 32) (size!1707 (buf!2097 b2!98))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentByte!4123 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) (currentBit!4118 b2!98)) #b0000000000000000000000000000000001111111111111111111111111111111) (and (bvsge ((_ sign_extend 32) (size!1707 (buf!2097 b2!98))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4123 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4118 b2!98)) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!131455 () (_ BitVec 64))

(assert (=> b!82593 (= lt!131454 (bvsub lt!131458 lt!131455))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!82593 (= lt!131454 (remainingBits!0 ((_ sign_extend 32) (size!1707 (buf!2097 b2!98))) ((_ sign_extend 32) (currentByte!4123 b2!98)) ((_ sign_extend 32) (currentBit!4118 b2!98))))))

(assert (=> b!82593 (= lt!131458 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1707 (buf!2097 b2!98)))))))

(declare-datatypes ((Unit!5523 0))(
  ( (Unit!5524) )
))
(declare-fun lt!131456 () Unit!5523)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!2976) Unit!5523)

(assert (=> b!82593 (= lt!131456 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!82594 () Bool)

(declare-fun e!54634 () Bool)

(declare-fun b1!98 () BitStream!2976)

(declare-fun array_inv!1553 (array!3736) Bool)

(assert (=> b!82594 (= e!54634 (array_inv!1553 (buf!2097 b1!98)))))

(declare-fun b!82595 () Bool)

(declare-fun e!54633 () Bool)

(assert (=> b!82595 (= e!54633 (array_inv!1553 (buf!2097 b2!98)))))

(declare-fun res!68032 () Bool)

(declare-fun e!54635 () Bool)

(assert (=> start!16720 (=> (not res!68032) (not e!54635))))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(assert (=> start!16720 (= res!68032 (and (= (size!1707 (buf!2097 b1!98)) (size!1707 (buf!2097 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16720 e!54635))

(declare-fun inv!12 (BitStream!2976) Bool)

(assert (=> start!16720 (and (inv!12 b1!98) e!54634)))

(assert (=> start!16720 (and (inv!12 b2!98) e!54633)))

(assert (=> start!16720 true))

(declare-fun b!82596 () Bool)

(declare-fun e!54630 () Bool)

(assert (=> b!82596 (= e!54630 (not e!54636))))

(declare-fun res!68033 () Bool)

(assert (=> b!82596 (=> res!68033 e!54636)))

(declare-fun lt!131459 () (_ BitVec 64))

(declare-fun lt!131457 () (_ BitVec 64))

(assert (=> b!82596 (= res!68033 (bvsgt lt!131457 (bvsub lt!131459 b1ValidateOffsetBits!11)))))

(assert (=> b!82596 (= (remainingBits!0 ((_ sign_extend 32) (size!1707 (buf!2097 b1!98))) ((_ sign_extend 32) (currentByte!4123 b1!98)) ((_ sign_extend 32) (currentBit!4118 b1!98))) (bvsub lt!131459 lt!131457))))

(assert (=> b!82596 (= lt!131459 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1707 (buf!2097 b1!98)))))))

(declare-fun lt!131460 () Unit!5523)

(assert (=> b!82596 (= lt!131460 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!82597 () Bool)

(declare-fun res!68035 () Bool)

(assert (=> b!82597 (=> (not res!68035) (not e!54635))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!82597 (= res!68035 (validate_offset_bits!1 ((_ sign_extend 32) (size!1707 (buf!2097 b1!98))) ((_ sign_extend 32) (currentByte!4123 b1!98)) ((_ sign_extend 32) (currentBit!4118 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!82598 () Bool)

(assert (=> b!82598 (= e!54635 e!54630)))

(declare-fun res!68034 () Bool)

(assert (=> b!82598 (=> (not res!68034) (not e!54630))))

(assert (=> b!82598 (= res!68034 (= lt!131453 lt!131455))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!82598 (= lt!131455 (bitIndex!0 (size!1707 (buf!2097 b2!98)) (currentByte!4123 b2!98) (currentBit!4118 b2!98)))))

(assert (=> b!82598 (= lt!131453 (bvadd lt!131457 b1b2Diff!1))))

(assert (=> b!82598 (= lt!131457 (bitIndex!0 (size!1707 (buf!2097 b1!98)) (currentByte!4123 b1!98) (currentBit!4118 b1!98)))))

(assert (= (and start!16720 res!68032) b!82597))

(assert (= (and b!82597 res!68035) b!82598))

(assert (= (and b!82598 res!68034) b!82596))

(assert (= (and b!82596 (not res!68033)) b!82593))

(assert (= start!16720 b!82594))

(assert (= start!16720 b!82595))

(declare-fun m!129073 () Bool)

(assert (=> b!82598 m!129073))

(declare-fun m!129075 () Bool)

(assert (=> b!82598 m!129075))

(declare-fun m!129077 () Bool)

(assert (=> b!82595 m!129077))

(declare-fun m!129079 () Bool)

(assert (=> b!82594 m!129079))

(declare-fun m!129081 () Bool)

(assert (=> b!82593 m!129081))

(declare-fun m!129083 () Bool)

(assert (=> b!82593 m!129083))

(declare-fun m!129085 () Bool)

(assert (=> start!16720 m!129085))

(declare-fun m!129087 () Bool)

(assert (=> start!16720 m!129087))

(declare-fun m!129089 () Bool)

(assert (=> b!82596 m!129089))

(declare-fun m!129091 () Bool)

(assert (=> b!82596 m!129091))

(declare-fun m!129093 () Bool)

(assert (=> b!82597 m!129093))

(check-sat (not b!82593) (not b!82596) (not b!82598) (not b!82597) (not start!16720) (not b!82595) (not b!82594))
(check-sat)
(get-model)

(declare-fun d!26164 () Bool)

(assert (=> d!26164 (= (array_inv!1553 (buf!2097 b2!98)) (bvsge (size!1707 (buf!2097 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!82595 d!26164))

(declare-fun d!26166 () Bool)

(assert (=> d!26166 (= (remainingBits!0 ((_ sign_extend 32) (size!1707 (buf!2097 b2!98))) ((_ sign_extend 32) (currentByte!4123 b2!98)) ((_ sign_extend 32) (currentBit!4118 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1707 (buf!2097 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4123 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4118 b2!98)))))))

(assert (=> b!82593 d!26166))

(declare-fun d!26168 () Bool)

(declare-fun lt!131498 () (_ BitVec 64))

(declare-fun lt!131497 () (_ BitVec 64))

(assert (=> d!26168 (= (remainingBits!0 ((_ sign_extend 32) (size!1707 (buf!2097 b2!98))) ((_ sign_extend 32) (currentByte!4123 b2!98)) ((_ sign_extend 32) (currentBit!4118 b2!98))) (bvsub lt!131498 lt!131497))))

(assert (=> d!26168 (or (= (bvand lt!131498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131497 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131498 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131498 lt!131497) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26168 (= lt!131497 (bitIndex!0 (size!1707 (buf!2097 b2!98)) (currentByte!4123 b2!98) (currentBit!4118 b2!98)))))

(declare-fun lt!131496 () (_ BitVec 64))

(declare-fun lt!131495 () (_ BitVec 64))

(assert (=> d!26168 (= lt!131498 (bvmul lt!131496 lt!131495))))

(assert (=> d!26168 (or (= lt!131496 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131495 (bvsdiv (bvmul lt!131496 lt!131495) lt!131496)))))

(assert (=> d!26168 (= lt!131495 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26168 (= lt!131496 ((_ sign_extend 32) (size!1707 (buf!2097 b2!98))))))

(declare-fun lt!131499 () Unit!5523)

(declare-fun choose!23 (BitStream!2976) Unit!5523)

(assert (=> d!26168 (= lt!131499 (choose!23 b2!98))))

(assert (=> d!26168 (= (remainingBitsBitIndexLemma!0 b2!98) lt!131499)))

(declare-fun bs!6417 () Bool)

(assert (= bs!6417 d!26168))

(assert (=> bs!6417 m!129081))

(assert (=> bs!6417 m!129073))

(declare-fun m!129117 () Bool)

(assert (=> bs!6417 m!129117))

(assert (=> b!82593 d!26168))

(declare-fun d!26170 () Bool)

(assert (=> d!26170 (= (array_inv!1553 (buf!2097 b1!98)) (bvsge (size!1707 (buf!2097 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!82594 d!26170))

(declare-fun d!26172 () Bool)

(assert (=> d!26172 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1707 (buf!2097 b1!98))) ((_ sign_extend 32) (currentByte!4123 b1!98)) ((_ sign_extend 32) (currentBit!4118 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1707 (buf!2097 b1!98))) ((_ sign_extend 32) (currentByte!4123 b1!98)) ((_ sign_extend 32) (currentBit!4118 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6418 () Bool)

(assert (= bs!6418 d!26172))

(assert (=> bs!6418 m!129089))

(assert (=> b!82597 d!26172))

(declare-fun d!26174 () Bool)

(declare-fun e!54660 () Bool)

(assert (=> d!26174 e!54660))

(declare-fun res!68052 () Bool)

(assert (=> d!26174 (=> (not res!68052) (not e!54660))))

(declare-fun lt!131517 () (_ BitVec 64))

(declare-fun lt!131515 () (_ BitVec 64))

(declare-fun lt!131512 () (_ BitVec 64))

(assert (=> d!26174 (= res!68052 (= lt!131517 (bvsub lt!131512 lt!131515)))))

(assert (=> d!26174 (or (= (bvand lt!131512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131515 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131512 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131512 lt!131515) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26174 (= lt!131515 (remainingBits!0 ((_ sign_extend 32) (size!1707 (buf!2097 b2!98))) ((_ sign_extend 32) (currentByte!4123 b2!98)) ((_ sign_extend 32) (currentBit!4118 b2!98))))))

(declare-fun lt!131516 () (_ BitVec 64))

(declare-fun lt!131513 () (_ BitVec 64))

(assert (=> d!26174 (= lt!131512 (bvmul lt!131516 lt!131513))))

(assert (=> d!26174 (or (= lt!131516 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131513 (bvsdiv (bvmul lt!131516 lt!131513) lt!131516)))))

(assert (=> d!26174 (= lt!131513 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26174 (= lt!131516 ((_ sign_extend 32) (size!1707 (buf!2097 b2!98))))))

(assert (=> d!26174 (= lt!131517 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4123 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4118 b2!98))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26174 (invariant!0 (currentBit!4118 b2!98) (currentByte!4123 b2!98) (size!1707 (buf!2097 b2!98)))))

(assert (=> d!26174 (= (bitIndex!0 (size!1707 (buf!2097 b2!98)) (currentByte!4123 b2!98) (currentBit!4118 b2!98)) lt!131517)))

(declare-fun b!82622 () Bool)

(declare-fun res!68053 () Bool)

(assert (=> b!82622 (=> (not res!68053) (not e!54660))))

(assert (=> b!82622 (= res!68053 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131517))))

(declare-fun b!82623 () Bool)

(declare-fun lt!131514 () (_ BitVec 64))

(assert (=> b!82623 (= e!54660 (bvsle lt!131517 (bvmul lt!131514 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82623 (or (= lt!131514 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131514 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131514)))))

(assert (=> b!82623 (= lt!131514 ((_ sign_extend 32) (size!1707 (buf!2097 b2!98))))))

(assert (= (and d!26174 res!68052) b!82622))

(assert (= (and b!82622 res!68053) b!82623))

(assert (=> d!26174 m!129081))

(declare-fun m!129119 () Bool)

(assert (=> d!26174 m!129119))

(assert (=> b!82598 d!26174))

(declare-fun d!26176 () Bool)

(declare-fun e!54661 () Bool)

(assert (=> d!26176 e!54661))

(declare-fun res!68054 () Bool)

(assert (=> d!26176 (=> (not res!68054) (not e!54661))))

(declare-fun lt!131523 () (_ BitVec 64))

(declare-fun lt!131518 () (_ BitVec 64))

(declare-fun lt!131521 () (_ BitVec 64))

(assert (=> d!26176 (= res!68054 (= lt!131523 (bvsub lt!131518 lt!131521)))))

(assert (=> d!26176 (or (= (bvand lt!131518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131521 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131518 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131518 lt!131521) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26176 (= lt!131521 (remainingBits!0 ((_ sign_extend 32) (size!1707 (buf!2097 b1!98))) ((_ sign_extend 32) (currentByte!4123 b1!98)) ((_ sign_extend 32) (currentBit!4118 b1!98))))))

(declare-fun lt!131522 () (_ BitVec 64))

(declare-fun lt!131519 () (_ BitVec 64))

(assert (=> d!26176 (= lt!131518 (bvmul lt!131522 lt!131519))))

(assert (=> d!26176 (or (= lt!131522 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131519 (bvsdiv (bvmul lt!131522 lt!131519) lt!131522)))))

(assert (=> d!26176 (= lt!131519 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26176 (= lt!131522 ((_ sign_extend 32) (size!1707 (buf!2097 b1!98))))))

(assert (=> d!26176 (= lt!131523 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4123 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4118 b1!98))))))

(assert (=> d!26176 (invariant!0 (currentBit!4118 b1!98) (currentByte!4123 b1!98) (size!1707 (buf!2097 b1!98)))))

(assert (=> d!26176 (= (bitIndex!0 (size!1707 (buf!2097 b1!98)) (currentByte!4123 b1!98) (currentBit!4118 b1!98)) lt!131523)))

(declare-fun b!82624 () Bool)

(declare-fun res!68055 () Bool)

(assert (=> b!82624 (=> (not res!68055) (not e!54661))))

(assert (=> b!82624 (= res!68055 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!131523))))

(declare-fun b!82625 () Bool)

(declare-fun lt!131520 () (_ BitVec 64))

(assert (=> b!82625 (= e!54661 (bvsle lt!131523 (bvmul lt!131520 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!82625 (or (= lt!131520 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!131520 #b0000000000000000000000000000000000000000000000000000000000001000) lt!131520)))))

(assert (=> b!82625 (= lt!131520 ((_ sign_extend 32) (size!1707 (buf!2097 b1!98))))))

(assert (= (and d!26176 res!68054) b!82624))

(assert (= (and b!82624 res!68055) b!82625))

(assert (=> d!26176 m!129089))

(declare-fun m!129121 () Bool)

(assert (=> d!26176 m!129121))

(assert (=> b!82598 d!26176))

(declare-fun d!26178 () Bool)

(assert (=> d!26178 (= (inv!12 b1!98) (invariant!0 (currentBit!4118 b1!98) (currentByte!4123 b1!98) (size!1707 (buf!2097 b1!98))))))

(declare-fun bs!6419 () Bool)

(assert (= bs!6419 d!26178))

(assert (=> bs!6419 m!129121))

(assert (=> start!16720 d!26178))

(declare-fun d!26180 () Bool)

(assert (=> d!26180 (= (inv!12 b2!98) (invariant!0 (currentBit!4118 b2!98) (currentByte!4123 b2!98) (size!1707 (buf!2097 b2!98))))))

(declare-fun bs!6420 () Bool)

(assert (= bs!6420 d!26180))

(assert (=> bs!6420 m!129119))

(assert (=> start!16720 d!26180))

(declare-fun d!26182 () Bool)

(assert (=> d!26182 (= (remainingBits!0 ((_ sign_extend 32) (size!1707 (buf!2097 b1!98))) ((_ sign_extend 32) (currentByte!4123 b1!98)) ((_ sign_extend 32) (currentBit!4118 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1707 (buf!2097 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4123 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4118 b1!98)))))))

(assert (=> b!82596 d!26182))

(declare-fun d!26184 () Bool)

(declare-fun lt!131527 () (_ BitVec 64))

(declare-fun lt!131526 () (_ BitVec 64))

(assert (=> d!26184 (= (remainingBits!0 ((_ sign_extend 32) (size!1707 (buf!2097 b1!98))) ((_ sign_extend 32) (currentByte!4123 b1!98)) ((_ sign_extend 32) (currentBit!4118 b1!98))) (bvsub lt!131527 lt!131526))))

(assert (=> d!26184 (or (= (bvand lt!131527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!131526 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!131527 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!131527 lt!131526) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26184 (= lt!131526 (bitIndex!0 (size!1707 (buf!2097 b1!98)) (currentByte!4123 b1!98) (currentBit!4118 b1!98)))))

(declare-fun lt!131525 () (_ BitVec 64))

(declare-fun lt!131524 () (_ BitVec 64))

(assert (=> d!26184 (= lt!131527 (bvmul lt!131525 lt!131524))))

(assert (=> d!26184 (or (= lt!131525 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!131524 (bvsdiv (bvmul lt!131525 lt!131524) lt!131525)))))

(assert (=> d!26184 (= lt!131524 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26184 (= lt!131525 ((_ sign_extend 32) (size!1707 (buf!2097 b1!98))))))

(declare-fun lt!131528 () Unit!5523)

(assert (=> d!26184 (= lt!131528 (choose!23 b1!98))))

(assert (=> d!26184 (= (remainingBitsBitIndexLemma!0 b1!98) lt!131528)))

(declare-fun bs!6421 () Bool)

(assert (= bs!6421 d!26184))

(assert (=> bs!6421 m!129089))

(assert (=> bs!6421 m!129075))

(declare-fun m!129123 () Bool)

(assert (=> bs!6421 m!129123))

(assert (=> b!82596 d!26184))

(check-sat (not d!26176) (not d!26172) (not d!26174) (not d!26168) (not d!26184) (not d!26180) (not d!26178))
