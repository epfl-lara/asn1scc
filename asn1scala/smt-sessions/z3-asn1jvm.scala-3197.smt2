; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73452 () Bool)

(assert start!73452)

(declare-fun res!267226 () Bool)

(declare-fun e!234834 () Bool)

(assert (=> start!73452 (=> (not res!267226) (not e!234834))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73452 (= res!267226 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73452 e!234834))

(assert (=> start!73452 true))

(declare-fun lt!448166 () (_ BitVec 64))

(declare-fun lt!448165 () (_ BitVec 64))

(declare-fun b!325630 () Bool)

(assert (=> b!325630 (= e!234834 (and (or (not (= lt!448166 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448166 (bvand (bvadd lt!448165 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) bufLength!19)) ((_ sign_extend 32) bufLength!19))))))))

(assert (=> b!325630 (= lt!448166 (bvand lt!448165 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325630 (= lt!448165 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(assert (= (and start!73452 res!267226) b!325630))

(declare-fun m!463611 () Bool)

(assert (=> start!73452 m!463611))

(check-sat (not start!73452))
(check-sat)
