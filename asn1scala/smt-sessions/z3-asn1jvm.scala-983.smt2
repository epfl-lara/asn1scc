; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27488 () Bool)

(assert start!27488)

(declare-fun b!141722 () Bool)

(declare-fun res!118248 () Bool)

(declare-fun e!94422 () Bool)

(assert (=> b!141722 (=> (not res!118248) (not e!94422))))

(declare-datatypes ((array!6503 0))(
  ( (array!6504 (arr!3652 (Array (_ BitVec 32) (_ BitVec 8))) (size!2945 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5148 0))(
  ( (BitStream!5149 (buf!3366 array!6503) (currentByte!6226 (_ BitVec 32)) (currentBit!6221 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5148)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141722 (= res!118248 (invariant!0 (currentBit!6221 thiss!1634) (currentByte!6226 thiss!1634) (size!2945 (buf!3366 thiss!1634))))))

(declare-fun b!141723 () Bool)

(declare-fun res!118243 () Bool)

(assert (=> b!141723 (=> (not res!118243) (not e!94422))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!141723 (= res!118243 (bvslt from!447 to!404))))

(declare-fun b!141724 () Bool)

(declare-fun e!94423 () Bool)

(declare-fun e!94420 () Bool)

(assert (=> b!141724 (= e!94423 e!94420)))

(declare-fun res!118245 () Bool)

(assert (=> b!141724 (=> (not res!118245) (not e!94420))))

(declare-datatypes ((Unit!8872 0))(
  ( (Unit!8873) )
))
(declare-datatypes ((tuple2!12576 0))(
  ( (tuple2!12577 (_1!6618 Unit!8872) (_2!6618 BitStream!5148)) )
))
(declare-fun lt!219750 () tuple2!12576)

(declare-fun lt!219753 () (_ BitVec 64))

(declare-fun lt!219758 () tuple2!12576)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!141724 (= res!118245 (= (bitIndex!0 (size!2945 (buf!3366 (_2!6618 lt!219750))) (currentByte!6226 (_2!6618 lt!219750)) (currentBit!6221 (_2!6618 lt!219750))) (bvadd (bitIndex!0 (size!2945 (buf!3366 (_2!6618 lt!219758))) (currentByte!6226 (_2!6618 lt!219758)) (currentBit!6221 (_2!6618 lt!219758))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 lt!219753))))))

(assert (=> b!141724 (= lt!219753 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(declare-fun res!118247 () Bool)

(assert (=> start!27488 (=> (not res!118247) (not e!94422))))

(declare-fun arr!237 () array!6503)

(assert (=> start!27488 (= res!118247 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2945 arr!237))))))

(assert (=> start!27488 e!94422))

(assert (=> start!27488 true))

(declare-fun array_inv!2734 (array!6503) Bool)

(assert (=> start!27488 (array_inv!2734 arr!237)))

(declare-fun e!94425 () Bool)

(declare-fun inv!12 (BitStream!5148) Bool)

(assert (=> start!27488 (and (inv!12 thiss!1634) e!94425)))

(declare-fun b!141725 () Bool)

(assert (=> b!141725 (= e!94425 (array_inv!2734 (buf!3366 thiss!1634)))))

(declare-fun b!141726 () Bool)

(assert (=> b!141726 (= e!94422 (not (bvsle (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2945 (buf!3366 (_2!6618 lt!219758))) (currentByte!6226 thiss!1634) (currentBit!6221 thiss!1634))) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!219758))))))))))

(declare-fun e!94424 () Bool)

(assert (=> b!141726 e!94424))

(declare-fun res!118238 () Bool)

(assert (=> b!141726 (=> (not res!118238) (not e!94424))))

(declare-fun isPrefixOf!0 (BitStream!5148 BitStream!5148) Bool)

(assert (=> b!141726 (= res!118238 (isPrefixOf!0 thiss!1634 (_2!6618 lt!219750)))))

(declare-fun lt!219754 () Unit!8872)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!5148 BitStream!5148 BitStream!5148) Unit!8872)

(assert (=> b!141726 (= lt!219754 (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6618 lt!219758) (_2!6618 lt!219750)))))

(assert (=> b!141726 e!94423))

(declare-fun res!118241 () Bool)

(assert (=> b!141726 (=> (not res!118241) (not e!94423))))

(assert (=> b!141726 (= res!118241 (= (size!2945 (buf!3366 (_2!6618 lt!219758))) (size!2945 (buf!3366 (_2!6618 lt!219750)))))))

(declare-fun appendByteArrayLoop!0 (BitStream!5148 array!6503 (_ BitVec 32) (_ BitVec 32)) tuple2!12576)

(assert (=> b!141726 (= lt!219750 (appendByteArrayLoop!0 (_2!6618 lt!219758) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!141726 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!219758)))) ((_ sign_extend 32) (currentByte!6226 (_2!6618 lt!219758))) ((_ sign_extend 32) (currentBit!6221 (_2!6618 lt!219758))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001))))

(declare-fun lt!219755 () Unit!8872)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!5148 BitStream!5148 (_ BitVec 64) (_ BitVec 32)) Unit!8872)

(assert (=> b!141726 (= lt!219755 (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6618 lt!219758) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(declare-fun e!94428 () Bool)

(assert (=> b!141726 e!94428))

(declare-fun res!118246 () Bool)

(assert (=> b!141726 (=> (not res!118246) (not e!94428))))

(assert (=> b!141726 (= res!118246 (= (size!2945 (buf!3366 thiss!1634)) (size!2945 (buf!3366 (_2!6618 lt!219758)))))))

(declare-fun appendByte!0 (BitStream!5148 (_ BitVec 8)) tuple2!12576)

(assert (=> b!141726 (= lt!219758 (appendByte!0 thiss!1634 (select (arr!3652 arr!237) from!447)))))

(declare-fun b!141727 () Bool)

(declare-fun res!118242 () Bool)

(assert (=> b!141727 (=> (not res!118242) (not e!94420))))

(assert (=> b!141727 (= res!118242 (isPrefixOf!0 (_2!6618 lt!219758) (_2!6618 lt!219750)))))

(declare-datatypes ((tuple2!12578 0))(
  ( (tuple2!12579 (_1!6619 BitStream!5148) (_2!6619 array!6503)) )
))
(declare-fun lt!219749 () tuple2!12578)

(declare-fun b!141728 () Bool)

(declare-fun e!94427 () Bool)

(declare-fun arrayRangesEq!261 (array!6503 array!6503 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!141728 (= e!94427 (not (arrayRangesEq!261 arr!237 (_2!6619 lt!219749) #b00000000000000000000000000000000 to!404)))))

(declare-fun b!141729 () Bool)

(assert (=> b!141729 (= e!94424 (invariant!0 (currentBit!6221 thiss!1634) (currentByte!6226 thiss!1634) (size!2945 (buf!3366 (_2!6618 lt!219758)))))))

(declare-fun b!141730 () Bool)

(declare-fun res!118240 () Bool)

(assert (=> b!141730 (=> (not res!118240) (not e!94428))))

(assert (=> b!141730 (= res!118240 (= (bitIndex!0 (size!2945 (buf!3366 (_2!6618 lt!219758))) (currentByte!6226 (_2!6618 lt!219758)) (currentBit!6221 (_2!6618 lt!219758))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2945 (buf!3366 thiss!1634)) (currentByte!6226 thiss!1634) (currentBit!6221 thiss!1634)))))))

(declare-fun b!141731 () Bool)

(assert (=> b!141731 (= e!94420 (not e!94427))))

(declare-fun res!118239 () Bool)

(assert (=> b!141731 (=> res!118239 e!94427)))

(declare-datatypes ((tuple2!12580 0))(
  ( (tuple2!12581 (_1!6620 BitStream!5148) (_2!6620 BitStream!5148)) )
))
(declare-fun lt!219751 () tuple2!12580)

(assert (=> b!141731 (= res!118239 (or (not (= (size!2945 (_2!6619 lt!219749)) (size!2945 arr!237))) (not (= (_1!6619 lt!219749) (_2!6620 lt!219751)))))))

(declare-fun readByteArrayLoopPure!0 (BitStream!5148 array!6503 (_ BitVec 32) (_ BitVec 32)) tuple2!12578)

(assert (=> b!141731 (= lt!219749 (readByteArrayLoopPure!0 (_1!6620 lt!219751) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!141731 (validate_offset_bits!1 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!219750)))) ((_ sign_extend 32) (currentByte!6226 (_2!6618 lt!219758))) ((_ sign_extend 32) (currentBit!6221 (_2!6618 lt!219758))) lt!219753)))

(declare-fun lt!219757 () Unit!8872)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!5148 array!6503 (_ BitVec 64)) Unit!8872)

(assert (=> b!141731 (= lt!219757 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6618 lt!219758) (buf!3366 (_2!6618 lt!219750)) lt!219753))))

(declare-fun reader!0 (BitStream!5148 BitStream!5148) tuple2!12580)

(assert (=> b!141731 (= lt!219751 (reader!0 (_2!6618 lt!219758) (_2!6618 lt!219750)))))

(declare-fun b!141732 () Bool)

(declare-fun res!118244 () Bool)

(assert (=> b!141732 (=> (not res!118244) (not e!94422))))

(assert (=> b!141732 (= res!118244 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2945 (buf!3366 thiss!1634))) ((_ sign_extend 32) (currentByte!6226 thiss!1634)) ((_ sign_extend 32) (currentBit!6221 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!141733 () Bool)

(declare-fun res!118249 () Bool)

(assert (=> b!141733 (=> (not res!118249) (not e!94428))))

(assert (=> b!141733 (= res!118249 (isPrefixOf!0 thiss!1634 (_2!6618 lt!219758)))))

(declare-fun b!141734 () Bool)

(declare-datatypes ((tuple2!12582 0))(
  ( (tuple2!12583 (_1!6621 BitStream!5148) (_2!6621 (_ BitVec 8))) )
))
(declare-fun lt!219756 () tuple2!12582)

(declare-fun lt!219752 () tuple2!12580)

(assert (=> b!141734 (= e!94428 (and (= (_2!6621 lt!219756) (select (arr!3652 arr!237) from!447)) (= (_1!6621 lt!219756) (_2!6620 lt!219752))))))

(declare-fun readBytePure!0 (BitStream!5148) tuple2!12582)

(assert (=> b!141734 (= lt!219756 (readBytePure!0 (_1!6620 lt!219752)))))

(assert (=> b!141734 (= lt!219752 (reader!0 thiss!1634 (_2!6618 lt!219758)))))

(assert (= (and start!27488 res!118247) b!141732))

(assert (= (and b!141732 res!118244) b!141723))

(assert (= (and b!141723 res!118243) b!141722))

(assert (= (and b!141722 res!118248) b!141726))

(assert (= (and b!141726 res!118246) b!141730))

(assert (= (and b!141730 res!118240) b!141733))

(assert (= (and b!141733 res!118249) b!141734))

(assert (= (and b!141726 res!118241) b!141724))

(assert (= (and b!141724 res!118245) b!141727))

(assert (= (and b!141727 res!118242) b!141731))

(assert (= (and b!141731 (not res!118239)) b!141728))

(assert (= (and b!141726 res!118238) b!141729))

(assert (= start!27488 b!141725))

(declare-fun m!217683 () Bool)

(assert (=> b!141732 m!217683))

(declare-fun m!217685 () Bool)

(assert (=> b!141722 m!217685))

(declare-fun m!217687 () Bool)

(assert (=> b!141726 m!217687))

(declare-fun m!217689 () Bool)

(assert (=> b!141726 m!217689))

(declare-fun m!217691 () Bool)

(assert (=> b!141726 m!217691))

(declare-fun m!217693 () Bool)

(assert (=> b!141726 m!217693))

(declare-fun m!217695 () Bool)

(assert (=> b!141726 m!217695))

(declare-fun m!217697 () Bool)

(assert (=> b!141726 m!217697))

(declare-fun m!217699 () Bool)

(assert (=> b!141726 m!217699))

(declare-fun m!217701 () Bool)

(assert (=> b!141726 m!217701))

(assert (=> b!141726 m!217697))

(declare-fun m!217703 () Bool)

(assert (=> b!141731 m!217703))

(declare-fun m!217705 () Bool)

(assert (=> b!141731 m!217705))

(declare-fun m!217707 () Bool)

(assert (=> b!141731 m!217707))

(declare-fun m!217709 () Bool)

(assert (=> b!141731 m!217709))

(declare-fun m!217711 () Bool)

(assert (=> b!141725 m!217711))

(declare-fun m!217713 () Bool)

(assert (=> b!141724 m!217713))

(declare-fun m!217715 () Bool)

(assert (=> b!141724 m!217715))

(assert (=> b!141734 m!217697))

(declare-fun m!217717 () Bool)

(assert (=> b!141734 m!217717))

(declare-fun m!217719 () Bool)

(assert (=> b!141734 m!217719))

(assert (=> b!141730 m!217715))

(declare-fun m!217721 () Bool)

(assert (=> b!141730 m!217721))

(declare-fun m!217723 () Bool)

(assert (=> b!141727 m!217723))

(declare-fun m!217725 () Bool)

(assert (=> b!141733 m!217725))

(declare-fun m!217727 () Bool)

(assert (=> b!141729 m!217727))

(declare-fun m!217729 () Bool)

(assert (=> start!27488 m!217729))

(declare-fun m!217731 () Bool)

(assert (=> start!27488 m!217731))

(declare-fun m!217733 () Bool)

(assert (=> b!141728 m!217733))

(check-sat (not b!141726) (not b!141733) (not b!141730) (not b!141728) (not b!141732) (not b!141725) (not b!141727) (not b!141734) (not start!27488) (not b!141722) (not b!141724) (not b!141729) (not b!141731))
(check-sat)
(get-model)

(declare-fun d!45392 () Bool)

(assert (=> d!45392 (= (invariant!0 (currentBit!6221 thiss!1634) (currentByte!6226 thiss!1634) (size!2945 (buf!3366 (_2!6618 lt!219758)))) (and (bvsge (currentBit!6221 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6221 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6226 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6226 thiss!1634) (size!2945 (buf!3366 (_2!6618 lt!219758)))) (and (= (currentBit!6221 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6226 thiss!1634) (size!2945 (buf!3366 (_2!6618 lt!219758))))))))))

(assert (=> b!141729 d!45392))

(declare-fun d!45394 () Bool)

(declare-fun res!118290 () Bool)

(declare-fun e!94460 () Bool)

(assert (=> d!45394 (=> res!118290 e!94460)))

(assert (=> d!45394 (= res!118290 (= #b00000000000000000000000000000000 to!404))))

(assert (=> d!45394 (= (arrayRangesEq!261 arr!237 (_2!6619 lt!219749) #b00000000000000000000000000000000 to!404) e!94460)))

(declare-fun b!141778 () Bool)

(declare-fun e!94461 () Bool)

(assert (=> b!141778 (= e!94460 e!94461)))

(declare-fun res!118291 () Bool)

(assert (=> b!141778 (=> (not res!118291) (not e!94461))))

(assert (=> b!141778 (= res!118291 (= (select (arr!3652 arr!237) #b00000000000000000000000000000000) (select (arr!3652 (_2!6619 lt!219749)) #b00000000000000000000000000000000)))))

(declare-fun b!141779 () Bool)

(assert (=> b!141779 (= e!94461 (arrayRangesEq!261 arr!237 (_2!6619 lt!219749) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) to!404))))

(assert (= (and d!45394 (not res!118290)) b!141778))

(assert (= (and b!141778 res!118291) b!141779))

(declare-fun m!217787 () Bool)

(assert (=> b!141778 m!217787))

(declare-fun m!217789 () Bool)

(assert (=> b!141778 m!217789))

(declare-fun m!217791 () Bool)

(assert (=> b!141779 m!217791))

(assert (=> b!141728 d!45394))

(declare-fun d!45396 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!45396 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2945 (buf!3366 thiss!1634))) ((_ sign_extend 32) (currentByte!6226 thiss!1634)) ((_ sign_extend 32) (currentBit!6221 thiss!1634)) (bvsub to!404 from!447)) (bvsle ((_ sign_extend 32) (bvsub to!404 from!447)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2945 (buf!3366 thiss!1634))) ((_ sign_extend 32) (currentByte!6226 thiss!1634)) ((_ sign_extend 32) (currentBit!6221 thiss!1634))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11162 () Bool)

(assert (= bs!11162 d!45396))

(declare-fun m!217793 () Bool)

(assert (=> bs!11162 m!217793))

(assert (=> b!141732 d!45396))

(declare-datatypes ((tuple3!536 0))(
  ( (tuple3!537 (_1!6626 Unit!8872) (_2!6626 BitStream!5148) (_3!330 array!6503)) )
))
(declare-fun lt!219791 () tuple3!536)

(declare-fun d!45398 () Bool)

(declare-fun readByteArrayLoop!0 (BitStream!5148 array!6503 (_ BitVec 32) (_ BitVec 32)) tuple3!536)

(assert (=> d!45398 (= lt!219791 (readByteArrayLoop!0 (_1!6620 lt!219751) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45398 (= (readByteArrayLoopPure!0 (_1!6620 lt!219751) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) (tuple2!12579 (_2!6626 lt!219791) (_3!330 lt!219791)))))

(declare-fun bs!11163 () Bool)

(assert (= bs!11163 d!45398))

(declare-fun m!217795 () Bool)

(assert (=> bs!11163 m!217795))

(assert (=> b!141731 d!45398))

(declare-fun d!45400 () Bool)

(assert (=> d!45400 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!219750)))) ((_ sign_extend 32) (currentByte!6226 (_2!6618 lt!219758))) ((_ sign_extend 32) (currentBit!6221 (_2!6618 lt!219758))) lt!219753) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!219750)))) ((_ sign_extend 32) (currentByte!6226 (_2!6618 lt!219758))) ((_ sign_extend 32) (currentBit!6221 (_2!6618 lt!219758)))) lt!219753))))

(declare-fun bs!11164 () Bool)

(assert (= bs!11164 d!45400))

(declare-fun m!217797 () Bool)

(assert (=> bs!11164 m!217797))

(assert (=> b!141731 d!45400))

(declare-fun d!45402 () Bool)

(assert (=> d!45402 (validate_offset_bits!1 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!219750)))) ((_ sign_extend 32) (currentByte!6226 (_2!6618 lt!219758))) ((_ sign_extend 32) (currentBit!6221 (_2!6618 lt!219758))) lt!219753)))

(declare-fun lt!219794 () Unit!8872)

(declare-fun choose!9 (BitStream!5148 array!6503 (_ BitVec 64) BitStream!5148) Unit!8872)

(assert (=> d!45402 (= lt!219794 (choose!9 (_2!6618 lt!219758) (buf!3366 (_2!6618 lt!219750)) lt!219753 (BitStream!5149 (buf!3366 (_2!6618 lt!219750)) (currentByte!6226 (_2!6618 lt!219758)) (currentBit!6221 (_2!6618 lt!219758)))))))

(assert (=> d!45402 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6618 lt!219758) (buf!3366 (_2!6618 lt!219750)) lt!219753) lt!219794)))

(declare-fun bs!11165 () Bool)

(assert (= bs!11165 d!45402))

(assert (=> bs!11165 m!217705))

(declare-fun m!217799 () Bool)

(assert (=> bs!11165 m!217799))

(assert (=> b!141731 d!45402))

(declare-fun d!45404 () Bool)

(declare-fun e!94467 () Bool)

(assert (=> d!45404 e!94467))

(declare-fun res!118300 () Bool)

(assert (=> d!45404 (=> (not res!118300) (not e!94467))))

(declare-fun lt!219839 () tuple2!12580)

(assert (=> d!45404 (= res!118300 (isPrefixOf!0 (_1!6620 lt!219839) (_2!6620 lt!219839)))))

(declare-fun lt!219842 () BitStream!5148)

(assert (=> d!45404 (= lt!219839 (tuple2!12581 lt!219842 (_2!6618 lt!219750)))))

(declare-fun lt!219835 () Unit!8872)

(declare-fun lt!219841 () Unit!8872)

(assert (=> d!45404 (= lt!219835 lt!219841)))

(assert (=> d!45404 (isPrefixOf!0 lt!219842 (_2!6618 lt!219750))))

(assert (=> d!45404 (= lt!219841 (lemmaIsPrefixTransitive!0 lt!219842 (_2!6618 lt!219750) (_2!6618 lt!219750)))))

(declare-fun lt!219852 () Unit!8872)

(declare-fun lt!219844 () Unit!8872)

(assert (=> d!45404 (= lt!219852 lt!219844)))

(assert (=> d!45404 (isPrefixOf!0 lt!219842 (_2!6618 lt!219750))))

(assert (=> d!45404 (= lt!219844 (lemmaIsPrefixTransitive!0 lt!219842 (_2!6618 lt!219758) (_2!6618 lt!219750)))))

(declare-fun lt!219843 () Unit!8872)

(declare-fun e!94466 () Unit!8872)

(assert (=> d!45404 (= lt!219843 e!94466)))

(declare-fun c!7802 () Bool)

(assert (=> d!45404 (= c!7802 (not (= (size!2945 (buf!3366 (_2!6618 lt!219758))) #b00000000000000000000000000000000)))))

(declare-fun lt!219846 () Unit!8872)

(declare-fun lt!219851 () Unit!8872)

(assert (=> d!45404 (= lt!219846 lt!219851)))

(assert (=> d!45404 (isPrefixOf!0 (_2!6618 lt!219750) (_2!6618 lt!219750))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!5148) Unit!8872)

(assert (=> d!45404 (= lt!219851 (lemmaIsPrefixRefl!0 (_2!6618 lt!219750)))))

(declare-fun lt!219838 () Unit!8872)

(declare-fun lt!219849 () Unit!8872)

(assert (=> d!45404 (= lt!219838 lt!219849)))

(assert (=> d!45404 (= lt!219849 (lemmaIsPrefixRefl!0 (_2!6618 lt!219750)))))

(declare-fun lt!219840 () Unit!8872)

(declare-fun lt!219847 () Unit!8872)

(assert (=> d!45404 (= lt!219840 lt!219847)))

(assert (=> d!45404 (isPrefixOf!0 lt!219842 lt!219842)))

(assert (=> d!45404 (= lt!219847 (lemmaIsPrefixRefl!0 lt!219842))))

(declare-fun lt!219845 () Unit!8872)

(declare-fun lt!219854 () Unit!8872)

(assert (=> d!45404 (= lt!219845 lt!219854)))

(assert (=> d!45404 (isPrefixOf!0 (_2!6618 lt!219758) (_2!6618 lt!219758))))

(assert (=> d!45404 (= lt!219854 (lemmaIsPrefixRefl!0 (_2!6618 lt!219758)))))

(assert (=> d!45404 (= lt!219842 (BitStream!5149 (buf!3366 (_2!6618 lt!219750)) (currentByte!6226 (_2!6618 lt!219758)) (currentBit!6221 (_2!6618 lt!219758))))))

(assert (=> d!45404 (isPrefixOf!0 (_2!6618 lt!219758) (_2!6618 lt!219750))))

(assert (=> d!45404 (= (reader!0 (_2!6618 lt!219758) (_2!6618 lt!219750)) lt!219839)))

(declare-fun b!141790 () Bool)

(declare-fun Unit!8876 () Unit!8872)

(assert (=> b!141790 (= e!94466 Unit!8876)))

(declare-fun b!141791 () Bool)

(declare-fun res!118298 () Bool)

(assert (=> b!141791 (=> (not res!118298) (not e!94467))))

(assert (=> b!141791 (= res!118298 (isPrefixOf!0 (_2!6620 lt!219839) (_2!6618 lt!219750)))))

(declare-fun b!141792 () Bool)

(declare-fun lt!219836 () (_ BitVec 64))

(declare-fun lt!219853 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!5148 (_ BitVec 64)) BitStream!5148)

(assert (=> b!141792 (= e!94467 (= (_1!6620 lt!219839) (withMovedBitIndex!0 (_2!6620 lt!219839) (bvsub lt!219836 lt!219853))))))

(assert (=> b!141792 (or (= (bvand lt!219836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!219853 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!219836 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!219836 lt!219853) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!141792 (= lt!219853 (bitIndex!0 (size!2945 (buf!3366 (_2!6618 lt!219750))) (currentByte!6226 (_2!6618 lt!219750)) (currentBit!6221 (_2!6618 lt!219750))))))

(assert (=> b!141792 (= lt!219836 (bitIndex!0 (size!2945 (buf!3366 (_2!6618 lt!219758))) (currentByte!6226 (_2!6618 lt!219758)) (currentBit!6221 (_2!6618 lt!219758))))))

(declare-fun b!141793 () Bool)

(declare-fun lt!219848 () Unit!8872)

(assert (=> b!141793 (= e!94466 lt!219848)))

(declare-fun lt!219850 () (_ BitVec 64))

(assert (=> b!141793 (= lt!219850 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219837 () (_ BitVec 64))

(assert (=> b!141793 (= lt!219837 (bitIndex!0 (size!2945 (buf!3366 (_2!6618 lt!219758))) (currentByte!6226 (_2!6618 lt!219758)) (currentBit!6221 (_2!6618 lt!219758))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!6503 array!6503 (_ BitVec 64) (_ BitVec 64)) Unit!8872)

(assert (=> b!141793 (= lt!219848 (arrayBitRangesEqSymmetric!0 (buf!3366 (_2!6618 lt!219758)) (buf!3366 (_2!6618 lt!219750)) lt!219850 lt!219837))))

(declare-fun arrayBitRangesEq!0 (array!6503 array!6503 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!141793 (arrayBitRangesEq!0 (buf!3366 (_2!6618 lt!219750)) (buf!3366 (_2!6618 lt!219758)) lt!219850 lt!219837)))

(declare-fun b!141794 () Bool)

(declare-fun res!118299 () Bool)

(assert (=> b!141794 (=> (not res!118299) (not e!94467))))

(assert (=> b!141794 (= res!118299 (isPrefixOf!0 (_1!6620 lt!219839) (_2!6618 lt!219758)))))

(assert (= (and d!45404 c!7802) b!141793))

(assert (= (and d!45404 (not c!7802)) b!141790))

(assert (= (and d!45404 res!118300) b!141794))

(assert (= (and b!141794 res!118299) b!141791))

(assert (= (and b!141791 res!118298) b!141792))

(declare-fun m!217801 () Bool)

(assert (=> b!141794 m!217801))

(assert (=> b!141793 m!217715))

(declare-fun m!217803 () Bool)

(assert (=> b!141793 m!217803))

(declare-fun m!217805 () Bool)

(assert (=> b!141793 m!217805))

(declare-fun m!217807 () Bool)

(assert (=> d!45404 m!217807))

(declare-fun m!217809 () Bool)

(assert (=> d!45404 m!217809))

(declare-fun m!217811 () Bool)

(assert (=> d!45404 m!217811))

(declare-fun m!217813 () Bool)

(assert (=> d!45404 m!217813))

(declare-fun m!217815 () Bool)

(assert (=> d!45404 m!217815))

(declare-fun m!217817 () Bool)

(assert (=> d!45404 m!217817))

(declare-fun m!217819 () Bool)

(assert (=> d!45404 m!217819))

(assert (=> d!45404 m!217723))

(declare-fun m!217821 () Bool)

(assert (=> d!45404 m!217821))

(declare-fun m!217823 () Bool)

(assert (=> d!45404 m!217823))

(declare-fun m!217825 () Bool)

(assert (=> d!45404 m!217825))

(declare-fun m!217827 () Bool)

(assert (=> b!141791 m!217827))

(declare-fun m!217829 () Bool)

(assert (=> b!141792 m!217829))

(assert (=> b!141792 m!217713))

(assert (=> b!141792 m!217715))

(assert (=> b!141731 d!45404))

(declare-fun d!45406 () Bool)

(declare-fun e!94470 () Bool)

(assert (=> d!45406 e!94470))

(declare-fun res!118305 () Bool)

(assert (=> d!45406 (=> (not res!118305) (not e!94470))))

(declare-fun lt!219869 () (_ BitVec 64))

(declare-fun lt!219872 () (_ BitVec 64))

(declare-fun lt!219867 () (_ BitVec 64))

(assert (=> d!45406 (= res!118305 (= lt!219869 (bvsub lt!219872 lt!219867)))))

(assert (=> d!45406 (or (= (bvand lt!219872 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!219867 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!219872 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!219872 lt!219867) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45406 (= lt!219867 (remainingBits!0 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!219758)))) ((_ sign_extend 32) (currentByte!6226 (_2!6618 lt!219758))) ((_ sign_extend 32) (currentBit!6221 (_2!6618 lt!219758)))))))

(declare-fun lt!219868 () (_ BitVec 64))

(declare-fun lt!219871 () (_ BitVec 64))

(assert (=> d!45406 (= lt!219872 (bvmul lt!219868 lt!219871))))

(assert (=> d!45406 (or (= lt!219868 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!219871 (bvsdiv (bvmul lt!219868 lt!219871) lt!219868)))))

(assert (=> d!45406 (= lt!219871 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45406 (= lt!219868 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!219758)))))))

(assert (=> d!45406 (= lt!219869 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6226 (_2!6618 lt!219758))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6221 (_2!6618 lt!219758)))))))

(assert (=> d!45406 (invariant!0 (currentBit!6221 (_2!6618 lt!219758)) (currentByte!6226 (_2!6618 lt!219758)) (size!2945 (buf!3366 (_2!6618 lt!219758))))))

(assert (=> d!45406 (= (bitIndex!0 (size!2945 (buf!3366 (_2!6618 lt!219758))) (currentByte!6226 (_2!6618 lt!219758)) (currentBit!6221 (_2!6618 lt!219758))) lt!219869)))

(declare-fun b!141799 () Bool)

(declare-fun res!118306 () Bool)

(assert (=> b!141799 (=> (not res!118306) (not e!94470))))

(assert (=> b!141799 (= res!118306 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!219869))))

(declare-fun b!141800 () Bool)

(declare-fun lt!219870 () (_ BitVec 64))

(assert (=> b!141800 (= e!94470 (bvsle lt!219869 (bvmul lt!219870 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!141800 (or (= lt!219870 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!219870 #b0000000000000000000000000000000000000000000000000000000000001000) lt!219870)))))

(assert (=> b!141800 (= lt!219870 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!219758)))))))

(assert (= (and d!45406 res!118305) b!141799))

(assert (= (and b!141799 res!118306) b!141800))

(declare-fun m!217831 () Bool)

(assert (=> d!45406 m!217831))

(declare-fun m!217833 () Bool)

(assert (=> d!45406 m!217833))

(assert (=> b!141730 d!45406))

(declare-fun d!45408 () Bool)

(declare-fun e!94471 () Bool)

(assert (=> d!45408 e!94471))

(declare-fun res!118307 () Bool)

(assert (=> d!45408 (=> (not res!118307) (not e!94471))))

(declare-fun lt!219878 () (_ BitVec 64))

(declare-fun lt!219873 () (_ BitVec 64))

(declare-fun lt!219875 () (_ BitVec 64))

(assert (=> d!45408 (= res!118307 (= lt!219875 (bvsub lt!219878 lt!219873)))))

(assert (=> d!45408 (or (= (bvand lt!219878 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!219873 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!219878 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!219878 lt!219873) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45408 (= lt!219873 (remainingBits!0 ((_ sign_extend 32) (size!2945 (buf!3366 thiss!1634))) ((_ sign_extend 32) (currentByte!6226 thiss!1634)) ((_ sign_extend 32) (currentBit!6221 thiss!1634))))))

(declare-fun lt!219874 () (_ BitVec 64))

(declare-fun lt!219877 () (_ BitVec 64))

(assert (=> d!45408 (= lt!219878 (bvmul lt!219874 lt!219877))))

(assert (=> d!45408 (or (= lt!219874 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!219877 (bvsdiv (bvmul lt!219874 lt!219877) lt!219874)))))

(assert (=> d!45408 (= lt!219877 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45408 (= lt!219874 ((_ sign_extend 32) (size!2945 (buf!3366 thiss!1634))))))

(assert (=> d!45408 (= lt!219875 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6226 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6221 thiss!1634))))))

(assert (=> d!45408 (invariant!0 (currentBit!6221 thiss!1634) (currentByte!6226 thiss!1634) (size!2945 (buf!3366 thiss!1634)))))

(assert (=> d!45408 (= (bitIndex!0 (size!2945 (buf!3366 thiss!1634)) (currentByte!6226 thiss!1634) (currentBit!6221 thiss!1634)) lt!219875)))

(declare-fun b!141801 () Bool)

(declare-fun res!118308 () Bool)

(assert (=> b!141801 (=> (not res!118308) (not e!94471))))

(assert (=> b!141801 (= res!118308 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!219875))))

(declare-fun b!141802 () Bool)

(declare-fun lt!219876 () (_ BitVec 64))

(assert (=> b!141802 (= e!94471 (bvsle lt!219875 (bvmul lt!219876 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!141802 (or (= lt!219876 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!219876 #b0000000000000000000000000000000000000000000000000000000000001000) lt!219876)))))

(assert (=> b!141802 (= lt!219876 ((_ sign_extend 32) (size!2945 (buf!3366 thiss!1634))))))

(assert (= (and d!45408 res!118307) b!141801))

(assert (= (and b!141801 res!118308) b!141802))

(assert (=> d!45408 m!217793))

(assert (=> d!45408 m!217685))

(assert (=> b!141730 d!45408))

(declare-fun d!45410 () Bool)

(assert (=> d!45410 (= (array_inv!2734 arr!237) (bvsge (size!2945 arr!237) #b00000000000000000000000000000000))))

(assert (=> start!27488 d!45410))

(declare-fun d!45412 () Bool)

(assert (=> d!45412 (= (inv!12 thiss!1634) (invariant!0 (currentBit!6221 thiss!1634) (currentByte!6226 thiss!1634) (size!2945 (buf!3366 thiss!1634))))))

(declare-fun bs!11166 () Bool)

(assert (= bs!11166 d!45412))

(assert (=> bs!11166 m!217685))

(assert (=> start!27488 d!45412))

(declare-fun d!45414 () Bool)

(declare-fun e!94472 () Bool)

(assert (=> d!45414 e!94472))

(declare-fun res!118309 () Bool)

(assert (=> d!45414 (=> (not res!118309) (not e!94472))))

(declare-fun lt!219881 () (_ BitVec 64))

(declare-fun lt!219879 () (_ BitVec 64))

(declare-fun lt!219884 () (_ BitVec 64))

(assert (=> d!45414 (= res!118309 (= lt!219881 (bvsub lt!219884 lt!219879)))))

(assert (=> d!45414 (or (= (bvand lt!219884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!219879 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!219884 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!219884 lt!219879) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45414 (= lt!219879 (remainingBits!0 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!219750)))) ((_ sign_extend 32) (currentByte!6226 (_2!6618 lt!219750))) ((_ sign_extend 32) (currentBit!6221 (_2!6618 lt!219750)))))))

(declare-fun lt!219880 () (_ BitVec 64))

(declare-fun lt!219883 () (_ BitVec 64))

(assert (=> d!45414 (= lt!219884 (bvmul lt!219880 lt!219883))))

(assert (=> d!45414 (or (= lt!219880 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!219883 (bvsdiv (bvmul lt!219880 lt!219883) lt!219880)))))

(assert (=> d!45414 (= lt!219883 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45414 (= lt!219880 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!219750)))))))

(assert (=> d!45414 (= lt!219881 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6226 (_2!6618 lt!219750))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6221 (_2!6618 lt!219750)))))))

(assert (=> d!45414 (invariant!0 (currentBit!6221 (_2!6618 lt!219750)) (currentByte!6226 (_2!6618 lt!219750)) (size!2945 (buf!3366 (_2!6618 lt!219750))))))

(assert (=> d!45414 (= (bitIndex!0 (size!2945 (buf!3366 (_2!6618 lt!219750))) (currentByte!6226 (_2!6618 lt!219750)) (currentBit!6221 (_2!6618 lt!219750))) lt!219881)))

(declare-fun b!141803 () Bool)

(declare-fun res!118310 () Bool)

(assert (=> b!141803 (=> (not res!118310) (not e!94472))))

(assert (=> b!141803 (= res!118310 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!219881))))

(declare-fun b!141804 () Bool)

(declare-fun lt!219882 () (_ BitVec 64))

(assert (=> b!141804 (= e!94472 (bvsle lt!219881 (bvmul lt!219882 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!141804 (or (= lt!219882 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!219882 #b0000000000000000000000000000000000000000000000000000000000001000) lt!219882)))))

(assert (=> b!141804 (= lt!219882 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!219750)))))))

(assert (= (and d!45414 res!118309) b!141803))

(assert (= (and b!141803 res!118310) b!141804))

(declare-fun m!217835 () Bool)

(assert (=> d!45414 m!217835))

(declare-fun m!217837 () Bool)

(assert (=> d!45414 m!217837))

(assert (=> b!141724 d!45414))

(assert (=> b!141724 d!45406))

(declare-fun d!45416 () Bool)

(declare-datatypes ((tuple2!12592 0))(
  ( (tuple2!12593 (_1!6627 (_ BitVec 8)) (_2!6627 BitStream!5148)) )
))
(declare-fun lt!219887 () tuple2!12592)

(declare-fun readByte!0 (BitStream!5148) tuple2!12592)

(assert (=> d!45416 (= lt!219887 (readByte!0 (_1!6620 lt!219752)))))

(assert (=> d!45416 (= (readBytePure!0 (_1!6620 lt!219752)) (tuple2!12583 (_2!6627 lt!219887) (_1!6627 lt!219887)))))

(declare-fun bs!11167 () Bool)

(assert (= bs!11167 d!45416))

(declare-fun m!217839 () Bool)

(assert (=> bs!11167 m!217839))

(assert (=> b!141734 d!45416))

(declare-fun d!45418 () Bool)

(declare-fun e!94474 () Bool)

(assert (=> d!45418 e!94474))

(declare-fun res!118313 () Bool)

(assert (=> d!45418 (=> (not res!118313) (not e!94474))))

(declare-fun lt!219892 () tuple2!12580)

(assert (=> d!45418 (= res!118313 (isPrefixOf!0 (_1!6620 lt!219892) (_2!6620 lt!219892)))))

(declare-fun lt!219895 () BitStream!5148)

(assert (=> d!45418 (= lt!219892 (tuple2!12581 lt!219895 (_2!6618 lt!219758)))))

(declare-fun lt!219888 () Unit!8872)

(declare-fun lt!219894 () Unit!8872)

(assert (=> d!45418 (= lt!219888 lt!219894)))

(assert (=> d!45418 (isPrefixOf!0 lt!219895 (_2!6618 lt!219758))))

(assert (=> d!45418 (= lt!219894 (lemmaIsPrefixTransitive!0 lt!219895 (_2!6618 lt!219758) (_2!6618 lt!219758)))))

(declare-fun lt!219905 () Unit!8872)

(declare-fun lt!219897 () Unit!8872)

(assert (=> d!45418 (= lt!219905 lt!219897)))

(assert (=> d!45418 (isPrefixOf!0 lt!219895 (_2!6618 lt!219758))))

(assert (=> d!45418 (= lt!219897 (lemmaIsPrefixTransitive!0 lt!219895 thiss!1634 (_2!6618 lt!219758)))))

(declare-fun lt!219896 () Unit!8872)

(declare-fun e!94473 () Unit!8872)

(assert (=> d!45418 (= lt!219896 e!94473)))

(declare-fun c!7803 () Bool)

(assert (=> d!45418 (= c!7803 (not (= (size!2945 (buf!3366 thiss!1634)) #b00000000000000000000000000000000)))))

(declare-fun lt!219899 () Unit!8872)

(declare-fun lt!219904 () Unit!8872)

(assert (=> d!45418 (= lt!219899 lt!219904)))

(assert (=> d!45418 (isPrefixOf!0 (_2!6618 lt!219758) (_2!6618 lt!219758))))

(assert (=> d!45418 (= lt!219904 (lemmaIsPrefixRefl!0 (_2!6618 lt!219758)))))

(declare-fun lt!219891 () Unit!8872)

(declare-fun lt!219902 () Unit!8872)

(assert (=> d!45418 (= lt!219891 lt!219902)))

(assert (=> d!45418 (= lt!219902 (lemmaIsPrefixRefl!0 (_2!6618 lt!219758)))))

(declare-fun lt!219893 () Unit!8872)

(declare-fun lt!219900 () Unit!8872)

(assert (=> d!45418 (= lt!219893 lt!219900)))

(assert (=> d!45418 (isPrefixOf!0 lt!219895 lt!219895)))

(assert (=> d!45418 (= lt!219900 (lemmaIsPrefixRefl!0 lt!219895))))

(declare-fun lt!219898 () Unit!8872)

(declare-fun lt!219907 () Unit!8872)

(assert (=> d!45418 (= lt!219898 lt!219907)))

(assert (=> d!45418 (isPrefixOf!0 thiss!1634 thiss!1634)))

(assert (=> d!45418 (= lt!219907 (lemmaIsPrefixRefl!0 thiss!1634))))

(assert (=> d!45418 (= lt!219895 (BitStream!5149 (buf!3366 (_2!6618 lt!219758)) (currentByte!6226 thiss!1634) (currentBit!6221 thiss!1634)))))

(assert (=> d!45418 (isPrefixOf!0 thiss!1634 (_2!6618 lt!219758))))

(assert (=> d!45418 (= (reader!0 thiss!1634 (_2!6618 lt!219758)) lt!219892)))

(declare-fun b!141805 () Bool)

(declare-fun Unit!8877 () Unit!8872)

(assert (=> b!141805 (= e!94473 Unit!8877)))

(declare-fun b!141806 () Bool)

(declare-fun res!118311 () Bool)

(assert (=> b!141806 (=> (not res!118311) (not e!94474))))

(assert (=> b!141806 (= res!118311 (isPrefixOf!0 (_2!6620 lt!219892) (_2!6618 lt!219758)))))

(declare-fun lt!219889 () (_ BitVec 64))

(declare-fun lt!219906 () (_ BitVec 64))

(declare-fun b!141807 () Bool)

(assert (=> b!141807 (= e!94474 (= (_1!6620 lt!219892) (withMovedBitIndex!0 (_2!6620 lt!219892) (bvsub lt!219889 lt!219906))))))

(assert (=> b!141807 (or (= (bvand lt!219889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!219906 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!219889 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!219889 lt!219906) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!141807 (= lt!219906 (bitIndex!0 (size!2945 (buf!3366 (_2!6618 lt!219758))) (currentByte!6226 (_2!6618 lt!219758)) (currentBit!6221 (_2!6618 lt!219758))))))

(assert (=> b!141807 (= lt!219889 (bitIndex!0 (size!2945 (buf!3366 thiss!1634)) (currentByte!6226 thiss!1634) (currentBit!6221 thiss!1634)))))

(declare-fun b!141808 () Bool)

(declare-fun lt!219901 () Unit!8872)

(assert (=> b!141808 (= e!94473 lt!219901)))

(declare-fun lt!219903 () (_ BitVec 64))

(assert (=> b!141808 (= lt!219903 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!219890 () (_ BitVec 64))

(assert (=> b!141808 (= lt!219890 (bitIndex!0 (size!2945 (buf!3366 thiss!1634)) (currentByte!6226 thiss!1634) (currentBit!6221 thiss!1634)))))

(assert (=> b!141808 (= lt!219901 (arrayBitRangesEqSymmetric!0 (buf!3366 thiss!1634) (buf!3366 (_2!6618 lt!219758)) lt!219903 lt!219890))))

(assert (=> b!141808 (arrayBitRangesEq!0 (buf!3366 (_2!6618 lt!219758)) (buf!3366 thiss!1634) lt!219903 lt!219890)))

(declare-fun b!141809 () Bool)

(declare-fun res!118312 () Bool)

(assert (=> b!141809 (=> (not res!118312) (not e!94474))))

(assert (=> b!141809 (= res!118312 (isPrefixOf!0 (_1!6620 lt!219892) thiss!1634))))

(assert (= (and d!45418 c!7803) b!141808))

(assert (= (and d!45418 (not c!7803)) b!141805))

(assert (= (and d!45418 res!118313) b!141809))

(assert (= (and b!141809 res!118312) b!141806))

(assert (= (and b!141806 res!118311) b!141807))

(declare-fun m!217841 () Bool)

(assert (=> b!141809 m!217841))

(assert (=> b!141808 m!217721))

(declare-fun m!217843 () Bool)

(assert (=> b!141808 m!217843))

(declare-fun m!217845 () Bool)

(assert (=> b!141808 m!217845))

(assert (=> d!45418 m!217811))

(declare-fun m!217847 () Bool)

(assert (=> d!45418 m!217847))

(declare-fun m!217849 () Bool)

(assert (=> d!45418 m!217849))

(declare-fun m!217851 () Bool)

(assert (=> d!45418 m!217851))

(declare-fun m!217853 () Bool)

(assert (=> d!45418 m!217853))

(declare-fun m!217855 () Bool)

(assert (=> d!45418 m!217855))

(assert (=> d!45418 m!217813))

(assert (=> d!45418 m!217725))

(declare-fun m!217857 () Bool)

(assert (=> d!45418 m!217857))

(declare-fun m!217859 () Bool)

(assert (=> d!45418 m!217859))

(declare-fun m!217861 () Bool)

(assert (=> d!45418 m!217861))

(declare-fun m!217863 () Bool)

(assert (=> b!141806 m!217863))

(declare-fun m!217865 () Bool)

(assert (=> b!141807 m!217865))

(assert (=> b!141807 m!217715))

(assert (=> b!141807 m!217721))

(assert (=> b!141734 d!45418))

(declare-fun d!45420 () Bool)

(declare-fun res!118320 () Bool)

(declare-fun e!94480 () Bool)

(assert (=> d!45420 (=> (not res!118320) (not e!94480))))

(assert (=> d!45420 (= res!118320 (= (size!2945 (buf!3366 thiss!1634)) (size!2945 (buf!3366 (_2!6618 lt!219758)))))))

(assert (=> d!45420 (= (isPrefixOf!0 thiss!1634 (_2!6618 lt!219758)) e!94480)))

(declare-fun b!141816 () Bool)

(declare-fun res!118322 () Bool)

(assert (=> b!141816 (=> (not res!118322) (not e!94480))))

(assert (=> b!141816 (= res!118322 (bvsle (bitIndex!0 (size!2945 (buf!3366 thiss!1634)) (currentByte!6226 thiss!1634) (currentBit!6221 thiss!1634)) (bitIndex!0 (size!2945 (buf!3366 (_2!6618 lt!219758))) (currentByte!6226 (_2!6618 lt!219758)) (currentBit!6221 (_2!6618 lt!219758)))))))

(declare-fun b!141817 () Bool)

(declare-fun e!94479 () Bool)

(assert (=> b!141817 (= e!94480 e!94479)))

(declare-fun res!118321 () Bool)

(assert (=> b!141817 (=> res!118321 e!94479)))

(assert (=> b!141817 (= res!118321 (= (size!2945 (buf!3366 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!141818 () Bool)

(assert (=> b!141818 (= e!94479 (arrayBitRangesEq!0 (buf!3366 thiss!1634) (buf!3366 (_2!6618 lt!219758)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2945 (buf!3366 thiss!1634)) (currentByte!6226 thiss!1634) (currentBit!6221 thiss!1634))))))

(assert (= (and d!45420 res!118320) b!141816))

(assert (= (and b!141816 res!118322) b!141817))

(assert (= (and b!141817 (not res!118321)) b!141818))

(assert (=> b!141816 m!217721))

(assert (=> b!141816 m!217715))

(assert (=> b!141818 m!217721))

(assert (=> b!141818 m!217721))

(declare-fun m!217867 () Bool)

(assert (=> b!141818 m!217867))

(assert (=> b!141733 d!45420))

(declare-fun d!45422 () Bool)

(assert (=> d!45422 (= (invariant!0 (currentBit!6221 thiss!1634) (currentByte!6226 thiss!1634) (size!2945 (buf!3366 thiss!1634))) (and (bvsge (currentBit!6221 thiss!1634) #b00000000000000000000000000000000) (bvslt (currentBit!6221 thiss!1634) #b00000000000000000000000000001000) (bvsge (currentByte!6226 thiss!1634) #b00000000000000000000000000000000) (or (bvslt (currentByte!6226 thiss!1634) (size!2945 (buf!3366 thiss!1634))) (and (= (currentBit!6221 thiss!1634) #b00000000000000000000000000000000) (= (currentByte!6226 thiss!1634) (size!2945 (buf!3366 thiss!1634)))))))))

(assert (=> b!141722 d!45422))

(declare-fun d!45424 () Bool)

(declare-fun res!118323 () Bool)

(declare-fun e!94482 () Bool)

(assert (=> d!45424 (=> (not res!118323) (not e!94482))))

(assert (=> d!45424 (= res!118323 (= (size!2945 (buf!3366 (_2!6618 lt!219758))) (size!2945 (buf!3366 (_2!6618 lt!219750)))))))

(assert (=> d!45424 (= (isPrefixOf!0 (_2!6618 lt!219758) (_2!6618 lt!219750)) e!94482)))

(declare-fun b!141819 () Bool)

(declare-fun res!118325 () Bool)

(assert (=> b!141819 (=> (not res!118325) (not e!94482))))

(assert (=> b!141819 (= res!118325 (bvsle (bitIndex!0 (size!2945 (buf!3366 (_2!6618 lt!219758))) (currentByte!6226 (_2!6618 lt!219758)) (currentBit!6221 (_2!6618 lt!219758))) (bitIndex!0 (size!2945 (buf!3366 (_2!6618 lt!219750))) (currentByte!6226 (_2!6618 lt!219750)) (currentBit!6221 (_2!6618 lt!219750)))))))

(declare-fun b!141820 () Bool)

(declare-fun e!94481 () Bool)

(assert (=> b!141820 (= e!94482 e!94481)))

(declare-fun res!118324 () Bool)

(assert (=> b!141820 (=> res!118324 e!94481)))

(assert (=> b!141820 (= res!118324 (= (size!2945 (buf!3366 (_2!6618 lt!219758))) #b00000000000000000000000000000000))))

(declare-fun b!141821 () Bool)

(assert (=> b!141821 (= e!94481 (arrayBitRangesEq!0 (buf!3366 (_2!6618 lt!219758)) (buf!3366 (_2!6618 lt!219750)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2945 (buf!3366 (_2!6618 lt!219758))) (currentByte!6226 (_2!6618 lt!219758)) (currentBit!6221 (_2!6618 lt!219758)))))))

(assert (= (and d!45424 res!118323) b!141819))

(assert (= (and b!141819 res!118325) b!141820))

(assert (= (and b!141820 (not res!118324)) b!141821))

(assert (=> b!141819 m!217715))

(assert (=> b!141819 m!217713))

(assert (=> b!141821 m!217715))

(assert (=> b!141821 m!217715))

(declare-fun m!217869 () Bool)

(assert (=> b!141821 m!217869))

(assert (=> b!141727 d!45424))

(declare-fun d!45426 () Bool)

(assert (=> d!45426 (isPrefixOf!0 thiss!1634 (_2!6618 lt!219750))))

(declare-fun lt!219910 () Unit!8872)

(declare-fun choose!30 (BitStream!5148 BitStream!5148 BitStream!5148) Unit!8872)

(assert (=> d!45426 (= lt!219910 (choose!30 thiss!1634 (_2!6618 lt!219758) (_2!6618 lt!219750)))))

(assert (=> d!45426 (isPrefixOf!0 thiss!1634 (_2!6618 lt!219758))))

(assert (=> d!45426 (= (lemmaIsPrefixTransitive!0 thiss!1634 (_2!6618 lt!219758) (_2!6618 lt!219750)) lt!219910)))

(declare-fun bs!11168 () Bool)

(assert (= bs!11168 d!45426))

(assert (=> bs!11168 m!217687))

(declare-fun m!217871 () Bool)

(assert (=> bs!11168 m!217871))

(assert (=> bs!11168 m!217725))

(assert (=> b!141726 d!45426))

(declare-fun d!45432 () Bool)

(declare-fun e!94508 () Bool)

(assert (=> d!45432 e!94508))

(declare-fun res!118365 () Bool)

(assert (=> d!45432 (=> (not res!118365) (not e!94508))))

(declare-fun lt!220030 () tuple2!12576)

(assert (=> d!45432 (= res!118365 (= (size!2945 (buf!3366 (_2!6618 lt!219758))) (size!2945 (buf!3366 (_2!6618 lt!220030)))))))

(declare-fun choose!64 (BitStream!5148 array!6503 (_ BitVec 32) (_ BitVec 32)) tuple2!12576)

(assert (=> d!45432 (= lt!220030 (choose!64 (_2!6618 lt!219758) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(assert (=> d!45432 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 from!447)) (bvsle (bvadd #b00000000000000000000000000000001 from!447) to!404) (bvsle to!404 (size!2945 arr!237)))))

(assert (=> d!45432 (= (appendByteArrayLoop!0 (_2!6618 lt!219758) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404) lt!220030)))

(declare-fun b!141866 () Bool)

(declare-fun res!118364 () Bool)

(assert (=> b!141866 (=> (not res!118364) (not e!94508))))

(assert (=> b!141866 (= res!118364 (isPrefixOf!0 (_2!6618 lt!219758) (_2!6618 lt!220030)))))

(declare-fun b!141867 () Bool)

(declare-fun e!94507 () Bool)

(assert (=> b!141867 (= e!94508 e!94507)))

(declare-fun res!118367 () Bool)

(assert (=> b!141867 (=> (not res!118367) (not e!94507))))

(declare-fun lt!220028 () tuple2!12580)

(declare-fun lt!220033 () tuple2!12578)

(assert (=> b!141867 (= res!118367 (and (= (size!2945 (_2!6619 lt!220033)) (size!2945 arr!237)) (= (_1!6619 lt!220033) (_2!6620 lt!220028))))))

(assert (=> b!141867 (= lt!220033 (readByteArrayLoopPure!0 (_1!6620 lt!220028) arr!237 (bvadd #b00000000000000000000000000000001 from!447) to!404))))

(declare-fun lt!220035 () Unit!8872)

(declare-fun lt!220032 () Unit!8872)

(assert (=> b!141867 (= lt!220035 lt!220032)))

(declare-fun lt!220029 () (_ BitVec 64))

(assert (=> b!141867 (validate_offset_bits!1 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!220030)))) ((_ sign_extend 32) (currentByte!6226 (_2!6618 lt!219758))) ((_ sign_extend 32) (currentBit!6221 (_2!6618 lt!219758))) lt!220029)))

(assert (=> b!141867 (= lt!220032 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!6618 lt!219758) (buf!3366 (_2!6618 lt!220030)) lt!220029))))

(declare-fun e!94506 () Bool)

(assert (=> b!141867 e!94506))

(declare-fun res!118366 () Bool)

(assert (=> b!141867 (=> (not res!118366) (not e!94506))))

(assert (=> b!141867 (= res!118366 (and (= (size!2945 (buf!3366 (_2!6618 lt!219758))) (size!2945 (buf!3366 (_2!6618 lt!220030)))) (bvsge lt!220029 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!141867 (= lt!220029 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!141867 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!141867 (= lt!220028 (reader!0 (_2!6618 lt!219758) (_2!6618 lt!220030)))))

(declare-fun b!141868 () Bool)

(assert (=> b!141868 (= e!94506 (validate_offset_bits!1 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!219758)))) ((_ sign_extend 32) (currentByte!6226 (_2!6618 lt!219758))) ((_ sign_extend 32) (currentBit!6221 (_2!6618 lt!219758))) lt!220029))))

(declare-fun b!141869 () Bool)

(declare-fun res!118368 () Bool)

(assert (=> b!141869 (=> (not res!118368) (not e!94508))))

(declare-fun lt!220031 () (_ BitVec 64))

(declare-fun lt!220036 () (_ BitVec 64))

(assert (=> b!141869 (= res!118368 (= (bitIndex!0 (size!2945 (buf!3366 (_2!6618 lt!220030))) (currentByte!6226 (_2!6618 lt!220030)) (currentBit!6221 (_2!6618 lt!220030))) (bvadd lt!220031 lt!220036)))))

(assert (=> b!141869 (or (not (= (bvand lt!220031 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220036 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!220031 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!220031 lt!220036) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!220034 () (_ BitVec 64))

(assert (=> b!141869 (= lt!220036 (bvmul lt!220034 #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> b!141869 (or (= lt!220034 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220034 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220034)))))

(assert (=> b!141869 (= lt!220034 ((_ sign_extend 32) (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447))))))

(assert (=> b!141869 (or (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 from!447) #b10000000000000000000000000000000)) (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 (bvadd #b00000000000000000000000000000001 from!447)) #b10000000000000000000000000000000)))))

(assert (=> b!141869 (= lt!220031 (bitIndex!0 (size!2945 (buf!3366 (_2!6618 lt!219758))) (currentByte!6226 (_2!6618 lt!219758)) (currentBit!6221 (_2!6618 lt!219758))))))

(declare-fun b!141870 () Bool)

(assert (=> b!141870 (= e!94507 (arrayRangesEq!261 arr!237 (_2!6619 lt!220033) #b00000000000000000000000000000000 to!404))))

(assert (= (and d!45432 res!118365) b!141869))

(assert (= (and b!141869 res!118368) b!141866))

(assert (= (and b!141866 res!118364) b!141867))

(assert (= (and b!141867 res!118366) b!141868))

(assert (= (and b!141867 res!118367) b!141870))

(declare-fun m!217925 () Bool)

(assert (=> b!141869 m!217925))

(assert (=> b!141869 m!217715))

(declare-fun m!217927 () Bool)

(assert (=> b!141867 m!217927))

(declare-fun m!217929 () Bool)

(assert (=> b!141867 m!217929))

(declare-fun m!217931 () Bool)

(assert (=> b!141867 m!217931))

(declare-fun m!217933 () Bool)

(assert (=> b!141867 m!217933))

(declare-fun m!217935 () Bool)

(assert (=> b!141870 m!217935))

(declare-fun m!217937 () Bool)

(assert (=> b!141868 m!217937))

(declare-fun m!217939 () Bool)

(assert (=> d!45432 m!217939))

(declare-fun m!217941 () Bool)

(assert (=> b!141866 m!217941))

(assert (=> b!141726 d!45432))

(declare-fun d!45466 () Bool)

(declare-fun e!94509 () Bool)

(assert (=> d!45466 e!94509))

(declare-fun res!118369 () Bool)

(assert (=> d!45466 (=> (not res!118369) (not e!94509))))

(declare-fun lt!220042 () (_ BitVec 64))

(declare-fun lt!220037 () (_ BitVec 64))

(declare-fun lt!220039 () (_ BitVec 64))

(assert (=> d!45466 (= res!118369 (= lt!220039 (bvsub lt!220042 lt!220037)))))

(assert (=> d!45466 (or (= (bvand lt!220042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220037 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!220042 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!220042 lt!220037) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!45466 (= lt!220037 (remainingBits!0 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!219758)))) ((_ sign_extend 32) (currentByte!6226 thiss!1634)) ((_ sign_extend 32) (currentBit!6221 thiss!1634))))))

(declare-fun lt!220038 () (_ BitVec 64))

(declare-fun lt!220041 () (_ BitVec 64))

(assert (=> d!45466 (= lt!220042 (bvmul lt!220038 lt!220041))))

(assert (=> d!45466 (or (= lt!220038 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!220041 (bvsdiv (bvmul lt!220038 lt!220041) lt!220038)))))

(assert (=> d!45466 (= lt!220041 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!45466 (= lt!220038 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!219758)))))))

(assert (=> d!45466 (= lt!220039 (bvadd (bvmul ((_ sign_extend 32) (currentByte!6226 thiss!1634)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!6221 thiss!1634))))))

(assert (=> d!45466 (invariant!0 (currentBit!6221 thiss!1634) (currentByte!6226 thiss!1634) (size!2945 (buf!3366 (_2!6618 lt!219758))))))

(assert (=> d!45466 (= (bitIndex!0 (size!2945 (buf!3366 (_2!6618 lt!219758))) (currentByte!6226 thiss!1634) (currentBit!6221 thiss!1634)) lt!220039)))

(declare-fun b!141871 () Bool)

(declare-fun res!118370 () Bool)

(assert (=> b!141871 (=> (not res!118370) (not e!94509))))

(assert (=> b!141871 (= res!118370 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!220039))))

(declare-fun b!141872 () Bool)

(declare-fun lt!220040 () (_ BitVec 64))

(assert (=> b!141872 (= e!94509 (bvsle lt!220039 (bvmul lt!220040 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!141872 (or (= lt!220040 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!220040 #b0000000000000000000000000000000000000000000000000000000000001000) lt!220040)))))

(assert (=> b!141872 (= lt!220040 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!219758)))))))

(assert (= (and d!45466 res!118369) b!141871))

(assert (= (and b!141871 res!118370) b!141872))

(declare-fun m!217943 () Bool)

(assert (=> d!45466 m!217943))

(assert (=> d!45466 m!217727))

(assert (=> b!141726 d!45466))

(declare-fun d!45468 () Bool)

(assert (=> d!45468 (= (validate_offset_bytes!0 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!219758)))) ((_ sign_extend 32) (currentByte!6226 (_2!6618 lt!219758))) ((_ sign_extend 32) (currentBit!6221 (_2!6618 lt!219758))) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsle ((_ sign_extend 32) (bvsub (bvsub to!404 from!447) #b00000000000000000000000000000001)) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!219758)))) ((_ sign_extend 32) (currentByte!6226 (_2!6618 lt!219758))) ((_ sign_extend 32) (currentBit!6221 (_2!6618 lt!219758)))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun bs!11176 () Bool)

(assert (= bs!11176 d!45468))

(assert (=> bs!11176 m!217831))

(assert (=> b!141726 d!45468))

(declare-fun d!45470 () Bool)

(declare-fun res!118371 () Bool)

(declare-fun e!94511 () Bool)

(assert (=> d!45470 (=> (not res!118371) (not e!94511))))

(assert (=> d!45470 (= res!118371 (= (size!2945 (buf!3366 thiss!1634)) (size!2945 (buf!3366 (_2!6618 lt!219750)))))))

(assert (=> d!45470 (= (isPrefixOf!0 thiss!1634 (_2!6618 lt!219750)) e!94511)))

(declare-fun b!141873 () Bool)

(declare-fun res!118373 () Bool)

(assert (=> b!141873 (=> (not res!118373) (not e!94511))))

(assert (=> b!141873 (= res!118373 (bvsle (bitIndex!0 (size!2945 (buf!3366 thiss!1634)) (currentByte!6226 thiss!1634) (currentBit!6221 thiss!1634)) (bitIndex!0 (size!2945 (buf!3366 (_2!6618 lt!219750))) (currentByte!6226 (_2!6618 lt!219750)) (currentBit!6221 (_2!6618 lt!219750)))))))

(declare-fun b!141874 () Bool)

(declare-fun e!94510 () Bool)

(assert (=> b!141874 (= e!94511 e!94510)))

(declare-fun res!118372 () Bool)

(assert (=> b!141874 (=> res!118372 e!94510)))

(assert (=> b!141874 (= res!118372 (= (size!2945 (buf!3366 thiss!1634)) #b00000000000000000000000000000000))))

(declare-fun b!141875 () Bool)

(assert (=> b!141875 (= e!94510 (arrayBitRangesEq!0 (buf!3366 thiss!1634) (buf!3366 (_2!6618 lt!219750)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2945 (buf!3366 thiss!1634)) (currentByte!6226 thiss!1634) (currentBit!6221 thiss!1634))))))

(assert (= (and d!45470 res!118371) b!141873))

(assert (= (and b!141873 res!118373) b!141874))

(assert (= (and b!141874 (not res!118372)) b!141875))

(assert (=> b!141873 m!217721))

(assert (=> b!141873 m!217713))

(assert (=> b!141875 m!217721))

(assert (=> b!141875 m!217721))

(declare-fun m!217945 () Bool)

(assert (=> b!141875 m!217945))

(assert (=> b!141726 d!45470))

(declare-fun d!45472 () Bool)

(declare-fun e!94524 () Bool)

(assert (=> d!45472 e!94524))

(declare-fun res!118391 () Bool)

(assert (=> d!45472 (=> (not res!118391) (not e!94524))))

(assert (=> d!45472 (= res!118391 (and (or (let ((rhs!3176 #b0000000000000000000000000000000000000000000000000000000000000111)) (and (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3176 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3176) #b1000000000000000000000000000000000000000000000000000000000000000))))) (let ((d!45477 #b0000000000000000000000000000000000000000000000000000000000001000)) (and (not (= d!45477 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= d!45477 #b1111111111111111111111111111111111111111111111111111111111111111)))))) (let ((rhs!3175 #b0000000000000000000000000000000000000000000000000000000000000111)) (or (not (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand rhs!3175 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand #b0000000000000000000000000000000000000000000000000000000000001000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 rhs!3175) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!220091 () Unit!8872)

(declare-fun choose!57 (BitStream!5148 BitStream!5148 (_ BitVec 64) (_ BitVec 32)) Unit!8872)

(assert (=> d!45472 (= lt!220091 (choose!57 thiss!1634 (_2!6618 lt!219758) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)))))

(assert (=> d!45472 (= (validateOffsetBytesFromBitIndexLemma!0 thiss!1634 (_2!6618 lt!219758) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!404 from!447)) lt!220091)))

(declare-fun b!141897 () Bool)

(declare-fun lt!220090 () (_ BitVec 32))

(assert (=> b!141897 (= e!94524 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2945 (buf!3366 (_2!6618 lt!219758)))) ((_ sign_extend 32) (currentByte!6226 (_2!6618 lt!219758))) ((_ sign_extend 32) (currentBit!6221 (_2!6618 lt!219758))) (bvsub (bvsub to!404 from!447) lt!220090)))))

(assert (=> b!141897 (or (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand lt!220090 #b10000000000000000000000000000000)) (= (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000) (bvand (bvsub (bvsub to!404 from!447) lt!220090) #b10000000000000000000000000000000)))))

(declare-fun lt!220089 () (_ BitVec 64))

(assert (=> b!141897 (= lt!220090 ((_ extract 31 0) lt!220089))))

(assert (=> b!141897 (and (bvslt lt!220089 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!220089 #b1111111111111111111111111111111110000000000000000000000000000000))))

(assert (=> b!141897 (= lt!220089 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (= (and d!45472 res!118391) b!141897))

(declare-fun m!217949 () Bool)

(assert (=> d!45472 m!217949))

(declare-fun m!217951 () Bool)

(assert (=> b!141897 m!217951))

(assert (=> b!141726 d!45472))

(declare-fun d!45480 () Bool)

(declare-fun e!94542 () Bool)

(assert (=> d!45480 e!94542))

(declare-fun res!118422 () Bool)

(assert (=> d!45480 (=> (not res!118422) (not e!94542))))

(declare-fun lt!220168 () tuple2!12576)

(assert (=> d!45480 (= res!118422 (= (size!2945 (buf!3366 thiss!1634)) (size!2945 (buf!3366 (_2!6618 lt!220168)))))))

(declare-fun choose!6 (BitStream!5148 (_ BitVec 8)) tuple2!12576)

(assert (=> d!45480 (= lt!220168 (choose!6 thiss!1634 (select (arr!3652 arr!237) from!447)))))

(declare-fun validate_offset_byte!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!45480 (validate_offset_byte!0 ((_ sign_extend 32) (size!2945 (buf!3366 thiss!1634))) ((_ sign_extend 32) (currentByte!6226 thiss!1634)) ((_ sign_extend 32) (currentBit!6221 thiss!1634)))))

(assert (=> d!45480 (= (appendByte!0 thiss!1634 (select (arr!3652 arr!237) from!447)) lt!220168)))

(declare-fun b!141930 () Bool)

(declare-fun res!118424 () Bool)

(assert (=> b!141930 (=> (not res!118424) (not e!94542))))

(declare-fun lt!220169 () (_ BitVec 64))

(declare-fun lt!220171 () (_ BitVec 64))

(assert (=> b!141930 (= res!118424 (= (bitIndex!0 (size!2945 (buf!3366 (_2!6618 lt!220168))) (currentByte!6226 (_2!6618 lt!220168)) (currentBit!6221 (_2!6618 lt!220168))) (bvadd lt!220171 lt!220169)))))

(assert (=> b!141930 (or (not (= (bvand lt!220171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!220169 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!220171 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!220171 lt!220169) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!141930 (= lt!220169 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> b!141930 (= lt!220171 (bitIndex!0 (size!2945 (buf!3366 thiss!1634)) (currentByte!6226 thiss!1634) (currentBit!6221 thiss!1634)))))

(declare-fun b!141931 () Bool)

(declare-fun res!118423 () Bool)

(assert (=> b!141931 (=> (not res!118423) (not e!94542))))

(assert (=> b!141931 (= res!118423 (isPrefixOf!0 thiss!1634 (_2!6618 lt!220168)))))

(declare-fun b!141932 () Bool)

(declare-fun lt!220170 () tuple2!12580)

(declare-fun lt!220167 () tuple2!12582)

(assert (=> b!141932 (= e!94542 (and (= (_2!6621 lt!220167) (select (arr!3652 arr!237) from!447)) (= (_1!6621 lt!220167) (_2!6620 lt!220170))))))

(assert (=> b!141932 (= lt!220167 (readBytePure!0 (_1!6620 lt!220170)))))

(assert (=> b!141932 (= lt!220170 (reader!0 thiss!1634 (_2!6618 lt!220168)))))

(assert (= (and d!45480 res!118422) b!141930))

(assert (= (and b!141930 res!118424) b!141931))

(assert (= (and b!141931 res!118423) b!141932))

(assert (=> d!45480 m!217697))

(declare-fun m!218001 () Bool)

(assert (=> d!45480 m!218001))

(declare-fun m!218003 () Bool)

(assert (=> d!45480 m!218003))

(declare-fun m!218005 () Bool)

(assert (=> b!141930 m!218005))

(assert (=> b!141930 m!217721))

(declare-fun m!218007 () Bool)

(assert (=> b!141931 m!218007))

(declare-fun m!218009 () Bool)

(assert (=> b!141932 m!218009))

(declare-fun m!218011 () Bool)

(assert (=> b!141932 m!218011))

(assert (=> b!141726 d!45480))

(declare-fun d!45504 () Bool)

(assert (=> d!45504 (= (array_inv!2734 (buf!3366 thiss!1634)) (bvsge (size!2945 (buf!3366 thiss!1634)) #b00000000000000000000000000000000))))

(assert (=> b!141725 d!45504))

(check-sat (not d!45396) (not b!141869) (not b!141792) (not b!141873) (not d!45398) (not b!141808) (not d!45404) (not d!45432) (not b!141794) (not b!141806) (not b!141866) (not b!141868) (not d!45472) (not b!141870) (not b!141821) (not b!141818) (not b!141931) (not d!45416) (not b!141807) (not d!45400) (not d!45468) (not b!141867) (not d!45402) (not b!141791) (not b!141779) (not d!45406) (not d!45418) (not d!45480) (not d!45426) (not b!141819) (not b!141793) (not b!141809) (not d!45408) (not b!141932) (not d!45466) (not b!141897) (not b!141875) (not d!45412) (not b!141816) (not b!141930) (not d!45414))
(check-sat)
