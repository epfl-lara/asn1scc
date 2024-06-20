; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73482 () Bool)

(assert start!73482)

(declare-fun res!267292 () Bool)

(declare-fun e!234899 () Bool)

(assert (=> start!73482 (=> (not res!267292) (not e!234899))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73482 (= res!267292 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73482 e!234899))

(assert (=> start!73482 true))

(declare-fun b!325694 () Bool)

(declare-fun e!234898 () Bool)

(assert (=> b!325694 (= e!234899 e!234898)))

(declare-fun res!267291 () Bool)

(assert (=> b!325694 (=> (not res!267291) (not e!234898))))

(declare-fun lt!448275 () (_ BitVec 64))

(declare-fun lt!448277 () (_ BitVec 64))

(assert (=> b!325694 (= res!267291 (or (not (= lt!448275 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448275 (bvand (bvadd lt!448277 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325694 (= lt!448275 (bvand lt!448277 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325694 (= lt!448277 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(declare-fun b!325695 () Bool)

(declare-fun e!234900 () Bool)

(assert (=> b!325695 (= e!234898 e!234900)))

(declare-fun res!267290 () Bool)

(assert (=> b!325695 (=> res!267290 e!234900)))

(declare-fun lt!448274 () (_ BitVec 64))

(declare-fun lt!448276 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!325695 (= res!267290 (not (= lt!448276 (bvsub lt!448274 (remainingBits!0 ((_ sign_extend 32) bufLength!19) ((_ sign_extend 32) currentByte!43) ((_ sign_extend 32) currentBit!38))))))))

(assert (=> b!325695 (= lt!448274 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) bufLength!19)))))

(assert (=> b!325695 (= lt!448276 (bvadd lt!448277 ((_ sign_extend 32) currentBit!38)))))

(declare-fun b!325696 () Bool)

(assert (=> b!325696 (= e!234900 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!448276) (bvsgt lt!448276 lt!448274)))))

(assert (= (and start!73482 res!267292) b!325694))

(assert (= (and b!325694 res!267291) b!325695))

(assert (= (and b!325695 (not res!267290)) b!325696))

(declare-fun m!463643 () Bool)

(assert (=> start!73482 m!463643))

(declare-fun m!463645 () Bool)

(assert (=> b!325695 m!463645))

(check-sat (not b!325695) (not start!73482))
(check-sat)
(get-model)

(declare-fun d!107416 () Bool)

(assert (=> d!107416 (= (remainingBits!0 ((_ sign_extend 32) bufLength!19) ((_ sign_extend 32) currentByte!43) ((_ sign_extend 32) currentBit!38)) (bvsub (bvmul ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) currentBit!38))))))

(assert (=> b!325695 d!107416))

(declare-fun d!107418 () Bool)

(assert (=> d!107418 (= (invariant!0 currentBit!38 currentByte!43 bufLength!19) (and (bvsge currentBit!38 #b00000000000000000000000000000000) (bvslt currentBit!38 #b00000000000000000000000000001000) (bvsge currentByte!43 #b00000000000000000000000000000000) (or (bvslt currentByte!43 bufLength!19) (and (= currentBit!38 #b00000000000000000000000000000000) (= currentByte!43 bufLength!19)))))))

(assert (=> start!73482 d!107418))

(check-sat)
