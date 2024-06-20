; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73446 () Bool)

(assert start!73446)

(declare-fun res!267217 () Bool)

(declare-fun e!234825 () Bool)

(assert (=> start!73446 (=> (not res!267217) (not e!234825))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73446 (= res!267217 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73446 e!234825))

(assert (=> start!73446 true))

(declare-fun lt!448148 () (_ BitVec 64))

(declare-fun b!325621 () Bool)

(declare-fun lt!448147 () (_ BitVec 64))

(assert (=> b!325621 (= e!234825 (and (= lt!448148 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!448148 (bvand (bvadd lt!448147 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325621 (= lt!448148 (bvand lt!448147 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325621 (= lt!448147 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(assert (= (and start!73446 res!267217) b!325621))

(declare-fun m!463605 () Bool)

(assert (=> start!73446 m!463605))

(check-sat (not start!73446))
(check-sat)
