; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17188 () Bool)

(assert start!17188)

(declare-fun lt!133494 () (_ BitVec 64))

(declare-fun b!83702 () Bool)

(declare-fun lt!133491 () (_ BitVec 64))

(declare-fun lt!133497 () (_ BitVec 64))

(declare-fun e!55745 () Bool)

(assert (=> b!83702 (= e!55745 (or (= lt!133497 (bvand lt!133494 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!133497 (bvand (bvsub lt!133491 lt!133494) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!83702 (= lt!133497 (bvand lt!133491 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((array!3866 0))(
  ( (array!3867 (arr!2394 (Array (_ BitVec 32) (_ BitVec 8))) (size!1757 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3076 0))(
  ( (BitStream!3077 (buf!2147 array!3866) (currentByte!4268 (_ BitVec 32)) (currentBit!4263 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3076)

(declare-fun lt!133490 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83702 (= (remainingBits!0 ((_ sign_extend 32) (size!1757 (buf!2147 b2!98))) ((_ sign_extend 32) (currentByte!4268 b2!98)) ((_ sign_extend 32) (currentBit!4263 b2!98))) (bvsub lt!133491 lt!133490))))

(assert (=> b!83702 (= lt!133491 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1757 (buf!2147 b2!98)))))))

(declare-datatypes ((Unit!5617 0))(
  ( (Unit!5618) )
))
(declare-fun lt!133493 () Unit!5617)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3076) Unit!5617)

(assert (=> b!83702 (= lt!133493 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun b!83704 () Bool)

(declare-fun e!55748 () Bool)

(declare-fun e!55747 () Bool)

(assert (=> b!83704 (= e!55748 e!55747)))

(declare-fun res!68814 () Bool)

(assert (=> b!83704 (=> (not res!68814) (not e!55747))))

(assert (=> b!83704 (= res!68814 (= lt!133494 lt!133490))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83704 (= lt!133490 (bitIndex!0 (size!1757 (buf!2147 b2!98)) (currentByte!4268 b2!98) (currentBit!4263 b2!98)))))

(declare-fun lt!133492 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> b!83704 (= lt!133494 (bvadd lt!133492 b1b2Diff!1))))

(declare-fun b1!98 () BitStream!3076)

(assert (=> b!83704 (= lt!133492 (bitIndex!0 (size!1757 (buf!2147 b1!98)) (currentByte!4268 b1!98) (currentBit!4263 b1!98)))))

(declare-fun b!83705 () Bool)

(declare-fun e!55744 () Bool)

(declare-fun array_inv!1603 (array!3866) Bool)

(assert (=> b!83705 (= e!55744 (array_inv!1603 (buf!2147 b1!98)))))

(declare-fun b!83706 () Bool)

(assert (=> b!83706 (= e!55747 (not e!55745))))

(declare-fun res!68813 () Bool)

(assert (=> b!83706 (=> res!68813 e!55745)))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(declare-fun lt!133496 () (_ BitVec 64))

(assert (=> b!83706 (= res!68813 (bvsgt lt!133492 (bvsub lt!133496 b1ValidateOffsetBits!11)))))

(assert (=> b!83706 (= (remainingBits!0 ((_ sign_extend 32) (size!1757 (buf!2147 b1!98))) ((_ sign_extend 32) (currentByte!4268 b1!98)) ((_ sign_extend 32) (currentBit!4263 b1!98))) (bvsub lt!133496 lt!133492))))

(assert (=> b!83706 (= lt!133496 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1757 (buf!2147 b1!98)))))))

(declare-fun lt!133495 () Unit!5617)

(assert (=> b!83706 (= lt!133495 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83707 () Bool)

(declare-fun res!68815 () Bool)

(assert (=> b!83707 (=> (not res!68815) (not e!55748))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83707 (= res!68815 (validate_offset_bits!1 ((_ sign_extend 32) (size!1757 (buf!2147 b1!98))) ((_ sign_extend 32) (currentByte!4268 b1!98)) ((_ sign_extend 32) (currentBit!4263 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun res!68812 () Bool)

(assert (=> start!17188 (=> (not res!68812) (not e!55748))))

(assert (=> start!17188 (= res!68812 (and (= (size!1757 (buf!2147 b1!98)) (size!1757 (buf!2147 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17188 e!55748))

(declare-fun inv!12 (BitStream!3076) Bool)

(assert (=> start!17188 (and (inv!12 b1!98) e!55744)))

(declare-fun e!55746 () Bool)

(assert (=> start!17188 (and (inv!12 b2!98) e!55746)))

(assert (=> start!17188 true))

(declare-fun b!83703 () Bool)

(assert (=> b!83703 (= e!55746 (array_inv!1603 (buf!2147 b2!98)))))

(assert (= (and start!17188 res!68812) b!83707))

(assert (= (and b!83707 res!68815) b!83704))

(assert (= (and b!83704 res!68814) b!83706))

(assert (= (and b!83706 (not res!68813)) b!83702))

(assert (= start!17188 b!83705))

(assert (= start!17188 b!83703))

(declare-fun m!130317 () Bool)

(assert (=> b!83702 m!130317))

(declare-fun m!130319 () Bool)

(assert (=> b!83702 m!130319))

(declare-fun m!130321 () Bool)

(assert (=> b!83703 m!130321))

(declare-fun m!130323 () Bool)

(assert (=> start!17188 m!130323))

(declare-fun m!130325 () Bool)

(assert (=> start!17188 m!130325))

(declare-fun m!130327 () Bool)

(assert (=> b!83706 m!130327))

(declare-fun m!130329 () Bool)

(assert (=> b!83706 m!130329))

(declare-fun m!130331 () Bool)

(assert (=> b!83707 m!130331))

(declare-fun m!130333 () Bool)

(assert (=> b!83705 m!130333))

(declare-fun m!130335 () Bool)

(assert (=> b!83704 m!130335))

(declare-fun m!130337 () Bool)

(assert (=> b!83704 m!130337))

(push 1)

(assert (not b!83703))

(assert (not b!83707))

(assert (not b!83706))

(assert (not b!83705))

(assert (not b!83702))

(assert (not b!83704))

(assert (not start!17188))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26820 () Bool)

(assert (=> d!26820 (= (remainingBits!0 ((_ sign_extend 32) (size!1757 (buf!2147 b2!98))) ((_ sign_extend 32) (currentByte!4268 b2!98)) ((_ sign_extend 32) (currentBit!4263 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1757 (buf!2147 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4268 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4263 b2!98)))))))

(assert (=> b!83702 d!26820))

(declare-fun d!26822 () Bool)

(declare-fun lt!133559 () (_ BitVec 64))

(declare-fun lt!133557 () (_ BitVec 64))

(assert (=> d!26822 (= (remainingBits!0 ((_ sign_extend 32) (size!1757 (buf!2147 b2!98))) ((_ sign_extend 32) (currentByte!4268 b2!98)) ((_ sign_extend 32) (currentBit!4263 b2!98))) (bvsub lt!133559 lt!133557))))

(assert (=> d!26822 (or (= (bvand lt!133559 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133557 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133559 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133559 lt!133557) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26822 (= lt!133557 (bitIndex!0 (size!1757 (buf!2147 b2!98)) (currentByte!4268 b2!98) (currentBit!4263 b2!98)))))

(declare-fun lt!133560 () (_ BitVec 64))

(declare-fun lt!133556 () (_ BitVec 64))

(assert (=> d!26822 (= lt!133559 (bvmul lt!133560 lt!133556))))

(assert (=> d!26822 (or (= lt!133560 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133556 (bvsdiv (bvmul lt!133560 lt!133556) lt!133560)))))

(assert (=> d!26822 (= lt!133556 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26822 (= lt!133560 ((_ sign_extend 32) (size!1757 (buf!2147 b2!98))))))

(declare-fun lt!133558 () Unit!5617)

(declare-fun choose!23 (BitStream!3076) Unit!5617)

(assert (=> d!26822 (= lt!133558 (choose!23 b2!98))))

(assert (=> d!26822 (= (remainingBitsBitIndexLemma!0 b2!98) lt!133558)))

(declare-fun bs!6607 () Bool)

(assert (= bs!6607 d!26822))

(assert (=> bs!6607 m!130317))

(assert (=> bs!6607 m!130335))

(declare-fun m!130383 () Bool)

(assert (=> bs!6607 m!130383))

(assert (=> b!83702 d!26822))

(declare-fun d!26824 () Bool)

(assert (=> d!26824 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1757 (buf!2147 b1!98))) ((_ sign_extend 32) (currentByte!4268 b1!98)) ((_ sign_extend 32) (currentBit!4263 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1757 (buf!2147 b1!98))) ((_ sign_extend 32) (currentByte!4268 b1!98)) ((_ sign_extend 32) (currentBit!4263 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6608 () Bool)

(assert (= bs!6608 d!26824))

(assert (=> bs!6608 m!130327))

(assert (=> b!83707 d!26824))

(declare-fun d!26826 () Bool)

(declare-fun e!55794 () Bool)

(assert (=> d!26826 e!55794))

(declare-fun res!68845 () Bool)

(assert (=> d!26826 (=> (not res!68845) (not e!55794))))

(declare-fun lt!133576 () (_ BitVec 64))

(declare-fun lt!133577 () (_ BitVec 64))

(declare-fun lt!133574 () (_ BitVec 64))

(assert (=> d!26826 (= res!68845 (= lt!133574 (bvsub lt!133577 lt!133576)))))

(assert (=> d!26826 (or (= (bvand lt!133577 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133576 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133577 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133577 lt!133576) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26826 (= lt!133576 (remainingBits!0 ((_ sign_extend 32) (size!1757 (buf!2147 b2!98))) ((_ sign_extend 32) (currentByte!4268 b2!98)) ((_ sign_extend 32) (currentBit!4263 b2!98))))))

(declare-fun lt!133575 () (_ BitVec 64))

(declare-fun lt!133578 () (_ BitVec 64))

(assert (=> d!26826 (= lt!133577 (bvmul lt!133575 lt!133578))))

(assert (=> d!26826 (or (= lt!133575 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133578 (bvsdiv (bvmul lt!133575 lt!133578) lt!133575)))))

(assert (=> d!26826 (= lt!133578 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26826 (= lt!133575 ((_ sign_extend 32) (size!1757 (buf!2147 b2!98))))))

(assert (=> d!26826 (= lt!133574 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4268 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4263 b2!98))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26826 (invariant!0 (currentBit!4263 b2!98) (currentByte!4268 b2!98) (size!1757 (buf!2147 b2!98)))))

(assert (=> d!26826 (= (bitIndex!0 (size!1757 (buf!2147 b2!98)) (currentByte!4268 b2!98) (currentBit!4263 b2!98)) lt!133574)))

(declare-fun b!83749 () Bool)

(declare-fun res!68844 () Bool)

(assert (=> b!83749 (=> (not res!68844) (not e!55794))))

(assert (=> b!83749 (= res!68844 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133574))))

(declare-fun b!83750 () Bool)

(declare-fun lt!133573 () (_ BitVec 64))

(assert (=> b!83750 (= e!55794 (bvsle lt!133574 (bvmul lt!133573 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83750 (or (= lt!133573 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133573 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133573)))))

(assert (=> b!83750 (= lt!133573 ((_ sign_extend 32) (size!1757 (buf!2147 b2!98))))))

(assert (= (and d!26826 res!68845) b!83749))

(assert (= (and b!83749 res!68844) b!83750))

(assert (=> d!26826 m!130317))

(declare-fun m!130385 () Bool)

(assert (=> d!26826 m!130385))

(assert (=> b!83704 d!26826))

(declare-fun d!26828 () Bool)

(declare-fun e!55795 () Bool)

(assert (=> d!26828 e!55795))

(declare-fun res!68847 () Bool)

(assert (=> d!26828 (=> (not res!68847) (not e!55795))))

(declare-fun lt!133582 () (_ BitVec 64))

(declare-fun lt!133583 () (_ BitVec 64))

(declare-fun lt!133580 () (_ BitVec 64))

(assert (=> d!26828 (= res!68847 (= lt!133580 (bvsub lt!133583 lt!133582)))))

(assert (=> d!26828 (or (= (bvand lt!133583 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133582 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133583 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133583 lt!133582) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26828 (= lt!133582 (remainingBits!0 ((_ sign_extend 32) (size!1757 (buf!2147 b1!98))) ((_ sign_extend 32) (currentByte!4268 b1!98)) ((_ sign_extend 32) (currentBit!4263 b1!98))))))

(declare-fun lt!133581 () (_ BitVec 64))

(declare-fun lt!133584 () (_ BitVec 64))

(assert (=> d!26828 (= lt!133583 (bvmul lt!133581 lt!133584))))

(assert (=> d!26828 (or (= lt!133581 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133584 (bvsdiv (bvmul lt!133581 lt!133584) lt!133581)))))

(assert (=> d!26828 (= lt!133584 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26828 (= lt!133581 ((_ sign_extend 32) (size!1757 (buf!2147 b1!98))))))

(assert (=> d!26828 (= lt!133580 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4268 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4263 b1!98))))))

(assert (=> d!26828 (invariant!0 (currentBit!4263 b1!98) (currentByte!4268 b1!98) (size!1757 (buf!2147 b1!98)))))

(assert (=> d!26828 (= (bitIndex!0 (size!1757 (buf!2147 b1!98)) (currentByte!4268 b1!98) (currentBit!4263 b1!98)) lt!133580)))

(declare-fun b!83751 () Bool)

(declare-fun res!68846 () Bool)

(assert (=> b!83751 (=> (not res!68846) (not e!55795))))

(assert (=> b!83751 (= res!68846 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133580))))

(declare-fun b!83752 () Bool)

(declare-fun lt!133579 () (_ BitVec 64))

(assert (=> b!83752 (= e!55795 (bvsle lt!133580 (bvmul lt!133579 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83752 (or (= lt!133579 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133579 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133579)))))

(assert (=> b!83752 (= lt!133579 ((_ sign_extend 32) (size!1757 (buf!2147 b1!98))))))

(assert (= (and d!26828 res!68847) b!83751))

(assert (= (and b!83751 res!68846) b!83752))

(assert (=> d!26828 m!130327))

(declare-fun m!130387 () Bool)

(assert (=> d!26828 m!130387))

(assert (=> b!83704 d!26828))

(declare-fun d!26830 () Bool)

(assert (=> d!26830 (= (array_inv!1603 (buf!2147 b2!98)) (bvsge (size!1757 (buf!2147 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83703 d!26830))

(declare-fun d!26832 () Bool)

(assert (=> d!26832 (= (array_inv!1603 (buf!2147 b1!98)) (bvsge (size!1757 (buf!2147 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83705 d!26832))

(declare-fun d!26834 () Bool)

(assert (=> d!26834 (= (inv!12 b1!98) (invariant!0 (currentBit!4263 b1!98) (currentByte!4268 b1!98) (size!1757 (buf!2147 b1!98))))))

(declare-fun bs!6609 () Bool)

(assert (= bs!6609 d!26834))

(assert (=> bs!6609 m!130387))

(assert (=> start!17188 d!26834))

(declare-fun d!26836 () Bool)

(assert (=> d!26836 (= (inv!12 b2!98) (invariant!0 (currentBit!4263 b2!98) (currentByte!4268 b2!98) (size!1757 (buf!2147 b2!98))))))

(declare-fun bs!6610 () Bool)

(assert (= bs!6610 d!26836))

(assert (=> bs!6610 m!130385))

(assert (=> start!17188 d!26836))

(declare-fun d!26838 () Bool)

(assert (=> d!26838 (= (remainingBits!0 ((_ sign_extend 32) (size!1757 (buf!2147 b1!98))) ((_ sign_extend 32) (currentByte!4268 b1!98)) ((_ sign_extend 32) (currentBit!4263 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1757 (buf!2147 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4268 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4263 b1!98)))))))

(assert (=> b!83706 d!26838))

(declare-fun d!26840 () Bool)

(declare-fun lt!133588 () (_ BitVec 64))

(declare-fun lt!133586 () (_ BitVec 64))

(assert (=> d!26840 (= (remainingBits!0 ((_ sign_extend 32) (size!1757 (buf!2147 b1!98))) ((_ sign_extend 32) (currentByte!4268 b1!98)) ((_ sign_extend 32) (currentBit!4263 b1!98))) (bvsub lt!133588 lt!133586))))

(assert (=> d!26840 (or (= (bvand lt!133588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133586 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133588 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133588 lt!133586) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26840 (= lt!133586 (bitIndex!0 (size!1757 (buf!2147 b1!98)) (currentByte!4268 b1!98) (currentBit!4263 b1!98)))))

(declare-fun lt!133589 () (_ BitVec 64))

(declare-fun lt!133585 () (_ BitVec 64))

(assert (=> d!26840 (= lt!133588 (bvmul lt!133589 lt!133585))))

(assert (=> d!26840 (or (= lt!133589 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133585 (bvsdiv (bvmul lt!133589 lt!133585) lt!133589)))))

(assert (=> d!26840 (= lt!133585 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26840 (= lt!133589 ((_ sign_extend 32) (size!1757 (buf!2147 b1!98))))))

(declare-fun lt!133587 () Unit!5617)

(assert (=> d!26840 (= lt!133587 (choose!23 b1!98))))

(assert (=> d!26840 (= (remainingBitsBitIndexLemma!0 b1!98) lt!133587)))

(declare-fun bs!6611 () Bool)

(assert (= bs!6611 d!26840))

(assert (=> bs!6611 m!130327))

(assert (=> bs!6611 m!130337))

(declare-fun m!130389 () Bool)

(assert (=> bs!6611 m!130389))

(assert (=> b!83706 d!26840))

(push 1)

(assert (not d!26840))

(assert (not d!26824))

(assert (not d!26822))

(assert (not d!26826))

(assert (not d!26836))

(assert (not d!26828))

(assert (not d!26834))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

