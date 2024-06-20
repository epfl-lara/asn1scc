; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!63566 () Bool)

(assert start!63566)

(declare-fun res!235225 () Bool)

(declare-fun e!202876 () Bool)

(assert (=> start!63566 (=> (not res!235225) (not e!202876))))

(declare-datatypes ((array!16566 0))(
  ( (array!16567 (arr!8149 (Array (_ BitVec 32) (_ BitVec 8))) (size!7153 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12676 0))(
  ( (BitStream!12677 (buf!7399 array!16566) (currentByte!13704 (_ BitVec 32)) (currentBit!13699 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12676)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63566 (= res!235225 (validate_offset_bits!1 ((_ sign_extend 32) (size!7153 (buf!7399 thiss!1929))) ((_ sign_extend 32) (currentByte!13704 thiss!1929)) ((_ sign_extend 32) (currentBit!13699 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13699 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63566 e!202876))

(declare-fun e!202878 () Bool)

(declare-fun inv!12 (BitStream!12676) Bool)

(assert (=> start!63566 (and (inv!12 thiss!1929) e!202878)))

(declare-fun b!283900 () Bool)

(declare-fun res!235226 () Bool)

(assert (=> b!283900 (=> (not res!235226) (not e!202876))))

(assert (=> b!283900 (= res!235226 (not (= (currentBit!13699 thiss!1929) #b00000000000000000000000000000000)))))

(declare-fun b!283901 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283901 (= e!202876 (not (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!13704 thiss!1929)) (size!7153 (buf!7399 thiss!1929)))))))

(declare-fun b!283902 () Bool)

(declare-fun array_inv!6846 (array!16566) Bool)

(assert (=> b!283902 (= e!202878 (array_inv!6846 (buf!7399 thiss!1929)))))

(assert (= (and start!63566 res!235225) b!283900))

(assert (= (and b!283900 res!235226) b!283901))

(assert (= start!63566 b!283902))

(declare-fun m!417015 () Bool)

(assert (=> start!63566 m!417015))

(declare-fun m!417017 () Bool)

(assert (=> start!63566 m!417017))

(declare-fun m!417019 () Bool)

(assert (=> b!283901 m!417019))

(declare-fun m!417021 () Bool)

(assert (=> b!283902 m!417021))

(push 1)

(assert (not start!63566))

(assert (not b!283902))

(assert (not b!283901))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97540 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!97540 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!7153 (buf!7399 thiss!1929))) ((_ sign_extend 32) (currentByte!13704 thiss!1929)) ((_ sign_extend 32) (currentBit!13699 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13699 thiss!1929)) #b00000000000000000000000000000111))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!7153 (buf!7399 thiss!1929))) ((_ sign_extend 32) (currentByte!13704 thiss!1929)) ((_ sign_extend 32) (currentBit!13699 thiss!1929))) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13699 thiss!1929)) #b00000000000000000000000000000111))))))

(declare-fun bs!24640 () Bool)

(assert (= bs!24640 d!97540))

(declare-fun m!417039 () Bool)

(assert (=> bs!24640 m!417039))

(assert (=> start!63566 d!97540))

(declare-fun d!97548 () Bool)

(assert (=> d!97548 (= (inv!12 thiss!1929) (invariant!0 (currentBit!13699 thiss!1929) (currentByte!13704 thiss!1929) (size!7153 (buf!7399 thiss!1929))))))

(declare-fun bs!24641 () Bool)

(assert (= bs!24641 d!97548))

(declare-fun m!417041 () Bool)

(assert (=> bs!24641 m!417041))

(assert (=> start!63566 d!97548))

(declare-fun d!97550 () Bool)

(assert (=> d!97550 (= (array_inv!6846 (buf!7399 thiss!1929)) (bvsge (size!7153 (buf!7399 thiss!1929)) #b00000000000000000000000000000000))))

(assert (=> b!283902 d!97550))

(declare-fun d!97556 () Bool)

(assert (=> d!97556 (= (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!13704 thiss!1929)) (size!7153 (buf!7399 thiss!1929))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 #b00000000000000000000000000001000) (bvsge (bvadd #b00000000000000000000000000000001 (currentByte!13704 thiss!1929)) #b00000000000000000000000000000000) (or (bvslt (bvadd #b00000000000000000000000000000001 (currentByte!13704 thiss!1929)) (size!7153 (buf!7399 thiss!1929))) (and (= #b00000000000000000000000000000000 #b00000000000000000000000000000000) (= (bvadd #b00000000000000000000000000000001 (currentByte!13704 thiss!1929)) (size!7153 (buf!7399 thiss!1929)))))))))

(assert (=> b!283901 d!97556))

(push 1)

(assert (not d!97540))

(assert (not d!97548))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!97566 () Bool)

(assert (=> d!97566 (= (remainingBits!0 ((_ sign_extend 32) (size!7153 (buf!7399 thiss!1929))) ((_ sign_extend 32) (currentByte!13704 thiss!1929)) ((_ sign_extend 32) (currentBit!13699 thiss!1929))) (bvsub (bvmul ((_ sign_extend 32) (size!7153 (buf!7399 thiss!1929))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13704 thiss!1929)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13699 thiss!1929)))))))

(assert (=> d!97540 d!97566))

(declare-fun d!97568 () Bool)

(assert (=> d!97568 (= (invariant!0 (currentBit!13699 thiss!1929) (currentByte!13704 thiss!1929) (size!7153 (buf!7399 thiss!1929))) (and (bvsge (currentBit!13699 thiss!1929) #b00000000000000000000000000000000) (bvslt (currentBit!13699 thiss!1929) #b00000000000000000000000000001000) (bvsge (currentByte!13704 thiss!1929) #b00000000000000000000000000000000) (or (bvslt (currentByte!13704 thiss!1929) (size!7153 (buf!7399 thiss!1929))) (and (= (currentBit!13699 thiss!1929) #b00000000000000000000000000000000) (= (currentByte!13704 thiss!1929) (size!7153 (buf!7399 thiss!1929)))))))))

(assert (=> d!97548 d!97568))

(push 1)

(check-sat)

