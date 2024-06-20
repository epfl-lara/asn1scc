; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!51602 () Bool)

(assert start!51602)

(declare-fun res!199935 () Bool)

(declare-fun e!165678 () Bool)

(assert (=> start!51602 (=> (not res!199935) (not e!165678))))

(declare-datatypes ((array!12934 0))(
  ( (array!12935 (arr!6660 (Array (_ BitVec 32) (_ BitVec 8))) (size!5673 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10268 0))(
  ( (BitStream!10269 (buf!6127 array!12934) (currentByte!11394 (_ BitVec 32)) (currentBit!11389 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10268)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51602 (= res!199935 (validate_offset_bits!1 ((_ sign_extend 32) (size!5673 (buf!6127 thiss!1854))) ((_ sign_extend 32) (currentByte!11394 thiss!1854)) ((_ sign_extend 32) (currentBit!11389 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51602 e!165678))

(declare-fun e!165679 () Bool)

(declare-fun inv!12 (BitStream!10268) Bool)

(assert (=> start!51602 (and (inv!12 thiss!1854) e!165679)))

(declare-fun b!239362 () Bool)

(assert (=> b!239362 (= e!165678 (not (inv!12 (BitStream!10269 (buf!6127 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11394 thiss!1854)) (currentBit!11389 thiss!1854)))))))

(declare-fun b!239363 () Bool)

(declare-fun array_inv!5414 (array!12934) Bool)

(assert (=> b!239363 (= e!165679 (array_inv!5414 (buf!6127 thiss!1854)))))

(assert (= (and start!51602 res!199935) b!239362))

(assert (= start!51602 b!239363))

(declare-fun m!361523 () Bool)

(assert (=> start!51602 m!361523))

(declare-fun m!361525 () Bool)

(assert (=> start!51602 m!361525))

(declare-fun m!361527 () Bool)

(assert (=> b!239362 m!361527))

(declare-fun m!361529 () Bool)

(assert (=> b!239363 m!361529))

(push 1)

(assert (not start!51602))

(assert (not b!239363))

(assert (not b!239362))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80733 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!80733 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5673 (buf!6127 thiss!1854))) ((_ sign_extend 32) (currentByte!11394 thiss!1854)) ((_ sign_extend 32) (currentBit!11389 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5673 (buf!6127 thiss!1854))) ((_ sign_extend 32) (currentByte!11394 thiss!1854)) ((_ sign_extend 32) (currentBit!11389 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun bs!20308 () Bool)

(assert (= bs!20308 d!80733))

(declare-fun m!361532 () Bool)

(assert (=> bs!20308 m!361532))

(assert (=> start!51602 d!80733))

(declare-fun d!80738 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!80738 (= (inv!12 thiss!1854) (invariant!0 (currentBit!11389 thiss!1854) (currentByte!11394 thiss!1854) (size!5673 (buf!6127 thiss!1854))))))

(declare-fun bs!20310 () Bool)

(assert (= bs!20310 d!80738))

(declare-fun m!361535 () Bool)

(assert (=> bs!20310 m!361535))

(assert (=> start!51602 d!80738))

(declare-fun d!80740 () Bool)

(assert (=> d!80740 (= (array_inv!5414 (buf!6127 thiss!1854)) (bvsge (size!5673 (buf!6127 thiss!1854)) #b00000000000000000000000000000000))))

(assert (=> b!239363 d!80740))

(declare-fun d!80744 () Bool)

(assert (=> d!80744 (= (inv!12 (BitStream!10269 (buf!6127 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11394 thiss!1854)) (currentBit!11389 thiss!1854))) (invariant!0 (currentBit!11389 (BitStream!10269 (buf!6127 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11394 thiss!1854)) (currentBit!11389 thiss!1854))) (currentByte!11394 (BitStream!10269 (buf!6127 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11394 thiss!1854)) (currentBit!11389 thiss!1854))) (size!5673 (buf!6127 (BitStream!10269 (buf!6127 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11394 thiss!1854)) (currentBit!11389 thiss!1854))))))))

(declare-fun bs!20312 () Bool)

(assert (= bs!20312 d!80744))

(declare-fun m!361539 () Bool)

(assert (=> bs!20312 m!361539))

(assert (=> b!239362 d!80744))

(push 1)

(assert (not d!80738))

(assert (not d!80744))

(assert (not d!80733))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!80764 () Bool)

(assert (=> d!80764 (= (invariant!0 (currentBit!11389 thiss!1854) (currentByte!11394 thiss!1854) (size!5673 (buf!6127 thiss!1854))) (and (bvsge (currentBit!11389 thiss!1854) #b00000000000000000000000000000000) (bvslt (currentBit!11389 thiss!1854) #b00000000000000000000000000001000) (bvsge (currentByte!11394 thiss!1854) #b00000000000000000000000000000000) (or (bvslt (currentByte!11394 thiss!1854) (size!5673 (buf!6127 thiss!1854))) (and (= (currentBit!11389 thiss!1854) #b00000000000000000000000000000000) (= (currentByte!11394 thiss!1854) (size!5673 (buf!6127 thiss!1854)))))))))

(assert (=> d!80738 d!80764))

(declare-fun d!80766 () Bool)

(assert (=> d!80766 (= (invariant!0 (currentBit!11389 (BitStream!10269 (buf!6127 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11394 thiss!1854)) (currentBit!11389 thiss!1854))) (currentByte!11394 (BitStream!10269 (buf!6127 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11394 thiss!1854)) (currentBit!11389 thiss!1854))) (size!5673 (buf!6127 (BitStream!10269 (buf!6127 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11394 thiss!1854)) (currentBit!11389 thiss!1854))))) (and (bvsge (currentBit!11389 (BitStream!10269 (buf!6127 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11394 thiss!1854)) (currentBit!11389 thiss!1854))) #b00000000000000000000000000000000) (bvslt (currentBit!11389 (BitStream!10269 (buf!6127 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11394 thiss!1854)) (currentBit!11389 thiss!1854))) #b00000000000000000000000000001000) (bvsge (currentByte!11394 (BitStream!10269 (buf!6127 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11394 thiss!1854)) (currentBit!11389 thiss!1854))) #b00000000000000000000000000000000) (or (bvslt (currentByte!11394 (BitStream!10269 (buf!6127 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11394 thiss!1854)) (currentBit!11389 thiss!1854))) (size!5673 (buf!6127 (BitStream!10269 (buf!6127 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11394 thiss!1854)) (currentBit!11389 thiss!1854))))) (and (= (currentBit!11389 (BitStream!10269 (buf!6127 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11394 thiss!1854)) (currentBit!11389 thiss!1854))) #b00000000000000000000000000000000) (= (currentByte!11394 (BitStream!10269 (buf!6127 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11394 thiss!1854)) (currentBit!11389 thiss!1854))) (size!5673 (buf!6127 (BitStream!10269 (buf!6127 thiss!1854) (bvadd #b00000000000000000000000000000001 (currentByte!11394 thiss!1854)) (currentBit!11389 thiss!1854)))))))))))

(assert (=> d!80744 d!80766))

(declare-fun d!80770 () Bool)

(assert (=> d!80770 (= (remainingBits!0 ((_ sign_extend 32) (size!5673 (buf!6127 thiss!1854))) ((_ sign_extend 32) (currentByte!11394 thiss!1854)) ((_ sign_extend 32) (currentBit!11389 thiss!1854))) (bvsub (bvmul ((_ sign_extend 32) (size!5673 (buf!6127 thiss!1854))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!11394 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11389 thiss!1854)))))))

(assert (=> d!80733 d!80770))

(push 1)

(check-sat)

(pop 1)

