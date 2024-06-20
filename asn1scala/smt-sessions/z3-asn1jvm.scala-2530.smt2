; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63924 () Bool)

(assert start!63924)

(declare-fun res!235463 () Bool)

(declare-fun e!203203 () Bool)

(assert (=> start!63924 (=> (not res!235463) (not e!203203))))

(declare-datatypes ((array!16667 0))(
  ( (array!16668 (arr!8183 (Array (_ BitVec 32) (_ BitVec 8))) (size!7187 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12744 0))(
  ( (BitStream!12745 (buf!7433 array!16667) (currentByte!13814 (_ BitVec 32)) (currentBit!13809 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12744)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63924 (= res!235463 (validate_offset_bits!1 ((_ sign_extend 32) (size!7187 (buf!7433 thiss!1929))) ((_ sign_extend 32) (currentByte!13814 thiss!1929)) ((_ sign_extend 32) (currentBit!13809 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13809 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63924 e!203203))

(declare-fun e!203205 () Bool)

(declare-fun inv!12 (BitStream!12744) Bool)

(assert (=> start!63924 (and (inv!12 thiss!1929) e!203205)))

(declare-fun b!284239 () Bool)

(declare-fun res!235462 () Bool)

(assert (=> b!284239 (=> (not res!235462) (not e!203203))))

(assert (=> b!284239 (= res!235462 (= (currentBit!13809 thiss!1929) #b00000000000000000000000000000000))))

(declare-fun b!284240 () Bool)

(declare-fun lt!418449 () (_ BitVec 64))

(assert (=> b!284240 (= e!203203 (bvsgt lt!418449 (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 lt!418449)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!284240 (= lt!418449 (bitIndex!0 (size!7187 (buf!7433 thiss!1929)) (currentByte!13814 thiss!1929) (currentBit!13809 thiss!1929)))))

(declare-fun b!284241 () Bool)

(declare-fun array_inv!6880 (array!16667) Bool)

(assert (=> b!284241 (= e!203205 (array_inv!6880 (buf!7433 thiss!1929)))))

(assert (= (and start!63924 res!235463) b!284239))

(assert (= (and b!284239 res!235462) b!284240))

(assert (= start!63924 b!284241))

(declare-fun m!417407 () Bool)

(assert (=> start!63924 m!417407))

(declare-fun m!417409 () Bool)

(assert (=> start!63924 m!417409))

(declare-fun m!417411 () Bool)

(assert (=> b!284240 m!417411))

(declare-fun m!417413 () Bool)

(assert (=> b!284241 m!417413))

(check-sat (not start!63924) (not b!284240) (not b!284241))
(check-sat)
(get-model)

(declare-fun d!97890 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97890 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7187 (buf!7433 thiss!1929))) ((_ sign_extend 32) (currentByte!13814 thiss!1929)) ((_ sign_extend 32) (currentBit!13809 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13809 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7187 (buf!7433 thiss!1929))) ((_ sign_extend 32) (currentByte!13814 thiss!1929)) ((_ sign_extend 32) (currentBit!13809 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13809 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24746 () Bool)

(assert (= bs!24746 d!97890))

(declare-fun m!417427 () Bool)

(assert (=> bs!24746 m!417427))

(assert (=> start!63924 d!97890))

(declare-fun d!97896 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97896 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13809 thiss!1929) (currentByte!13814 thiss!1929) (size!7187 (buf!7433 thiss!1929))))))

(declare-fun bs!24747 () Bool)

(assert (= bs!24747 d!97896))

(declare-fun m!417429 () Bool)

(assert (=> bs!24747 m!417429))

(assert (=> start!63924 d!97896))

(declare-fun d!97898 () Bool)

(declare-fun e!203220 () Bool)

(assert (=> d!97898 e!203220))

(declare-fun res!235480 () Bool)

(assert (=> d!97898 (=> (not res!235480) (not e!203220))))

(declare-fun lt!418487 () (_ BitVec 64))

(declare-fun lt!418485 () (_ BitVec 64))

(declare-fun lt!418484 () (_ BitVec 64))

(assert (=> d!97898 (= res!235480 (= lt!418484 (bvsub lt!418485 lt!418487)))))

(assert (=> d!97898 (or (= (bvand lt!418485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!418487 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!418485 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!418485 lt!418487) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!97898 (= lt!418487 (remainingBits!0 ((_ sign_extend 32) (size!7187 (buf!7433 thiss!1929))) ((_ sign_extend 32) (currentByte!13814 thiss!1929)) ((_ sign_extend 32) (currentBit!13809 thiss!1929))))))

(declare-fun lt!418483 () (_ BitVec 64))

(declare-fun lt!418486 () (_ BitVec 64))

(assert (=> d!97898 (= lt!418485 (bvmul lt!418483 lt!418486))))

(assert (=> d!97898 (or (= lt!418483 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!418486 (bvsdiv (bvmul lt!418483 lt!418486) lt!418483)))))

(assert (=> d!97898 (= lt!418486 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!97898 (= lt!418483 ((_ sign_extend 32) (size!7187 (buf!7433 thiss!1929))))))

(assert (=> d!97898 (= lt!418484 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13814 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13809 thiss!1929))))))

(assert (=> d!97898 (invariant!0 (currentBit!13809 thiss!1929) (currentByte!13814 thiss!1929) (size!7187 (buf!7433 thiss!1929)))))

(assert (=> d!97898 (= (bitIndex!0 (size!7187 (buf!7433 thiss!1929)) (currentByte!13814 thiss!1929) (currentBit!13809 thiss!1929)) lt!418484)))

(declare-fun b!284261 () Bool)

(declare-fun res!235481 () Bool)

(assert (=> b!284261 (=> (not res!235481) (not e!203220))))

(assert (=> b!284261 (= res!235481 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!418484))))

(declare-fun b!284262 () Bool)

(declare-fun lt!418488 () (_ BitVec 64))

(assert (=> b!284262 (= e!203220 (bvsle lt!418484 (bvmul lt!418488 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!284262 (or (= lt!418488 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!418488 #b0000000000000000000000000000000000000000000000000000000000001000) lt!418488)))))

(assert (=> b!284262 (= lt!418488 ((_ sign_extend 32) (size!7187 (buf!7433 thiss!1929))))))

(assert (= (and d!97898 res!235480) b!284261))

(assert (= (and b!284261 res!235481) b!284262))

(assert (=> d!97898 m!417427))

(assert (=> d!97898 m!417429))

(assert (=> b!284240 d!97898))

(declare-fun d!97902 () Bool)

(assert (=> d!97902 (= (array_inv!6880 (buf!7433 thiss!1929)) (bvsge (size!7187 (buf!7433 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284241 d!97902))

(check-sat (not d!97896) (not d!97890) (not d!97898))
(check-sat)
