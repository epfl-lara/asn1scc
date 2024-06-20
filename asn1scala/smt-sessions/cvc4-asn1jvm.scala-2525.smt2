; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63760 () Bool)

(assert start!63760)

(declare-fun res!235327 () Bool)

(declare-fun e!203049 () Bool)

(assert (=> start!63760 (=> (not res!235327) (not e!203049))))

(declare-datatypes ((array!16624 0))(
  ( (array!16625 (arr!8169 (Array (_ BitVec 32) (_ BitVec 8))) (size!7173 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12716 0))(
  ( (BitStream!12717 (buf!7419 array!16624) (currentByte!13762 (_ BitVec 32)) (currentBit!13757 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12716)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63760 (= res!235327 (validate_offset_bits!1 ((_ sign_extend 32) (size!7173 (buf!7419 thiss!1929))) ((_ sign_extend 32) (currentByte!13762 thiss!1929)) ((_ sign_extend 32) (currentBit!13757 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13757 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63760 e!203049))

(declare-fun e!203048 () Bool)

(declare-fun inv!12 (BitStream!12716) Bool)

(assert (=> start!63760 (and (inv!12 thiss!1929) e!203048)))

(declare-fun b!284062 () Bool)

(declare-fun res!235328 () Bool)

(assert (=> b!284062 (=> (not res!235328) (not e!203049))))

(assert (=> b!284062 (= res!235328 (not (= (currentBit!13757 thiss!1929) #b00000000000000000000000000000000)))))

(declare-fun b!284063 () Bool)

(assert (=> b!284063 (= e!203049 (not (inv!12 (BitStream!12717 (buf!7419 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13762 thiss!1929)) #b00000000000000000000000000000000))))))

(declare-fun b!284064 () Bool)

(declare-fun array_inv!6866 (array!16624) Bool)

(assert (=> b!284064 (= e!203048 (array_inv!6866 (buf!7419 thiss!1929)))))

(assert (= (and start!63760 res!235327) b!284062))

(assert (= (and b!284062 res!235328) b!284063))

(assert (= start!63760 b!284064))

(declare-fun m!417217 () Bool)

(assert (=> start!63760 m!417217))

(declare-fun m!417219 () Bool)

(assert (=> start!63760 m!417219))

(declare-fun m!417221 () Bool)

(assert (=> b!284063 m!417221))

(declare-fun m!417223 () Bool)

(assert (=> b!284064 m!417223))

(push 1)

(assert (not start!63760))

(assert (not b!284064))

(assert (not b!284063))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97724 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97724 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7173 (buf!7419 thiss!1929))) ((_ sign_extend 32) (currentByte!13762 thiss!1929)) ((_ sign_extend 32) (currentBit!13757 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13757 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7173 (buf!7419 thiss!1929))) ((_ sign_extend 32) (currentByte!13762 thiss!1929)) ((_ sign_extend 32) (currentBit!13757 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13757 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24699 () Bool)

(assert (= bs!24699 d!97724))

(declare-fun m!417231 () Bool)

(assert (=> bs!24699 m!417231))

(assert (=> start!63760 d!97724))

(declare-fun d!97732 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97732 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13757 thiss!1929) (currentByte!13762 thiss!1929) (size!7173 (buf!7419 thiss!1929))))))

(declare-fun bs!24703 () Bool)

(assert (= bs!24703 d!97732))

(declare-fun m!417239 () Bool)

(assert (=> bs!24703 m!417239))

(assert (=> start!63760 d!97732))

(declare-fun d!97738 () Bool)

(assert (=> d!97738 (= (array_inv!6866 (buf!7419 thiss!1929)) (bvsge (size!7173 (buf!7419 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284064 d!97738))

(declare-fun d!97740 () Bool)

(assert (=> d!97740 (= (inv!12 (BitStream!12717 (buf!7419 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13762 thiss!1929)) #b00000000000000000000000000000000)) (invariant!0 (currentBit!13757 (BitStream!12717 (buf!7419 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13762 thiss!1929)) #b00000000000000000000000000000000)) (currentByte!13762 (BitStream!12717 (buf!7419 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13762 thiss!1929)) #b00000000000000000000000000000000)) (size!7173 (buf!7419 (BitStream!12717 (buf!7419 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13762 thiss!1929)) #b00000000000000000000000000000000)))))))

(declare-fun bs!24704 () Bool)

(assert (= bs!24704 d!97740))

(declare-fun m!417241 () Bool)

(assert (=> bs!24704 m!417241))

(assert (=> b!284063 d!97740))

(push 1)

(assert (not d!97724))

(assert (not d!97740))

(assert (not d!97732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97754 () Bool)

(assert (=> d!97754 (= (remainingBits!0 ((_ sign_extend 32) (size!7173 (buf!7419 thiss!1929))) ((_ sign_extend 32) (currentByte!13762 thiss!1929)) ((_ sign_extend 32) (currentBit!13757 thiss!1929))) (bvsub (bvmul ((_ sign_extend 32) (size!7173 (buf!7419 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13762 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13757 thiss!1929)))))))

(assert (=> d!97724 d!97754))

(declare-fun d!97756 () Bool)

(assert (=> d!97756 (= (invariant!0 (currentBit!13757 (BitStream!12717 (buf!7419 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13762 thiss!1929)) #b00000000000000000000000000000000)) (currentByte!13762 (BitStream!12717 (buf!7419 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13762 thiss!1929)) #b00000000000000000000000000000000)) (size!7173 (buf!7419 (BitStream!12717 (buf!7419 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13762 thiss!1929)) #b00000000000000000000000000000000)))) (and (bvsge (currentBit!13757 (BitStream!12717 (buf!7419 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13762 thiss!1929)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (bvslt (currentBit!13757 (BitStream!12717 (buf!7419 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13762 thiss!1929)) #b00000000000000000000000000000000)) #b00000000000000000000000000001000) (bvsge (currentByte!13762 (BitStream!12717 (buf!7419 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13762 thiss!1929)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13762 (BitStream!12717 (buf!7419 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13762 thiss!1929)) #b00000000000000000000000000000000)) (size!7173 (buf!7419 (BitStream!12717 (buf!7419 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13762 thiss!1929)) #b00000000000000000000000000000000)))) (and (= (currentBit!13757 (BitStream!12717 (buf!7419 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13762 thiss!1929)) #b00000000000000000000000000000000)) #b00000000000000000000000000000000) (= (currentByte!13762 (BitStream!12717 (buf!7419 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13762 thiss!1929)) #b00000000000000000000000000000000)) (size!7173 (buf!7419 (BitStream!12717 (buf!7419 thiss!1929) (bvadd #b00000000000000000000000000000001 (currentByte!13762 thiss!1929)) #b00000000000000000000000000000000))))))))))

(assert (=> d!97740 d!97756))

(declare-fun d!97758 () Bool)

(assert (=> d!97758 (= (invariant!0 (currentBit!13757 thiss!1929) (currentByte!13762 thiss!1929) (size!7173 (buf!7419 thiss!1929))) (and (bvsge (currentBit!13757 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13757 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13762 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13762 thiss!1929) (size!7173 (buf!7419 thiss!1929))) (and (= (currentBit!13757 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13762 thiss!1929) (size!7173 (buf!7419 thiss!1929)))))))))

(assert (=> d!97732 d!97758))

(push 1)

(check-sat)

(pop 1)

