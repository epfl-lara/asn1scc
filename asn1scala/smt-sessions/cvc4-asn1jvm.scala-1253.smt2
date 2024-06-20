; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35570 () Bool)

(assert start!35570)

(declare-fun res!138472 () Bool)

(declare-fun e!115136 () Bool)

(assert (=> start!35570 (=> (not res!138472) (not e!115136))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35570 (= res!138472 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35570 e!115136))

(assert (=> start!35570 true))

(declare-datatypes ((array!8458 0))(
  ( (array!8459 (arr!4695 (Array (_ BitVec 32) (_ BitVec 8))) (size!3774 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6704 0))(
  ( (BitStream!6705 (buf!4226 array!8458) (currentByte!7923 (_ BitVec 32)) (currentBit!7918 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6704)

(declare-fun e!115135 () Bool)

(declare-fun inv!12 (BitStream!6704) Bool)

(assert (=> start!35570 (and (inv!12 thiss!1577) e!115135)))

(declare-fun b!166267 () Bool)

(declare-fun res!138473 () Bool)

(assert (=> b!166267 (=> (not res!138473) (not e!115136))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166267 (= res!138473 (validate_offset_bits!1 ((_ sign_extend 32) (size!3774 (buf!4226 thiss!1577))) ((_ sign_extend 32) (currentByte!7923 thiss!1577)) ((_ sign_extend 32) (currentBit!7918 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166268 () Bool)

(assert (=> b!166268 (= e!115136 (and (bvsgt (bvadd (currentBit!7918 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (currentByte!7923 thiss!1577) #b00000000000000000000000000000000) (bvsge (currentByte!7923 thiss!1577) (size!3774 (buf!4226 thiss!1577))))))))

(declare-fun b!166269 () Bool)

(declare-fun array_inv!3515 (array!8458) Bool)

(assert (=> b!166269 (= e!115135 (array_inv!3515 (buf!4226 thiss!1577)))))

(assert (= (and start!35570 res!138472) b!166267))

(assert (= (and b!166267 res!138473) b!166268))

(assert (= start!35570 b!166269))

(declare-fun m!264199 () Bool)

(assert (=> start!35570 m!264199))

(declare-fun m!264201 () Bool)

(assert (=> b!166267 m!264201))

(declare-fun m!264203 () Bool)

(assert (=> b!166269 m!264203))

(push 1)

(assert (not b!166267))

(assert (not start!35570))

(assert (not b!166269))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57845 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57845 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3774 (buf!4226 thiss!1577))) ((_ sign_extend 32) (currentByte!7923 thiss!1577)) ((_ sign_extend 32) (currentBit!7918 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3774 (buf!4226 thiss!1577))) ((_ sign_extend 32) (currentByte!7923 thiss!1577)) ((_ sign_extend 32) (currentBit!7918 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14339 () Bool)

(assert (= bs!14339 d!57845))

(declare-fun m!264213 () Bool)

(assert (=> bs!14339 m!264213))

(assert (=> b!166267 d!57845))

(declare-fun d!57847 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57847 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7918 thiss!1577) (currentByte!7923 thiss!1577) (size!3774 (buf!4226 thiss!1577))))))

(declare-fun bs!14340 () Bool)

(assert (= bs!14340 d!57847))

(declare-fun m!264215 () Bool)

(assert (=> bs!14340 m!264215))

(assert (=> start!35570 d!57847))

(declare-fun d!57851 () Bool)

(assert (=> d!57851 (= (array_inv!3515 (buf!4226 thiss!1577)) (bvsge (size!3774 (buf!4226 thiss!1577)) #b00000000000000000000000000000000))))

