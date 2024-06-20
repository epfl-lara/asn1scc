; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73416 () Bool)

(assert start!73416)

(declare-fun res!267169 () Bool)

(declare-fun e!234777 () Bool)

(assert (=> start!73416 (=> (not res!267169) (not e!234777))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73416 (= res!267169 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73416 e!234777))

(assert (=> start!73416 true))

(declare-fun lt!448088 () (_ BitVec 64))

(declare-fun b!325573 () Bool)

(declare-fun lt!448087 () (_ BitVec 64))

(assert (=> b!325573 (= e!234777 (and (or (not (= lt!448088 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448088 (bvand (bvadd lt!448087 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or (bvsgt ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) currentBit!38) #b0000000000000000000000000000000001111111111111111111111111111111))))))

(assert (=> b!325573 (= lt!448088 (bvand lt!448087 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325573 (= lt!448087 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(assert (= (and start!73416 res!267169) b!325573))

(declare-fun m!463573 () Bool)

(assert (=> start!73416 m!463573))

(push 1)

(assert (not start!73416))

(check-sat)

(pop 1)

(push 1)

(check-sat)

