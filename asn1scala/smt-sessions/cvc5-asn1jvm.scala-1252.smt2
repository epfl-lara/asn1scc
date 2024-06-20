; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35542 () Bool)

(assert start!35542)

(declare-fun b!166218 () Bool)

(declare-fun e!115091 () Bool)

(declare-datatypes ((array!8445 0))(
  ( (array!8446 (arr!4690 (Array (_ BitVec 32) (_ BitVec 8))) (size!3769 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6694 0))(
  ( (BitStream!6695 (buf!4221 array!8445) (currentByte!7915 (_ BitVec 32)) (currentBit!7910 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6694)

(declare-fun array_inv!3510 (array!8445) Bool)

(assert (=> b!166218 (= e!115091 (array_inv!3510 (buf!4221 thiss!1577)))))

(declare-fun res!138437 () Bool)

(declare-fun e!115090 () Bool)

(assert (=> start!35542 (=> (not res!138437) (not e!115090))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35542 (= res!138437 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35542 e!115090))

(assert (=> start!35542 true))

(declare-fun inv!12 (BitStream!6694) Bool)

(assert (=> start!35542 (and (inv!12 thiss!1577) e!115091)))

(declare-fun b!166215 () Bool)

(declare-fun res!138435 () Bool)

(assert (=> b!166215 (=> (not res!138435) (not e!115090))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!166215 (= res!138435 (validate_offset_bits!1 ((_ sign_extend 32) (size!3769 (buf!4221 thiss!1577))) ((_ sign_extend 32) (currentByte!7915 thiss!1577)) ((_ sign_extend 32) (currentBit!7910 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!166216 () Bool)

(declare-fun res!138436 () Bool)

(assert (=> b!166216 (=> (not res!138436) (not e!115090))))

(assert (=> b!166216 (= res!138436 (bvsgt (bvadd (currentBit!7910 thiss!1577) nBits!511) #b00000000000000000000000000001000))))

(declare-fun b!166217 () Bool)

(declare-fun v!206 () (_ BitVec 8))

(assert (=> b!166217 (= e!115090 (not (inv!12 (BitStream!6695 (array!8446 (store (arr!4690 (buf!4221 thiss!1577)) (currentByte!7915 thiss!1577) ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!4690 (buf!4221 thiss!1577)) (currentByte!7915 thiss!1577))) ((_ sign_extend 24) ((_ extract 7 0) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (currentBit!7910 thiss!1577)))))))) (bvlshr (bvand ((_ sign_extend 24) ((_ extract 7 0) (bvand ((_ sign_extend 24) v!206) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) nBits!511))))) #b00000000000000000000000011111111) (bvsub (bvadd (currentBit!7910 thiss!1577) nBits!511) #b00000000000000000000000000001000))))) (size!3769 (buf!4221 thiss!1577))) (currentByte!7915 thiss!1577) (currentBit!7910 thiss!1577)))))))

(assert (= (and start!35542 res!138437) b!166215))

(assert (= (and b!166215 res!138435) b!166216))

(assert (= (and b!166216 res!138436) b!166217))

(assert (= start!35542 b!166218))

(declare-fun m!264121 () Bool)

(assert (=> b!166218 m!264121))

(declare-fun m!264123 () Bool)

(assert (=> start!35542 m!264123))

(declare-fun m!264125 () Bool)

(assert (=> b!166215 m!264125))

(declare-fun m!264127 () Bool)

(assert (=> b!166217 m!264127))

(declare-fun m!264129 () Bool)

(assert (=> b!166217 m!264129))

(declare-fun m!264131 () Bool)

(assert (=> b!166217 m!264131))

(declare-fun m!264133 () Bool)

(assert (=> b!166217 m!264133))

(declare-fun m!264135 () Bool)

(assert (=> b!166217 m!264135))

(push 1)

(assert (not b!166218))

(assert (not start!35542))

(assert (not b!166215))

(assert (not b!166217))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57811 () Bool)

(assert (=> d!57811 (= (array_inv!3510 (buf!4221 thiss!1577)) (bvsge (size!3769 (buf!4221 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!166218 d!57811))

(declare-fun d!57813 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57813 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7910 thiss!1577) (currentByte!7915 thiss!1577) (size!3769 (buf!4221 thiss!1577))))))

(declare-fun bs!14326 () Bool)

(assert (= bs!14326 d!57813))

(declare-fun m!264175 () Bool)

(assert (=> bs!14326 m!264175))

(assert (=> start!35542 d!57813))

(declare-fun d!57817 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57817 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3769 (buf!4221 thiss!1577))) ((_ sign_extend 32) (currentByte!7915 thiss!1577)) ((_ sign_extend 32) (currentBit!7910 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3769 (buf!4221 thiss!1577))) ((_ sign_extend 32) (currentByte!7915 thiss!1577)) ((_ sign_extend 32) (currentBit!7910 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14328 () Bool)

(assert (= bs!14328 d!57817))

(declare-fun m!264179 () Bool)

(assert (=> bs!14328 m!264179))

(assert (=> b!166215 d!57817))

