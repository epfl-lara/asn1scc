; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73440 () Bool)

(assert start!73440)

(declare-fun res!267208 () Bool)

(declare-fun e!234816 () Bool)

(assert (=> start!73440 (=> (not res!267208) (not e!234816))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73440 (= res!267208 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73440 e!234816))

(assert (=> start!73440 true))

(declare-fun b!325612 () Bool)

(assert (=> b!325612 (= e!234816 (and (not (= ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)) ((_ sign_extend 32) currentByte!43))))))))

(assert (= (and start!73440 res!267208) b!325612))

(declare-fun m!463599 () Bool)

(assert (=> start!73440 m!463599))

(check-sat (not start!73440))
(check-sat)
