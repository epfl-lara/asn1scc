; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35052 () Bool)

(assert start!35052)

(declare-fun res!137465 () Bool)

(declare-fun e!114129 () Bool)

(assert (=> start!35052 (=> (not res!137465) (not e!114129))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35052 (= res!137465 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35052 e!114129))

(assert (=> start!35052 true))

(declare-datatypes ((array!8332 0))(
  ( (array!8333 (arr!4647 (Array (_ BitVec 32) (_ BitVec 8))) (size!3726 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6608 0))(
  ( (BitStream!6609 (buf!4178 array!8332) (currentByte!7797 (_ BitVec 32)) (currentBit!7792 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6608)

(declare-fun e!114127 () Bool)

(declare-fun inv!12 (BitStream!6608) Bool)

(assert (=> start!35052 (and (inv!12 thiss!1577) e!114127)))

(declare-fun b!165010 () Bool)

(declare-fun res!137464 () Bool)

(assert (=> b!165010 (=> (not res!137464) (not e!114129))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165010 (= res!137464 (validate_offset_bits!1 ((_ sign_extend 32) (size!3726 (buf!4178 thiss!1577))) ((_ sign_extend 32) (currentByte!7797 thiss!1577)) ((_ sign_extend 32) (currentBit!7792 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165011 () Bool)

(assert (=> b!165011 (= e!114129 (and (bvsle (bvadd (currentBit!7792 thiss!1577) nBits!511) #b00000000000000000000000000001000) (bvsge (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7792 thiss!1577) nBits!511)) #b00000000000000000000000000001001)))))

(declare-fun b!165012 () Bool)

(declare-fun array_inv!3467 (array!8332) Bool)

(assert (=> b!165012 (= e!114127 (array_inv!3467 (buf!4178 thiss!1577)))))

(assert (= (and start!35052 res!137465) b!165010))

(assert (= (and b!165010 res!137464) b!165011))

(assert (= start!35052 b!165012))

(declare-fun m!262351 () Bool)

(assert (=> start!35052 m!262351))

(declare-fun m!262353 () Bool)

(assert (=> b!165010 m!262353))

(declare-fun m!262355 () Bool)

(assert (=> b!165012 m!262355))

(push 1)

(assert (not b!165010))

(assert (not start!35052))

(assert (not b!165012))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57061 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57061 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3726 (buf!4178 thiss!1577))) ((_ sign_extend 32) (currentByte!7797 thiss!1577)) ((_ sign_extend 32) (currentBit!7792 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3726 (buf!4178 thiss!1577))) ((_ sign_extend 32) (currentByte!7797 thiss!1577)) ((_ sign_extend 32) (currentBit!7792 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14161 () Bool)

(assert (= bs!14161 d!57061))

(declare-fun m!262365 () Bool)

(assert (=> bs!14161 m!262365))

(assert (=> b!165010 d!57061))

(declare-fun d!57063 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57063 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7792 thiss!1577) (currentByte!7797 thiss!1577) (size!3726 (buf!4178 thiss!1577))))))

(declare-fun bs!14162 () Bool)

(assert (= bs!14162 d!57063))

(declare-fun m!262367 () Bool)

(assert (=> bs!14162 m!262367))

(assert (=> start!35052 d!57063))

(declare-fun d!57065 () Bool)

(assert (=> d!57065 (= (array_inv!3467 (buf!4178 thiss!1577)) (bvsge (size!3726 (buf!4178 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165012 d!57065))

(push 1)

(assert (not d!57061))

(assert (not d!57063))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

