; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53242 () Bool)

(assert start!53242)

(declare-fun b!247282 () Bool)

(declare-fun res!206939 () Bool)

(declare-fun e!171287 () Bool)

(assert (=> b!247282 (=> (not res!206939) (not e!171287))))

(declare-fun from!289 () (_ BitVec 64))

(declare-datatypes ((array!13471 0))(
  ( (array!13472 (arr!6893 (Array (_ BitVec 32) (_ BitVec 8))) (size!5906 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10734 0))(
  ( (BitStream!10735 (buf!6390 array!13471) (currentByte!11792 (_ BitVec 32)) (currentBit!11787 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10734)

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247282 (= res!206939 (validate_offset_bits!1 ((_ sign_extend 32) (size!5906 (buf!6390 thiss!1005))) ((_ sign_extend 32) (currentByte!11792 thiss!1005)) ((_ sign_extend 32) (currentBit!11787 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!247283 () Bool)

(declare-fun e!171286 () Bool)

(assert (=> b!247283 (= e!171287 (not e!171286))))

(declare-fun res!206937 () Bool)

(assert (=> b!247283 (=> res!206937 e!171286)))

(assert (=> b!247283 (= res!206937 (not (= nBits!297 from!289)))))

(declare-fun isPrefixOf!0 (BitStream!10734 BitStream!10734) Bool)

(assert (=> b!247283 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-datatypes ((Unit!17930 0))(
  ( (Unit!17931) )
))
(declare-fun lt!385806 () Unit!17930)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10734) Unit!17930)

(assert (=> b!247283 (= lt!385806 (lemmaIsPrefixRefl!0 thiss!1005))))

(declare-fun res!206938 () Bool)

(assert (=> start!53242 (=> (not res!206938) (not e!171287))))

(assert (=> start!53242 (= res!206938 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53242 e!171287))

(assert (=> start!53242 true))

(declare-fun e!171285 () Bool)

(declare-fun inv!12 (BitStream!10734) Bool)

(assert (=> start!53242 (and (inv!12 thiss!1005) e!171285)))

(declare-fun b!247284 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!247284 (= e!171286 (invariant!0 (currentBit!11787 thiss!1005) (currentByte!11792 thiss!1005) (size!5906 (buf!6390 thiss!1005))))))

(declare-fun b!247285 () Bool)

(declare-fun res!206940 () Bool)

(assert (=> b!247285 (=> (not res!206940) (not e!171287))))

(assert (=> b!247285 (= res!206940 (bvsge from!289 nBits!297))))

(declare-fun b!247286 () Bool)

(declare-fun array_inv!5647 (array!13471) Bool)

(assert (=> b!247286 (= e!171285 (array_inv!5647 (buf!6390 thiss!1005)))))

(assert (= (and start!53242 res!206938) b!247282))

(assert (= (and b!247282 res!206939) b!247285))

(assert (= (and b!247285 res!206940) b!247283))

(assert (= (and b!247283 (not res!206937)) b!247284))

(assert (= start!53242 b!247286))

(declare-fun m!373031 () Bool)

(assert (=> b!247284 m!373031))

(declare-fun m!373033 () Bool)

(assert (=> b!247286 m!373033))

(declare-fun m!373035 () Bool)

(assert (=> b!247283 m!373035))

(declare-fun m!373037 () Bool)

(assert (=> b!247283 m!373037))

(declare-fun m!373039 () Bool)

(assert (=> start!53242 m!373039))

(declare-fun m!373041 () Bool)

(assert (=> b!247282 m!373041))

(check-sat (not b!247286) (not b!247284) (not b!247282) (not start!53242) (not b!247283))
(check-sat)
(get-model)

(declare-fun d!82842 () Bool)

(assert (=> d!82842 (= (invariant!0 (currentBit!11787 thiss!1005) (currentByte!11792 thiss!1005) (size!5906 (buf!6390 thiss!1005))) (and (bvsge (currentBit!11787 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11787 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11792 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11792 thiss!1005) (size!5906 (buf!6390 thiss!1005))) (and (= (currentBit!11787 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11792 thiss!1005) (size!5906 (buf!6390 thiss!1005)))))))))

(assert (=> b!247284 d!82842))

(declare-fun d!82850 () Bool)

(declare-fun res!206966 () Bool)

(declare-fun e!171308 () Bool)

(assert (=> d!82850 (=> (not res!206966) (not e!171308))))

(assert (=> d!82850 (= res!206966 (= (size!5906 (buf!6390 thiss!1005)) (size!5906 (buf!6390 thiss!1005))))))

(assert (=> d!82850 (= (isPrefixOf!0 thiss!1005 thiss!1005) e!171308)))

(declare-fun b!247314 () Bool)

(declare-fun res!206967 () Bool)

(assert (=> b!247314 (=> (not res!206967) (not e!171308))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247314 (= res!206967 (bvsle (bitIndex!0 (size!5906 (buf!6390 thiss!1005)) (currentByte!11792 thiss!1005) (currentBit!11787 thiss!1005)) (bitIndex!0 (size!5906 (buf!6390 thiss!1005)) (currentByte!11792 thiss!1005) (currentBit!11787 thiss!1005))))))

(declare-fun b!247315 () Bool)

(declare-fun e!171309 () Bool)

(assert (=> b!247315 (= e!171308 e!171309)))

(declare-fun res!206965 () Bool)

(assert (=> b!247315 (=> res!206965 e!171309)))

(assert (=> b!247315 (= res!206965 (= (size!5906 (buf!6390 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!247316 () Bool)

(declare-fun arrayBitRangesEq!0 (array!13471 array!13471 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247316 (= e!171309 (arrayBitRangesEq!0 (buf!6390 thiss!1005) (buf!6390 thiss!1005) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5906 (buf!6390 thiss!1005)) (currentByte!11792 thiss!1005) (currentBit!11787 thiss!1005))))))

(assert (= (and d!82850 res!206966) b!247314))

(assert (= (and b!247314 res!206967) b!247315))

(assert (= (and b!247315 (not res!206965)) b!247316))

(declare-fun m!373061 () Bool)

(assert (=> b!247314 m!373061))

(assert (=> b!247314 m!373061))

(assert (=> b!247316 m!373061))

(assert (=> b!247316 m!373061))

(declare-fun m!373065 () Bool)

(assert (=> b!247316 m!373065))

(assert (=> b!247283 d!82850))

(declare-fun d!82862 () Bool)

(assert (=> d!82862 (isPrefixOf!0 thiss!1005 thiss!1005)))

(declare-fun lt!385814 () Unit!17930)

(declare-fun choose!11 (BitStream!10734) Unit!17930)

(assert (=> d!82862 (= lt!385814 (choose!11 thiss!1005))))

(assert (=> d!82862 (= (lemmaIsPrefixRefl!0 thiss!1005) lt!385814)))

(declare-fun bs!20979 () Bool)

(assert (= bs!20979 d!82862))

(assert (=> bs!20979 m!373035))

(declare-fun m!373069 () Bool)

(assert (=> bs!20979 m!373069))

(assert (=> b!247283 d!82862))

(declare-fun d!82864 () Bool)

(assert (=> d!82864 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11787 thiss!1005) (currentByte!11792 thiss!1005) (size!5906 (buf!6390 thiss!1005))))))

(declare-fun bs!20981 () Bool)

(assert (= bs!20981 d!82864))

(assert (=> bs!20981 m!373031))

(assert (=> start!53242 d!82864))

(declare-fun d!82870 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!82870 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5906 (buf!6390 thiss!1005))) ((_ sign_extend 32) (currentByte!11792 thiss!1005)) ((_ sign_extend 32) (currentBit!11787 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5906 (buf!6390 thiss!1005))) ((_ sign_extend 32) (currentByte!11792 thiss!1005)) ((_ sign_extend 32) (currentBit!11787 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20982 () Bool)

(assert (= bs!20982 d!82870))

(declare-fun m!373075 () Bool)

(assert (=> bs!20982 m!373075))

(assert (=> b!247282 d!82870))

(declare-fun d!82874 () Bool)

(assert (=> d!82874 (= (array_inv!5647 (buf!6390 thiss!1005)) (bvsge (size!5906 (buf!6390 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!247286 d!82874))

(check-sat (not d!82862) (not b!247316) (not b!247314) (not d!82864) (not d!82870))
(check-sat)
