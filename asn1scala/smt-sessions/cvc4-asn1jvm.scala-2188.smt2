; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55520 () Bool)

(assert start!55520)

(declare-fun res!216648 () Bool)

(declare-fun e!179387 () Bool)

(assert (=> start!55520 (=> (not res!216648) (not e!179387))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-fun from!526 () (_ BitVec 64))

(assert (=> start!55520 (= res!216648 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55520 e!179387))

(assert (=> start!55520 true))

(declare-datatypes ((array!14080 0))(
  ( (array!14081 (arr!7158 (Array (_ BitVec 32) (_ BitVec 8))) (size!6171 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11264 0))(
  ( (BitStream!11265 (buf!6693 array!14080) (currentByte!12292 (_ BitVec 32)) (currentBit!12287 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11264)

(declare-fun e!179389 () Bool)

(declare-fun inv!12 (BitStream!11264) Bool)

(assert (=> start!55520 (and (inv!12 thiss!1754) e!179389)))

(declare-fun b!258625 () Bool)

(declare-fun res!216647 () Bool)

(assert (=> b!258625 (=> (not res!216647) (not e!179387))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258625 (= res!216647 (validate_offset_bits!1 ((_ sign_extend 32) (size!6171 (buf!6693 thiss!1754))) ((_ sign_extend 32) (currentByte!12292 thiss!1754)) ((_ sign_extend 32) (currentBit!12287 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun b!258628 () Bool)

(declare-fun array_inv!5912 (array!14080) Bool)

(assert (=> b!258628 (= e!179389 (array_inv!5912 (buf!6693 thiss!1754)))))

(declare-fun lt!400313 () (_ BitVec 64))

(declare-fun b!258627 () Bool)

(declare-fun lt!400312 () (_ BitVec 64))

(assert (=> b!258627 (= e!179387 (and (not (= lt!400312 (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!400312 (bvand (bvsub lt!400313 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!258627 (= lt!400312 (bvand lt!400313 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258627 (= lt!400313 (bvadd (bitIndex!0 (size!6171 (buf!6693 thiss!1754)) (currentByte!12292 thiss!1754) (currentBit!12287 thiss!1754)) nBits!535))))

(declare-fun b!258626 () Bool)

(declare-fun res!216649 () Bool)

(assert (=> b!258626 (=> (not res!216649) (not e!179387))))

(assert (=> b!258626 (= res!216649 (= from!526 nBits!535))))

(assert (= (and start!55520 res!216648) b!258625))

(assert (= (and b!258625 res!216647) b!258626))

(assert (= (and b!258626 res!216649) b!258627))

(assert (= start!55520 b!258628))

(declare-fun m!388047 () Bool)

(assert (=> start!55520 m!388047))

(declare-fun m!388049 () Bool)

(assert (=> b!258625 m!388049))

(declare-fun m!388051 () Bool)

(assert (=> b!258628 m!388051))

(declare-fun m!388053 () Bool)

(assert (=> b!258627 m!388053))

(push 1)

(assert (not b!258625))

(assert (not b!258628))

(assert (not b!258627))

(assert (not start!55520))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86784 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86784 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6171 (buf!6693 thiss!1754))) ((_ sign_extend 32) (currentByte!12292 thiss!1754)) ((_ sign_extend 32) (currentBit!12287 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6171 (buf!6693 thiss!1754))) ((_ sign_extend 32) (currentByte!12292 thiss!1754)) ((_ sign_extend 32) (currentBit!12287 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21958 () Bool)

(assert (= bs!21958 d!86784))

(declare-fun m!388057 () Bool)

(assert (=> bs!21958 m!388057))

(assert (=> b!258625 d!86784))

(declare-fun d!86786 () Bool)

(assert (=> d!86786 (= (array_inv!5912 (buf!6693 thiss!1754)) (bvsge (size!6171 (buf!6693 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258628 d!86786))

(declare-fun d!86788 () Bool)

(declare-fun e!179397 () Bool)

(assert (=> d!86788 e!179397))

(declare-fun res!216663 () Bool)

(assert (=> d!86788 (=> (not res!216663) (not e!179397))))

(declare-fun lt!400357 () (_ BitVec 64))

(declare-fun lt!400354 () (_ BitVec 64))

(declare-fun lt!400355 () (_ BitVec 64))

(assert (=> d!86788 (= res!216663 (= lt!400355 (bvsub lt!400354 lt!400357)))))

(assert (=> d!86788 (or (= (bvand lt!400354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400357 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400354 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400354 lt!400357) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86788 (= lt!400357 (remainingBits!0 ((_ sign_extend 32) (size!6171 (buf!6693 thiss!1754))) ((_ sign_extend 32) (currentByte!12292 thiss!1754)) ((_ sign_extend 32) (currentBit!12287 thiss!1754))))))

(declare-fun lt!400356 () (_ BitVec 64))

(declare-fun lt!400353 () (_ BitVec 64))

(assert (=> d!86788 (= lt!400354 (bvmul lt!400356 lt!400353))))

(assert (=> d!86788 (or (= lt!400356 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400353 (bvsdiv (bvmul lt!400356 lt!400353) lt!400356)))))

(assert (=> d!86788 (= lt!400353 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86788 (= lt!400356 ((_ sign_extend 32) (size!6171 (buf!6693 thiss!1754))))))

(assert (=> d!86788 (= lt!400355 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12292 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12287 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86788 (invariant!0 (currentBit!12287 thiss!1754) (currentByte!12292 thiss!1754) (size!6171 (buf!6693 thiss!1754)))))

(assert (=> d!86788 (= (bitIndex!0 (size!6171 (buf!6693 thiss!1754)) (currentByte!12292 thiss!1754) (currentBit!12287 thiss!1754)) lt!400355)))

(declare-fun b!258639 () Bool)

(declare-fun res!216662 () Bool)

(assert (=> b!258639 (=> (not res!216662) (not e!179397))))

(assert (=> b!258639 (= res!216662 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400355))))

(declare-fun b!258640 () Bool)

(declare-fun lt!400352 () (_ BitVec 64))

(assert (=> b!258640 (= e!179397 (bvsle lt!400355 (bvmul lt!400352 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258640 (or (= lt!400352 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400352 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400352)))))

(assert (=> b!258640 (= lt!400352 ((_ sign_extend 32) (size!6171 (buf!6693 thiss!1754))))))

(assert (= (and d!86788 res!216663) b!258639))

(assert (= (and b!258639 res!216662) b!258640))

(assert (=> d!86788 m!388057))

(declare-fun m!388061 () Bool)

(assert (=> d!86788 m!388061))

(assert (=> b!258627 d!86788))

(declare-fun d!86796 () Bool)

(assert (=> d!86796 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12287 thiss!1754) (currentByte!12292 thiss!1754) (size!6171 (buf!6693 thiss!1754))))))

(declare-fun bs!21960 () Bool)

(assert (= bs!21960 d!86796))

(assert (=> bs!21960 m!388061))

(assert (=> start!55520 d!86796))

(push 1)

(assert (not d!86796))

(assert (not d!86788))

(assert (not d!86784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

