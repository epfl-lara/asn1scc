; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73554 () Bool)

(assert start!73554)

(declare-fun res!267312 () Bool)

(declare-fun e!234915 () Bool)

(assert (=> start!73554 (=> (not res!267312) (not e!234915))))

(declare-fun bufLength!6 () (_ BitVec 64))

(declare-fun currentBit!15 () (_ BitVec 64))

(declare-fun currentByte!20 () (_ BitVec 64))

(assert (=> start!73554 (= res!267312 (and (bvsle bufLength!6 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentByte!20 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentBit!15 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge bufLength!6 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentByte!20 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentBit!15 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!73554 e!234915))

(assert (=> start!73554 true))

(declare-fun b!325716 () Bool)

(declare-fun res!267313 () Bool)

(assert (=> b!325716 (=> (not res!267313) (not e!234915))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!325716 (= res!267313 (invariant!0 ((_ extract 31 0) currentBit!15) ((_ extract 31 0) currentByte!20) ((_ extract 31 0) bufLength!6)))))

(declare-fun b!325717 () Bool)

(assert (=> b!325717 (= e!234915 (and (not (= bufLength!6 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 bufLength!6) bufLength!6)))))))

(assert (= (and start!73554 res!267312) b!325716))

(assert (= (and b!325716 res!267313) b!325717))

(declare-fun m!463653 () Bool)

(assert (=> b!325716 m!463653))

(check-sat (not b!325716))
(check-sat)
