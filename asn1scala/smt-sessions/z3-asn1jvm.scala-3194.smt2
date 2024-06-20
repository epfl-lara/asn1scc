; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73434 () Bool)

(assert start!73434)

(declare-fun res!267196 () Bool)

(declare-fun e!234803 () Bool)

(assert (=> start!73434 (=> (not res!267196) (not e!234803))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73434 (= res!267196 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73434 e!234803))

(assert (=> start!73434 true))

(declare-fun b!325599 () Bool)

(declare-fun e!234804 () Bool)

(assert (=> b!325599 (= e!234803 e!234804)))

(declare-fun res!267195 () Bool)

(assert (=> b!325599 (=> (not res!267195) (not e!234804))))

(declare-fun lt!448130 () (_ BitVec 64))

(declare-fun lt!448129 () (_ BitVec 64))

(assert (=> b!325599 (= res!267195 (and (or (not (= lt!448130 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448130 (bvand (bvadd lt!448129 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))) (bvsle ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) currentBit!38) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) currentBit!38) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!325599 (= lt!448130 (bvand lt!448129 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325599 (= lt!448129 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(declare-fun b!325600 () Bool)

(assert (=> b!325600 (= e!234804 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) currentBit!38)) ((_ extract 31 0) ((_ sign_extend 32) currentByte!43)) ((_ extract 31 0) ((_ sign_extend 32) bufLength!19)))))))

(assert (= (and start!73434 res!267196) b!325599))

(assert (= (and b!325599 res!267195) b!325600))

(declare-fun m!463589 () Bool)

(assert (=> start!73434 m!463589))

(declare-fun m!463591 () Bool)

(assert (=> b!325600 m!463591))

(check-sat (not b!325600) (not start!73434))
