; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35254 () Bool)

(assert start!35254)

(declare-fun res!137611 () Bool)

(declare-fun e!114335 () Bool)

(assert (=> start!35254 (=> (not res!137611) (not e!114335))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35254 (= res!137611 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35254 e!114335))

(assert (=> start!35254 true))

(declare-datatypes ((array!8394 0))(
  ( (array!8395 (arr!4670 (Array (_ BitVec 32) (_ BitVec 8))) (size!3749 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6654 0))(
  ( (BitStream!6655 (buf!4201 array!8394) (currentByte!7866 (_ BitVec 32)) (currentBit!7861 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6654)

(declare-fun e!114336 () Bool)

(declare-fun inv!12 (BitStream!6654) Bool)

(assert (=> start!35254 (and (inv!12 thiss!1577) e!114336)))

(declare-fun b!165226 () Bool)

(declare-fun res!137612 () Bool)

(assert (=> b!165226 (=> (not res!137612) (not e!114335))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165226 (= res!137612 (validate_offset_bits!1 ((_ sign_extend 32) (size!3749 (buf!4201 thiss!1577))) ((_ sign_extend 32) (currentByte!7866 thiss!1577)) ((_ sign_extend 32) (currentBit!7861 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165227 () Bool)

(assert (=> b!165227 (= e!114335 (and (bvsle (bvadd (currentBit!7861 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvsgt #b00000000000000000000000000000000 (currentByte!7866 thiss!1577)) (bvsge (currentByte!7866 thiss!1577) (size!3749 (buf!4201 thiss!1577))))))))

(declare-fun b!165228 () Bool)

(declare-fun array_inv!3490 (array!8394) Bool)

(assert (=> b!165228 (= e!114336 (array_inv!3490 (buf!4201 thiss!1577)))))

(assert (= (and start!35254 res!137611) b!165226))

(assert (= (and b!165226 res!137612) b!165227))

(assert (= start!35254 b!165228))

(declare-fun m!262615 () Bool)

(assert (=> start!35254 m!262615))

(declare-fun m!262617 () Bool)

(assert (=> b!165226 m!262617))

(declare-fun m!262619 () Bool)

(assert (=> b!165228 m!262619))

(check-sat (not b!165226) (not b!165228) (not start!35254))
(check-sat)
(get-model)

(declare-fun d!57223 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57223 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3749 (buf!4201 thiss!1577))) ((_ sign_extend 32) (currentByte!7866 thiss!1577)) ((_ sign_extend 32) (currentBit!7861 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3749 (buf!4201 thiss!1577))) ((_ sign_extend 32) (currentByte!7866 thiss!1577)) ((_ sign_extend 32) (currentBit!7861 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14214 () Bool)

(assert (= bs!14214 d!57223))

(declare-fun m!262627 () Bool)

(assert (=> bs!14214 m!262627))

(assert (=> b!165226 d!57223))

(declare-fun d!57225 () Bool)

(assert (=> d!57225 (= (array_inv!3490 (buf!4201 thiss!1577)) (bvsge (size!3749 (buf!4201 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165228 d!57225))

(declare-fun d!57227 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57227 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7861 thiss!1577) (currentByte!7866 thiss!1577) (size!3749 (buf!4201 thiss!1577))))))

(declare-fun bs!14215 () Bool)

(assert (= bs!14215 d!57227))

(declare-fun m!262629 () Bool)

(assert (=> bs!14215 m!262629))

(assert (=> start!35254 d!57227))

(check-sat (not d!57227) (not d!57223))
(check-sat)
(get-model)

(declare-fun d!57241 () Bool)

(assert (=> d!57241 (= (invariant!0 (currentBit!7861 thiss!1577) (currentByte!7866 thiss!1577) (size!3749 (buf!4201 thiss!1577))) (and (bvsge (currentBit!7861 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7861 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7866 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7866 thiss!1577) (size!3749 (buf!4201 thiss!1577))) (and (= (currentBit!7861 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7866 thiss!1577) (size!3749 (buf!4201 thiss!1577)))))))))

(assert (=> d!57227 d!57241))

(declare-fun d!57243 () Bool)

(assert (=> d!57243 (= (remainingBits!0 ((_ sign_extend 32) (size!3749 (buf!4201 thiss!1577))) ((_ sign_extend 32) (currentByte!7866 thiss!1577)) ((_ sign_extend 32) (currentBit!7861 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3749 (buf!4201 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7866 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7861 thiss!1577)))))))

(assert (=> d!57223 d!57243))

(check-sat)
