; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35148 () Bool)

(assert start!35148)

(declare-fun res!137564 () Bool)

(declare-fun e!114263 () Bool)

(assert (=> start!35148 (=> (not res!137564) (not e!114263))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35148 (= res!137564 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35148 e!114263))

(assert (=> start!35148 true))

(declare-datatypes ((array!8369 0))(
  ( (array!8370 (arr!4662 (Array (_ BitVec 32) (_ BitVec 8))) (size!3741 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6638 0))(
  ( (BitStream!6639 (buf!4193 array!8369) (currentByte!7831 (_ BitVec 32)) (currentBit!7826 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6638)

(declare-fun e!114264 () Bool)

(declare-fun inv!12 (BitStream!6638) Bool)

(assert (=> start!35148 (and (inv!12 thiss!1577) e!114264)))

(declare-fun b!165154 () Bool)

(declare-fun res!137563 () Bool)

(assert (=> b!165154 (=> (not res!137563) (not e!114263))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165154 (= res!137563 (validate_offset_bits!1 ((_ sign_extend 32) (size!3741 (buf!4193 thiss!1577))) ((_ sign_extend 32) (currentByte!7831 thiss!1577)) ((_ sign_extend 32) (currentBit!7826 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165155 () Bool)

(assert (=> b!165155 (= e!114263 (and (bvsle (bvadd (currentBit!7826 thiss!1577) nBits!511) #b00000000000000000000000000001000) (bvsgt (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7826 thiss!1577) nBits!511)) #b00000000000000000000000000100000)))))

(declare-fun b!165156 () Bool)

(declare-fun array_inv!3482 (array!8369) Bool)

(assert (=> b!165156 (= e!114264 (array_inv!3482 (buf!4193 thiss!1577)))))

(assert (= (and start!35148 res!137564) b!165154))

(assert (= (and b!165154 res!137563) b!165155))

(assert (= start!35148 b!165156))

(declare-fun m!262531 () Bool)

(assert (=> start!35148 m!262531))

(declare-fun m!262533 () Bool)

(assert (=> b!165154 m!262533))

(declare-fun m!262535 () Bool)

(assert (=> b!165156 m!262535))

(push 1)

(assert (not start!35148))

(assert (not b!165154))

(assert (not b!165156))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57139 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57139 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7826 thiss!1577) (currentByte!7831 thiss!1577) (size!3741 (buf!4193 thiss!1577))))))

(declare-fun bs!14191 () Bool)

(assert (= bs!14191 d!57139))

(declare-fun m!262545 () Bool)

(assert (=> bs!14191 m!262545))

(assert (=> start!35148 d!57139))

(declare-fun d!57143 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57143 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3741 (buf!4193 thiss!1577))) ((_ sign_extend 32) (currentByte!7831 thiss!1577)) ((_ sign_extend 32) (currentBit!7826 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3741 (buf!4193 thiss!1577))) ((_ sign_extend 32) (currentByte!7831 thiss!1577)) ((_ sign_extend 32) (currentBit!7826 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14192 () Bool)

(assert (= bs!14192 d!57143))

(declare-fun m!262547 () Bool)

(assert (=> bs!14192 m!262547))

(assert (=> b!165154 d!57143))

(declare-fun d!57145 () Bool)

(assert (=> d!57145 (= (array_inv!3482 (buf!4193 thiss!1577)) (bvsge (size!3741 (buf!4193 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165156 d!57145))

(push 1)

(assert (not d!57139))

(assert (not d!57143))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

