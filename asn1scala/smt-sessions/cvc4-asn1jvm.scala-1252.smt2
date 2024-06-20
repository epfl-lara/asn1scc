; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35546 () Bool)

(assert start!35546)

(declare-fun b!166241 () Bool)

(declare-fun nBits!511 () (_ BitVec 32))

(declare-fun e!115110 () Bool)

(declare-datatypes ((array!8449 0))(
  ( (array!8450 (arr!4692 (Array (_ BitVec 32) (_ BitVec 8))) (size!3771 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6698 0))(
  ( (BitStream!6699 (buf!4223 array!8449) (currentByte!7917 (_ BitVec 32)) (currentBit!7912 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6698)

(declare-fun v!206 () (_ BitVec 8))

(declare-fun inv!12 (BitStream!6698) Bool)

(assert (=> b!166241 (= e!115110 (not (inv!12 (BitStream!6699 (array!8450 (store (arr!4692 (buf!4223 thiss!1577)) (currentByte!7917 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4692 (buf!4223 thiss!1577)) (currentByte!7917 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7912 thiss!1577)))))))) (bvlshr (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) #b00000000000000000000000011111111) (bvsub (bvadd (currentBit!7912 thiss!1577) nBits!511) #b00000000000000000000000000001000))))) (size!3771 (buf!4223 thiss!1577))) (currentByte!7917 thiss!1577) (currentBit!7912 thiss!1577)))))))

(declare-fun res!138454 () Bool)

(assert (=> start!35546 (=> (not res!138454) (not e!115110))))

(assert (=> start!35546 (= res!138454 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35546 e!115110))

(assert (=> start!35546 true))

(declare-fun e!115109 () Bool)

(assert (=> start!35546 (and (inv!12 thiss!1577) e!115109)))

(declare-fun b!166242 () Bool)

(declare-fun array_inv!3512 (array!8449) Bool)

(assert (=> b!166242 (= e!115109 (array_inv!3512 (buf!4223 thiss!1577)))))

(declare-fun b!166240 () Bool)

(declare-fun res!138453 () Bool)

(assert (=> b!166240 (=> (not res!138453) (not e!115110))))

(assert (=> b!166240 (= res!138453 (bvsgt (bvadd (currentBit!7912 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!166239 () Bool)

(declare-fun res!138455 () Bool)

(assert (=> b!166239 (=> (not res!138455) (not e!115110))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166239 (= res!138455 (validate_offset_bits!1 ((_ sign_extend 32) (size!3771 (buf!4223 thiss!1577))) ((_ sign_extend 32) (currentByte!7917 thiss!1577)) ((_ sign_extend 32) (currentBit!7912 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(assert (= (and start!35546 res!138454) b!166239))

(assert (= (and b!166239 res!138455) b!166240))

(assert (= (and b!166240 res!138453) b!166241))

(assert (= start!35546 b!166242))

(declare-fun m!264153 () Bool)

(assert (=> b!166241 m!264153))

(declare-fun m!264155 () Bool)

(assert (=> b!166241 m!264155))

(declare-fun m!264157 () Bool)

(assert (=> b!166241 m!264157))

(declare-fun m!264159 () Bool)

(assert (=> b!166241 m!264159))

(declare-fun m!264161 () Bool)

(assert (=> b!166241 m!264161))

(declare-fun m!264163 () Bool)

(assert (=> start!35546 m!264163))

(declare-fun m!264165 () Bool)

(assert (=> b!166242 m!264165))

(declare-fun m!264167 () Bool)

(assert (=> b!166239 m!264167))

(push 1)

(assert (not start!35546))

(assert (not b!166239))

(assert (not b!166241))

(assert (not b!166242))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57815 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57815 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7912 thiss!1577) (currentByte!7917 thiss!1577) (size!3771 (buf!4223 thiss!1577))))))

(declare-fun bs!14327 () Bool)

(assert (= bs!14327 d!57815))

(declare-fun m!264177 () Bool)

(assert (=> bs!14327 m!264177))

(assert (=> start!35546 d!57815))

(declare-fun d!57819 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57819 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3771 (buf!4223 thiss!1577))) ((_ sign_extend 32) (currentByte!7917 thiss!1577)) ((_ sign_extend 32) (currentBit!7912 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3771 (buf!4223 thiss!1577))) ((_ sign_extend 32) (currentByte!7917 thiss!1577)) ((_ sign_extend 32) (currentBit!7912 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14329 () Bool)

(assert (= bs!14329 d!57819))

