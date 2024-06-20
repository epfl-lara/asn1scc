; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63722 () Bool)

(assert start!63722)

(declare-fun res!235303 () Bool)

(declare-fun e!203013 () Bool)

(assert (=> start!63722 (=> (not res!235303) (not e!203013))))

(declare-datatypes ((array!16613 0))(
  ( (array!16614 (arr!8165 (Array (_ BitVec 32) (_ BitVec 8))) (size!7169 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12708 0))(
  ( (BitStream!12709 (buf!7415 array!16613) (currentByte!13749 (_ BitVec 32)) (currentBit!13744 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12708)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63722 (= res!235303 (validate_offset_bits!1 ((_ sign_extend 32) (size!7169 (buf!7415 thiss!1929))) ((_ sign_extend 32) (currentByte!13749 thiss!1929)) ((_ sign_extend 32) (currentBit!13744 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13744 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63722 e!203013))

(declare-fun e!203012 () Bool)

(declare-fun inv!12 (BitStream!12708) Bool)

(assert (=> start!63722 (and (inv!12 thiss!1929) e!203012)))

(declare-fun b!284026 () Bool)

(declare-fun res!235304 () Bool)

(assert (=> b!284026 (=> (not res!235304) (not e!203013))))

(assert (=> b!284026 (= res!235304 (not (= (currentBit!13744 thiss!1929) #b00000000000000000000000000000000)))))

(declare-fun b!284027 () Bool)

(assert (=> b!284027 (= e!203013 (not (inv!12 (BitStream!12709 (buf!7415 thiss!1929) (currentByte!13749 thiss!1929) #b00000000000000000000000000000000))))))

(declare-fun b!284028 () Bool)

(declare-fun array_inv!6862 (array!16613) Bool)

(assert (=> b!284028 (= e!203012 (array_inv!6862 (buf!7415 thiss!1929)))))

(assert (= (and start!63722 res!235303) b!284026))

(assert (= (and b!284026 res!235304) b!284027))

(assert (= start!63722 b!284028))

(declare-fun m!417167 () Bool)

(assert (=> start!63722 m!417167))

(declare-fun m!417169 () Bool)

(assert (=> start!63722 m!417169))

(declare-fun m!417171 () Bool)

(assert (=> b!284027 m!417171))

(declare-fun m!417173 () Bool)

(assert (=> b!284028 m!417173))

(check-sat (not b!284027) (not start!63722) (not b!284028))
(check-sat)
(get-model)

(declare-fun d!97690 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!97690 (= (inv!12 (BitStream!12709 (buf!7415 thiss!1929) (currentByte!13749 thiss!1929) #b00000000000000000000000000000000)) (invariant!0 (currentBit!13744 (BitStream!12709 (buf!7415 thiss!1929) (currentByte!13749 thiss!1929) #b00000000000000000000000000000000)) (currentByte!13749 (BitStream!12709 (buf!7415 thiss!1929) (currentByte!13749 thiss!1929) #b00000000000000000000000000000000)) (size!7169 (buf!7415 (BitStream!12709 (buf!7415 thiss!1929) (currentByte!13749 thiss!1929) #b00000000000000000000000000000000)))))))

(declare-fun bs!24690 () Bool)

(assert (= bs!24690 d!97690))

(declare-fun m!417195 () Bool)

(assert (=> bs!24690 m!417195))

(assert (=> b!284027 d!97690))

(declare-fun d!97692 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97692 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7169 (buf!7415 thiss!1929))) ((_ sign_extend 32) (currentByte!13749 thiss!1929)) ((_ sign_extend 32) (currentBit!13744 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13744 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7169 (buf!7415 thiss!1929))) ((_ sign_extend 32) (currentByte!13749 thiss!1929)) ((_ sign_extend 32) (currentBit!13744 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13744 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24691 () Bool)

(assert (= bs!24691 d!97692))

(declare-fun m!417197 () Bool)

(assert (=> bs!24691 m!417197))

(assert (=> start!63722 d!97692))

(declare-fun d!97694 () Bool)

(assert (=> d!97694 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13744 thiss!1929) (currentByte!13749 thiss!1929) (size!7169 (buf!7415 thiss!1929))))))

(declare-fun bs!24692 () Bool)

(assert (= bs!24692 d!97694))

(declare-fun m!417199 () Bool)

(assert (=> bs!24692 m!417199))

(assert (=> start!63722 d!97694))

(declare-fun d!97696 () Bool)

(assert (=> d!97696 (= (array_inv!6862 (buf!7415 thiss!1929)) (bvsge (size!7169 (buf!7415 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!284028 d!97696))

(check-sat (not d!97694) (not d!97692) (not d!97690))
(check-sat)
(get-model)

(declare-fun d!97702 () Bool)

(assert (=> d!97702 (= (invariant!0 (currentBit!13744 thiss!1929) (currentByte!13749 thiss!1929) (size!7169 (buf!7415 thiss!1929))) (and (bvsge (currentBit!13744 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13744 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13749 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13749 thiss!1929) (size!7169 (buf!7415 thiss!1929))) (and (= (currentBit!13744 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13749 thiss!1929) (size!7169 (buf!7415 thiss!1929)))))))))

(assert (=> d!97694 d!97702))

(declare-fun d!97708 () Bool)

(assert (=> d!97708 (= (remainingBits!0 ((_ sign_extend 32) (size!7169 (buf!7415 thiss!1929))) ((_ sign_extend 32) (currentByte!13749 thiss!1929)) ((_ sign_extend 32) (currentBit!13744 thiss!1929))) (bvsub (bvmul ((_ sign_extend 32) (size!7169 (buf!7415 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13749 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13744 thiss!1929)))))))

(assert (=> d!97692 d!97708))

(declare-fun d!97714 () Bool)

