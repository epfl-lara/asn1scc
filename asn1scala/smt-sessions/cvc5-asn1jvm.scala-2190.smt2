; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55576 () Bool)

(assert start!55576)

(declare-fun b!258710 () Bool)

(declare-fun res!216720 () Bool)

(declare-fun e!179441 () Bool)

(assert (=> b!258710 (=> (not res!216720) (not e!179441))))

(declare-fun from!526 () (_ BitVec 64))

(declare-fun nBits!535 () (_ BitVec 64))

(assert (=> b!258710 (= res!216720 (= from!526 nBits!535))))

(declare-fun res!216721 () Bool)

(assert (=> start!55576 (=> (not res!216721) (not e!179441))))

(assert (=> start!55576 (= res!216721 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55576 e!179441))

(assert (=> start!55576 true))

(declare-datatypes ((array!14094 0))(
  ( (array!14095 (arr!7162 (Array (_ BitVec 32) (_ BitVec 8))) (size!6175 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11272 0))(
  ( (BitStream!11273 (buf!6697 array!14094) (currentByte!12308 (_ BitVec 32)) (currentBit!12303 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11272)

(declare-fun e!179442 () Bool)

(declare-fun inv!12 (BitStream!11272) Bool)

(assert (=> start!55576 (and (inv!12 thiss!1754) e!179442)))

(declare-fun lt!400445 () (_ BitVec 64))

(declare-fun lt!400444 () (_ BitVec 64))

(declare-fun b!258711 () Bool)

(assert (=> b!258711 (= e!179441 (and (not (= lt!400445 (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!400445 (bvand (bvsub lt!400444 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!258711 (= lt!400445 (bvand lt!400444 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258711 (= lt!400444 (bvadd (bitIndex!0 (size!6175 (buf!6697 thiss!1754)) (currentByte!12308 thiss!1754) (currentBit!12303 thiss!1754)) nBits!535))))

(declare-fun b!258712 () Bool)

(declare-fun array_inv!5916 (array!14094) Bool)

(assert (=> b!258712 (= e!179442 (array_inv!5916 (buf!6697 thiss!1754)))))

(declare-fun b!258709 () Bool)

(declare-fun res!216719 () Bool)

(assert (=> b!258709 (=> (not res!216719) (not e!179441))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258709 (= res!216719 (validate_offset_bits!1 ((_ sign_extend 32) (size!6175 (buf!6697 thiss!1754))) ((_ sign_extend 32) (currentByte!12308 thiss!1754)) ((_ sign_extend 32) (currentBit!12303 thiss!1754)) (bvsub nBits!535 from!526)))))

(assert (= (and start!55576 res!216721) b!258709))

(assert (= (and b!258709 res!216719) b!258710))

(assert (= (and b!258710 res!216720) b!258711))

(assert (= start!55576 b!258712))

(declare-fun m!388103 () Bool)

(assert (=> start!55576 m!388103))

(declare-fun m!388105 () Bool)

(assert (=> b!258711 m!388105))

(declare-fun m!388107 () Bool)

(assert (=> b!258712 m!388107))

(declare-fun m!388109 () Bool)

(assert (=> b!258709 m!388109))

(push 1)

(assert (not b!258712))

(assert (not b!258711))

(assert (not start!55576))

(assert (not b!258709))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86832 () Bool)

(assert (=> d!86832 (= (array_inv!5916 (buf!6697 thiss!1754)) (bvsge (size!6175 (buf!6697 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258712 d!86832))

(declare-fun d!86838 () Bool)

(declare-fun e!179467 () Bool)

(assert (=> d!86838 e!179467))

(declare-fun res!216751 () Bool)

(assert (=> d!86838 (=> (not res!216751) (not e!179467))))

(declare-fun lt!400482 () (_ BitVec 64))

(declare-fun lt!400487 () (_ BitVec 64))

(declare-fun lt!400489 () (_ BitVec 64))

(assert (=> d!86838 (= res!216751 (= lt!400487 (bvsub lt!400489 lt!400482)))))

(assert (=> d!86838 (or (= (bvand lt!400489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400482 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400489 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400489 lt!400482) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86838 (= lt!400482 (remainingBits!0 ((_ sign_extend 32) (size!6175 (buf!6697 thiss!1754))) ((_ sign_extend 32) (currentByte!12308 thiss!1754)) ((_ sign_extend 32) (currentBit!12303 thiss!1754))))))

(declare-fun lt!400491 () (_ BitVec 64))

(declare-fun lt!400484 () (_ BitVec 64))

(assert (=> d!86838 (= lt!400489 (bvmul lt!400491 lt!400484))))

(assert (=> d!86838 (or (= lt!400491 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400484 (bvsdiv (bvmul lt!400491 lt!400484) lt!400491)))))

(assert (=> d!86838 (= lt!400484 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86838 (= lt!400491 ((_ sign_extend 32) (size!6175 (buf!6697 thiss!1754))))))

(assert (=> d!86838 (= lt!400487 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12308 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12303 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86838 (invariant!0 (currentBit!12303 thiss!1754) (currentByte!12308 thiss!1754) (size!6175 (buf!6697 thiss!1754)))))

(assert (=> d!86838 (= (bitIndex!0 (size!6175 (buf!6697 thiss!1754)) (currentByte!12308 thiss!1754) (currentBit!12303 thiss!1754)) lt!400487)))

(declare-fun b!258746 () Bool)

(declare-fun res!216748 () Bool)

(assert (=> b!258746 (=> (not res!216748) (not e!179467))))

(assert (=> b!258746 (= res!216748 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400487))))

(declare-fun b!258748 () Bool)

(declare-fun lt!400493 () (_ BitVec 64))

(assert (=> b!258748 (= e!179467 (bvsle lt!400487 (bvmul lt!400493 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258748 (or (= lt!400493 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400493 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400493)))))

(assert (=> b!258748 (= lt!400493 ((_ sign_extend 32) (size!6175 (buf!6697 thiss!1754))))))

(assert (= (and d!86838 res!216751) b!258746))

(assert (= (and b!258746 res!216748) b!258748))

(declare-fun m!388129 () Bool)

(assert (=> d!86838 m!388129))

(declare-fun m!388133 () Bool)

(assert (=> d!86838 m!388133))

(assert (=> b!258711 d!86838))

(declare-fun d!86846 () Bool)

(assert (=> d!86846 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12303 thiss!1754) (currentByte!12308 thiss!1754) (size!6175 (buf!6697 thiss!1754))))))

(declare-fun bs!21976 () Bool)

(assert (= bs!21976 d!86846))

(assert (=> bs!21976 m!388133))

(assert (=> start!55576 d!86846))

(declare-fun d!86848 () Bool)

(assert (=> d!86848 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6175 (buf!6697 thiss!1754))) ((_ sign_extend 32) (currentByte!12308 thiss!1754)) ((_ sign_extend 32) (currentBit!12303 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6175 (buf!6697 thiss!1754))) ((_ sign_extend 32) (currentByte!12308 thiss!1754)) ((_ sign_extend 32) (currentBit!12303 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21978 () Bool)

(assert (= bs!21978 d!86848))

(assert (=> bs!21978 m!388129))

(assert (=> b!258709 d!86848))

(push 1)

(assert (not d!86838))

(assert (not d!86846))

(assert (not d!86848))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

