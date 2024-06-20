; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73560 () Bool)

(assert start!73560)

(declare-fun res!267330 () Bool)

(declare-fun e!234924 () Bool)

(assert (=> start!73560 (=> (not res!267330) (not e!234924))))

(declare-fun bufLength!6 () (_ BitVec 64))

(declare-fun currentBit!15 () (_ BitVec 64))

(declare-fun currentByte!20 () (_ BitVec 64))

(assert (=> start!73560 (= res!267330 (and (bvsle bufLength!6 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentByte!20 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle currentBit!15 #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge bufLength!6 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentByte!20 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge currentBit!15 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> start!73560 e!234924))

(assert (=> start!73560 true))

(declare-fun b!325734 () Bool)

(declare-fun res!267331 () Bool)

(assert (=> b!325734 (=> (not res!267331) (not e!234924))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!325734 (= res!267331 (invariant!0 ((_ extract 31 0) currentBit!15) ((_ extract 31 0) currentByte!20) ((_ extract 31 0) bufLength!6)))))

(declare-fun b!325735 () Bool)

(assert (=> b!325735 (= e!234924 (and (not (= currentByte!20 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 currentByte!20) currentByte!20)))))))

(assert (= (and start!73560 res!267330) b!325734))

(assert (= (and b!325734 res!267331) b!325735))

(declare-fun m!463659 () Bool)

(assert (=> b!325734 m!463659))

(check-sat (not b!325734))
(check-sat)
