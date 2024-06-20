; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73564 () Bool)

(assert start!73564)

(declare-fun res!267342 () Bool)

(declare-fun e!234930 () Bool)

(assert (=> start!73564 (=> (not res!267342) (not e!234930))))

(declare-fun bufLength!6 () (_ BitVec 64))

(declare-fun currentBit!15 () (_ BitVec 64))

(declare-fun currentByte!20 () (_ BitVec 64))

(assert (=> start!73564 (= res!267342 (and (bvsle bufLength!6 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentByte!20 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentBit!15 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge bufLength!6 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentByte!20 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentBit!15 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!73564 e!234930))

(assert (=> start!73564 true))

(declare-fun b!325746 () Bool)

(declare-fun res!267343 () Bool)

(assert (=> b!325746 (=> (not res!267343) (not e!234930))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!325746 (= res!267343 (invariant!0 ((_ extract 31 0) currentBit!15) ((_ extract 31 0) currentByte!20) ((_ extract 31 0) bufLength!6)))))

(declare-fun lt!448292 () (_ BitVec 64))

(declare-fun b!325747 () Bool)

(assert (=> b!325747 (= e!234930 (and (= lt!448292 (bvand currentBit!15 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!448292 (bvand (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 currentByte!20) currentBit!15) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325747 (= lt!448292 (bvand (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 currentByte!20) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!73564 res!267342) b!325746))

(assert (= (and b!325746 res!267343) b!325747))

(declare-fun m!463663 () Bool)

(assert (=> b!325746 m!463663))

(push 1)

(assert (not b!325746))

(check-sat)

(pop 1)

(push 1)

(check-sat)

