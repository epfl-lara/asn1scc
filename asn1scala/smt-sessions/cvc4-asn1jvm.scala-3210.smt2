; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73556 () Bool)

(assert start!73556)

(declare-fun res!267318 () Bool)

(declare-fun e!234918 () Bool)

(assert (=> start!73556 (=> (not res!267318) (not e!234918))))

(declare-fun bufLength!6 () (_ BitVec 64))

(declare-fun currentBit!15 () (_ BitVec 64))

(declare-fun currentByte!20 () (_ BitVec 64))

(assert (=> start!73556 (= res!267318 (and (bvsle bufLength!6 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentByte!20 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentBit!15 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge bufLength!6 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentByte!20 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentBit!15 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!73556 e!234918))

(assert (=> start!73556 true))

(declare-fun b!325722 () Bool)

(declare-fun res!267319 () Bool)

(assert (=> b!325722 (=> (not res!267319) (not e!234918))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!325722 (= res!267319 (invariant!0 ((_ extract 31 0) currentBit!15) ((_ extract 31 0) currentByte!20) ((_ extract 31 0) bufLength!6)))))

(declare-fun b!325723 () Bool)

(assert (=> b!325723 (= e!234918 (and (not (= bufLength!6 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 bufLength!6) bufLength!6)))))))

(assert (= (and start!73556 res!267318) b!325722))

(assert (= (and b!325722 res!267319) b!325723))

(declare-fun m!463655 () Bool)

(assert (=> b!325722 m!463655))

(push 1)

(assert (not b!325722))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

