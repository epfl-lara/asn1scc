; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73454 () Bool)

(assert start!73454)

(declare-fun res!267229 () Bool)

(declare-fun e!234837 () Bool)

(assert (=> start!73454 (=> (not res!267229) (not e!234837))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73454 (= res!267229 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73454 e!234837))

(assert (=> start!73454 true))

(declare-fun b!325633 () Bool)

(declare-fun lt!448172 () (_ BitVec 64))

(declare-fun lt!448171 () (_ BitVec 64))

(assert (=> b!325633 (= e!234837 (and (or (not (= lt!448172 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448172 (bvand (bvadd lt!448171 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) bufLength!19)) ((_ sign_extend 32) bufLength!19))))))))

(assert (=> b!325633 (= lt!448172 (bvand lt!448171 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325633 (= lt!448171 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(assert (= (and start!73454 res!267229) b!325633))

(declare-fun m!463613 () Bool)

(assert (=> start!73454 m!463613))

(push 1)

(assert (not start!73454))

(check-sat)

(pop 1)

(push 1)

(check-sat)

