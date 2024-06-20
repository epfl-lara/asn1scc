; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73424 () Bool)

(assert start!73424)

(declare-fun res!267181 () Bool)

(declare-fun e!234789 () Bool)

(assert (=> start!73424 (=> (not res!267181) (not e!234789))))

(declare-fun currentBit!38 () (_ BitVec 32))

(declare-fun bufLength!19 () (_ BitVec 32))

(declare-fun currentByte!43 () (_ BitVec 32))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> start!73424 (= res!267181 (invariant!0 currentBit!38 currentByte!43 bufLength!19))))

(assert (=> start!73424 e!234789))

(assert (=> start!73424 true))

(declare-fun lt!448112 () (_ BitVec 64))

(declare-fun b!325585 () Bool)

(declare-fun lt!448111 () (_ BitVec 64))

(assert (=> b!325585 (= e!234789 (and (or (not (= lt!448112 (bvand ((_ sign_extend 32) currentBit!38) #b1000000000000000000000000000000000000000000000000000000000000000))) (= lt!448112 (bvand (bvadd lt!448111 ((_ sign_extend 32) currentBit!38)) #b1000000000000000000000000000000000000000000000000000000000000000))) (bvsle ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) currentBit!38) #b0000000000000000000000000000000001111111111111111111111111111111) (or (bvslt ((_ sign_extend 32) bufLength!19) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) currentByte!43) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt ((_ sign_extend 32) currentBit!38) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!325585 (= lt!448112 (bvand lt!448111 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!325585 (= lt!448111 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) currentByte!43)))))

(assert (= (and start!73424 res!267181) b!325585))

(declare-fun m!463581 () Bool)

(assert (=> start!73424 m!463581))

(check-sat (not start!73424))
(check-sat)
(get-model)

(declare-fun d!107386 () Bool)

(assert (=> d!107386 (= (invariant!0 currentBit!38 currentByte!43 bufLength!19) (and (bvsge currentBit!38 #b00000000000000000000000000000000) (bvslt currentBit!38 #b00000000000000000000000000001000) (bvsge currentByte!43 #b00000000000000000000000000000000) (or (bvslt currentByte!43 bufLength!19) (and (= currentBit!38 #b00000000000000000000000000000000) (= currentByte!43 bufLength!19)))))))

(assert (=> start!73424 d!107386))

(check-sat)
