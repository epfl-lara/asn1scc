; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73420 () Bool)

(assert start!73420)

(declare-fun res!267175 () Bool)

(declare-fun e!234783 () Bool)

(assert (=> start!73420 (=> (not res!267175) (not e!234783))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73420 (= res!267175 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73420 e!234783))

(assert (=> start!73420 true))

(declare-fun lt!448099 () (_ BitVec 64))

(declare-fun b!325579 () Bool)

(declare-fun lt!448100 () (_ BitVec 64))

(assert (=> b!325579 (= e!234783 (and (or (not (= lt!448100 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448100 (bvand (bvadd lt!448099 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or (bvsgt ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) currentBit!38) #b0000000000000000000000000000000001111111111111111111111111111111))))))

(assert (=> b!325579 (= lt!448100 (bvand lt!448099 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325579 (= lt!448099 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(assert (= (and start!73420 res!267175) b!325579))

(declare-fun m!463577 () Bool)

(assert (=> start!73420 m!463577))

(push 1)

(assert (not start!73420))

(check-sat)

(pop 1)

(push 1)

(check-sat)

