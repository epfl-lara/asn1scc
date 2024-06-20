; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73382 () Bool)

(assert start!73382)

(declare-fun res!267129 () Bool)

(declare-fun e!234736 () Bool)

(assert (=> start!73382 (=> (not res!267129) (not e!234736))))

(declare-fun lt!448004 () (_ BitVec 64))

(declare-datatypes ((array!21059 0))(
  ( (array!21060 (arr!10231 (Array (_ BitVec 32) (_ BitVec 8))) (size!9139 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14440 0))(
  ( (BitStream!14441 (buf!8281 array!21059) (currentByte!15373 (_ BitVec 32)) (currentBit!15368 (_ BitVec 32))) )
))
(declare-fun thiss!877 () BitStream!14440)

(assert (=> start!73382 (= res!267129 (and (bvsgt lt!448004 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (currentBit!15368 thiss!877) #b00000000000000000000000000000111)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> start!73382 (= lt!448004 (remainingBits!0 ((_ sign_extend 32) (size!9139 (buf!8281 thiss!877))) ((_ sign_extend 32) (currentByte!15373 thiss!877)) ((_ sign_extend 32) (currentBit!15368 thiss!877))))))

(assert (=> start!73382 e!234736))

(declare-fun e!234737 () Bool)

(declare-fun inv!12 (BitStream!14440) Bool)

(assert (=> start!73382 (and (inv!12 thiss!877) e!234737)))

(declare-fun b!325526 () Bool)

(declare-fun e!234738 () Bool)

(assert (=> b!325526 (= e!234736 e!234738)))

(declare-fun res!267130 () Bool)

(assert (=> b!325526 (=> res!267130 e!234738)))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!325526 (= res!267130 (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!9139 (buf!8281 thiss!877)) (currentByte!15373 thiss!877) (currentBit!15368 thiss!877))) (bitIndex!0 (size!9139 (buf!8281 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15373 thiss!877)) #b00000000000000000000000000000000))))))

(declare-fun b!325527 () Bool)

(assert (=> b!325527 (= e!234738 (not (= (bvsub lt!448004 (remainingBits!0 ((_ sign_extend 32) (size!9139 (buf!8281 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15373 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!325528 () Bool)

(declare-fun array_inv!8691 (array!21059) Bool)

(assert (=> b!325528 (= e!234737 (array_inv!8691 (buf!8281 thiss!877)))))

(assert (= (and start!73382 res!267129) b!325526))

(assert (= (and b!325526 (not res!267130)) b!325527))

(assert (= start!73382 b!325528))

(declare-fun m!463519 () Bool)

(assert (=> start!73382 m!463519))

(declare-fun m!463521 () Bool)

(assert (=> start!73382 m!463521))

(declare-fun m!463523 () Bool)

(assert (=> b!325526 m!463523))

(declare-fun m!463525 () Bool)

(assert (=> b!325526 m!463525))

(declare-fun m!463527 () Bool)

(assert (=> b!325527 m!463527))

(declare-fun m!463529 () Bool)

(assert (=> b!325528 m!463529))

(push 1)

(assert (not b!325527))

(assert (not b!325528))

(assert (not b!325526))

(assert (not start!73382))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!107338 () Bool)

(assert (=> d!107338 (= (remainingBits!0 ((_ sign_extend 32) (size!9139 (buf!8281 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15373 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsub (bvmul ((_ sign_extend 32) (size!9139 (buf!8281 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15373 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!325527 d!107338))

(declare-fun d!107340 () Bool)

(assert (=> d!107340 (= (array_inv!8691 (buf!8281 thiss!877)) (bvsge (size!9139 (buf!8281 thiss!877)) #b00000000000000000000000000000000))))

(assert (=> b!325528 d!107340))

(declare-fun d!107342 () Bool)

(declare-fun e!234769 () Bool)

(assert (=> d!107342 e!234769))

(declare-fun res!267155 () Bool)

(assert (=> d!107342 (=> (not res!267155) (not e!234769))))

(declare-fun lt!448049 () (_ BitVec 64))

(declare-fun lt!448048 () (_ BitVec 64))

(declare-fun lt!448052 () (_ BitVec 64))

(assert (=> d!107342 (= res!267155 (= lt!448052 (bvsub lt!448049 lt!448048)))))

(assert (=> d!107342 (or (= (bvand lt!448049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!448048 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!448049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!448049 lt!448048) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107342 (= lt!448048 (remainingBits!0 ((_ sign_extend 32) (size!9139 (buf!8281 thiss!877))) ((_ sign_extend 32) (currentByte!15373 thiss!877)) ((_ sign_extend 32) (currentBit!15368 thiss!877))))))

(declare-fun lt!448047 () (_ BitVec 64))

(declare-fun lt!448051 () (_ BitVec 64))

(assert (=> d!107342 (= lt!448049 (bvmul lt!448047 lt!448051))))

(assert (=> d!107342 (or (= lt!448047 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!448051 (bvsdiv (bvmul lt!448047 lt!448051) lt!448047)))))

(assert (=> d!107342 (= lt!448051 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107342 (= lt!448047 ((_ sign_extend 32) (size!9139 (buf!8281 thiss!877))))))

(assert (=> d!107342 (= lt!448052 (bvadd (bvmul ((_ sign_extend 32) (currentByte!15373 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15368 thiss!877))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!107342 (invariant!0 (currentBit!15368 thiss!877) (currentByte!15373 thiss!877) (size!9139 (buf!8281 thiss!877)))))

(assert (=> d!107342 (= (bitIndex!0 (size!9139 (buf!8281 thiss!877)) (currentByte!15373 thiss!877) (currentBit!15368 thiss!877)) lt!448052)))

(declare-fun b!325559 () Bool)

(declare-fun res!267156 () Bool)

(assert (=> b!325559 (=> (not res!267156) (not e!234769))))

(assert (=> b!325559 (= res!267156 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!448052))))

(declare-fun b!325560 () Bool)

(declare-fun lt!448050 () (_ BitVec 64))

(assert (=> b!325560 (= e!234769 (bvsle lt!448052 (bvmul lt!448050 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325560 (or (= lt!448050 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!448050 #b0000000000000000000000000000000000000000000000000000000000001000) lt!448050)))))

(assert (=> b!325560 (= lt!448050 ((_ sign_extend 32) (size!9139 (buf!8281 thiss!877))))))

(assert (= (and d!107342 res!267155) b!325559))

(assert (= (and b!325559 res!267156) b!325560))

(assert (=> d!107342 m!463519))

(declare-fun m!463561 () Bool)

(assert (=> d!107342 m!463561))

(assert (=> b!325526 d!107342))

(declare-fun d!107352 () Bool)

(declare-fun e!234770 () Bool)

(assert (=> d!107352 e!234770))

(declare-fun res!267157 () Bool)

(assert (=> d!107352 (=> (not res!267157) (not e!234770))))

(declare-fun lt!448055 () (_ BitVec 64))

(declare-fun lt!448054 () (_ BitVec 64))

(declare-fun lt!448058 () (_ BitVec 64))

(assert (=> d!107352 (= res!267157 (= lt!448058 (bvsub lt!448055 lt!448054)))))

(assert (=> d!107352 (or (= (bvand lt!448055 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!448054 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!448055 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!448055 lt!448054) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!107352 (= lt!448054 (remainingBits!0 ((_ sign_extend 32) (size!9139 (buf!8281 thiss!877))) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15373 thiss!877))) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(declare-fun lt!448053 () (_ BitVec 64))

(declare-fun lt!448057 () (_ BitVec 64))

(assert (=> d!107352 (= lt!448055 (bvmul lt!448053 lt!448057))))

(assert (=> d!107352 (or (= lt!448053 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!448057 (bvsdiv (bvmul lt!448053 lt!448057) lt!448053)))))

(assert (=> d!107352 (= lt!448057 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!107352 (= lt!448053 ((_ sign_extend 32) (size!9139 (buf!8281 thiss!877))))))

(assert (=> d!107352 (= lt!448058 (bvadd (bvmul ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 (currentByte!15373 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) #b00000000000000000000000000000000)))))

(assert (=> d!107352 (invariant!0 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 (currentByte!15373 thiss!877)) (size!9139 (buf!8281 thiss!877)))))

(assert (=> d!107352 (= (bitIndex!0 (size!9139 (buf!8281 thiss!877)) (bvadd #b00000000000000000000000000000001 (currentByte!15373 thiss!877)) #b00000000000000000000000000000000) lt!448058)))

(declare-fun b!325561 () Bool)

(declare-fun res!267158 () Bool)

(assert (=> b!325561 (=> (not res!267158) (not e!234770))))

(assert (=> b!325561 (= res!267158 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!448058))))

(declare-fun b!325562 () Bool)

(declare-fun lt!448056 () (_ BitVec 64))

(assert (=> b!325562 (= e!234770 (bvsle lt!448058 (bvmul lt!448056 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!325562 (or (= lt!448056 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!448056 #b0000000000000000000000000000000000000000000000000000000000001000) lt!448056)))))

(assert (=> b!325562 (= lt!448056 ((_ sign_extend 32) (size!9139 (buf!8281 thiss!877))))))

(assert (= (and d!107352 res!267157) b!325561))

(assert (= (and b!325561 res!267158) b!325562))

(declare-fun m!463563 () Bool)

(assert (=> d!107352 m!463563))

(declare-fun m!463565 () Bool)

(assert (=> d!107352 m!463565))

(assert (=> b!325526 d!107352))

(declare-fun d!107356 () Bool)

(assert (=> d!107356 (= (remainingBits!0 ((_ sign_extend 32) (size!9139 (buf!8281 thiss!877))) ((_ sign_extend 32) (currentByte!15373 thiss!877)) ((_ sign_extend 32) (currentBit!15368 thiss!877))) (bvsub (bvmul ((_ sign_extend 32) (size!9139 (buf!8281 thiss!877))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!15373 thiss!877)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!15368 thiss!877)))))))

(assert (=> start!73382 d!107356))

(declare-fun d!107358 () Bool)

(assert (=> d!107358 (= (inv!12 thiss!877) (invariant!0 (currentBit!15368 thiss!877) (currentByte!15373 thiss!877) (size!9139 (buf!8281 thiss!877))))))

(declare-fun bs!28242 () Bool)

(assert (= bs!28242 d!107358))

(assert (=> bs!28242 m!463561))

(assert (=> start!73382 d!107358))

(push 1)

(assert (not d!107342))

(assert (not d!107358))

(assert (not d!107352))

(check-sat)

(pop 1)

(push 1)

(check-sat)

