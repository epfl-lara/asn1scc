; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!55516 () Bool)

(assert start!55516)

(declare-fun b!258601 () Bool)

(declare-fun res!216630 () Bool)

(declare-fun e!179370 () Bool)

(assert (=> b!258601 (=> (not res!216630) (not e!179370))))

(declare-fun nBits!535 () (_ BitVec 64))

(declare-datatypes ((array!14076 0))(
  ( (array!14077 (arr!7156 (Array (_ BitVec 32) (_ BitVec 8))) (size!6169 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!11260 0))(
  ( (BitStream!11261 (buf!6691 array!14076) (currentByte!12290 (_ BitVec 32)) (currentBit!12285 (_ BitVec 32))) )
))
(declare-fun thiss!1754 () BitStream!11260)

(declare-fun from!526 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!258601 (= res!216630 (validate_offset_bits!1 ((_ sign_extend 32) (size!6169 (buf!6691 thiss!1754))) ((_ sign_extend 32) (currentByte!12290 thiss!1754)) ((_ sign_extend 32) (currentBit!12285 thiss!1754)) (bvsub nBits!535 from!526)))))

(declare-fun res!216631 () Bool)

(assert (=> start!55516 (=> (not res!216631) (not e!179370))))

(assert (=> start!55516 (= res!216631 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!535) (bvsle nBits!535 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!526) (bvsle from!526 nBits!535)))))

(assert (=> start!55516 e!179370))

(assert (=> start!55516 true))

(declare-fun e!179369 () Bool)

(declare-fun inv!12 (BitStream!11260) Bool)

(assert (=> start!55516 (and (inv!12 thiss!1754) e!179369)))

(declare-fun b!258602 () Bool)

(declare-fun res!216629 () Bool)

(assert (=> b!258602 (=> (not res!216629) (not e!179370))))

(assert (=> b!258602 (= res!216629 (= from!526 nBits!535))))

(declare-fun b!258604 () Bool)

(declare-fun array_inv!5910 (array!14076) Bool)

(assert (=> b!258604 (= e!179369 (array_inv!5910 (buf!6691 thiss!1754)))))

(declare-fun lt!400301 () (_ BitVec 64))

(declare-fun b!258603 () Bool)

(declare-fun lt!400300 () (_ BitVec 64))

(assert (=> b!258603 (= e!179370 (and (not (= lt!400300 (bvand from!526 #b1000000000000000000000000000000000000000000000000000000000000000))) (not (= lt!400300 (bvand (bvsub lt!400301 from!526) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (=> b!258603 (= lt!400300 (bvand lt!400301 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!258603 (= lt!400301 (bvadd (bitIndex!0 (size!6169 (buf!6691 thiss!1754)) (currentByte!12290 thiss!1754) (currentBit!12285 thiss!1754)) nBits!535))))

(assert (= (and start!55516 res!216631) b!258601))

(assert (= (and b!258601 res!216630) b!258602))

(assert (= (and b!258602 res!216629) b!258603))

(assert (= start!55516 b!258604))

(declare-fun m!388031 () Bool)

(assert (=> b!258601 m!388031))

(declare-fun m!388033 () Bool)

(assert (=> start!55516 m!388033))

(declare-fun m!388035 () Bool)

(assert (=> b!258604 m!388035))

(declare-fun m!388037 () Bool)

(assert (=> b!258603 m!388037))

(push 1)

(assert (not b!258601))

(assert (not b!258604))

(assert (not b!258603))

(assert (not start!55516))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!86778 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!86778 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!6169 (buf!6691 thiss!1754))) ((_ sign_extend 32) (currentByte!12290 thiss!1754)) ((_ sign_extend 32) (currentBit!12285 thiss!1754)) (bvsub nBits!535 from!526)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6169 (buf!6691 thiss!1754))) ((_ sign_extend 32) (currentByte!12290 thiss!1754)) ((_ sign_extend 32) (currentBit!12285 thiss!1754))) (bvsub nBits!535 from!526)))))

(declare-fun bs!21957 () Bool)

(assert (= bs!21957 d!86778))

(declare-fun m!388055 () Bool)

(assert (=> bs!21957 m!388055))

(assert (=> b!258601 d!86778))

(declare-fun d!86780 () Bool)

(assert (=> d!86780 (= (array_inv!5910 (buf!6691 thiss!1754)) (bvsge (size!6169 (buf!6691 thiss!1754)) #b00000000000000000000000000000000))))

(assert (=> b!258604 d!86780))

(declare-fun d!86782 () Bool)

(declare-fun e!179392 () Bool)

(assert (=> d!86782 e!179392))

(declare-fun res!216655 () Bool)

(assert (=> d!86782 (=> (not res!216655) (not e!179392))))

(declare-fun lt!400327 () (_ BitVec 64))

(declare-fun lt!400331 () (_ BitVec 64))

(declare-fun lt!400326 () (_ BitVec 64))

(assert (=> d!86782 (= res!216655 (= lt!400326 (bvsub lt!400331 lt!400327)))))

(assert (=> d!86782 (or (= (bvand lt!400331 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!400327 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!400331 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!400331 lt!400327) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!86782 (= lt!400327 (remainingBits!0 ((_ sign_extend 32) (size!6169 (buf!6691 thiss!1754))) ((_ sign_extend 32) (currentByte!12290 thiss!1754)) ((_ sign_extend 32) (currentBit!12285 thiss!1754))))))

(declare-fun lt!400330 () (_ BitVec 64))

(declare-fun lt!400328 () (_ BitVec 64))

(assert (=> d!86782 (= lt!400331 (bvmul lt!400330 lt!400328))))

(assert (=> d!86782 (or (= lt!400330 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!400328 (bvsdiv (bvmul lt!400330 lt!400328) lt!400330)))))

(assert (=> d!86782 (= lt!400328 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!86782 (= lt!400330 ((_ sign_extend 32) (size!6169 (buf!6691 thiss!1754))))))

(assert (=> d!86782 (= lt!400326 (bvadd (bvmul ((_ sign_extend 32) (currentByte!12290 thiss!1754)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!12285 thiss!1754))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!86782 (invariant!0 (currentBit!12285 thiss!1754) (currentByte!12290 thiss!1754) (size!6169 (buf!6691 thiss!1754)))))

(assert (=> d!86782 (= (bitIndex!0 (size!6169 (buf!6691 thiss!1754)) (currentByte!12290 thiss!1754) (currentBit!12285 thiss!1754)) lt!400326)))

(declare-fun b!258633 () Bool)

(declare-fun res!216654 () Bool)

(assert (=> b!258633 (=> (not res!216654) (not e!179392))))

(assert (=> b!258633 (= res!216654 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!400326))))

(declare-fun b!258634 () Bool)

(declare-fun lt!400329 () (_ BitVec 64))

(assert (=> b!258634 (= e!179392 (bvsle lt!400326 (bvmul lt!400329 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!258634 (or (= lt!400329 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!400329 #b0000000000000000000000000000000000000000000000000000000000001000) lt!400329)))))

(assert (=> b!258634 (= lt!400329 ((_ sign_extend 32) (size!6169 (buf!6691 thiss!1754))))))

(assert (= (and d!86782 res!216655) b!258633))

(assert (= (and b!258633 res!216654) b!258634))

(assert (=> d!86782 m!388055))

(declare-fun m!388059 () Bool)

(assert (=> d!86782 m!388059))

(assert (=> b!258603 d!86782))

(declare-fun d!86794 () Bool)

(assert (=> d!86794 (= (inv!12 thiss!1754) (invariant!0 (currentBit!12285 thiss!1754) (currentByte!12290 thiss!1754) (size!6169 (buf!6691 thiss!1754))))))

(declare-fun bs!21959 () Bool)

(assert (= bs!21959 d!86794))

(assert (=> bs!21959 m!388059))

(assert (=> start!55516 d!86794))

(push 1)

(assert (not d!86794))

(assert (not d!86778))

(assert (not d!86782))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

