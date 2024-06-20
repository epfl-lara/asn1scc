; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11160 () Bool)

(assert start!11160)

(declare-fun b!55325 () Bool)

(declare-fun e!36861 () Bool)

(declare-fun e!36862 () Bool)

(assert (=> b!55325 (= e!36861 e!36862)))

(declare-fun res!46083 () Bool)

(assert (=> b!55325 (=> res!46083 e!36862)))

(declare-datatypes ((array!2575 0))(
  ( (array!2576 (arr!1718 (Array (_ BitVec 32) (_ BitVec 8))) (size!1172 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2032 0))(
  ( (BitStream!2033 (buf!1535 array!2575) (currentByte!3117 (_ BitVec 32)) (currentBit!3112 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2032)

(declare-datatypes ((Unit!3823 0))(
  ( (Unit!3824) )
))
(declare-datatypes ((tuple2!5042 0))(
  ( (tuple2!5043 (_1!2632 Unit!3823) (_2!2632 BitStream!2032)) )
))
(declare-fun lt!86401 () tuple2!5042)

(declare-fun isPrefixOf!0 (BitStream!2032 BitStream!2032) Bool)

(assert (=> b!55325 (= res!46083 (not (isPrefixOf!0 thiss!1379 (_2!2632 lt!86401))))))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!55325 (validate_offset_bits!1 ((_ sign_extend 32) (size!1172 (buf!1535 (_2!2632 lt!86401)))) ((_ sign_extend 32) (currentByte!3117 (_2!2632 lt!86401))) ((_ sign_extend 32) (currentBit!3112 (_2!2632 lt!86401))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!86398 () Unit!3823)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2032 BitStream!2032 (_ BitVec 64) (_ BitVec 64)) Unit!3823)

(assert (=> b!55325 (= lt!86398 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2632 lt!86401) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!2575)

(declare-fun appendBitFromByte!0 (BitStream!2032 (_ BitVec 8) (_ BitVec 32)) tuple2!5042)

(assert (=> b!55325 (= lt!86401 (appendBitFromByte!0 thiss!1379 (select (arr!1718 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!55326 () Bool)

(declare-fun res!46084 () Bool)

(declare-fun e!36856 () Bool)

(assert (=> b!55326 (=> (not res!46084) (not e!36856))))

(assert (=> b!55326 (= res!46084 (validate_offset_bits!1 ((_ sign_extend 32) (size!1172 (buf!1535 thiss!1379))) ((_ sign_extend 32) (currentByte!3117 thiss!1379)) ((_ sign_extend 32) (currentBit!3112 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!46081 () Bool)

(assert (=> start!11160 (=> (not res!46081) (not e!36856))))

(assert (=> start!11160 (= res!46081 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1172 srcBuffer!2))))))))

(assert (=> start!11160 e!36856))

(assert (=> start!11160 true))

(declare-fun array_inv!1075 (array!2575) Bool)

(assert (=> start!11160 (array_inv!1075 srcBuffer!2)))

(declare-fun e!36863 () Bool)

(declare-fun inv!12 (BitStream!2032) Bool)

(assert (=> start!11160 (and (inv!12 thiss!1379) e!36863)))

(declare-fun b!55327 () Bool)

(assert (=> b!55327 (= e!36856 (not e!36861))))

(declare-fun res!46082 () Bool)

(assert (=> b!55327 (=> res!46082 e!36861)))

(assert (=> b!55327 (= res!46082 (bvsge i!635 to!314))))

(assert (=> b!55327 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!86400 () Unit!3823)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2032) Unit!3823)

(assert (=> b!55327 (= lt!86400 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!86399 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!55327 (= lt!86399 (bitIndex!0 (size!1172 (buf!1535 thiss!1379)) (currentByte!3117 thiss!1379) (currentBit!3112 thiss!1379)))))

(declare-fun b!55328 () Bool)

(declare-fun res!46080 () Bool)

(declare-fun e!36857 () Bool)

(assert (=> b!55328 (=> res!46080 e!36857)))

(declare-fun lt!86402 () tuple2!5042)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!55328 (= res!46080 (not (invariant!0 (currentBit!3112 (_2!2632 lt!86402)) (currentByte!3117 (_2!2632 lt!86402)) (size!1172 (buf!1535 (_2!2632 lt!86402))))))))

(declare-fun b!55329 () Bool)

(assert (=> b!55329 (= e!36863 (array_inv!1075 (buf!1535 thiss!1379)))))

(declare-datatypes ((tuple2!5044 0))(
  ( (tuple2!5045 (_1!2633 BitStream!2032) (_2!2633 BitStream!2032)) )
))
(declare-fun lt!86397 () tuple2!5044)

(declare-fun b!55330 () Bool)

(declare-fun e!36860 () Bool)

(declare-datatypes ((List!591 0))(
  ( (Nil!588) (Cons!587 (h!706 Bool) (t!1341 List!591)) )
))
(declare-fun head!410 (List!591) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2032 array!2575 (_ BitVec 64) (_ BitVec 64)) List!591)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2032 BitStream!2032 (_ BitVec 64)) List!591)

(assert (=> b!55330 (= e!36860 (= (head!410 (byteArrayBitContentToList!0 (_2!2632 lt!86401) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!410 (bitStreamReadBitsIntoList!0 (_2!2632 lt!86401) (_1!2633 lt!86397) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!55331 () Bool)

(declare-fun res!46085 () Bool)

(assert (=> b!55331 (=> res!46085 e!36857)))

(assert (=> b!55331 (= res!46085 (not (= (bitIndex!0 (size!1172 (buf!1535 (_2!2632 lt!86402))) (currentByte!3117 (_2!2632 lt!86402)) (currentBit!3112 (_2!2632 lt!86402))) (bvsub (bvadd lt!86399 to!314) i!635))))))

(declare-fun b!55332 () Bool)

(assert (=> b!55332 (= e!36857 (or (not (= (size!1172 (buf!1535 thiss!1379)) (size!1172 (buf!1535 (_2!2632 lt!86402))))) (= (size!1172 (buf!1535 (_2!2632 lt!86402))) (size!1172 (buf!1535 thiss!1379)))))))

(declare-fun b!55333 () Bool)

(assert (=> b!55333 (= e!36862 e!36857)))

(declare-fun res!46079 () Bool)

(assert (=> b!55333 (=> res!46079 e!36857)))

(assert (=> b!55333 (= res!46079 (not (isPrefixOf!0 (_2!2632 lt!86401) (_2!2632 lt!86402))))))

(assert (=> b!55333 (isPrefixOf!0 thiss!1379 (_2!2632 lt!86402))))

(declare-fun lt!86403 () Unit!3823)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2032 BitStream!2032 BitStream!2032) Unit!3823)

(assert (=> b!55333 (= lt!86403 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2632 lt!86401) (_2!2632 lt!86402)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2032 array!2575 (_ BitVec 64) (_ BitVec 64)) tuple2!5042)

(assert (=> b!55333 (= lt!86402 (appendBitsMSBFirstLoop!0 (_2!2632 lt!86401) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!55333 e!36860))

(declare-fun res!46086 () Bool)

(assert (=> b!55333 (=> (not res!46086) (not e!36860))))

(assert (=> b!55333 (= res!46086 (validate_offset_bits!1 ((_ sign_extend 32) (size!1172 (buf!1535 (_2!2632 lt!86401)))) ((_ sign_extend 32) (currentByte!3117 thiss!1379)) ((_ sign_extend 32) (currentBit!3112 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!86404 () Unit!3823)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2032 array!2575 (_ BitVec 64)) Unit!3823)

(assert (=> b!55333 (= lt!86404 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1535 (_2!2632 lt!86401)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!2032 BitStream!2032) tuple2!5044)

(assert (=> b!55333 (= lt!86397 (reader!0 thiss!1379 (_2!2632 lt!86401)))))

(assert (= (and start!11160 res!46081) b!55326))

(assert (= (and b!55326 res!46084) b!55327))

(assert (= (and b!55327 (not res!46082)) b!55325))

(assert (= (and b!55325 (not res!46083)) b!55333))

(assert (= (and b!55333 res!46086) b!55330))

(assert (= (and b!55333 (not res!46079)) b!55331))

(assert (= (and b!55331 (not res!46085)) b!55328))

(assert (= (and b!55328 (not res!46080)) b!55332))

(assert (= start!11160 b!55329))

(declare-fun m!87133 () Bool)

(assert (=> b!55327 m!87133))

(declare-fun m!87135 () Bool)

(assert (=> b!55327 m!87135))

(declare-fun m!87137 () Bool)

(assert (=> b!55327 m!87137))

(declare-fun m!87139 () Bool)

(assert (=> b!55326 m!87139))

(declare-fun m!87141 () Bool)

(assert (=> b!55325 m!87141))

(declare-fun m!87143 () Bool)

(assert (=> b!55325 m!87143))

(declare-fun m!87145 () Bool)

(assert (=> b!55325 m!87145))

(assert (=> b!55325 m!87143))

(declare-fun m!87147 () Bool)

(assert (=> b!55325 m!87147))

(declare-fun m!87149 () Bool)

(assert (=> b!55325 m!87149))

(declare-fun m!87151 () Bool)

(assert (=> b!55331 m!87151))

(declare-fun m!87153 () Bool)

(assert (=> b!55329 m!87153))

(declare-fun m!87155 () Bool)

(assert (=> b!55328 m!87155))

(declare-fun m!87157 () Bool)

(assert (=> b!55333 m!87157))

(declare-fun m!87159 () Bool)

(assert (=> b!55333 m!87159))

(declare-fun m!87161 () Bool)

(assert (=> b!55333 m!87161))

(declare-fun m!87163 () Bool)

(assert (=> b!55333 m!87163))

(declare-fun m!87165 () Bool)

(assert (=> b!55333 m!87165))

(declare-fun m!87167 () Bool)

(assert (=> b!55333 m!87167))

(declare-fun m!87169 () Bool)

(assert (=> b!55333 m!87169))

(declare-fun m!87171 () Bool)

(assert (=> b!55330 m!87171))

(assert (=> b!55330 m!87171))

(declare-fun m!87173 () Bool)

(assert (=> b!55330 m!87173))

(declare-fun m!87175 () Bool)

(assert (=> b!55330 m!87175))

(assert (=> b!55330 m!87175))

(declare-fun m!87177 () Bool)

(assert (=> b!55330 m!87177))

(declare-fun m!87179 () Bool)

(assert (=> start!11160 m!87179))

(declare-fun m!87181 () Bool)

(assert (=> start!11160 m!87181))

(push 1)

