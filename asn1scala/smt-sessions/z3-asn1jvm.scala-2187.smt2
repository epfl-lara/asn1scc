; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!55488 () Bool)

(assert start!55488)

(declare-fun b!258562 () Bool)

(declare-fun e!179344 () Bool)

(declare-datatypes ((array!14069 0))(
  ( (array!14070 (arr!7154 (Array (_ BitVec 32) (_ BitVec 8))) (size!6167 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11256 0))(
  ( (BitStream!11257 (buf!6689 array!14069) (currentByte!12282 (_ BitVec 32)) (currentBit!12277 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11256)

(declare-fun array_inv!5908 (array!14069) Bool)

(assert (=> b!258562 (= e!179344 (array_inv!5908 (buf!6689 thiss!1754)))))

(declare-fun b!258561 () Bool)

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun lt!400235 () (_ BitVec 64))

(declare-fun lt!400234 () (_ BitVec 64))

(declare-fun e!179343 () Bool)

(assert (=> b!258561 (= e!179343 (and (= lt!400234 (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!400234 (bvand (bvadd lt!400235 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!258561 (= lt!400234 (bvand lt!400235 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258561 (= lt!400235 (bitIndex!0 (size!6167 (buf!6689 thiss!1754)) (currentByte!12282 thiss!1754) (currentBit!12277 thiss!1754)))))

(declare-fun b!258560 () Bool)

(declare-fun res!216595 () Bool)

(assert (=> b!258560 (=> (not res!216595) (not e!179343))))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> b!258560 (= res!216595 (= from!526 nBits!535))))

(declare-fun res!216593 () Bool)

(assert (=> start!55488 (=> (not res!216593) (not e!179343))))

(assert (=> start!55488 (= res!216593 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55488 e!179343))

(assert (=> start!55488 true))

(declare-fun inv!12 (BitStream!11256) Bool)

(assert (=> start!55488 (and (inv!12 thiss!1754) e!179344)))

(declare-fun b!258559 () Bool)

(declare-fun res!216594 () Bool)

(assert (=> b!258559 (=> (not res!216594) (not e!179343))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258559 (= res!216594 (validate_offset_bits!1 ((_ sign_extend 32) (size!6167 (buf!6689 thiss!1754))) ((_ sign_extend 32) (currentByte!12282 thiss!1754)) ((_ sign_extend 32) (currentBit!12277 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55488 res!216593) b!258559))

(assert (= (and b!258559 res!216594) b!258560))

(assert (= (and b!258560 res!216595) b!258561))

(assert (= start!55488 b!258562))

(declare-fun m!388003 () Bool)

(assert (=> b!258562 m!388003))

(declare-fun m!388005 () Bool)

(assert (=> b!258561 m!388005))

(declare-fun m!388007 () Bool)

(assert (=> start!55488 m!388007))

(declare-fun m!388009 () Bool)

(assert (=> b!258559 m!388009))

(check-sat (not b!258562) (not b!258561) (not start!55488) (not b!258559))
(check-sat)
(get-model)

(declare-fun d!86752 () Bool)

(assert (=> d!86752 (= (array_inv!5908 (buf!6689 thiss!1754)) (bvsge (size!6167 (buf!6689 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258562 d!86752))

(declare-fun d!86754 () Bool)

(declare-fun e!179356 () Bool)

(assert (=> d!86754 e!179356))

(declare-fun res!216610 () Bool)

(assert (=> d!86754 (=> (not res!216610) (not e!179356))))

(declare-fun lt!400255 () (_ BitVec 64))

(declare-fun lt!400258 () (_ BitVec 64))

(declare-fun lt!400259 () (_ BitVec 64))

(assert (=> d!86754 (= res!216610 (= lt!400255 (bvsub lt!400259 lt!400258)))))

(assert (=> d!86754 (or (= (bvand lt!400259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400258 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400259 lt!400258) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86754 (= lt!400258 (remainingBits!0 ((_ sign_extend 32) (size!6167 (buf!6689 thiss!1754))) ((_ sign_extend 32) (currentByte!12282 thiss!1754)) ((_ sign_extend 32) (currentBit!12277 thiss!1754))))))

(declare-fun lt!400256 () (_ BitVec 64))

(declare-fun lt!400254 () (_ BitVec 64))

(assert (=> d!86754 (= lt!400259 (bvmul lt!400256 lt!400254))))

(assert (=> d!86754 (or (= lt!400256 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400254 (bvsdiv (bvmul lt!400256 lt!400254) lt!400256)))))

(assert (=> d!86754 (= lt!400254 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86754 (= lt!400256 ((_ sign_extend 32) (size!6167 (buf!6689 thiss!1754))))))

(assert (=> d!86754 (= lt!400255 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12282 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12277 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86754 (invariant!0 (currentBit!12277 thiss!1754) (currentByte!12282 thiss!1754) (size!6167 (buf!6689 thiss!1754)))))

(assert (=> d!86754 (= (bitIndex!0 (size!6167 (buf!6689 thiss!1754)) (currentByte!12282 thiss!1754) (currentBit!12277 thiss!1754)) lt!400255)))

(declare-fun b!258579 () Bool)

(declare-fun res!216609 () Bool)

(assert (=> b!258579 (=> (not res!216609) (not e!179356))))

(assert (=> b!258579 (= res!216609 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400255))))

(declare-fun b!258580 () Bool)

(declare-fun lt!400257 () (_ BitVec 64))

(assert (=> b!258580 (= e!179356 (bvsle lt!400255 (bvmul lt!400257 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258580 (or (= lt!400257 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400257 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400257)))))

(assert (=> b!258580 (= lt!400257 ((_ sign_extend 32) (size!6167 (buf!6689 thiss!1754))))))

(assert (= (and d!86754 res!216610) b!258579))

(assert (= (and b!258579 res!216609) b!258580))

(declare-fun m!388027 () Bool)

(assert (=> d!86754 m!388027))

(declare-fun m!388029 () Bool)

(assert (=> d!86754 m!388029))

(assert (=> b!258561 d!86754))

(declare-fun d!86772 () Bool)

(assert (=> d!86772 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12277 thiss!1754) (currentByte!12282 thiss!1754) (size!6167 (buf!6689 thiss!1754))))))

(declare-fun bs!21952 () Bool)

(assert (= bs!21952 d!86772))

(assert (=> bs!21952 m!388029))

(assert (=> start!55488 d!86772))

(declare-fun d!86774 () Bool)

(assert (=> d!86774 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6167 (buf!6689 thiss!1754))) ((_ sign_extend 32) (currentByte!12282 thiss!1754)) ((_ sign_extend 32) (currentBit!12277 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6167 (buf!6689 thiss!1754))) ((_ sign_extend 32) (currentByte!12282 thiss!1754)) ((_ sign_extend 32) (currentBit!12277 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21953 () Bool)

(assert (= bs!21953 d!86774))

(assert (=> bs!21953 m!388027))

(assert (=> b!258559 d!86774))

(check-sat (not d!86774) (not d!86772) (not d!86754))
