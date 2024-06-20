; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73562 () Bool)

(assert start!73562)

(declare-fun res!267336 () Bool)

(declare-fun e!234927 () Bool)

(assert (=> start!73562 (=> (not res!267336) (not e!234927))))

(declare-fun bufLength!6 () (_ BitVec 64))

(declare-fun currentBit!15 () (_ BitVec 64))

(declare-fun currentByte!20 () (_ BitVec 64))

(assert (=> start!73562 (= res!267336 (and (bvsle bufLength!6 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentByte!20 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentBit!15 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge bufLength!6 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentByte!20 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentBit!15 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!73562 e!234927))

(assert (=> start!73562 true))

(declare-fun b!325740 () Bool)

(declare-fun res!267337 () Bool)

(assert (=> b!325740 (=> (not res!267337) (not e!234927))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!325740 (= res!267337 (invariant!0 ((_ extract 31 0) currentBit!15) ((_ extract 31 0) currentByte!20) ((_ extract 31 0) bufLength!6)))))

(declare-fun b!325741 () Bool)

(assert (=> b!325741 (= e!234927 (and (not (= currentByte!20 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 currentByte!20) currentByte!20)))))))

(assert (= (and start!73562 res!267336) b!325740))

(assert (= (and b!325740 res!267337) b!325741))

(declare-fun m!463661 () Bool)

(assert (=> b!325740 m!463661))

(push 1)

(assert (not b!325740))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

