; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73570 () Bool)

(assert start!73570)

(declare-fun res!267361 () Bool)

(declare-fun e!234939 () Bool)

(assert (=> start!73570 (=> (not res!267361) (not e!234939))))

(declare-fun bufLength!6 () (_ BitVec 64))

(declare-fun currentByte!20 () (_ BitVec 64))

(declare-fun currentBit!15 () (_ BitVec 64))

(assert (=> start!73570 (= res!267361 (and (bvsle bufLength!6 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentByte!20 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentBit!15 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge bufLength!6 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentByte!20 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentBit!15 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!73570 e!234939))

(assert (=> start!73570 true))

(declare-fun b!325764 () Bool)

(declare-fun res!267360 () Bool)

(assert (=> b!325764 (=> (not res!267360) (not e!234939))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!325764 (= res!267360 (invariant!0 ((_ extract 31 0) currentBit!15) ((_ extract 31 0) currentByte!20) ((_ extract 31 0) bufLength!6)))))

(declare-fun lt!448304 () (_ BitVec 64))

(declare-fun lt!448303 () (_ BitVec 64))

(declare-fun b!325765 () Bool)

(assert (=> b!325765 (= e!234939 (and (not (= lt!448304 (bvand lt!448303 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!448304 (bvand (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 bufLength!6) lt!448303) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325765 (= lt!448304 (bvand (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 bufLength!6) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325765 (= lt!448303 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 currentByte!20) currentBit!15))))

(assert (= (and start!73570 res!267361) b!325764))

(assert (= (and b!325764 res!267360) b!325765))

(declare-fun m!463669 () Bool)

(assert (=> b!325764 m!463669))

(push 1)

(assert (not b!325764))

(check-sat)

(pop 1)

(push 1)

(check-sat)

