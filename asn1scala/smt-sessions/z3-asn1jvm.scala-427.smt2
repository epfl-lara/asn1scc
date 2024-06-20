; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!11372 () Bool)

(assert start!11372)

(declare-fun b!56284 () Bool)

(declare-fun res!46826 () Bool)

(declare-fun e!37445 () Bool)

(assert (=> b!56284 (=> res!46826 e!37445)))

(declare-datatypes ((array!2601 0))(
  ( (array!2602 (arr!1734 (Array (_ BitVec 32) (_ BitVec 8))) (size!1182 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2052 0))(
  ( (BitStream!2053 (buf!1551 array!2601) (currentByte!3145 (_ BitVec 32)) (currentBit!3140 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2052)

(declare-datatypes ((Unit!3891 0))(
  ( (Unit!3892) )
))
(declare-datatypes ((tuple2!5130 0))(
  ( (tuple2!5131 (_1!2676 Unit!3891) (_2!2676 BitStream!2052)) )
))
(declare-fun lt!88320 () tuple2!5130)

(assert (=> b!56284 (= res!46826 (not (= (size!1182 (buf!1551 thiss!1379)) (size!1182 (buf!1551 (_2!2676 lt!88320))))))))

(declare-fun b!56285 () Bool)

(declare-fun res!46827 () Bool)

(assert (=> b!56285 (=> res!46827 e!37445)))

(declare-fun lt!88321 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!56285 (= res!46827 (not (= (bitIndex!0 (size!1182 (buf!1551 (_2!2676 lt!88320))) (currentByte!3145 (_2!2676 lt!88320)) (currentBit!3140 (_2!2676 lt!88320))) (bvsub (bvadd lt!88321 to!314) i!635))))))

(declare-fun srcBuffer!2 () array!2601)

(declare-fun b!56286 () Bool)

(declare-fun lt!88323 () tuple2!5130)

(declare-datatypes ((tuple2!5132 0))(
  ( (tuple2!5133 (_1!2677 BitStream!2052) (_2!2677 BitStream!2052)) )
))
(declare-fun lt!88327 () tuple2!5132)

(declare-fun e!37448 () Bool)

(declare-datatypes ((List!601 0))(
  ( (Nil!598) (Cons!597 (h!716 Bool) (t!1351 List!601)) )
))
(declare-fun head!420 (List!601) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2052 array!2601 (_ BitVec 64) (_ BitVec 64)) List!601)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2052 BitStream!2052 (_ BitVec 64)) List!601)

(assert (=> b!56286 (= e!37448 (= (head!420 (byteArrayBitContentToList!0 (_2!2676 lt!88323) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!420 (bitStreamReadBitsIntoList!0 (_2!2676 lt!88323) (_1!2677 lt!88327) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!56287 () Bool)

(declare-fun e!37446 () Bool)

(assert (=> b!56287 (= e!37446 e!37445)))

(declare-fun res!46829 () Bool)

(assert (=> b!56287 (=> res!46829 e!37445)))

(declare-fun isPrefixOf!0 (BitStream!2052 BitStream!2052) Bool)

(assert (=> b!56287 (= res!46829 (not (isPrefixOf!0 (_2!2676 lt!88323) (_2!2676 lt!88320))))))

(assert (=> b!56287 (isPrefixOf!0 thiss!1379 (_2!2676 lt!88320))))

(declare-fun lt!88326 () Unit!3891)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2052 BitStream!2052 BitStream!2052) Unit!3891)

(assert (=> b!56287 (= lt!88326 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2676 lt!88323) (_2!2676 lt!88320)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2052 array!2601 (_ BitVec 64) (_ BitVec 64)) tuple2!5130)

(assert (=> b!56287 (= lt!88320 (appendBitsMSBFirstLoop!0 (_2!2676 lt!88323) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!56287 e!37448))

(declare-fun res!46823 () Bool)

(assert (=> b!56287 (=> (not res!46823) (not e!37448))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!56287 (= res!46823 (validate_offset_bits!1 ((_ sign_extend 32) (size!1182 (buf!1551 (_2!2676 lt!88323)))) ((_ sign_extend 32) (currentByte!3145 thiss!1379)) ((_ sign_extend 32) (currentBit!3140 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!88324 () Unit!3891)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2052 array!2601 (_ BitVec 64)) Unit!3891)

(assert (=> b!56287 (= lt!88324 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1551 (_2!2676 lt!88323)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2052 BitStream!2052) tuple2!5132)

(assert (=> b!56287 (= lt!88327 (reader!0 thiss!1379 (_2!2676 lt!88323)))))

(declare-fun b!56288 () Bool)

(declare-fun e!37444 () Bool)

(declare-fun e!37451 () Bool)

(assert (=> b!56288 (= e!37444 (not e!37451))))

(declare-fun res!46825 () Bool)

(assert (=> b!56288 (=> res!46825 e!37451)))

(assert (=> b!56288 (= res!46825 (bvsge i!635 to!314))))

(assert (=> b!56288 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!88325 () Unit!3891)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2052) Unit!3891)

(assert (=> b!56288 (= lt!88325 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!56288 (= lt!88321 (bitIndex!0 (size!1182 (buf!1551 thiss!1379)) (currentByte!3145 thiss!1379) (currentBit!3140 thiss!1379)))))

(declare-fun b!56289 () Bool)

(declare-fun res!46830 () Bool)

(assert (=> b!56289 (=> res!46830 e!37445)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!56289 (= res!46830 (not (invariant!0 (currentBit!3140 (_2!2676 lt!88320)) (currentByte!3145 (_2!2676 lt!88320)) (size!1182 (buf!1551 (_2!2676 lt!88320))))))))

(declare-fun b!56290 () Bool)

(declare-fun res!46822 () Bool)

(assert (=> b!56290 (=> (not res!46822) (not e!37444))))

(assert (=> b!56290 (= res!46822 (validate_offset_bits!1 ((_ sign_extend 32) (size!1182 (buf!1551 thiss!1379))) ((_ sign_extend 32) (currentByte!3145 thiss!1379)) ((_ sign_extend 32) (currentBit!3140 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!56291 () Bool)

(declare-fun e!37447 () Bool)

(declare-fun array_inv!1085 (array!2601) Bool)

(assert (=> b!56291 (= e!37447 (array_inv!1085 (buf!1551 thiss!1379)))))

(declare-fun res!46824 () Bool)

(assert (=> start!11372 (=> (not res!46824) (not e!37444))))

(assert (=> start!11372 (= res!46824 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1182 srcBuffer!2))))))))

(assert (=> start!11372 e!37444))

(assert (=> start!11372 true))

(assert (=> start!11372 (array_inv!1085 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2052) Bool)

(assert (=> start!11372 (and (inv!12 thiss!1379) e!37447)))

(declare-fun b!56292 () Bool)

(assert (=> b!56292 (= e!37451 e!37446)))

(declare-fun res!46828 () Bool)

(assert (=> b!56292 (=> res!46828 e!37446)))

(assert (=> b!56292 (= res!46828 (not (isPrefixOf!0 thiss!1379 (_2!2676 lt!88323))))))

(assert (=> b!56292 (validate_offset_bits!1 ((_ sign_extend 32) (size!1182 (buf!1551 (_2!2676 lt!88323)))) ((_ sign_extend 32) (currentByte!3145 (_2!2676 lt!88323))) ((_ sign_extend 32) (currentBit!3140 (_2!2676 lt!88323))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!88322 () Unit!3891)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2052 BitStream!2052 (_ BitVec 64) (_ BitVec 64)) Unit!3891)

(assert (=> b!56292 (= lt!88322 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2676 lt!88323) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2052 (_ BitVec 8) (_ BitVec 32)) tuple2!5130)

(assert (=> b!56292 (= lt!88323 (appendBitFromByte!0 thiss!1379 (select (arr!1734 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!56293 () Bool)

(assert (=> b!56293 (= e!37445 true)))

(assert (=> b!56293 (= (size!1182 (buf!1551 (_2!2676 lt!88320))) (size!1182 (buf!1551 thiss!1379)))))

(assert (= (and start!11372 res!46824) b!56290))

(assert (= (and b!56290 res!46822) b!56288))

(assert (= (and b!56288 (not res!46825)) b!56292))

(assert (= (and b!56292 (not res!46828)) b!56287))

(assert (= (and b!56287 res!46823) b!56286))

(assert (= (and b!56287 (not res!46829)) b!56285))

(assert (= (and b!56285 (not res!46827)) b!56289))

(assert (= (and b!56289 (not res!46830)) b!56284))

(assert (= (and b!56284 (not res!46826)) b!56293))

(assert (= start!11372 b!56291))

(declare-fun m!88701 () Bool)

(assert (=> b!56285 m!88701))

(declare-fun m!88703 () Bool)

(assert (=> b!56288 m!88703))

(declare-fun m!88705 () Bool)

(assert (=> b!56288 m!88705))

(declare-fun m!88707 () Bool)

(assert (=> b!56288 m!88707))

(declare-fun m!88709 () Bool)

(assert (=> b!56291 m!88709))

(declare-fun m!88711 () Bool)

(assert (=> b!56286 m!88711))

(assert (=> b!56286 m!88711))

(declare-fun m!88713 () Bool)

(assert (=> b!56286 m!88713))

(declare-fun m!88715 () Bool)

(assert (=> b!56286 m!88715))

(assert (=> b!56286 m!88715))

(declare-fun m!88717 () Bool)

(assert (=> b!56286 m!88717))

(declare-fun m!88719 () Bool)

(assert (=> b!56290 m!88719))

(declare-fun m!88721 () Bool)

(assert (=> b!56287 m!88721))

(declare-fun m!88723 () Bool)

(assert (=> b!56287 m!88723))

(declare-fun m!88725 () Bool)

(assert (=> b!56287 m!88725))

(declare-fun m!88727 () Bool)

(assert (=> b!56287 m!88727))

(declare-fun m!88729 () Bool)

(assert (=> b!56287 m!88729))

(declare-fun m!88731 () Bool)

(assert (=> b!56287 m!88731))

(declare-fun m!88733 () Bool)

(assert (=> b!56287 m!88733))

(declare-fun m!88735 () Bool)

(assert (=> b!56289 m!88735))

(declare-fun m!88737 () Bool)

(assert (=> start!11372 m!88737))

(declare-fun m!88739 () Bool)

(assert (=> start!11372 m!88739))

(declare-fun m!88741 () Bool)

(assert (=> b!56292 m!88741))

(declare-fun m!88743 () Bool)

(assert (=> b!56292 m!88743))

(declare-fun m!88745 () Bool)

(assert (=> b!56292 m!88745))

(assert (=> b!56292 m!88743))

(declare-fun m!88747 () Bool)

(assert (=> b!56292 m!88747))

(declare-fun m!88749 () Bool)

(assert (=> b!56292 m!88749))

(check-sat (not b!56285) (not start!11372) (not b!56286) (not b!56289) (not b!56292) (not b!56287) (not b!56288) (not b!56291) (not b!56290))
