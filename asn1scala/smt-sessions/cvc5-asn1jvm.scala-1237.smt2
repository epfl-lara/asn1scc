; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35048 () Bool)

(assert start!35048)

(declare-fun res!137452 () Bool)

(declare-fun e!114111 () Bool)

(assert (=> start!35048 (=> (not res!137452) (not e!114111))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35048 (= res!137452 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35048 e!114111))

(assert (=> start!35048 true))

(declare-datatypes ((array!8328 0))(
  ( (array!8329 (arr!4645 (Array (_ BitVec 32) (_ BitVec 8))) (size!3724 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6604 0))(
  ( (BitStream!6605 (buf!4176 array!8328) (currentByte!7795 (_ BitVec 32)) (currentBit!7790 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6604)

(declare-fun e!114109 () Bool)

(declare-fun inv!12 (BitStream!6604) Bool)

(assert (=> start!35048 (and (inv!12 thiss!1577) e!114109)))

(declare-fun b!164992 () Bool)

(declare-fun res!137453 () Bool)

(assert (=> b!164992 (=> (not res!137453) (not e!114111))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164992 (= res!137453 (validate_offset_bits!1 ((_ sign_extend 32) (size!3724 (buf!4176 thiss!1577))) ((_ sign_extend 32) (currentByte!7795 thiss!1577)) ((_ sign_extend 32) (currentBit!7790 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164993 () Bool)

(assert (=> b!164993 (= e!114111 (and (bvsle (bvadd (currentBit!7790 thiss!1577) nBits!511) #b00000000000000000000000000001000) (bvsge (bvsub #b00000000000000000000000000001000 (bvadd (currentBit!7790 thiss!1577) nBits!511)) #b00000000000000000000000000001001)))))

(declare-fun b!164994 () Bool)

(declare-fun array_inv!3465 (array!8328) Bool)

(assert (=> b!164994 (= e!114109 (array_inv!3465 (buf!4176 thiss!1577)))))

(assert (= (and start!35048 res!137452) b!164992))

(assert (= (and b!164992 res!137453) b!164993))

(assert (= start!35048 b!164994))

(declare-fun m!262339 () Bool)

(assert (=> start!35048 m!262339))

(declare-fun m!262341 () Bool)

(assert (=> b!164992 m!262341))

(declare-fun m!262343 () Bool)

(assert (=> b!164994 m!262343))

(push 1)

(assert (not start!35048))

(assert (not b!164994))

(assert (not b!164992))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57055 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57055 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7790 thiss!1577) (currentByte!7795 thiss!1577) (size!3724 (buf!4176 thiss!1577))))))

(declare-fun bs!14159 () Bool)

(assert (= bs!14159 d!57055))

(declare-fun m!262361 () Bool)

(assert (=> bs!14159 m!262361))

(assert (=> start!35048 d!57055))

(declare-fun d!57057 () Bool)

(assert (=> d!57057 (= (array_inv!3465 (buf!4176 thiss!1577)) (bvsge (size!3724 (buf!4176 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164994 d!57057))

(declare-fun d!57059 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57059 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3724 (buf!4176 thiss!1577))) ((_ sign_extend 32) (currentByte!7795 thiss!1577)) ((_ sign_extend 32) (currentBit!7790 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3724 (buf!4176 thiss!1577))) ((_ sign_extend 32) (currentByte!7795 thiss!1577)) ((_ sign_extend 32) (currentBit!7790 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14160 () Bool)

(assert (= bs!14160 d!57059))

(declare-fun m!262363 () Bool)

(assert (=> bs!14160 m!262363))

(assert (=> b!164992 d!57059))

(push 1)

(assert (not d!57059))

(assert (not d!57055))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57071 () Bool)

(assert (=> d!57071 (= (remainingBits!0 ((_ sign_extend 32) (size!3724 (buf!4176 thiss!1577))) ((_ sign_extend 32) (currentByte!7795 thiss!1577)) ((_ sign_extend 32) (currentBit!7790 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3724 (buf!4176 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7795 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7790 thiss!1577)))))))

(assert (=> d!57059 d!57071))

(declare-fun d!57073 () Bool)

(assert (=> d!57073 (= (invariant!0 (currentBit!7790 thiss!1577) (currentByte!7795 thiss!1577) (size!3724 (buf!4176 thiss!1577))) (and (bvsge (currentBit!7790 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7790 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7795 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7795 thiss!1577) (size!3724 (buf!4176 thiss!1577))) (and (= (currentBit!7790 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7795 thiss!1577) (size!3724 (buf!4176 thiss!1577)))))))))

(assert (=> d!57055 d!57073))

(push 1)

(check-sat)

