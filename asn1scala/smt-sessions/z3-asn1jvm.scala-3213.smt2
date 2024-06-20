; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73572 () Bool)

(assert start!73572)

(declare-fun res!267366 () Bool)

(declare-fun e!234942 () Bool)

(assert (=> start!73572 (=> (not res!267366) (not e!234942))))

(declare-fun bufLength!6 () (_ BitVec 64))

(declare-fun currentBit!15 () (_ BitVec 64))

(declare-fun currentByte!20 () (_ BitVec 64))

(assert (=> start!73572 (= res!267366 (and (bvsle bufLength!6 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentByte!20 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentBit!15 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge bufLength!6 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentByte!20 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentBit!15 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!73572 e!234942))

(assert (=> start!73572 true))

(declare-fun b!325770 () Bool)

(declare-fun res!267367 () Bool)

(assert (=> b!325770 (=> (not res!267367) (not e!234942))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!325770 (= res!267367 (invariant!0 ((_ extract 31 0) currentBit!15) ((_ extract 31 0) currentByte!20) ((_ extract 31 0) bufLength!6)))))

(declare-fun lt!448309 () (_ BitVec 64))

(declare-fun lt!448310 () (_ BitVec 64))

(declare-fun b!325771 () Bool)

(assert (=> b!325771 (= e!234942 (and (not (= lt!448309 (bvand lt!448310 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!448309 (bvand (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 bufLength!6) lt!448310) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325771 (= lt!448309 (bvand (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 bufLength!6) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325771 (= lt!448310 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 currentByte!20) currentBit!15))))

(assert (= (and start!73572 res!267366) b!325770))

(assert (= (and b!325770 res!267367) b!325771))

(declare-fun m!463671 () Bool)

(assert (=> b!325770 m!463671))

(check-sat (not b!325770))
(check-sat)
