; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18800 () Bool)

(assert start!18800)

(declare-fun res!77328 () Bool)

(declare-fun e!61560 () Bool)

(assert (=> start!18800 (=> (not res!77328) (not e!61560))))

(declare-fun nBits!484 () (_ BitVec 64))

(assert (=> start!18800 (= res!77328 (bvsgt nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> start!18800 e!61560))

(assert (=> start!18800 true))

(declare-datatypes ((array!4392 0))(
  ( (array!4393 (arr!2610 (Array (_ BitVec 32) (_ BitVec 8))) (size!1993 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3508 0))(
  ( (BitStream!3509 (buf!2363 array!4392) (currentByte!4705 (_ BitVec 32)) (currentBit!4700 (_ BitVec 32))) )
))
(declare-fun bitStream1!8 () BitStream!3508)

(declare-fun e!61565 () Bool)

(declare-fun inv!12 (BitStream!3508) Bool)

(assert (=> start!18800 (and (inv!12 bitStream1!8) e!61565)))

(declare-fun bitStream2!8 () BitStream!3508)

(declare-fun e!61564 () Bool)

(assert (=> start!18800 (and (inv!12 bitStream2!8) e!61564)))

(declare-fun base!8 () BitStream!3508)

(declare-fun e!61561 () Bool)

(assert (=> start!18800 (and (inv!12 base!8) e!61561)))

(declare-fun thiss!1534 () BitStream!3508)

(declare-fun e!61559 () Bool)

(assert (=> start!18800 (and (inv!12 thiss!1534) e!61559)))

(declare-fun b!93744 () Bool)

(declare-fun array_inv!1819 (array!4392) Bool)

(assert (=> b!93744 (= e!61561 (array_inv!1819 (buf!2363 base!8)))))

(declare-fun b!93745 () Bool)

(declare-fun res!77324 () Bool)

(assert (=> b!93745 (=> (not res!77324) (not e!61560))))

(declare-fun isPrefixOf!0 (BitStream!3508 BitStream!3508) Bool)

(assert (=> b!93745 (= res!77324 (isPrefixOf!0 bitStream1!8 bitStream2!8))))

(declare-fun b!93746 () Bool)

(declare-fun res!77325 () Bool)

(assert (=> b!93746 (=> (not res!77325) (not e!61560))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93746 (= res!77325 (validate_offset_bits!1 ((_ sign_extend 32) (size!1993 (buf!2363 bitStream2!8))) ((_ sign_extend 32) (currentByte!4705 bitStream2!8)) ((_ sign_extend 32) (currentBit!4700 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!93747 () Bool)

(declare-fun res!77327 () Bool)

(assert (=> b!93747 (=> (not res!77327) (not e!61560))))

(assert (=> b!93747 (= res!77327 (isPrefixOf!0 bitStream1!8 base!8))))

(declare-fun b!93748 () Bool)

(declare-fun res!77326 () Bool)

(assert (=> b!93748 (=> (not res!77326) (not e!61560))))

(assert (=> b!93748 (= res!77326 (isPrefixOf!0 bitStream2!8 base!8))))

(declare-fun b!93749 () Bool)

(declare-fun res!77320 () Bool)

(assert (=> b!93749 (=> (not res!77320) (not e!61560))))

(declare-datatypes ((List!860 0))(
  ( (Nil!857) (Cons!856 (h!975 Bool) (t!1610 List!860)) )
))
(declare-fun listBits!13 () List!860)

(declare-fun length!451 (List!860) Int)

(assert (=> b!93749 (= res!77320 (> (length!451 listBits!13) 0))))

(declare-fun b!93750 () Bool)

(declare-fun res!77323 () Bool)

(assert (=> b!93750 (=> (not res!77323) (not e!61560))))

(assert (=> b!93750 (= res!77323 (and (= (buf!2363 bitStream1!8) (buf!2363 bitStream2!8)) (= (buf!2363 bitStream1!8) (buf!2363 base!8))))))

(declare-fun b!93751 () Bool)

(declare-fun res!77319 () Bool)

(assert (=> b!93751 (=> (not res!77319) (not e!61560))))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!3508 BitStream!3508 (_ BitVec 64)) List!860)

(assert (=> b!93751 (= res!77319 (= listBits!13 (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484)))))

(declare-fun b!93752 () Bool)

(assert (=> b!93752 (= e!61565 (array_inv!1819 (buf!2363 bitStream1!8)))))

(declare-fun b!93753 () Bool)

(declare-fun res!77322 () Bool)

(assert (=> b!93753 (=> (not res!77322) (not e!61560))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!93753 (= res!77322 (bvslt (bitIndex!0 (size!1993 (buf!2363 base!8)) (currentByte!4705 base!8) (currentBit!4700 base!8)) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!484)))))

(declare-fun b!93754 () Bool)

(assert (=> b!93754 (= e!61560 (and (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001) (= listBits!13 Nil!857)))))

(declare-fun b!93755 () Bool)

(declare-fun res!77321 () Bool)

(assert (=> b!93755 (=> (not res!77321) (not e!61560))))

(assert (=> b!93755 (= res!77321 (validate_offset_bits!1 ((_ sign_extend 32) (size!1993 (buf!2363 bitStream1!8))) ((_ sign_extend 32) (currentByte!4705 bitStream1!8)) ((_ sign_extend 32) (currentBit!4700 bitStream1!8)) nBits!484))))

(declare-fun b!93756 () Bool)

(assert (=> b!93756 (= e!61559 (array_inv!1819 (buf!2363 thiss!1534)))))

(declare-fun b!93757 () Bool)

(declare-fun res!77318 () Bool)

(assert (=> b!93757 (=> (not res!77318) (not e!61560))))

(assert (=> b!93757 (= res!77318 (= (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!1993 (buf!2363 bitStream1!8)) (currentByte!4705 bitStream1!8) (currentBit!4700 bitStream1!8))) (bitIndex!0 (size!1993 (buf!2363 bitStream2!8)) (currentByte!4705 bitStream2!8) (currentBit!4700 bitStream2!8))))))

(declare-fun b!93758 () Bool)

(assert (=> b!93758 (= e!61564 (array_inv!1819 (buf!2363 bitStream2!8)))))

(assert (= (and start!18800 res!77328) b!93749))

(assert (= (and b!93749 res!77320) b!93747))

(assert (= (and b!93747 res!77327) b!93748))

(assert (= (and b!93748 res!77326) b!93745))

(assert (= (and b!93745 res!77324) b!93750))

(assert (= (and b!93750 res!77323) b!93753))

(assert (= (and b!93753 res!77322) b!93757))

(assert (= (and b!93757 res!77318) b!93755))

(assert (= (and b!93755 res!77321) b!93746))

(assert (= (and b!93746 res!77325) b!93751))

(assert (= (and b!93751 res!77319) b!93754))

(assert (= start!18800 b!93752))

(assert (= start!18800 b!93758))

(assert (= start!18800 b!93744))

(assert (= start!18800 b!93756))

(declare-fun m!137477 () Bool)

(assert (=> b!93747 m!137477))

(declare-fun m!137479 () Bool)

(assert (=> start!18800 m!137479))

(declare-fun m!137481 () Bool)

(assert (=> start!18800 m!137481))

(declare-fun m!137483 () Bool)

(assert (=> start!18800 m!137483))

(declare-fun m!137485 () Bool)

(assert (=> start!18800 m!137485))

(declare-fun m!137487 () Bool)

(assert (=> b!93753 m!137487))

(declare-fun m!137489 () Bool)

(assert (=> b!93756 m!137489))

(declare-fun m!137491 () Bool)

(assert (=> b!93745 m!137491))

(declare-fun m!137493 () Bool)

(assert (=> b!93757 m!137493))

(declare-fun m!137495 () Bool)

(assert (=> b!93757 m!137495))

(declare-fun m!137497 () Bool)

(assert (=> b!93748 m!137497))

(declare-fun m!137499 () Bool)

(assert (=> b!93746 m!137499))

(declare-fun m!137501 () Bool)

(assert (=> b!93749 m!137501))

(declare-fun m!137503 () Bool)

(assert (=> b!93755 m!137503))

(declare-fun m!137505 () Bool)

(assert (=> b!93758 m!137505))

(declare-fun m!137507 () Bool)

(assert (=> b!93752 m!137507))

(declare-fun m!137509 () Bool)

(assert (=> b!93751 m!137509))

(declare-fun m!137511 () Bool)

(assert (=> b!93744 m!137511))

(push 1)

(assert (not b!93749))

(assert (not b!93756))

(assert (not b!93747))

(assert (not b!93752))

(assert (not b!93757))

(assert (not start!18800))

(assert (not b!93751))

(assert (not b!93745))

(assert (not b!93744))

(assert (not b!93755))

(assert (not b!93748))

(assert (not b!93758))

(assert (not b!93753))

(assert (not b!93746))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!29102 () Bool)

(declare-fun e!61635 () Bool)

(assert (=> d!29102 e!61635))

(declare-fun res!77410 () Bool)

(assert (=> d!29102 (=> (not res!77410) (not e!61635))))

(declare-fun lt!138518 () (_ BitVec 64))

(declare-fun lt!138515 () (_ BitVec 64))

(declare-fun lt!138516 () (_ BitVec 64))

(assert (=> d!29102 (= res!77410 (= lt!138516 (bvsub lt!138515 lt!138518)))))

(assert (=> d!29102 (or (= (bvand lt!138515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138518 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138515 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138515 lt!138518) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!29102 (= lt!138518 (remainingBits!0 ((_ sign_extend 32) (size!1993 (buf!2363 base!8))) ((_ sign_extend 32) (currentByte!4705 base!8)) ((_ sign_extend 32) (currentBit!4700 base!8))))))

(declare-fun lt!138517 () (_ BitVec 64))

(declare-fun lt!138514 () (_ BitVec 64))

(assert (=> d!29102 (= lt!138515 (bvmul lt!138517 lt!138514))))

(assert (=> d!29102 (or (= lt!138517 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138514 (bvsdiv (bvmul lt!138517 lt!138514) lt!138517)))))

(assert (=> d!29102 (= lt!138514 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29102 (= lt!138517 ((_ sign_extend 32) (size!1993 (buf!2363 base!8))))))

(assert (=> d!29102 (= lt!138516 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4705 base!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4700 base!8))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!29102 (invariant!0 (currentBit!4700 base!8) (currentByte!4705 base!8) (size!1993 (buf!2363 base!8)))))

(assert (=> d!29102 (= (bitIndex!0 (size!1993 (buf!2363 base!8)) (currentByte!4705 base!8) (currentBit!4700 base!8)) lt!138516)))

(declare-fun b!93875 () Bool)

(declare-fun res!77409 () Bool)

(assert (=> b!93875 (=> (not res!77409) (not e!61635))))

(assert (=> b!93875 (= res!77409 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138516))))

(declare-fun b!93876 () Bool)

(declare-fun lt!138519 () (_ BitVec 64))

(assert (=> b!93876 (= e!61635 (bvsle lt!138516 (bvmul lt!138519 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!93876 (or (= lt!138519 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138519 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138519)))))

(assert (=> b!93876 (= lt!138519 ((_ sign_extend 32) (size!1993 (buf!2363 base!8))))))

(assert (= (and d!29102 res!77410) b!93875))

(assert (= (and b!93875 res!77409) b!93876))

(declare-fun m!137599 () Bool)

(assert (=> d!29102 m!137599))

(declare-fun m!137601 () Bool)

(assert (=> d!29102 m!137601))

(assert (=> b!93753 d!29102))

(declare-fun d!29114 () Bool)

(assert (=> d!29114 (= (array_inv!1819 (buf!2363 bitStream1!8)) (bvsge (size!1993 (buf!2363 bitStream1!8)) #b00000000000000000000000000000000))))

(assert (=> b!93752 d!29114))

(declare-fun d!29118 () Bool)

(declare-fun e!61640 () Bool)

(assert (=> d!29118 e!61640))

(declare-fun res!77419 () Bool)

(assert (=> d!29118 (=> (not res!77419) (not e!61640))))

(declare-fun lt!138536 () (_ BitVec 64))

(declare-fun lt!138533 () (_ BitVec 64))

(declare-fun lt!138534 () (_ BitVec 64))

(assert (=> d!29118 (= res!77419 (= lt!138534 (bvsub lt!138533 lt!138536)))))

(assert (=> d!29118 (or (= (bvand lt!138533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138536 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138533 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138533 lt!138536) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29118 (= lt!138536 (remainingBits!0 ((_ sign_extend 32) (size!1993 (buf!2363 bitStream1!8))) ((_ sign_extend 32) (currentByte!4705 bitStream1!8)) ((_ sign_extend 32) (currentBit!4700 bitStream1!8))))))

(declare-fun lt!138535 () (_ BitVec 64))

(declare-fun lt!138532 () (_ BitVec 64))

(assert (=> d!29118 (= lt!138533 (bvmul lt!138535 lt!138532))))

(assert (=> d!29118 (or (= lt!138535 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138532 (bvsdiv (bvmul lt!138535 lt!138532) lt!138535)))))

(assert (=> d!29118 (= lt!138532 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29118 (= lt!138535 ((_ sign_extend 32) (size!1993 (buf!2363 bitStream1!8))))))

(assert (=> d!29118 (= lt!138534 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4705 bitStream1!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4700 bitStream1!8))))))

(assert (=> d!29118 (invariant!0 (currentBit!4700 bitStream1!8) (currentByte!4705 bitStream1!8) (size!1993 (buf!2363 bitStream1!8)))))

(assert (=> d!29118 (= (bitIndex!0 (size!1993 (buf!2363 bitStream1!8)) (currentByte!4705 bitStream1!8) (currentBit!4700 bitStream1!8)) lt!138534)))

(declare-fun b!93884 () Bool)

(declare-fun res!77418 () Bool)

(assert (=> b!93884 (=> (not res!77418) (not e!61640))))

(assert (=> b!93884 (= res!77418 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138534))))

(declare-fun b!93885 () Bool)

(declare-fun lt!138537 () (_ BitVec 64))

(assert (=> b!93885 (= e!61640 (bvsle lt!138534 (bvmul lt!138537 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!93885 (or (= lt!138537 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138537 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138537)))))

(assert (=> b!93885 (= lt!138537 ((_ sign_extend 32) (size!1993 (buf!2363 bitStream1!8))))))

(assert (= (and d!29118 res!77419) b!93884))

(assert (= (and b!93884 res!77418) b!93885))

(declare-fun m!137609 () Bool)

(assert (=> d!29118 m!137609))

(declare-fun m!137613 () Bool)

(assert (=> d!29118 m!137613))

(assert (=> b!93757 d!29118))

(declare-fun d!29124 () Bool)

(declare-fun e!61641 () Bool)

(assert (=> d!29124 e!61641))

(declare-fun res!77421 () Bool)

(assert (=> d!29124 (=> (not res!77421) (not e!61641))))

(declare-fun lt!138539 () (_ BitVec 64))

(declare-fun lt!138542 () (_ BitVec 64))

(declare-fun lt!138540 () (_ BitVec 64))

(assert (=> d!29124 (= res!77421 (= lt!138540 (bvsub lt!138539 lt!138542)))))

(assert (=> d!29124 (or (= (bvand lt!138539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!138542 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!138539 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!138539 lt!138542) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!29124 (= lt!138542 (remainingBits!0 ((_ sign_extend 32) (size!1993 (buf!2363 bitStream2!8))) ((_ sign_extend 32) (currentByte!4705 bitStream2!8)) ((_ sign_extend 32) (currentBit!4700 bitStream2!8))))))

(declare-fun lt!138541 () (_ BitVec 64))

(declare-fun lt!138538 () (_ BitVec 64))

(assert (=> d!29124 (= lt!138539 (bvmul lt!138541 lt!138538))))

(assert (=> d!29124 (or (= lt!138541 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!138538 (bvsdiv (bvmul lt!138541 lt!138538) lt!138541)))))

(assert (=> d!29124 (= lt!138538 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!29124 (= lt!138541 ((_ sign_extend 32) (size!1993 (buf!2363 bitStream2!8))))))

(assert (=> d!29124 (= lt!138540 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4705 bitStream2!8)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4700 bitStream2!8))))))

(assert (=> d!29124 (invariant!0 (currentBit!4700 bitStream2!8) (currentByte!4705 bitStream2!8) (size!1993 (buf!2363 bitStream2!8)))))

(assert (=> d!29124 (= (bitIndex!0 (size!1993 (buf!2363 bitStream2!8)) (currentByte!4705 bitStream2!8) (currentBit!4700 bitStream2!8)) lt!138540)))

(declare-fun b!93886 () Bool)

(declare-fun res!77420 () Bool)

(assert (=> b!93886 (=> (not res!77420) (not e!61641))))

(assert (=> b!93886 (= res!77420 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!138540))))

(declare-fun b!93887 () Bool)

(declare-fun lt!138543 () (_ BitVec 64))

(assert (=> b!93887 (= e!61641 (bvsle lt!138540 (bvmul lt!138543 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!93887 (or (= lt!138543 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!138543 #b0000000000000000000000000000000000000000000000000000000000001000) lt!138543)))))

(assert (=> b!93887 (= lt!138543 ((_ sign_extend 32) (size!1993 (buf!2363 bitStream2!8))))))

(assert (= (and d!29124 res!77421) b!93886))

(assert (= (and b!93886 res!77420) b!93887))

(declare-fun m!137615 () Bool)

(assert (=> d!29124 m!137615))

(declare-fun m!137617 () Bool)

(assert (=> d!29124 m!137617))

(assert (=> b!93757 d!29124))

(declare-fun d!29128 () Bool)

(assert (=> d!29128 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1993 (buf!2363 bitStream2!8))) ((_ sign_extend 32) (currentByte!4705 bitStream2!8)) ((_ sign_extend 32) (currentBit!4700 bitStream2!8)) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1993 (buf!2363 bitStream2!8))) ((_ sign_extend 32) (currentByte!4705 bitStream2!8)) ((_ sign_extend 32) (currentBit!4700 bitStream2!8))) (bvsub nBits!484 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!7170 () Bool)

(assert (= bs!7170 d!29128))

(assert (=> bs!7170 m!137615))

(assert (=> b!93746 d!29128))

(declare-fun d!29132 () Bool)

(assert (=> d!29132 (= (array_inv!1819 (buf!2363 thiss!1534)) (bvsge (size!1993 (buf!2363 thiss!1534)) #b00000000000000000000000000000000))))

(assert (=> b!93756 d!29132))

(declare-fun d!29134 () Bool)

(declare-fun res!77445 () Bool)

(declare-fun e!61658 () Bool)

(assert (=> d!29134 (=> (not res!77445) (not e!61658))))

(assert (=> d!29134 (= res!77445 (= (size!1993 (buf!2363 bitStream1!8)) (size!1993 (buf!2363 bitStream2!8))))))

(assert (=> d!29134 (= (isPrefixOf!0 bitStream1!8 bitStream2!8) e!61658)))

(declare-fun b!93911 () Bool)

(declare-fun res!77447 () Bool)

(assert (=> b!93911 (=> (not res!77447) (not e!61658))))

(assert (=> b!93911 (= res!77447 (bvsle (bitIndex!0 (size!1993 (buf!2363 bitStream1!8)) (currentByte!4705 bitStream1!8) (currentBit!4700 bitStream1!8)) (bitIndex!0 (size!1993 (buf!2363 bitStream2!8)) (currentByte!4705 bitStream2!8) (currentBit!4700 bitStream2!8))))))

(declare-fun b!93912 () Bool)

(declare-fun e!61657 () Bool)

(assert (=> b!93912 (= e!61658 e!61657)))

(declare-fun res!77446 () Bool)

(assert (=> b!93912 (=> res!77446 e!61657)))

(assert (=> b!93912 (= res!77446 (= (size!1993 (buf!2363 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!93913 () Bool)

(declare-fun arrayBitRangesEq!0 (array!4392 array!4392 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!93913 (= e!61657 (arrayBitRangesEq!0 (buf!2363 bitStream1!8) (buf!2363 bitStream2!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1993 (buf!2363 bitStream1!8)) (currentByte!4705 bitStream1!8) (currentBit!4700 bitStream1!8))))))

(assert (= (and d!29134 res!77445) b!93911))

(assert (= (and b!93911 res!77447) b!93912))

(assert (= (and b!93912 (not res!77446)) b!93913))

(assert (=> b!93911 m!137493))

(assert (=> b!93911 m!137495))

(assert (=> b!93913 m!137493))

(assert (=> b!93913 m!137493))

(declare-fun m!137633 () Bool)

(assert (=> b!93913 m!137633))

(assert (=> b!93745 d!29134))

(declare-fun d!29160 () Bool)

(assert (=> d!29160 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1993 (buf!2363 bitStream1!8))) ((_ sign_extend 32) (currentByte!4705 bitStream1!8)) ((_ sign_extend 32) (currentBit!4700 bitStream1!8)) nBits!484) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1993 (buf!2363 bitStream1!8))) ((_ sign_extend 32) (currentByte!4705 bitStream1!8)) ((_ sign_extend 32) (currentBit!4700 bitStream1!8))) nBits!484))))

(declare-fun bs!7176 () Bool)

(assert (= bs!7176 d!29160))

(assert (=> bs!7176 m!137609))

(assert (=> b!93755 d!29160))

(declare-fun d!29162 () Bool)

(assert (=> d!29162 (= (array_inv!1819 (buf!2363 base!8)) (bvsge (size!1993 (buf!2363 base!8)) #b00000000000000000000000000000000))))

(assert (=> b!93744 d!29162))

(declare-fun d!29164 () Bool)

(assert (=> d!29164 (= (inv!12 bitStream1!8) (invariant!0 (currentBit!4700 bitStream1!8) (currentByte!4705 bitStream1!8) (size!1993 (buf!2363 bitStream1!8))))))

(declare-fun bs!7178 () Bool)

(assert (= bs!7178 d!29164))

(assert (=> bs!7178 m!137613))

(assert (=> start!18800 d!29164))

(declare-fun d!29166 () Bool)

(assert (=> d!29166 (= (inv!12 bitStream2!8) (invariant!0 (currentBit!4700 bitStream2!8) (currentByte!4705 bitStream2!8) (size!1993 (buf!2363 bitStream2!8))))))

(declare-fun bs!7179 () Bool)

(assert (= bs!7179 d!29166))

(assert (=> bs!7179 m!137617))

(assert (=> start!18800 d!29166))

(declare-fun d!29168 () Bool)

(assert (=> d!29168 (= (inv!12 base!8) (invariant!0 (currentBit!4700 base!8) (currentByte!4705 base!8) (size!1993 (buf!2363 base!8))))))

(declare-fun bs!7180 () Bool)

(assert (= bs!7180 d!29168))

(assert (=> bs!7180 m!137601))

(assert (=> start!18800 d!29168))

(declare-fun d!29170 () Bool)

(assert (=> d!29170 (= (inv!12 thiss!1534) (invariant!0 (currentBit!4700 thiss!1534) (currentByte!4705 thiss!1534) (size!1993 (buf!2363 thiss!1534))))))

(declare-fun bs!7181 () Bool)

(assert (= bs!7181 d!29170))

(declare-fun m!137637 () Bool)

(assert (=> bs!7181 m!137637))

(assert (=> start!18800 d!29170))

(declare-fun d!29172 () Bool)

(declare-fun size!1998 (List!860) Int)

(assert (=> d!29172 (= (length!451 listBits!13) (size!1998 listBits!13))))

(declare-fun bs!7182 () Bool)

(assert (= bs!7182 d!29172))

(declare-fun m!137639 () Bool)

(assert (=> bs!7182 m!137639))

(assert (=> b!93749 d!29172))

(declare-fun d!29174 () Bool)

(declare-fun res!77452 () Bool)

(declare-fun e!61662 () Bool)

(assert (=> d!29174 (=> (not res!77452) (not e!61662))))

(assert (=> d!29174 (= res!77452 (= (size!1993 (buf!2363 bitStream2!8)) (size!1993 (buf!2363 base!8))))))

(assert (=> d!29174 (= (isPrefixOf!0 bitStream2!8 base!8) e!61662)))

(declare-fun b!93918 () Bool)

(declare-fun res!77454 () Bool)

(assert (=> b!93918 (=> (not res!77454) (not e!61662))))

(assert (=> b!93918 (= res!77454 (bvsle (bitIndex!0 (size!1993 (buf!2363 bitStream2!8)) (currentByte!4705 bitStream2!8) (currentBit!4700 bitStream2!8)) (bitIndex!0 (size!1993 (buf!2363 base!8)) (currentByte!4705 base!8) (currentBit!4700 base!8))))))

(declare-fun b!93919 () Bool)

(declare-fun e!61661 () Bool)

(assert (=> b!93919 (= e!61662 e!61661)))

(declare-fun res!77453 () Bool)

(assert (=> b!93919 (=> res!77453 e!61661)))

(assert (=> b!93919 (= res!77453 (= (size!1993 (buf!2363 bitStream2!8)) #b00000000000000000000000000000000))))

(declare-fun b!93920 () Bool)

(assert (=> b!93920 (= e!61661 (arrayBitRangesEq!0 (buf!2363 bitStream2!8) (buf!2363 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1993 (buf!2363 bitStream2!8)) (currentByte!4705 bitStream2!8) (currentBit!4700 bitStream2!8))))))

(assert (= (and d!29174 res!77452) b!93918))

(assert (= (and b!93918 res!77454) b!93919))

(assert (= (and b!93919 (not res!77453)) b!93920))

(assert (=> b!93918 m!137495))

(assert (=> b!93918 m!137487))

(assert (=> b!93920 m!137495))

(assert (=> b!93920 m!137495))

(declare-fun m!137641 () Bool)

(assert (=> b!93920 m!137641))

(assert (=> b!93748 d!29174))

(declare-fun d!29176 () Bool)

(assert (=> d!29176 (= (array_inv!1819 (buf!2363 bitStream2!8)) (bvsge (size!1993 (buf!2363 bitStream2!8)) #b00000000000000000000000000000000))))

(assert (=> b!93758 d!29176))

(declare-fun d!29178 () Bool)

(declare-fun res!77457 () Bool)

(declare-fun e!61665 () Bool)

(assert (=> d!29178 (=> (not res!77457) (not e!61665))))

(assert (=> d!29178 (= res!77457 (= (size!1993 (buf!2363 bitStream1!8)) (size!1993 (buf!2363 base!8))))))

(assert (=> d!29178 (= (isPrefixOf!0 bitStream1!8 base!8) e!61665)))

(declare-fun b!93923 () Bool)

(declare-fun res!77459 () Bool)

(assert (=> b!93923 (=> (not res!77459) (not e!61665))))

(assert (=> b!93923 (= res!77459 (bvsle (bitIndex!0 (size!1993 (buf!2363 bitStream1!8)) (currentByte!4705 bitStream1!8) (currentBit!4700 bitStream1!8)) (bitIndex!0 (size!1993 (buf!2363 base!8)) (currentByte!4705 base!8) (currentBit!4700 base!8))))))

(declare-fun b!93924 () Bool)

(declare-fun e!61664 () Bool)

(assert (=> b!93924 (= e!61665 e!61664)))

(declare-fun res!77458 () Bool)

(assert (=> b!93924 (=> res!77458 e!61664)))

(assert (=> b!93924 (= res!77458 (= (size!1993 (buf!2363 bitStream1!8)) #b00000000000000000000000000000000))))

(declare-fun b!93925 () Bool)

(assert (=> b!93925 (= e!61664 (arrayBitRangesEq!0 (buf!2363 bitStream1!8) (buf!2363 base!8) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!1993 (buf!2363 bitStream1!8)) (currentByte!4705 bitStream1!8) (currentBit!4700 bitStream1!8))))))

(assert (= (and d!29178 res!77457) b!93923))

(assert (= (and b!93923 res!77459) b!93924))

(assert (= (and b!93924 (not res!77458)) b!93925))

(assert (=> b!93923 m!137493))

(assert (=> b!93923 m!137487))

(assert (=> b!93925 m!137493))

(assert (=> b!93925 m!137493))

(declare-fun m!137645 () Bool)

(assert (=> b!93925 m!137645))

(assert (=> b!93747 d!29178))

(declare-fun b!93954 () Bool)

(declare-datatypes ((tuple2!7626 0))(
  ( (tuple2!7627 (_1!4060 List!860) (_2!4060 BitStream!3508)) )
))
(declare-fun e!61682 () tuple2!7626)

(assert (=> b!93954 (= e!61682 (tuple2!7627 Nil!857 bitStream1!8))))

(declare-fun b!93955 () Bool)

(declare-datatypes ((tuple2!7628 0))(
  ( (tuple2!7629 (_1!4061 Bool) (_2!4061 BitStream!3508)) )
))
(declare-fun lt!138591 () tuple2!7628)

(declare-fun lt!138589 () (_ BitVec 64))

(assert (=> b!93955 (= e!61682 (tuple2!7627 (Cons!856 (_1!4061 lt!138591) (bitStreamReadBitsIntoList!0 thiss!1534 (_2!4061 lt!138591) (bvsub nBits!484 lt!138589))) (_2!4061 lt!138591)))))

(declare-fun readBit!0 (BitStream!3508) tuple2!7628)

(assert (=> b!93955 (= lt!138591 (readBit!0 bitStream1!8))))

(assert (=> b!93955 (= lt!138589 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!93956 () Bool)

(declare-fun e!61681 () Bool)

(declare-fun lt!138590 () List!860)

(declare-fun isEmpty!249 (List!860) Bool)

(assert (=> b!93956 (= e!61681 (isEmpty!249 lt!138590))))

(declare-fun b!93957 () Bool)

(assert (=> b!93957 (= e!61681 (> (length!451 lt!138590) 0))))

(declare-fun d!29182 () Bool)

(assert (=> d!29182 e!61681))

(declare-fun c!5918 () Bool)

(assert (=> d!29182 (= c!5918 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29182 (= lt!138590 (_1!4060 e!61682))))

(declare-fun c!5919 () Bool)

(assert (=> d!29182 (= c!5919 (= nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!29182 (bvsge nBits!484 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!29182 (= (bitStreamReadBitsIntoList!0 thiss!1534 bitStream1!8 nBits!484) lt!138590)))

(assert (= (and d!29182 c!5919) b!93954))

(assert (= (and d!29182 (not c!5919)) b!93955))

(assert (= (and d!29182 c!5918) b!93956))

(assert (= (and d!29182 (not c!5918)) b!93957))

(declare-fun m!137661 () Bool)

(assert (=> b!93955 m!137661))

(declare-fun m!137663 () Bool)

(assert (=> b!93955 m!137663))

(declare-fun m!137665 () Bool)

(assert (=> b!93956 m!137665))

(declare-fun m!137667 () Bool)

(assert (=> b!93957 m!137667))

(assert (=> b!93751 d!29182))

(push 1)

(assert (not b!93925))

(assert (not d!29164))

(assert (not b!93918))

(assert (not b!93913))

(assert (not d!29172))

(assert (not d!29170))

(assert (not d!29102))

(assert (not d!29166))

(assert (not b!93920))

(assert (not d!29128))

(assert (not b!93911))

(assert (not d!29118))

(assert (not d!29124))

(assert (not b!93956))

(assert (not d!29160))

(assert (not b!93923))

(assert (not b!93957))

(assert (not d!29168))

(assert (not b!93955))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

