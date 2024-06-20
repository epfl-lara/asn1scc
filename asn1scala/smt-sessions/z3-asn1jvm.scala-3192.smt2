; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73418 () Bool)

(assert start!73418)

(declare-fun res!267172 () Bool)

(declare-fun e!234780 () Bool)

(assert (=> start!73418 (=> (not res!267172) (not e!234780))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73418 (= res!267172 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73418 e!234780))

(assert (=> start!73418 true))

(declare-fun lt!448094 () (_ BitVec 64))

(declare-fun b!325576 () Bool)

(declare-fun lt!448093 () (_ BitVec 64))

(assert (=> b!325576 (= e!234780 (and (or (not (= lt!448094 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448094 (bvand (bvadd lt!448093 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or (bvsgt ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsgt ((_ sign_extend 32) currentBit!38) #b0000000000000000000000000000000001111111111111111111111111111111))))))

(assert (=> b!325576 (= lt!448094 (bvand lt!448093 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325576 (= lt!448093 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(assert (= (and start!73418 res!267172) b!325576))

(declare-fun m!463575 () Bool)

(assert (=> start!73418 m!463575))

(check-sat (not start!73418))
(check-sat)
