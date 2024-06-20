; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35998 () Bool)

(assert start!35998)

(declare-fun res!138742 () Bool)

(declare-fun e!115513 () Bool)

(assert (=> start!35998 (=> (not res!138742) (not e!115513))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35998 (= res!138742 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35998 e!115513))

(assert (=> start!35998 true))

(declare-datatypes ((array!8578 0))(
  ( (array!8579 (arr!4737 (Array (_ BitVec 32) (_ BitVec 8))) (size!3816 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6788 0))(
  ( (BitStream!6789 (buf!4268 array!8578) (currentByte!8065 (_ BitVec 32)) (currentBit!8060 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6788)

(declare-fun e!115514 () Bool)

(declare-fun inv!12 (BitStream!6788) Bool)

(assert (=> start!35998 (and (inv!12 thiss!1577) e!115514)))

(declare-fun b!166663 () Bool)

(declare-fun res!138743 () Bool)

(assert (=> b!166663 (=> (not res!138743) (not e!115513))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166663 (= res!138743 (validate_offset_bits!1 ((_ sign_extend 32) (size!3816 (buf!4268 thiss!1577))) ((_ sign_extend 32) (currentByte!8065 thiss!1577)) ((_ sign_extend 32) (currentBit!8060 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166664 () Bool)

(assert (=> b!166664 (= e!115513 (and (bvsgt (bvadd (currentBit!8060 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvsgt #b00000000000000000000000000000000 (currentByte!8065 thiss!1577)) (bvsge (currentByte!8065 thiss!1577) (size!3816 (buf!4268 thiss!1577))))))))

(declare-fun b!166665 () Bool)

(declare-fun array_inv!3557 (array!8578) Bool)

(assert (=> b!166665 (= e!115514 (array_inv!3557 (buf!4268 thiss!1577)))))

(assert (= (and start!35998 res!138742) b!166663))

(assert (= (and b!166663 res!138743) b!166664))

(assert (= start!35998 b!166665))

(declare-fun m!264685 () Bool)

(assert (=> start!35998 m!264685))

(declare-fun m!264687 () Bool)

(assert (=> b!166663 m!264687))

(declare-fun m!264689 () Bool)

(assert (=> b!166665 m!264689))

(push 1)

(assert (not b!166665))

(assert (not start!35998))

(assert (not b!166663))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58239 () Bool)

(assert (=> d!58239 (= (array_inv!3557 (buf!4268 thiss!1577)) (bvsge (size!3816 (buf!4268 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166665 d!58239))

(declare-fun d!58243 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58243 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8060 thiss!1577) (currentByte!8065 thiss!1577) (size!3816 (buf!4268 thiss!1577))))))

(declare-fun bs!14459 () Bool)

(assert (= bs!14459 d!58243))

(declare-fun m!264699 () Bool)

(assert (=> bs!14459 m!264699))

(assert (=> start!35998 d!58243))

(declare-fun d!58245 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58245 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3816 (buf!4268 thiss!1577))) ((_ sign_extend 32) (currentByte!8065 thiss!1577)) ((_ sign_extend 32) (currentBit!8060 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3816 (buf!4268 thiss!1577))) ((_ sign_extend 32) (currentByte!8065 thiss!1577)) ((_ sign_extend 32) (currentBit!8060 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14460 () Bool)

(assert (= bs!14460 d!58245))

(declare-fun m!264701 () Bool)

(assert (=> bs!14460 m!264701))

(assert (=> b!166663 d!58245))

(push 1)

(assert (not d!58243))

(assert (not d!58245))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

