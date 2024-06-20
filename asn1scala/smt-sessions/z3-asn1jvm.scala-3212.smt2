; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73566 () Bool)

(assert start!73566)

(declare-fun res!267348 () Bool)

(declare-fun e!234933 () Bool)

(assert (=> start!73566 (=> (not res!267348) (not e!234933))))

(declare-fun bufLength!6 () (_ BitVec 64))

(declare-fun currentBit!15 () (_ BitVec 64))

(declare-fun currentByte!20 () (_ BitVec 64))

(assert (=> start!73566 (= res!267348 (and (bvsle bufLength!6 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentByte!20 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentBit!15 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge bufLength!6 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentByte!20 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentBit!15 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!73566 e!234933))

(assert (=> start!73566 true))

(declare-fun b!325752 () Bool)

(declare-fun res!267349 () Bool)

(assert (=> b!325752 (=> (not res!267349) (not e!234933))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!325752 (= res!267349 (invariant!0 ((_ extract 31 0) currentBit!15) ((_ extract 31 0) currentByte!20) ((_ extract 31 0) bufLength!6)))))

(declare-fun b!325753 () Bool)

(declare-fun lt!448295 () (_ BitVec 64))

(assert (=> b!325753 (= e!234933 (and (= lt!448295 (bvand currentBit!15 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!448295 (bvand (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 currentByte!20) currentBit!15) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!325753 (= lt!448295 (bvand (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 currentByte!20) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!73566 res!267348) b!325752))

(assert (= (and b!325752 res!267349) b!325753))

(declare-fun m!463665 () Bool)

(assert (=> b!325752 m!463665))

(check-sat (not b!325752))
(check-sat)
