; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16928 () Bool)

(assert start!16928)

(declare-fun b!83100 () Bool)

(declare-fun e!55143 () Bool)

(declare-datatypes ((array!3792 0))(
  ( (array!3793 (arr!2366 (Array (_ BitVec 32) (_ BitVec 8))) (size!1729 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3020 0))(
  ( (BitStream!3021 (buf!2119 array!3792) (currentByte!4189 (_ BitVec 32)) (currentBit!4184 (_ BitVec 32))) )
))
(declare-fun b1!98 () BitStream!3020)

(declare-fun array_inv!1575 (array!3792) Bool)

(assert (=> b!83100 (= e!55143 (array_inv!1575 (buf!2119 b1!98)))))

(declare-fun b!83101 () Bool)

(declare-fun e!55146 () Bool)

(declare-fun e!55145 () Bool)

(assert (=> b!83101 (= e!55146 e!55145)))

(declare-fun res!68393 () Bool)

(assert (=> b!83101 (=> (not res!68393) (not e!55145))))

(declare-fun lt!132389 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(declare-fun b2!98 () BitStream!3020)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83101 (= res!68393 (= (bvadd lt!132389 b1b2Diff!1) (bitIndex!0 (size!1729 (buf!2119 b2!98)) (currentByte!4189 b2!98) (currentBit!4184 b2!98))))))

(assert (=> b!83101 (= lt!132389 (bitIndex!0 (size!1729 (buf!2119 b1!98)) (currentByte!4189 b1!98) (currentBit!4184 b1!98)))))

(declare-fun res!68395 () Bool)

(assert (=> start!16928 (=> (not res!68395) (not e!55146))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(assert (=> start!16928 (= res!68395 (and (= (size!1729 (buf!2119 b1!98)) (size!1729 (buf!2119 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!16928 e!55146))

(declare-fun inv!12 (BitStream!3020) Bool)

(assert (=> start!16928 (and (inv!12 b1!98) e!55143)))

(declare-fun e!55141 () Bool)

(assert (=> start!16928 (and (inv!12 b2!98) e!55141)))

(assert (=> start!16928 true))

(declare-fun b!83102 () Bool)

(assert (=> b!83102 (= e!55141 (array_inv!1575 (buf!2119 b2!98)))))

(declare-fun lt!132388 () (_ BitVec 64))

(declare-fun b!83103 () Bool)

(assert (=> b!83103 (= e!55145 (not (bvsle lt!132389 (bvsub lt!132388 b1ValidateOffsetBits!11))))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83103 (= (remainingBits!0 ((_ sign_extend 32) (size!1729 (buf!2119 b1!98))) ((_ sign_extend 32) (currentByte!4189 b1!98)) ((_ sign_extend 32) (currentBit!4184 b1!98))) (bvsub lt!132388 lt!132389))))

(assert (=> b!83103 (= lt!132388 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1729 (buf!2119 b1!98)))))))

(declare-datatypes ((Unit!5567 0))(
  ( (Unit!5568) )
))
(declare-fun lt!132390 () Unit!5567)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3020) Unit!5567)

(assert (=> b!83103 (= lt!132390 (remainingBitsBitIndexLemma!0 b1!98))))

(declare-fun b!83104 () Bool)

(declare-fun res!68394 () Bool)

(assert (=> b!83104 (=> (not res!68394) (not e!55146))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83104 (= res!68394 (validate_offset_bits!1 ((_ sign_extend 32) (size!1729 (buf!2119 b1!98))) ((_ sign_extend 32) (currentByte!4189 b1!98)) ((_ sign_extend 32) (currentBit!4184 b1!98)) b1ValidateOffsetBits!11))))

(assert (= (and start!16928 res!68395) b!83104))

(assert (= (and b!83104 res!68394) b!83101))

(assert (= (and b!83101 res!68393) b!83103))

(assert (= start!16928 b!83100))

(assert (= start!16928 b!83102))

(declare-fun m!129645 () Bool)

(assert (=> b!83100 m!129645))

(declare-fun m!129647 () Bool)

(assert (=> b!83102 m!129647))

(declare-fun m!129649 () Bool)

(assert (=> b!83104 m!129649))

(declare-fun m!129651 () Bool)

(assert (=> b!83101 m!129651))

(declare-fun m!129653 () Bool)

(assert (=> b!83101 m!129653))

(declare-fun m!129655 () Bool)

(assert (=> b!83103 m!129655))

(declare-fun m!129657 () Bool)

(assert (=> b!83103 m!129657))

(declare-fun m!129659 () Bool)

(assert (=> start!16928 m!129659))

(declare-fun m!129661 () Bool)

(assert (=> start!16928 m!129661))

(push 1)

(assert (not b!83102))

(assert (not b!83101))

(assert (not b!83103))

(assert (not b!83104))

(assert (not b!83100))

(assert (not start!16928))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!26488 () Bool)

(assert (=> d!26488 (= (array_inv!1575 (buf!2119 b1!98)) (bvsge (size!1729 (buf!2119 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83100 d!26488))

(declare-fun d!26490 () Bool)

(declare-fun e!55153 () Bool)

(assert (=> d!26490 e!55153))

(declare-fun res!68409 () Bool)

(assert (=> d!26490 (=> (not res!68409) (not e!55153))))

(declare-fun lt!132442 () (_ BitVec 64))

(declare-fun lt!132443 () (_ BitVec 64))

(declare-fun lt!132446 () (_ BitVec 64))

(assert (=> d!26490 (= res!68409 (= lt!132443 (bvsub lt!132442 lt!132446)))))

(assert (=> d!26490 (or (= (bvand lt!132442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132446 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132442 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132442 lt!132446) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26490 (= lt!132446 (remainingBits!0 ((_ sign_extend 32) (size!1729 (buf!2119 b2!98))) ((_ sign_extend 32) (currentByte!4189 b2!98)) ((_ sign_extend 32) (currentBit!4184 b2!98))))))

(declare-fun lt!132444 () (_ BitVec 64))

(declare-fun lt!132447 () (_ BitVec 64))

(assert (=> d!26490 (= lt!132442 (bvmul lt!132444 lt!132447))))

(assert (=> d!26490 (or (= lt!132444 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132447 (bvsdiv (bvmul lt!132444 lt!132447) lt!132444)))))

(assert (=> d!26490 (= lt!132447 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26490 (= lt!132444 ((_ sign_extend 32) (size!1729 (buf!2119 b2!98))))))

(assert (=> d!26490 (= lt!132443 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4189 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4184 b2!98))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26490 (invariant!0 (currentBit!4184 b2!98) (currentByte!4189 b2!98) (size!1729 (buf!2119 b2!98)))))

(assert (=> d!26490 (= (bitIndex!0 (size!1729 (buf!2119 b2!98)) (currentByte!4189 b2!98) (currentBit!4184 b2!98)) lt!132443)))

(declare-fun b!83118 () Bool)

(declare-fun res!68408 () Bool)

(assert (=> b!83118 (=> (not res!68408) (not e!55153))))

(assert (=> b!83118 (= res!68408 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132443))))

(declare-fun b!83119 () Bool)

(declare-fun lt!132445 () (_ BitVec 64))

(assert (=> b!83119 (= e!55153 (bvsle lt!132443 (bvmul lt!132445 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83119 (or (= lt!132445 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132445 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132445)))))

(assert (=> b!83119 (= lt!132445 ((_ sign_extend 32) (size!1729 (buf!2119 b2!98))))))

(assert (= (and d!26490 res!68409) b!83118))

(assert (= (and b!83118 res!68408) b!83119))

(declare-fun m!129671 () Bool)

(assert (=> d!26490 m!129671))

(declare-fun m!129673 () Bool)

(assert (=> d!26490 m!129673))

(assert (=> b!83101 d!26490))

(declare-fun d!26492 () Bool)

(declare-fun e!55154 () Bool)

(assert (=> d!26492 e!55154))

(declare-fun res!68411 () Bool)

(assert (=> d!26492 (=> (not res!68411) (not e!55154))))

(declare-fun lt!132452 () (_ BitVec 64))

(declare-fun lt!132448 () (_ BitVec 64))

(declare-fun lt!132449 () (_ BitVec 64))

(assert (=> d!26492 (= res!68411 (= lt!132449 (bvsub lt!132448 lt!132452)))))

(assert (=> d!26492 (or (= (bvand lt!132448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132452 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132448 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132448 lt!132452) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26492 (= lt!132452 (remainingBits!0 ((_ sign_extend 32) (size!1729 (buf!2119 b1!98))) ((_ sign_extend 32) (currentByte!4189 b1!98)) ((_ sign_extend 32) (currentBit!4184 b1!98))))))

(declare-fun lt!132450 () (_ BitVec 64))

(declare-fun lt!132453 () (_ BitVec 64))

(assert (=> d!26492 (= lt!132448 (bvmul lt!132450 lt!132453))))

(assert (=> d!26492 (or (= lt!132450 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132453 (bvsdiv (bvmul lt!132450 lt!132453) lt!132450)))))

(assert (=> d!26492 (= lt!132453 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26492 (= lt!132450 ((_ sign_extend 32) (size!1729 (buf!2119 b1!98))))))

(assert (=> d!26492 (= lt!132449 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4189 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4184 b1!98))))))

(assert (=> d!26492 (invariant!0 (currentBit!4184 b1!98) (currentByte!4189 b1!98) (size!1729 (buf!2119 b1!98)))))

(assert (=> d!26492 (= (bitIndex!0 (size!1729 (buf!2119 b1!98)) (currentByte!4189 b1!98) (currentBit!4184 b1!98)) lt!132449)))

(declare-fun b!83120 () Bool)

(declare-fun res!68410 () Bool)

(assert (=> b!83120 (=> (not res!68410) (not e!55154))))

(assert (=> b!83120 (= res!68410 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!132449))))

(declare-fun b!83121 () Bool)

(declare-fun lt!132451 () (_ BitVec 64))

(assert (=> b!83121 (= e!55154 (bvsle lt!132449 (bvmul lt!132451 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83121 (or (= lt!132451 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!132451 #b0000000000000000000000000000000000000000000000000000000000001000) lt!132451)))))

(assert (=> b!83121 (= lt!132451 ((_ sign_extend 32) (size!1729 (buf!2119 b1!98))))))

(assert (= (and d!26492 res!68411) b!83120))

(assert (= (and b!83120 res!68410) b!83121))

(assert (=> d!26492 m!129655))

(declare-fun m!129675 () Bool)

(assert (=> d!26492 m!129675))

(assert (=> b!83101 d!26492))

(declare-fun d!26494 () Bool)

(assert (=> d!26494 (= (inv!12 b1!98) (invariant!0 (currentBit!4184 b1!98) (currentByte!4189 b1!98) (size!1729 (buf!2119 b1!98))))))

(declare-fun bs!6506 () Bool)

(assert (= bs!6506 d!26494))

(assert (=> bs!6506 m!129675))

(assert (=> start!16928 d!26494))

(declare-fun d!26498 () Bool)

(assert (=> d!26498 (= (inv!12 b2!98) (invariant!0 (currentBit!4184 b2!98) (currentByte!4189 b2!98) (size!1729 (buf!2119 b2!98))))))

(declare-fun bs!6507 () Bool)

(assert (= bs!6507 d!26498))

(assert (=> bs!6507 m!129673))

(assert (=> start!16928 d!26498))

(declare-fun d!26500 () Bool)

(assert (=> d!26500 (= (array_inv!1575 (buf!2119 b2!98)) (bvsge (size!1729 (buf!2119 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83102 d!26500))

(declare-fun d!26502 () Bool)

(assert (=> d!26502 (= (remainingBits!0 ((_ sign_extend 32) (size!1729 (buf!2119 b1!98))) ((_ sign_extend 32) (currentByte!4189 b1!98)) ((_ sign_extend 32) (currentBit!4184 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1729 (buf!2119 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4189 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4184 b1!98)))))))

(assert (=> b!83103 d!26502))

(declare-fun d!26510 () Bool)

(declare-fun lt!132464 () (_ BitVec 64))

(declare-fun lt!132466 () (_ BitVec 64))

(assert (=> d!26510 (= (remainingBits!0 ((_ sign_extend 32) (size!1729 (buf!2119 b1!98))) ((_ sign_extend 32) (currentByte!4189 b1!98)) ((_ sign_extend 32) (currentBit!4184 b1!98))) (bvsub lt!132464 lt!132466))))

(assert (=> d!26510 (or (= (bvand lt!132464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!132466 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!132464 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!132464 lt!132466) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26510 (= lt!132466 (bitIndex!0 (size!1729 (buf!2119 b1!98)) (currentByte!4189 b1!98) (currentBit!4184 b1!98)))))

(declare-fun lt!132468 () (_ BitVec 64))

(declare-fun lt!132465 () (_ BitVec 64))

(assert (=> d!26510 (= lt!132464 (bvmul lt!132468 lt!132465))))

(assert (=> d!26510 (or (= lt!132468 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!132465 (bvsdiv (bvmul lt!132468 lt!132465) lt!132468)))))

(assert (=> d!26510 (= lt!132465 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26510 (= lt!132468 ((_ sign_extend 32) (size!1729 (buf!2119 b1!98))))))

(declare-fun lt!132467 () Unit!5567)

(declare-fun choose!23 (BitStream!3020) Unit!5567)

(assert (=> d!26510 (= lt!132467 (choose!23 b1!98))))

(assert (=> d!26510 (= (remainingBitsBitIndexLemma!0 b1!98) lt!132467)))

(declare-fun bs!6511 () Bool)

(assert (= bs!6511 d!26510))

(assert (=> bs!6511 m!129655))

(assert (=> bs!6511 m!129653))

(declare-fun m!129681 () Bool)

(assert (=> bs!6511 m!129681))

(assert (=> b!83103 d!26510))

(declare-fun d!26516 () Bool)

(assert (=> d!26516 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1729 (buf!2119 b1!98))) ((_ sign_extend 32) (currentByte!4189 b1!98)) ((_ sign_extend 32) (currentBit!4184 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1729 (buf!2119 b1!98))) ((_ sign_extend 32) (currentByte!4189 b1!98)) ((_ sign_extend 32) (currentBit!4184 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6512 () Bool)

(assert (= bs!6512 d!26516))

(assert (=> bs!6512 m!129655))

(assert (=> b!83104 d!26516))

(push 1)

(assert (not d!26510))

(assert (not d!26490))

(assert (not d!26516))

(assert (not d!26498))

(assert (not d!26492))

(assert (not d!26494))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

