; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35966 () Bool)

(assert start!35966)

(declare-fun res!138724 () Bool)

(declare-fun e!115487 () Bool)

(assert (=> start!35966 (=> (not res!138724) (not e!115487))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35966 (= res!138724 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35966 e!115487))

(assert (=> start!35966 true))

(declare-datatypes ((array!8569 0))(
  ( (array!8570 (arr!4734 (Array (_ BitVec 32) (_ BitVec 8))) (size!3813 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6782 0))(
  ( (BitStream!6783 (buf!4265 array!8569) (currentByte!8055 (_ BitVec 32)) (currentBit!8050 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6782)

(declare-fun e!115486 () Bool)

(declare-fun inv!12 (BitStream!6782) Bool)

(assert (=> start!35966 (and (inv!12 thiss!1577) e!115486)))

(declare-fun b!166636 () Bool)

(declare-fun res!138725 () Bool)

(assert (=> b!166636 (=> (not res!138725) (not e!115487))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166636 (= res!138725 (validate_offset_bits!1 ((_ sign_extend 32) (size!3813 (buf!4265 thiss!1577))) ((_ sign_extend 32) (currentByte!8055 thiss!1577)) ((_ sign_extend 32) (currentBit!8050 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166637 () Bool)

(assert (=> b!166637 (= e!115487 (and (bvsgt (bvadd (currentBit!8050 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (currentByte!8055 thiss!1577) #b00000000000000000000000000000000) (bvsge (currentByte!8055 thiss!1577) (size!3813 (buf!4265 thiss!1577))))))))

(declare-fun b!166638 () Bool)

(declare-fun array_inv!3554 (array!8569) Bool)

(assert (=> b!166638 (= e!115486 (array_inv!3554 (buf!4265 thiss!1577)))))

(assert (= (and start!35966 res!138724) b!166636))

(assert (= (and b!166636 res!138725) b!166637))

(assert (= start!35966 b!166638))

(declare-fun m!264655 () Bool)

(assert (=> start!35966 m!264655))

(declare-fun m!264657 () Bool)

(assert (=> b!166636 m!264657))

(declare-fun m!264659 () Bool)

(assert (=> b!166638 m!264659))

(push 1)

(assert (not b!166638))

(assert (not start!35966))

(assert (not b!166636))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58209 () Bool)

(assert (=> d!58209 (= (array_inv!3554 (buf!4265 thiss!1577)) (bvsge (size!3813 (buf!4265 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166638 d!58209))

(declare-fun d!58213 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58213 (= (inv!12 thiss!1577) (invariant!0 (currentBit!8050 thiss!1577) (currentByte!8055 thiss!1577) (size!3813 (buf!4265 thiss!1577))))))

(declare-fun bs!14450 () Bool)

(assert (= bs!14450 d!58213))

(declare-fun m!264669 () Bool)

(assert (=> bs!14450 m!264669))

(assert (=> start!35966 d!58213))

(declare-fun d!58217 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58217 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3813 (buf!4265 thiss!1577))) ((_ sign_extend 32) (currentByte!8055 thiss!1577)) ((_ sign_extend 32) (currentBit!8050 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3813 (buf!4265 thiss!1577))) ((_ sign_extend 32) (currentByte!8055 thiss!1577)) ((_ sign_extend 32) (currentBit!8050 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14451 () Bool)

(assert (= bs!14451 d!58217))

(declare-fun m!264671 () Bool)

(assert (=> bs!14451 m!264671))

(assert (=> b!166636 d!58217))

(push 1)

(assert (not d!58217))

(assert (not d!58213))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

