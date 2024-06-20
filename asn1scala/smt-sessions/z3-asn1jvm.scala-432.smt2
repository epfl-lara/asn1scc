; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11786 () Bool)

(assert start!11786)

(declare-fun b!58110 () Bool)

(declare-fun res!48243 () Bool)

(declare-fun e!38506 () Bool)

(assert (=> b!58110 (=> (not res!48243) (not e!38506))))

(declare-datatypes ((array!2643 0))(
  ( (array!2644 (arr!1761 (Array (_ BitVec 32) (_ BitVec 8))) (size!1197 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2082 0))(
  ( (BitStream!2083 (buf!1578 array!2643) (currentByte!3196 (_ BitVec 32)) (currentBit!3191 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2082)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!58110 (= res!48243 (validate_offset_bits!1 ((_ sign_extend 32) (size!1197 (buf!1578 thiss!1379))) ((_ sign_extend 32) (currentByte!3196 thiss!1379)) ((_ sign_extend 32) (currentBit!3191 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!58111 () Bool)

(declare-fun res!48234 () Bool)

(declare-fun e!38503 () Bool)

(assert (=> b!58111 (=> res!48234 e!38503)))

(declare-datatypes ((Unit!4017 0))(
  ( (Unit!4018) )
))
(declare-datatypes ((tuple2!5286 0))(
  ( (tuple2!5287 (_1!2754 Unit!4017) (_2!2754 BitStream!2082)) )
))
(declare-fun lt!92104 () tuple2!5286)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!58111 (= res!48234 (not (invariant!0 (currentBit!3191 (_2!2754 lt!92104)) (currentByte!3196 (_2!2754 lt!92104)) (size!1197 (buf!1578 (_2!2754 lt!92104))))))))

(declare-fun b!58112 () Bool)

(declare-fun e!38505 () Bool)

(declare-fun lt!92110 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!58112 (= e!38505 (= lt!92110 (bvsub (bvsub (bvadd (bitIndex!0 (size!1197 (buf!1578 (_2!2754 lt!92104))) (currentByte!3196 (_2!2754 lt!92104)) (currentBit!3191 (_2!2754 lt!92104))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!58113 () Bool)

(declare-fun e!38502 () Bool)

(assert (=> b!58113 (= e!38502 e!38503)))

(declare-fun res!48237 () Bool)

(assert (=> b!58113 (=> res!48237 e!38503)))

(declare-fun lt!92102 () tuple2!5286)

(assert (=> b!58113 (= res!48237 (not (= (size!1197 (buf!1578 (_2!2754 lt!92104))) (size!1197 (buf!1578 (_2!2754 lt!92102))))))))

(assert (=> b!58113 e!38505))

(declare-fun res!48242 () Bool)

(assert (=> b!58113 (=> (not res!48242) (not e!38505))))

(assert (=> b!58113 (= res!48242 (= (size!1197 (buf!1578 (_2!2754 lt!92102))) (size!1197 (buf!1578 thiss!1379))))))

(declare-fun b!58114 () Bool)

(declare-fun e!38500 () Bool)

(assert (=> b!58114 (= e!38506 (not e!38500))))

(declare-fun res!48235 () Bool)

(assert (=> b!58114 (=> res!48235 e!38500)))

(assert (=> b!58114 (= res!48235 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!2082 BitStream!2082) Bool)

(assert (=> b!58114 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!92108 () Unit!4017)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2082) Unit!4017)

(assert (=> b!58114 (= lt!92108 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!92101 () (_ BitVec 64))

(assert (=> b!58114 (= lt!92101 (bitIndex!0 (size!1197 (buf!1578 thiss!1379)) (currentByte!3196 thiss!1379) (currentBit!3191 thiss!1379)))))

(declare-fun b!58115 () Bool)

(declare-fun res!48239 () Bool)

(assert (=> b!58115 (=> res!48239 e!38502)))

(assert (=> b!58115 (= res!48239 (not (invariant!0 (currentBit!3191 (_2!2754 lt!92102)) (currentByte!3196 (_2!2754 lt!92102)) (size!1197 (buf!1578 (_2!2754 lt!92102))))))))

(declare-fun res!48236 () Bool)

(assert (=> start!11786 (=> (not res!48236) (not e!38506))))

(declare-fun srcBuffer!2 () array!2643)

(assert (=> start!11786 (= res!48236 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1197 srcBuffer!2))))))))

(assert (=> start!11786 e!38506))

(assert (=> start!11786 true))

(declare-fun array_inv!1100 (array!2643) Bool)

(assert (=> start!11786 (array_inv!1100 srcBuffer!2)))

(declare-fun e!38507 () Bool)

(declare-fun inv!12 (BitStream!2082) Bool)

(assert (=> start!11786 (and (inv!12 thiss!1379) e!38507)))

(declare-fun b!58116 () Bool)

(declare-fun res!48241 () Bool)

(assert (=> b!58116 (=> res!48241 e!38503)))

(assert (=> b!58116 (= res!48241 (not (invariant!0 (currentBit!3191 (_2!2754 lt!92104)) (currentByte!3196 (_2!2754 lt!92104)) (size!1197 (buf!1578 (_2!2754 lt!92102))))))))

(declare-fun b!58117 () Bool)

(declare-fun e!38501 () Bool)

(declare-datatypes ((tuple2!5288 0))(
  ( (tuple2!5289 (_1!2755 BitStream!2082) (_2!2755 BitStream!2082)) )
))
(declare-fun lt!92106 () tuple2!5288)

(declare-datatypes ((List!616 0))(
  ( (Nil!613) (Cons!612 (h!731 Bool) (t!1366 List!616)) )
))
(declare-fun head!435 (List!616) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2082 array!2643 (_ BitVec 64) (_ BitVec 64)) List!616)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2082 BitStream!2082 (_ BitVec 64)) List!616)

(assert (=> b!58117 (= e!38501 (= (head!435 (byteArrayBitContentToList!0 (_2!2754 lt!92104) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!435 (bitStreamReadBitsIntoList!0 (_2!2754 lt!92104) (_1!2755 lt!92106) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!58118 () Bool)

(assert (=> b!58118 (= e!38503 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand i!635 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!92109 () tuple2!5288)

(declare-fun reader!0 (BitStream!2082 BitStream!2082) tuple2!5288)

(assert (=> b!58118 (= lt!92109 (reader!0 thiss!1379 (_2!2754 lt!92102)))))

(declare-fun b!58119 () Bool)

(declare-fun e!38508 () Bool)

(assert (=> b!58119 (= e!38500 e!38508)))

(declare-fun res!48232 () Bool)

(assert (=> b!58119 (=> res!48232 e!38508)))

(assert (=> b!58119 (= res!48232 (not (isPrefixOf!0 thiss!1379 (_2!2754 lt!92104))))))

(assert (=> b!58119 (validate_offset_bits!1 ((_ sign_extend 32) (size!1197 (buf!1578 (_2!2754 lt!92104)))) ((_ sign_extend 32) (currentByte!3196 (_2!2754 lt!92104))) ((_ sign_extend 32) (currentBit!3191 (_2!2754 lt!92104))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92105 () Unit!4017)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2082 BitStream!2082 (_ BitVec 64) (_ BitVec 64)) Unit!4017)

(assert (=> b!58119 (= lt!92105 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2754 lt!92104) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2082 (_ BitVec 8) (_ BitVec 32)) tuple2!5286)

(assert (=> b!58119 (= lt!92104 (appendBitFromByte!0 thiss!1379 (select (arr!1761 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!58120 () Bool)

(assert (=> b!58120 (= e!38507 (array_inv!1100 (buf!1578 thiss!1379)))))

(declare-fun b!58121 () Bool)

(declare-fun e!38504 () Bool)

(assert (=> b!58121 (= e!38504 e!38502)))

(declare-fun res!48233 () Bool)

(assert (=> b!58121 (=> res!48233 e!38502)))

(assert (=> b!58121 (= res!48233 (not (= lt!92110 (bvsub (bvadd lt!92101 to!314) i!635))))))

(assert (=> b!58121 (= lt!92110 (bitIndex!0 (size!1197 (buf!1578 (_2!2754 lt!92102))) (currentByte!3196 (_2!2754 lt!92102)) (currentBit!3191 (_2!2754 lt!92102))))))

(declare-fun b!58122 () Bool)

(declare-fun res!48231 () Bool)

(assert (=> b!58122 (=> res!48231 e!38502)))

(assert (=> b!58122 (= res!48231 (not (= (size!1197 (buf!1578 thiss!1379)) (size!1197 (buf!1578 (_2!2754 lt!92102))))))))

(declare-fun b!58123 () Bool)

(assert (=> b!58123 (= e!38508 e!38504)))

(declare-fun res!48240 () Bool)

(assert (=> b!58123 (=> res!48240 e!38504)))

(assert (=> b!58123 (= res!48240 (not (isPrefixOf!0 (_2!2754 lt!92104) (_2!2754 lt!92102))))))

(assert (=> b!58123 (isPrefixOf!0 thiss!1379 (_2!2754 lt!92102))))

(declare-fun lt!92103 () Unit!4017)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2082 BitStream!2082 BitStream!2082) Unit!4017)

(assert (=> b!58123 (= lt!92103 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2754 lt!92104) (_2!2754 lt!92102)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2082 array!2643 (_ BitVec 64) (_ BitVec 64)) tuple2!5286)

(assert (=> b!58123 (= lt!92102 (appendBitsMSBFirstLoop!0 (_2!2754 lt!92104) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!58123 e!38501))

(declare-fun res!48238 () Bool)

(assert (=> b!58123 (=> (not res!48238) (not e!38501))))

(assert (=> b!58123 (= res!48238 (validate_offset_bits!1 ((_ sign_extend 32) (size!1197 (buf!1578 (_2!2754 lt!92104)))) ((_ sign_extend 32) (currentByte!3196 thiss!1379)) ((_ sign_extend 32) (currentBit!3191 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!92107 () Unit!4017)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2082 array!2643 (_ BitVec 64)) Unit!4017)

(assert (=> b!58123 (= lt!92107 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1578 (_2!2754 lt!92104)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!58123 (= lt!92106 (reader!0 thiss!1379 (_2!2754 lt!92104)))))

(assert (= (and start!11786 res!48236) b!58110))

(assert (= (and b!58110 res!48243) b!58114))

(assert (= (and b!58114 (not res!48235)) b!58119))

(assert (= (and b!58119 (not res!48232)) b!58123))

(assert (= (and b!58123 res!48238) b!58117))

(assert (= (and b!58123 (not res!48240)) b!58121))

(assert (= (and b!58121 (not res!48233)) b!58115))

(assert (= (and b!58115 (not res!48239)) b!58122))

(assert (= (and b!58122 (not res!48231)) b!58113))

(assert (= (and b!58113 res!48242) b!58112))

(assert (= (and b!58113 (not res!48237)) b!58111))

(assert (= (and b!58111 (not res!48234)) b!58116))

(assert (= (and b!58116 (not res!48241)) b!58118))

(assert (= start!11786 b!58120))

(declare-fun m!91619 () Bool)

(assert (=> b!58114 m!91619))

(declare-fun m!91621 () Bool)

(assert (=> b!58114 m!91621))

(declare-fun m!91623 () Bool)

(assert (=> b!58114 m!91623))

(declare-fun m!91625 () Bool)

(assert (=> b!58123 m!91625))

(declare-fun m!91627 () Bool)

(assert (=> b!58123 m!91627))

(declare-fun m!91629 () Bool)

(assert (=> b!58123 m!91629))

(declare-fun m!91631 () Bool)

(assert (=> b!58123 m!91631))

(declare-fun m!91633 () Bool)

(assert (=> b!58123 m!91633))

(declare-fun m!91635 () Bool)

(assert (=> b!58123 m!91635))

(declare-fun m!91637 () Bool)

(assert (=> b!58123 m!91637))

(declare-fun m!91639 () Bool)

(assert (=> b!58119 m!91639))

(declare-fun m!91641 () Bool)

(assert (=> b!58119 m!91641))

(declare-fun m!91643 () Bool)

(assert (=> b!58119 m!91643))

(declare-fun m!91645 () Bool)

(assert (=> b!58119 m!91645))

(declare-fun m!91647 () Bool)

(assert (=> b!58119 m!91647))

(assert (=> b!58119 m!91643))

(declare-fun m!91649 () Bool)

(assert (=> b!58115 m!91649))

(declare-fun m!91651 () Bool)

(assert (=> b!58116 m!91651))

(declare-fun m!91653 () Bool)

(assert (=> b!58118 m!91653))

(declare-fun m!91655 () Bool)

(assert (=> b!58121 m!91655))

(declare-fun m!91657 () Bool)

(assert (=> b!58117 m!91657))

(assert (=> b!58117 m!91657))

(declare-fun m!91659 () Bool)

(assert (=> b!58117 m!91659))

(declare-fun m!91661 () Bool)

(assert (=> b!58117 m!91661))

(assert (=> b!58117 m!91661))

(declare-fun m!91663 () Bool)

(assert (=> b!58117 m!91663))

(declare-fun m!91665 () Bool)

(assert (=> b!58120 m!91665))

(declare-fun m!91667 () Bool)

(assert (=> b!58112 m!91667))

(declare-fun m!91669 () Bool)

(assert (=> b!58111 m!91669))

(declare-fun m!91671 () Bool)

(assert (=> b!58110 m!91671))

(declare-fun m!91673 () Bool)

(assert (=> start!11786 m!91673))

(declare-fun m!91675 () Bool)

(assert (=> start!11786 m!91675))

(check-sat (not b!58118) (not b!58110) (not b!58116) (not b!58119) (not b!58117) (not b!58114) (not b!58120) (not b!58111) (not start!11786) (not b!58112) (not b!58121) (not b!58115) (not b!58123))
(check-sat)
