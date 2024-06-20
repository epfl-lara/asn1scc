; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73436 () Bool)

(assert start!73436)

(declare-fun res!267202 () Bool)

(declare-fun e!234809 () Bool)

(assert (=> start!73436 (=> (not res!267202) (not e!234809))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73436 (= res!267202 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73436 e!234809))

(assert (=> start!73436 true))

(declare-fun b!325605 () Bool)

(declare-fun e!234810 () Bool)

(assert (=> b!325605 (= e!234809 e!234810)))

(declare-fun res!267201 () Bool)

(assert (=> b!325605 (=> (not res!267201) (not e!234810))))

(declare-fun lt!448136 () (_ BitVec 64))

(declare-fun lt!448135 () (_ BitVec 64))

(assert (=> b!325605 (= res!267201 (and (or (not (= lt!448135 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448135 (bvand (bvadd lt!448136 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))) (bvsle ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) currentBit!38) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) currentBit!38) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!325605 (= lt!448135 (bvand lt!448136 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325605 (= lt!448136 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(declare-fun b!325606 () Bool)

(assert (=> b!325606 (= e!234810 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) currentBit!38)) ((_ extract 31 0) ((_ sign_extend 32) currentByte!43)) ((_ extract 31 0) ((_ sign_extend 32) bufLength!19)))))))

(assert (= (and start!73436 res!267202) b!325605))

(assert (= (and b!325605 res!267201) b!325606))

(declare-fun m!463593 () Bool)

(assert (=> start!73436 m!463593))

(declare-fun m!463595 () Bool)

(assert (=> b!325606 m!463595))

(push 1)

(assert (not b!325606))

(assert (not start!73436))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

