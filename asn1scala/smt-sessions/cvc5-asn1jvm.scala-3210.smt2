; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73552 () Bool)

(assert start!73552)

(declare-fun res!267306 () Bool)

(declare-fun e!234912 () Bool)

(assert (=> start!73552 (=> (not res!267306) (not e!234912))))

(declare-fun bufLength!6 () (_ BitVec 64))

(declare-fun currentBit!15 () (_ BitVec 64))

(declare-fun currentByte!20 () (_ BitVec 64))

(assert (=> start!73552 (= res!267306 (and (bvsle bufLength!6 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentByte!20 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentBit!15 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge bufLength!6 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentByte!20 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentBit!15 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!73552 e!234912))

(assert (=> start!73552 true))

(declare-fun b!325710 () Bool)

(declare-fun res!267307 () Bool)

(assert (=> b!325710 (=> (not res!267307) (not e!234912))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!325710 (= res!267307 (invariant!0 ((_ extract 31 0) currentBit!15) ((_ extract 31 0) currentByte!20) ((_ extract 31 0) bufLength!6)))))

(declare-fun b!325711 () Bool)

(assert (=> b!325711 (= e!234912 (and (not (= bufLength!6 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 bufLength!6) bufLength!6)))))))

(assert (= (and start!73552 res!267306) b!325710))

(assert (= (and b!325710 res!267307) b!325711))

(declare-fun m!463651 () Bool)

(assert (=> b!325710 m!463651))

(push 1)

(assert (not b!325710))

(check-sat)

(pop 1)

(push 1)

(check-sat)

