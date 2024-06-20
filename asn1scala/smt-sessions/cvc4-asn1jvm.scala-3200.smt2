; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73484 () Bool)

(assert start!73484)

(declare-fun res!267300 () Bool)

(declare-fun e!234908 () Bool)

(assert (=> start!73484 (=> (not res!267300) (not e!234908))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73484 (= res!267300 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73484 e!234908))

(assert (=> start!73484 true))

(declare-fun b!325703 () Bool)

(declare-fun e!234909 () Bool)

(assert (=> b!325703 (= e!234908 e!234909)))

(declare-fun res!267299 () Bool)

(assert (=> b!325703 (=> (not res!267299) (not e!234909))))

(declare-fun lt!448288 () (_ BitVec 64))

(declare-fun lt!448289 () (_ BitVec 64))

(assert (=> b!325703 (= res!267299 (or (not (= lt!448289 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448289 (bvand (bvadd lt!448288 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325703 (= lt!448289 (bvand lt!448288 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325703 (= lt!448288 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(declare-fun b!325704 () Bool)

(declare-fun e!234907 () Bool)

(assert (=> b!325704 (= e!234909 e!234907)))

(declare-fun res!267301 () Bool)

(assert (=> b!325704 (=> res!267301 e!234907)))

(declare-fun lt!448287 () (_ BitVec 64))

(declare-fun lt!448286 () (_ BitVec 64))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!325704 (= res!267301 (not (= lt!448286 (bvsub lt!448287 (remainingBits!0 ((_ sign_extend 32) bufLength!19) ((_ sign_extend 32) currentByte!43) ((_ sign_extend 32) currentBit!38))))))))

(assert (=> b!325704 (= lt!448287 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) bufLength!19)))))

(assert (=> b!325704 (= lt!448286 (bvadd lt!448288 ((_ sign_extend 32) currentBit!38)))))

(declare-fun b!325705 () Bool)

(assert (=> b!325705 (= e!234907 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!448286) (bvsgt lt!448286 lt!448287)))))

(assert (= (and start!73484 res!267300) b!325703))

(assert (= (and b!325703 res!267299) b!325704))

(assert (= (and b!325704 (not res!267301)) b!325705))

(declare-fun m!463647 () Bool)

(assert (=> start!73484 m!463647))

(declare-fun m!463649 () Bool)

(assert (=> b!325704 m!463649))

(push 1)

(assert (not b!325704))

(assert (not start!73484))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107424 () Bool)

(assert (=> d!107424 (= (remainingBits!0 ((_ sign_extend 32) bufLength!19) ((_ sign_extend 32) currentByte!43) ((_ sign_extend 32) currentBit!38)) (bvsub (bvmul ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) currentBit!38))))))

(assert (=> b!325704 d!107424))

(declare-fun d!107426 () Bool)

(assert (=> d!107426 (= (invariant!0 currentBit!38 currentByte!43 bufLength!19) (and (bvsge currentBit!38 #b00000000000000000000000000000000) (bvslt currentBit!38 #b00000000000000000000000000001000) (bvsge currentByte!43 #b00000000000000000000000000000000) (or (bvslt currentByte!43 bufLength!19) (and (= currentBit!38 #b00000000000000000000000000000000) (= currentByte!43 bufLength!19)))))))

(assert (=> start!73484 d!107426))

(push 1)

(check-sat)

(pop 1)

