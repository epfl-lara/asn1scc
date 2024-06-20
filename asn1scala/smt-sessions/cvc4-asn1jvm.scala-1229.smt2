; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34916 () Bool)

(assert start!34916)

(declare-fun res!137320 () Bool)

(declare-fun e!113913 () Bool)

(assert (=> start!34916 (=> (not res!137320) (not e!113913))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!34916 (= res!137320 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!34916 e!113913))

(assert (=> start!34916 true))

(declare-datatypes ((array!8275 0))(
  ( (array!8276 (arr!4623 (Array (_ BitVec 32) (_ BitVec 8))) (size!3702 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6560 0))(
  ( (BitStream!6561 (buf!4154 array!8275) (currentByte!7747 (_ BitVec 32)) (currentBit!7742 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6560)

(declare-fun e!113911 () Bool)

(declare-fun inv!12 (BitStream!6560) Bool)

(assert (=> start!34916 (and (inv!12 thiss!1577) e!113911)))

(declare-fun b!164794 () Bool)

(declare-fun res!137321 () Bool)

(assert (=> b!164794 (=> (not res!137321) (not e!113913))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!164794 (= res!137321 (validate_offset_bits!1 ((_ sign_extend 32) (size!3702 (buf!4154 thiss!1577))) ((_ sign_extend 32) (currentByte!7747 thiss!1577)) ((_ sign_extend 32) (currentBit!7742 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!164795 () Bool)

(assert (=> b!164795 (= e!113913 (and (not (= #b00000000000000000000000000000000 (bvand (currentBit!7742 thiss!1577) #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 (currentBit!7742 thiss!1577)) #b10000000000000000000000000000000)))))))

(declare-fun b!164796 () Bool)

(declare-fun array_inv!3443 (array!8275) Bool)

(assert (=> b!164796 (= e!113911 (array_inv!3443 (buf!4154 thiss!1577)))))

(assert (= (and start!34916 res!137320) b!164794))

(assert (= (and b!164794 res!137321) b!164795))

(assert (= start!34916 b!164796))

(declare-fun m!262147 () Bool)

(assert (=> start!34916 m!262147))

(declare-fun m!262149 () Bool)

(assert (=> b!164794 m!262149))

(declare-fun m!262151 () Bool)

(assert (=> b!164796 m!262151))

(push 1)

(assert (not b!164794))

(assert (not start!34916))

(assert (not b!164796))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56953 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!56953 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3702 (buf!4154 thiss!1577))) ((_ sign_extend 32) (currentByte!7747 thiss!1577)) ((_ sign_extend 32) (currentBit!7742 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3702 (buf!4154 thiss!1577))) ((_ sign_extend 32) (currentByte!7747 thiss!1577)) ((_ sign_extend 32) (currentBit!7742 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14118 () Bool)

(assert (= bs!14118 d!56953))

(declare-fun m!262159 () Bool)

(assert (=> bs!14118 m!262159))

(assert (=> b!164794 d!56953))

(declare-fun d!56959 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!56959 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7742 thiss!1577) (currentByte!7747 thiss!1577) (size!3702 (buf!4154 thiss!1577))))))

(declare-fun bs!14120 () Bool)

(assert (= bs!14120 d!56959))

(declare-fun m!262163 () Bool)

(assert (=> bs!14120 m!262163))

(assert (=> start!34916 d!56959))

(declare-fun d!56961 () Bool)

(assert (=> d!56961 (= (array_inv!3443 (buf!4154 thiss!1577)) (bvsge (size!3702 (buf!4154 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!164796 d!56961))

(push 1)

(assert (not d!56953))

(assert (not d!56959))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!56971 () Bool)

(assert (=> d!56971 (= (remainingBits!0 ((_ sign_extend 32) (size!3702 (buf!4154 thiss!1577))) ((_ sign_extend 32) (currentByte!7747 thiss!1577)) ((_ sign_extend 32) (currentBit!7742 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3702 (buf!4154 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7747 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7742 thiss!1577)))))))

(assert (=> d!56953 d!56971))

(declare-fun d!56973 () Bool)

(assert (=> d!56973 (= (invariant!0 (currentBit!7742 thiss!1577) (currentByte!7747 thiss!1577) (size!3702 (buf!4154 thiss!1577))) (and (bvsge (currentBit!7742 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7742 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7747 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7747 thiss!1577) (size!3702 (buf!4154 thiss!1577))) (and (= (currentBit!7742 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7747 thiss!1577) (size!3702 (buf!4154 thiss!1577)))))))))

(assert (=> d!56959 d!56973))

(push 1)

