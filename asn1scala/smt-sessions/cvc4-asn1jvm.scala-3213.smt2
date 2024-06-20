; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73574 () Bool)

(assert start!73574)

(declare-fun res!267373 () Bool)

(declare-fun e!234945 () Bool)

(assert (=> start!73574 (=> (not res!267373) (not e!234945))))

(declare-fun bufLength!6 () (_ BitVec 64))

(declare-fun currentBit!15 () (_ BitVec 64))

(declare-fun currentByte!20 () (_ BitVec 64))

(assert (=> start!73574 (= res!267373 (and (bvsle bufLength!6 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentByte!20 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentBit!15 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge bufLength!6 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentByte!20 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentBit!15 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!73574 e!234945))

(assert (=> start!73574 true))

(declare-fun b!325776 () Bool)

(declare-fun res!267372 () Bool)

(assert (=> b!325776 (=> (not res!267372) (not e!234945))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!325776 (= res!267372 (invariant!0 ((_ extract 31 0) currentBit!15) ((_ extract 31 0) currentByte!20) ((_ extract 31 0) bufLength!6)))))

(declare-fun lt!448316 () (_ BitVec 64))

(declare-fun lt!448315 () (_ BitVec 64))

(declare-fun b!325777 () Bool)

(assert (=> b!325777 (= e!234945 (and (not (= lt!448315 (bvand lt!448316 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!448315 (bvand (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 bufLength!6) lt!448316) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325777 (= lt!448315 (bvand (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 bufLength!6) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325777 (= lt!448316 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 currentByte!20) currentBit!15))))

(assert (= (and start!73574 res!267373) b!325776))

(assert (= (and b!325776 res!267372) b!325777))

(declare-fun m!463673 () Bool)

(assert (=> b!325776 m!463673))

(push 1)

(assert (not b!325776))

(check-sat)

(pop 1)

(push 1)

(check-sat)

