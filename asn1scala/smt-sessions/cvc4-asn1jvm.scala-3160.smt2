; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72618 () Bool)

(assert start!72618)

(declare-fun res!266170 () Bool)

(declare-fun e!233733 () Bool)

(assert (=> start!72618 (=> (not res!266170) (not e!233733))))

(declare-datatypes ((array!20807 0))(
  ( (array!20808 (arr!10140 (Array (_ BitVec 32) (_ BitVec 8))) (size!9048 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14258 0))(
  ( (BitStream!14259 (buf!8190 array!20807) (currentByte!15136 (_ BitVec 32)) (currentBit!15131 (_ BitVec 32))) )
))
(declare-fun thiss!1702 () BitStream!14258)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!72618 (= res!266170 (validate_offset_bit!0 ((_ sign_extend 32) (size!9048 (buf!8190 thiss!1702))) ((_ sign_extend 32) (currentByte!15136 thiss!1702)) ((_ sign_extend 32) (currentBit!15131 thiss!1702))))))

(assert (=> start!72618 e!233733))

(declare-fun e!233734 () Bool)

(declare-fun inv!12 (BitStream!14258) Bool)

(assert (=> start!72618 (and (inv!12 thiss!1702) e!233734)))

(declare-fun b!324293 () Bool)

(declare-fun e!233735 () Bool)

(assert (=> b!324293 (= e!233733 e!233735)))

(declare-fun res!266169 () Bool)

(assert (=> b!324293 (=> res!266169 e!233735)))

(declare-datatypes ((Unit!22096 0))(
  ( (Unit!22097) )
))
(declare-datatypes ((tuple2!23766 0))(
  ( (tuple2!23767 (_1!13512 Unit!22096) (_2!13512 BitStream!14258)) )
))
(declare-fun lt!446849 () tuple2!23766)

(assert (=> b!324293 (= res!266169 (not (= (buf!8190 (_2!13512 lt!446849)) (buf!8190 thiss!1702))))))

(declare-fun increaseBitIndex!0 (BitStream!14258) tuple2!23766)

(assert (=> b!324293 (= lt!446849 (increaseBitIndex!0 thiss!1702))))

(declare-fun b!324294 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!324294 (= e!233735 (not (= (bitIndex!0 (size!9048 (buf!8190 (_2!13512 lt!446849))) (currentByte!15136 (_2!13512 lt!446849)) (currentBit!15131 (_2!13512 lt!446849))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9048 (buf!8190 thiss!1702)) (currentByte!15136 thiss!1702) (currentBit!15131 thiss!1702))))))))

(declare-fun b!324295 () Bool)

(declare-fun array_inv!8600 (array!20807) Bool)

(assert (=> b!324295 (= e!233734 (array_inv!8600 (buf!8190 thiss!1702)))))

(assert (= (and start!72618 res!266170) b!324293))

(assert (= (and b!324293 (not res!266169)) b!324294))

(assert (= start!72618 b!324295))

(declare-fun m!462407 () Bool)

(assert (=> start!72618 m!462407))

(declare-fun m!462409 () Bool)

(assert (=> start!72618 m!462409))

(declare-fun m!462411 () Bool)

(assert (=> b!324293 m!462411))

(declare-fun m!462413 () Bool)

(assert (=> b!324294 m!462413))

(declare-fun m!462415 () Bool)

(assert (=> b!324294 m!462415))

(declare-fun m!462417 () Bool)

(assert (=> b!324295 m!462417))

(push 1)

(assert (not b!324295))

(assert (not start!72618))

(assert (not b!324293))

(assert (not b!324294))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!106554 () Bool)

(assert (=> d!106554 (= (array_inv!8600 (buf!8190 thiss!1702)) (bvsge (size!9048 (buf!8190 thiss!1702)) #b00000000000000000000000000000000))))

(assert (=> b!324295 d!106554))

(declare-fun d!106556 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!106556 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!9048 (buf!8190 thiss!1702))) ((_ sign_extend 32) (currentByte!15136 thiss!1702)) ((_ sign_extend 32) (currentBit!15131 thiss!1702))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!9048 (buf!8190 thiss!1702))) ((_ sign_extend 32) (currentByte!15136 thiss!1702)) ((_ sign_extend 32) (currentBit!15131 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!28068 () Bool)

(assert (= bs!28068 d!106556))

(declare-fun m!462423 () Bool)

(assert (=> bs!28068 m!462423))

(assert (=> start!72618 d!106556))

(declare-fun d!106558 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!106558 (= (inv!12 thiss!1702) (invariant!0 (currentBit!15131 thiss!1702) (currentByte!15136 thiss!1702) (size!9048 (buf!8190 thiss!1702))))))

(declare-fun bs!28069 () Bool)

(assert (= bs!28069 d!106558))

(declare-fun m!462431 () Bool)

(assert (=> bs!28069 m!462431))

(assert (=> start!72618 d!106558))

(declare-fun d!106562 () Bool)

(declare-fun e!233753 () Bool)

(assert (=> d!106562 e!233753))

(declare-fun res!266204 () Bool)

(assert (=> d!106562 (=> (not res!266204) (not e!233753))))

(declare-fun lt!446938 () (_ BitVec 64))

(declare-fun lt!446941 () tuple2!23766)

(declare-fun lt!446942 () (_ BitVec 64))

(assert (=> d!106562 (= res!266204 (= (bvadd lt!446942 lt!446938) (bitIndex!0 (size!9048 (buf!8190 (_2!13512 lt!446941))) (currentByte!15136 (_2!13512 lt!446941)) (currentBit!15131 (_2!13512 lt!446941)))))))

(assert (=> d!106562 (or (not (= (bvand lt!446942 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446938 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!446942 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!446942 lt!446938) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106562 (= lt!446938 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!106562 (= lt!446942 (bitIndex!0 (size!9048 (buf!8190 thiss!1702)) (currentByte!15136 thiss!1702) (currentBit!15131 thiss!1702)))))

(declare-fun Unit!22102 () Unit!22096)

(declare-fun Unit!22103 () Unit!22096)

(assert (=> d!106562 (= lt!446941 (ite (bvslt (currentBit!15131 thiss!1702) #b00000000000000000000000000000111) (tuple2!23767 Unit!22102 (BitStream!14259 (buf!8190 thiss!1702) (currentByte!15136 thiss!1702) (bvadd (currentBit!15131 thiss!1702) #b00000000000000000000000000000001))) (tuple2!23767 Unit!22103 (BitStream!14259 (buf!8190 thiss!1702) (bvadd (currentByte!15136 thiss!1702) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!106562 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!9048 (buf!8190 thiss!1702))) ((_ sign_extend 32) (currentByte!15136 thiss!1702)) ((_ sign_extend 32) (currentBit!15131 thiss!1702))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!106562 (= (increaseBitIndex!0 thiss!1702) lt!446941)))

(declare-fun b!324328 () Bool)

(declare-fun res!266203 () Bool)

(assert (=> b!324328 (=> (not res!266203) (not e!233753))))

(declare-fun lt!446939 () (_ BitVec 64))

(declare-fun lt!446940 () (_ BitVec 64))

(assert (=> b!324328 (= res!266203 (= (bvsub lt!446939 lt!446940) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!324328 (or (= (bvand lt!446939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446940 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446939 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446939 lt!446940) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!324328 (= lt!446940 (remainingBits!0 ((_ sign_extend 32) (size!9048 (buf!8190 (_2!13512 lt!446941)))) ((_ sign_extend 32) (currentByte!15136 (_2!13512 lt!446941))) ((_ sign_extend 32) (currentBit!15131 (_2!13512 lt!446941)))))))

(assert (=> b!324328 (= lt!446939 (remainingBits!0 ((_ sign_extend 32) (size!9048 (buf!8190 thiss!1702))) ((_ sign_extend 32) (currentByte!15136 thiss!1702)) ((_ sign_extend 32) (currentBit!15131 thiss!1702))))))

(declare-fun b!324329 () Bool)

(assert (=> b!324329 (= e!233753 (= (size!9048 (buf!8190 thiss!1702)) (size!9048 (buf!8190 (_2!13512 lt!446941)))))))

(assert (= (and d!106562 res!266204) b!324328))

(assert (= (and b!324328 res!266203) b!324329))

(declare-fun m!462447 () Bool)

(assert (=> d!106562 m!462447))

(assert (=> d!106562 m!462415))

(assert (=> d!106562 m!462423))

(declare-fun m!462449 () Bool)

(assert (=> b!324328 m!462449))

(assert (=> b!324328 m!462423))

(assert (=> b!324293 d!106562))

(declare-fun d!106578 () Bool)

(declare-fun e!233756 () Bool)

(assert (=> d!106578 e!233756))

(declare-fun res!266209 () Bool)

(assert (=> d!106578 (=> (not res!266209) (not e!233756))))

(declare-fun lt!446956 () (_ BitVec 64))

(declare-fun lt!446959 () (_ BitVec 64))

(declare-fun lt!446960 () (_ BitVec 64))

(assert (=> d!106578 (= res!266209 (= lt!446956 (bvsub lt!446960 lt!446959)))))

(assert (=> d!106578 (or (= (bvand lt!446960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446959 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446960 lt!446959) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106578 (= lt!446959 (remainingBits!0 ((_ sign_extend 32) (size!9048 (buf!8190 (_2!13512 lt!446849)))) ((_ sign_extend 32) (currentByte!15136 (_2!13512 lt!446849))) ((_ sign_extend 32) (currentBit!15131 (_2!13512 lt!446849)))))))

(declare-fun lt!446957 () (_ BitVec 64))

(declare-fun lt!446958 () (_ BitVec 64))

(assert (=> d!106578 (= lt!446960 (bvmul lt!446957 lt!446958))))

(assert (=> d!106578 (or (= lt!446957 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446958 (bvsdiv (bvmul lt!446957 lt!446958) lt!446957)))))

(assert (=> d!106578 (= lt!446958 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106578 (= lt!446957 ((_ sign_extend 32) (size!9048 (buf!8190 (_2!13512 lt!446849)))))))

(assert (=> d!106578 (= lt!446956 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15136 (_2!13512 lt!446849))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15131 (_2!13512 lt!446849)))))))

(assert (=> d!106578 (invariant!0 (currentBit!15131 (_2!13512 lt!446849)) (currentByte!15136 (_2!13512 lt!446849)) (size!9048 (buf!8190 (_2!13512 lt!446849))))))

(assert (=> d!106578 (= (bitIndex!0 (size!9048 (buf!8190 (_2!13512 lt!446849))) (currentByte!15136 (_2!13512 lt!446849)) (currentBit!15131 (_2!13512 lt!446849))) lt!446956)))

(declare-fun b!324334 () Bool)

(declare-fun res!266210 () Bool)

(assert (=> b!324334 (=> (not res!266210) (not e!233756))))

(assert (=> b!324334 (= res!266210 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446956))))

(declare-fun b!324335 () Bool)

(declare-fun lt!446955 () (_ BitVec 64))

(assert (=> b!324335 (= e!233756 (bvsle lt!446956 (bvmul lt!446955 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324335 (or (= lt!446955 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446955 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446955)))))

(assert (=> b!324335 (= lt!446955 ((_ sign_extend 32) (size!9048 (buf!8190 (_2!13512 lt!446849)))))))

(assert (= (and d!106578 res!266209) b!324334))

(assert (= (and b!324334 res!266210) b!324335))

(declare-fun m!462451 () Bool)

(assert (=> d!106578 m!462451))

(declare-fun m!462453 () Bool)

(assert (=> d!106578 m!462453))

(assert (=> b!324294 d!106578))

(declare-fun d!106580 () Bool)

(declare-fun e!233757 () Bool)

(assert (=> d!106580 e!233757))

(declare-fun res!266211 () Bool)

(assert (=> d!106580 (=> (not res!266211) (not e!233757))))

(declare-fun lt!446962 () (_ BitVec 64))

(declare-fun lt!446966 () (_ BitVec 64))

(declare-fun lt!446965 () (_ BitVec 64))

(assert (=> d!106580 (= res!266211 (= lt!446962 (bvsub lt!446966 lt!446965)))))

(assert (=> d!106580 (or (= (bvand lt!446966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!446965 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!446966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!446966 lt!446965) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!106580 (= lt!446965 (remainingBits!0 ((_ sign_extend 32) (size!9048 (buf!8190 thiss!1702))) ((_ sign_extend 32) (currentByte!15136 thiss!1702)) ((_ sign_extend 32) (currentBit!15131 thiss!1702))))))

(declare-fun lt!446963 () (_ BitVec 64))

(declare-fun lt!446964 () (_ BitVec 64))

(assert (=> d!106580 (= lt!446966 (bvmul lt!446963 lt!446964))))

(assert (=> d!106580 (or (= lt!446963 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!446964 (bvsdiv (bvmul lt!446963 lt!446964) lt!446963)))))

(assert (=> d!106580 (= lt!446964 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!106580 (= lt!446963 ((_ sign_extend 32) (size!9048 (buf!8190 thiss!1702))))))

(assert (=> d!106580 (= lt!446962 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15136 thiss!1702)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15131 thiss!1702))))))

(assert (=> d!106580 (invariant!0 (currentBit!15131 thiss!1702) (currentByte!15136 thiss!1702) (size!9048 (buf!8190 thiss!1702)))))

(assert (=> d!106580 (= (bitIndex!0 (size!9048 (buf!8190 thiss!1702)) (currentByte!15136 thiss!1702) (currentBit!15131 thiss!1702)) lt!446962)))

(declare-fun b!324336 () Bool)

(declare-fun res!266212 () Bool)

(assert (=> b!324336 (=> (not res!266212) (not e!233757))))

(assert (=> b!324336 (= res!266212 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!446962))))

(declare-fun b!324337 () Bool)

(declare-fun lt!446961 () (_ BitVec 64))

(assert (=> b!324337 (= e!233757 (bvsle lt!446962 (bvmul lt!446961 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!324337 (or (= lt!446961 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!446961 #b0000000000000000000000000000000000000000000000000000000000001000) lt!446961)))))

(assert (=> b!324337 (= lt!446961 ((_ sign_extend 32) (size!9048 (buf!8190 thiss!1702))))))

(assert (= (and d!106580 res!266211) b!324336))

(assert (= (and b!324336 res!266212) b!324337))

(assert (=> d!106580 m!462423))

(assert (=> d!106580 m!462431))

(assert (=> b!324294 d!106580))

(push 1)

(assert (not d!106556))

(assert (not d!106558))

(assert (not d!106562))

(assert (not d!106580))

(assert (not d!106578))

(assert (not b!324328))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

