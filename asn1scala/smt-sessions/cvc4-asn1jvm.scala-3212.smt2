; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73568 () Bool)

(assert start!73568)

(declare-fun res!267354 () Bool)

(declare-fun e!234936 () Bool)

(assert (=> start!73568 (=> (not res!267354) (not e!234936))))

(declare-fun bufLength!6 () (_ BitVec 64))

(declare-fun currentByte!20 () (_ BitVec 64))

(declare-fun currentBit!15 () (_ BitVec 64))

(assert (=> start!73568 (= res!267354 (and (bvsle bufLength!6 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentByte!20 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentBit!15 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge bufLength!6 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentByte!20 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentBit!15 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!73568 e!234936))

(assert (=> start!73568 true))

(declare-fun b!325758 () Bool)

(declare-fun res!267355 () Bool)

(assert (=> b!325758 (=> (not res!267355) (not e!234936))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!325758 (= res!267355 (invariant!0 ((_ extract 31 0) currentBit!15) ((_ extract 31 0) currentByte!20) ((_ extract 31 0) bufLength!6)))))

(declare-fun lt!448298 () (_ BitVec 64))

(declare-fun b!325759 () Bool)

(assert (=> b!325759 (= e!234936 (and (= lt!448298 (bvand currentBit!15 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!448298 (bvand (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 currentByte!20) currentBit!15) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325759 (= lt!448298 (bvand (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 currentByte!20) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!73568 res!267354) b!325758))

(assert (= (and b!325758 res!267355) b!325759))

(declare-fun m!463667 () Bool)

(assert (=> b!325758 m!463667))

(push 1)

(assert (not b!325758))

(check-sat)

(pop 1)

(push 1)

(check-sat)

