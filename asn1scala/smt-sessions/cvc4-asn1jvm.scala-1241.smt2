; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35112 () Bool)

(assert start!35112)

(declare-fun res!137546 () Bool)

(declare-fun e!114235 () Bool)

(assert (=> start!35112 (=> (not res!137546) (not e!114235))))

(declare-fun nBits!511 () (_ BitVec 32))

(assert (=> start!35112 (= res!137546 (and (bvsge nBits!511 #b00000000000000000000000000000001) (bvslt nBits!511 #b00000000000000000000000000001000)))))

(assert (=> start!35112 e!114235))

(assert (=> start!35112 true))

(declare-datatypes ((array!8360 0))(
  ( (array!8361 (arr!4659 (Array (_ BitVec 32) (_ BitVec 8))) (size!3738 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!6632 0))(
  ( (BitStream!6633 (buf!4190 array!8360) (currentByte!7819 (_ BitVec 32)) (currentBit!7814 (_ BitVec 32))) )
))
(declare-fun thiss!1577 () BitStream!6632)

(declare-fun e!114237 () Bool)

(declare-fun inv!12 (BitStream!6632) Bool)

(assert (=> start!35112 (and (inv!12 thiss!1577) e!114237)))

(declare-fun b!165127 () Bool)

(declare-fun res!137545 () Bool)

(assert (=> b!165127 (=> (not res!137545) (not e!114235))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!165127 (= res!137545 (validate_offset_bits!1 ((_ sign_extend 32) (size!3738 (buf!4190 thiss!1577))) ((_ sign_extend 32) (currentByte!7819 thiss!1577)) ((_ sign_extend 32) (currentBit!7814 thiss!1577)) ((_ sign_extend 32) nBits!511)))))

(declare-fun b!165128 () Bool)

(assert (=> b!165128 (= e!114235 (and (bvsle (bvadd (currentBit!7814 thiss!1577) nBits!511) #b00000000000000000000000000001000) (or (bvslt (currentByte!7819 thiss!1577) #b00000000000000000000000000000000) (bvsge (currentByte!7819 thiss!1577) (size!3738 (buf!4190 thiss!1577))))))))

(declare-fun b!165129 () Bool)

(declare-fun array_inv!3479 (array!8360) Bool)

(assert (=> b!165129 (= e!114237 (array_inv!3479 (buf!4190 thiss!1577)))))

(assert (= (and start!35112 res!137546) b!165127))

(assert (= (and b!165127 res!137545) b!165128))

(assert (= start!35112 b!165129))

(declare-fun m!262501 () Bool)

(assert (=> start!35112 m!262501))

(declare-fun m!262503 () Bool)

(assert (=> b!165127 m!262503))

(declare-fun m!262505 () Bool)

(assert (=> b!165129 m!262505))

(push 1)

(assert (not b!165127))

(assert (not start!35112))

(assert (not b!165129))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57107 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!57107 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!3738 (buf!4190 thiss!1577))) ((_ sign_extend 32) (currentByte!7819 thiss!1577)) ((_ sign_extend 32) (currentBit!7814 thiss!1577)) ((_ sign_extend 32) nBits!511)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!3738 (buf!4190 thiss!1577))) ((_ sign_extend 32) (currentByte!7819 thiss!1577)) ((_ sign_extend 32) (currentBit!7814 thiss!1577))) ((_ sign_extend 32) nBits!511)))))

(declare-fun bs!14182 () Bool)

(assert (= bs!14182 d!57107))

(declare-fun m!262515 () Bool)

(assert (=> bs!14182 m!262515))

(assert (=> b!165127 d!57107))

(declare-fun d!57109 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!57109 (= (inv!12 thiss!1577) (invariant!0 (currentBit!7814 thiss!1577) (currentByte!7819 thiss!1577) (size!3738 (buf!4190 thiss!1577))))))

(declare-fun bs!14183 () Bool)

(assert (= bs!14183 d!57109))

(declare-fun m!262517 () Bool)

(assert (=> bs!14183 m!262517))

(assert (=> start!35112 d!57109))

(declare-fun d!57111 () Bool)

(assert (=> d!57111 (= (array_inv!3479 (buf!4190 thiss!1577)) (bvsge (size!3738 (buf!4190 thiss!1577)) #b00000000000000000000000000000000))))

(assert (=> b!165129 d!57111))

(push 1)

(assert (not d!57109))

(assert (not d!57107))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!57121 () Bool)

(assert (=> d!57121 (= (invariant!0 (currentBit!7814 thiss!1577) (currentByte!7819 thiss!1577) (size!3738 (buf!4190 thiss!1577))) (and (bvsge (currentBit!7814 thiss!1577) #b00000000000000000000000000000000) (bvslt (currentBit!7814 thiss!1577) #b00000000000000000000000000001000) (bvsge (currentByte!7819 thiss!1577) #b00000000000000000000000000000000) (or (bvslt (currentByte!7819 thiss!1577) (size!3738 (buf!4190 thiss!1577))) (and (= (currentBit!7814 thiss!1577) #b00000000000000000000000000000000) (= (currentByte!7819 thiss!1577) (size!3738 (buf!4190 thiss!1577)))))))))

(assert (=> d!57109 d!57121))

(declare-fun d!57123 () Bool)

(assert (=> d!57123 (= (remainingBits!0 ((_ sign_extend 32) (size!3738 (buf!4190 thiss!1577))) ((_ sign_extend 32) (currentByte!7819 thiss!1577)) ((_ sign_extend 32) (currentBit!7814 thiss!1577))) (bvsub (bvmul ((_ sign_extend 32) (size!3738 (buf!4190 thiss!1577))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!7819 thiss!1577)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!7814 thiss!1577)))))))

(assert (=> d!57107 d!57123))

(push 1)

(check-sat)

