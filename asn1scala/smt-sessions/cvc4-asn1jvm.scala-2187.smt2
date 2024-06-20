; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55490 () Bool)

(assert start!55490)

(declare-fun b!258571 () Bool)

(declare-fun res!216603 () Bool)

(declare-fun e!179352 () Bool)

(assert (=> b!258571 (=> (not res!216603) (not e!179352))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!14071 0))(
  ( (array!14072 (arr!7155 (Array (_ BitVec 32) (_ BitVec 8))) (size!6168 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11258 0))(
  ( (BitStream!11259 (buf!6690 array!14071) (currentByte!12283 (_ BitVec 32)) (currentBit!12278 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11258)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258571 (= res!216603 (validate_offset_bits!1 ((_ sign_extend 32) (size!6168 (buf!6690 thiss!1754))) ((_ sign_extend 32) (currentByte!12283 thiss!1754)) ((_ sign_extend 32) (currentBit!12278 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!216604 () Bool)

(assert (=> start!55490 (=> (not res!216604) (not e!179352))))

(assert (=> start!55490 (= res!216604 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55490 e!179352))

(assert (=> start!55490 true))

(declare-fun e!179353 () Bool)

(declare-fun inv!12 (BitStream!11258) Bool)

(assert (=> start!55490 (and (inv!12 thiss!1754) e!179353)))

(declare-fun lt!400241 () (_ BitVec 64))

(declare-fun lt!400240 () (_ BitVec 64))

(declare-fun b!258573 () Bool)

(assert (=> b!258573 (= e!179352 (and (= lt!400241 (bvand nBits!535 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!400241 (bvand (bvadd lt!400240 nBits!535) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!258573 (= lt!400241 (bvand lt!400240 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258573 (= lt!400240 (bitIndex!0 (size!6168 (buf!6690 thiss!1754)) (currentByte!12283 thiss!1754) (currentBit!12278 thiss!1754)))))

(declare-fun b!258574 () Bool)

(declare-fun array_inv!5909 (array!14071) Bool)

(assert (=> b!258574 (= e!179353 (array_inv!5909 (buf!6690 thiss!1754)))))

(declare-fun b!258572 () Bool)

(declare-fun res!216602 () Bool)

(assert (=> b!258572 (=> (not res!216602) (not e!179352))))

(assert (=> b!258572 (= res!216602 (= from!526 nBits!535))))

(assert (= (and start!55490 res!216604) b!258571))

(assert (= (and b!258571 res!216603) b!258572))

(assert (= (and b!258572 res!216602) b!258573))

(assert (= start!55490 b!258574))

(declare-fun m!388011 () Bool)

(assert (=> b!258571 m!388011))

(declare-fun m!388013 () Bool)

(assert (=> start!55490 m!388013))

(declare-fun m!388015 () Bool)

(assert (=> b!258573 m!388015))

(declare-fun m!388017 () Bool)

(assert (=> b!258574 m!388017))

(push 1)

(assert (not start!55490))

(assert (not b!258571))

(assert (not b!258574))

(assert (not b!258573))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86764 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86764 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12278 thiss!1754) (currentByte!12283 thiss!1754) (size!6168 (buf!6690 thiss!1754))))))

(declare-fun bs!21950 () Bool)

(assert (= bs!21950 d!86764))

(declare-fun m!388023 () Bool)

(assert (=> bs!21950 m!388023))

(assert (=> start!55490 d!86764))

(declare-fun d!86766 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86766 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6168 (buf!6690 thiss!1754))) ((_ sign_extend 32) (currentByte!12283 thiss!1754)) ((_ sign_extend 32) (currentBit!12278 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6168 (buf!6690 thiss!1754))) ((_ sign_extend 32) (currentByte!12283 thiss!1754)) ((_ sign_extend 32) (currentBit!12278 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21951 () Bool)

(assert (= bs!21951 d!86766))

(declare-fun m!388025 () Bool)

(assert (=> bs!21951 m!388025))

(assert (=> b!258571 d!86766))

(declare-fun d!86768 () Bool)

(assert (=> d!86768 (= (array_inv!5909 (buf!6690 thiss!1754)) (bvsge (size!6168 (buf!6690 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258574 d!86768))

(declare-fun d!86770 () Bool)

(declare-fun e!179362 () Bool)

(assert (=> d!86770 e!179362))

(declare-fun res!216622 () Bool)

(assert (=> d!86770 (=> (not res!216622) (not e!179362))))

(declare-fun lt!400295 () (_ BitVec 64))

(declare-fun lt!400291 () (_ BitVec 64))

(declare-fun lt!400290 () (_ BitVec 64))

(assert (=> d!86770 (= res!216622 (= lt!400295 (bvsub lt!400291 lt!400290)))))

(assert (=> d!86770 (or (= (bvand lt!400291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400290 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400291 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400291 lt!400290) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86770 (= lt!400290 (remainingBits!0 ((_ sign_extend 32) (size!6168 (buf!6690 thiss!1754))) ((_ sign_extend 32) (currentByte!12283 thiss!1754)) ((_ sign_extend 32) (currentBit!12278 thiss!1754))))))

(declare-fun lt!400292 () (_ BitVec 64))

(declare-fun lt!400294 () (_ BitVec 64))

(assert (=> d!86770 (= lt!400291 (bvmul lt!400292 lt!400294))))

(assert (=> d!86770 (or (= lt!400292 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400294 (bvsdiv (bvmul lt!400292 lt!400294) lt!400292)))))

(assert (=> d!86770 (= lt!400294 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86770 (= lt!400292 ((_ sign_extend 32) (size!6168 (buf!6690 thiss!1754))))))

(assert (=> d!86770 (= lt!400295 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12283 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12278 thiss!1754))))))

(assert (=> d!86770 (invariant!0 (currentBit!12278 thiss!1754) (currentByte!12283 thiss!1754) (size!6168 (buf!6690 thiss!1754)))))

(assert (=> d!86770 (= (bitIndex!0 (size!6168 (buf!6690 thiss!1754)) (currentByte!12283 thiss!1754) (currentBit!12278 thiss!1754)) lt!400295)))

(declare-fun b!258591 () Bool)

(declare-fun res!216621 () Bool)

(assert (=> b!258591 (=> (not res!216621) (not e!179362))))

(assert (=> b!258591 (= res!216621 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400295))))

(declare-fun b!258592 () Bool)

(declare-fun lt!400293 () (_ BitVec 64))

(assert (=> b!258592 (= e!179362 (bvsle lt!400295 (bvmul lt!400293 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258592 (or (= lt!400293 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400293 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400293)))))

(assert (=> b!258592 (= lt!400293 ((_ sign_extend 32) (size!6168 (buf!6690 thiss!1754))))))

(assert (= (and d!86770 res!216622) b!258591))

(assert (= (and b!258591 res!216621) b!258592))

(assert (=> d!86770 m!388025))

(assert (=> d!86770 m!388023))

(assert (=> b!258573 d!86770))

(push 1)

(assert (not d!86766))

(assert (not d!86770))

(assert (not d!86764))

(check-sat)

(pop 1)

(push 1)

(check-sat)

