; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35748 () Bool)

(assert start!35748)

(declare-fun res!138578 () Bool)

(declare-fun e!115279 () Bool)

(assert (=> start!35748 (=> (not res!138578) (not e!115279))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35748 (= res!138578 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35748 e!115279))

(assert (=> start!35748 true))

(declare-datatypes ((array!8505 0))(
  ( (array!8506 (arr!4711 (Array (_ BitVec 32) (_ BitVec 8))) (size!3790 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6736 0))(
  ( (BitStream!6737 (buf!4242 array!8505) (currentByte!7982 (_ BitVec 32)) (currentBit!7977 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6736)

(declare-fun e!115280 () Bool)

(declare-fun inv!12 (BitStream!6736) Bool)

(assert (=> start!35748 (and (inv!12 thiss!1577) e!115280)))

(declare-fun b!166420 () Bool)

(declare-fun res!138577 () Bool)

(assert (=> b!166420 (=> (not res!138577) (not e!115279))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166420 (= res!138577 (validate_offset_bits!1 ((_ sign_extend 32) (size!3790 (buf!4242 thiss!1577))) ((_ sign_extend 32) (currentByte!7982 thiss!1577)) ((_ sign_extend 32) (currentBit!7977 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166421 () Bool)

(assert (=> b!166421 (= e!115279 (and (bvsgt (bvadd (currentBit!7977 thiss!1577) nBits!511) #b00000000000000000000000000001000) (let ((bdg!10015 (bvsub #b00000000000000000000000000001000 (bvsub (bvadd (currentBit!7977 thiss!1577) nBits!511) #b00000000000000000000000000001000)))) (or (bvslt bdg!10015 #b00000000000000000000000000000000) (bvsge bdg!10015 #b00000000000000000000000000001001)))))))

(declare-fun b!166422 () Bool)

(declare-fun array_inv!3531 (array!8505) Bool)

(assert (=> b!166422 (= e!115280 (array_inv!3531 (buf!4242 thiss!1577)))))

(assert (= (and start!35748 res!138578) b!166420))

(assert (= (and b!166420 res!138577) b!166421))

(assert (= start!35748 b!166422))

(declare-fun m!264391 () Bool)

(assert (=> start!35748 m!264391))

(declare-fun m!264393 () Bool)

(assert (=> b!166420 m!264393))

(declare-fun m!264395 () Bool)

(assert (=> b!166422 m!264395))

(push 1)

(assert (not start!35748))

(assert (not b!166420))

(assert (not b!166422))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58005 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!58005 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7977 thiss!1577) (currentByte!7982 thiss!1577) (size!3790 (buf!4242 thiss!1577))))))

(declare-fun bs!14388 () Bool)

(assert (= bs!14388 d!58005))

(declare-fun m!264413 () Bool)

(assert (=> bs!14388 m!264413))

(assert (=> start!35748 d!58005))

(declare-fun d!58007 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!58007 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3790 (buf!4242 thiss!1577))) ((_ sign_extend 32) (currentByte!7982 thiss!1577)) ((_ sign_extend 32) (currentBit!7977 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3790 (buf!4242 thiss!1577))) ((_ sign_extend 32) (currentByte!7982 thiss!1577)) ((_ sign_extend 32) (currentBit!7977 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14389 () Bool)

(assert (= bs!14389 d!58007))

(declare-fun m!264415 () Bool)

(assert (=> bs!14389 m!264415))

(assert (=> b!166420 d!58007))

(declare-fun d!58009 () Bool)

(assert (=> d!58009 (= (array_inv!3531 (buf!4242 thiss!1577)) (bvsge (size!3790 (buf!4242 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166422 d!58009))

(push 1)

(assert (not d!58005))

(assert (not d!58007))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!58021 () Bool)

(assert (=> d!58021 (= (invariant!0 (currentBit!7977 thiss!1577) (currentByte!7982 thiss!1577) (size!3790 (buf!4242 thiss!1577))) (and (bvsge (currentBit!7977 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7977 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7982 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7982 thiss!1577) (size!3790 (buf!4242 thiss!1577))) (and (= (currentBit!7977 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7982 thiss!1577) (size!3790 (buf!4242 thiss!1577)))))))))

(assert (=> d!58005 d!58021))

(declare-fun d!58023 () Bool)

(assert (=> d!58023 (= (remainingBits!0 ((_ sign_extend 32) (size!3790 (buf!4242 thiss!1577))) ((_ sign_extend 32) (currentByte!7982 thiss!1577)) ((_ sign_extend 32) (currentBit!7977 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3790 (buf!4242 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7982 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7977 thiss!1577)))))))

(assert (=> d!58007 d!58023))

(push 1)

(check-sat)

