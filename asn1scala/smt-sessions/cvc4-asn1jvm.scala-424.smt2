; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!11164 () Bool)

(assert start!11164)

(declare-fun b!55379 () Bool)

(declare-fun e!36911 () Bool)

(declare-datatypes ((array!2579 0))(
  ( (array!2580 (arr!1720 (Array (_ BitVec 32) (_ BitVec 8))) (size!1174 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2036 0))(
  ( (BitStream!2037 (buf!1537 array!2579) (currentByte!3119 (_ BitVec 32)) (currentBit!3114 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2036)

(declare-datatypes ((Unit!3827 0))(
  ( (Unit!3828) )
))
(declare-datatypes ((tuple2!5050 0))(
  ( (tuple2!5051 (_1!2636 Unit!3827) (_2!2636 BitStream!2036)) )
))
(declare-fun lt!86450 () tuple2!5050)

(assert (=> b!55379 (= e!36911 (or (not (= (size!1174 (buf!1537 thiss!1379)) (size!1174 (buf!1537 (_2!2636 lt!86450))))) (= (size!1174 (buf!1537 (_2!2636 lt!86450))) (size!1174 (buf!1537 thiss!1379)))))))

(declare-fun b!55380 () Bool)

(declare-fun e!36909 () Bool)

(declare-fun array_inv!1077 (array!2579) Bool)

(assert (=> b!55380 (= e!36909 (array_inv!1077 (buf!1537 thiss!1379)))))

(declare-fun b!55381 () Bool)

(declare-fun e!36907 () Bool)

(assert (=> b!55381 (= e!36907 e!36911)))

(declare-fun res!46133 () Bool)

(assert (=> b!55381 (=> res!46133 e!36911)))

(declare-fun lt!86446 () tuple2!5050)

(declare-fun isPrefixOf!0 (BitStream!2036 BitStream!2036) Bool)

(assert (=> b!55381 (= res!46133 (not (isPrefixOf!0 (_2!2636 lt!86446) (_2!2636 lt!86450))))))

(assert (=> b!55381 (isPrefixOf!0 thiss!1379 (_2!2636 lt!86450))))

(declare-fun lt!86445 () Unit!3827)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!2036 BitStream!2036 BitStream!2036) Unit!3827)

(assert (=> b!55381 (= lt!86445 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!2636 lt!86446) (_2!2636 lt!86450)))))

(declare-fun srcBuffer!2 () array!2579)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!2036 array!2579 (_ BitVec 64) (_ BitVec 64)) tuple2!5050)

(assert (=> b!55381 (= lt!86450 (appendBitsMSBFirstLoop!0 (_2!2636 lt!86446) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!36904 () Bool)

(assert (=> b!55381 e!36904))

(declare-fun res!46130 () Bool)

(assert (=> b!55381 (=> (not res!46130) (not e!36904))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!55381 (= res!46130 (validate_offset_bits!1 ((_ sign_extend 32) (size!1174 (buf!1537 (_2!2636 lt!86446)))) ((_ sign_extend 32) (currentByte!3119 thiss!1379)) ((_ sign_extend 32) (currentBit!3114 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!86452 () Unit!3827)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!2036 array!2579 (_ BitVec 64)) Unit!3827)

(assert (=> b!55381 (= lt!86452 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1537 (_2!2636 lt!86446)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!5052 0))(
  ( (tuple2!5053 (_1!2637 BitStream!2036) (_2!2637 BitStream!2036)) )
))
(declare-fun lt!86451 () tuple2!5052)

(declare-fun reader!0 (BitStream!2036 BitStream!2036) tuple2!5052)

(assert (=> b!55381 (= lt!86451 (reader!0 thiss!1379 (_2!2636 lt!86446)))))

(declare-fun b!55382 () Bool)

(declare-fun res!46132 () Bool)

(assert (=> b!55382 (=> res!46132 e!36911)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!55382 (= res!46132 (not (invariant!0 (currentBit!3114 (_2!2636 lt!86450)) (currentByte!3119 (_2!2636 lt!86450)) (size!1174 (buf!1537 (_2!2636 lt!86450))))))))

(declare-fun b!55383 () Bool)

(declare-datatypes ((List!593 0))(
  ( (Nil!590) (Cons!589 (h!708 Bool) (t!1343 List!593)) )
))
(declare-fun head!412 (List!593) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!2036 array!2579 (_ BitVec 64) (_ BitVec 64)) List!593)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!2036 BitStream!2036 (_ BitVec 64)) List!593)

(assert (=> b!55383 (= e!36904 (= (head!412 (byteArrayBitContentToList!0 (_2!2636 lt!86446) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!412 (bitStreamReadBitsIntoList!0 (_2!2636 lt!86446) (_1!2637 lt!86451) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!55384 () Bool)

(declare-fun res!46131 () Bool)

(assert (=> b!55384 (=> res!46131 e!36911)))

(declare-fun lt!86449 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!55384 (= res!46131 (not (= (bitIndex!0 (size!1174 (buf!1537 (_2!2636 lt!86450))) (currentByte!3119 (_2!2636 lt!86450)) (currentBit!3114 (_2!2636 lt!86450))) (bvsub (bvadd lt!86449 to!314) i!635))))))

(declare-fun b!55385 () Bool)

(declare-fun e!36908 () Bool)

(assert (=> b!55385 (= e!36908 e!36907)))

(declare-fun res!46128 () Bool)

(assert (=> b!55385 (=> res!46128 e!36907)))

(assert (=> b!55385 (= res!46128 (not (isPrefixOf!0 thiss!1379 (_2!2636 lt!86446))))))

(assert (=> b!55385 (validate_offset_bits!1 ((_ sign_extend 32) (size!1174 (buf!1537 (_2!2636 lt!86446)))) ((_ sign_extend 32) (currentByte!3119 (_2!2636 lt!86446))) ((_ sign_extend 32) (currentBit!3114 (_2!2636 lt!86446))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!86447 () Unit!3827)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!2036 BitStream!2036 (_ BitVec 64) (_ BitVec 64)) Unit!3827)

(assert (=> b!55385 (= lt!86447 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2636 lt!86446) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!2036 (_ BitVec 8) (_ BitVec 32)) tuple2!5050)

(assert (=> b!55385 (= lt!86446 (appendBitFromByte!0 thiss!1379 (select (arr!1720 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!46129 () Bool)

(declare-fun e!36910 () Bool)

(assert (=> start!11164 (=> (not res!46129) (not e!36910))))

(assert (=> start!11164 (= res!46129 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1174 srcBuffer!2))))))))

(assert (=> start!11164 e!36910))

(assert (=> start!11164 true))

(assert (=> start!11164 (array_inv!1077 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2036) Bool)

(assert (=> start!11164 (and (inv!12 thiss!1379) e!36909)))

(declare-fun b!55386 () Bool)

(declare-fun res!46134 () Bool)

(assert (=> b!55386 (=> (not res!46134) (not e!36910))))

(assert (=> b!55386 (= res!46134 (validate_offset_bits!1 ((_ sign_extend 32) (size!1174 (buf!1537 thiss!1379))) ((_ sign_extend 32) (currentByte!3119 thiss!1379)) ((_ sign_extend 32) (currentBit!3114 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!55387 () Bool)

(assert (=> b!55387 (= e!36910 (not e!36908))))

(declare-fun res!46127 () Bool)

(assert (=> b!55387 (=> res!46127 e!36908)))

(assert (=> b!55387 (= res!46127 (bvsge i!635 to!314))))

(assert (=> b!55387 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!86448 () Unit!3827)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2036) Unit!3827)

(assert (=> b!55387 (= lt!86448 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!55387 (= lt!86449 (bitIndex!0 (size!1174 (buf!1537 thiss!1379)) (currentByte!3119 thiss!1379) (currentBit!3114 thiss!1379)))))

(assert (= (and start!11164 res!46129) b!55386))

(assert (= (and b!55386 res!46134) b!55387))

(assert (= (and b!55387 (not res!46127)) b!55385))

(assert (= (and b!55385 (not res!46128)) b!55381))

(assert (= (and b!55381 res!46130) b!55383))

(assert (= (and b!55381 (not res!46133)) b!55384))

(assert (= (and b!55384 (not res!46131)) b!55382))

(assert (= (and b!55382 (not res!46132)) b!55379))

(assert (= start!11164 b!55380))

(declare-fun m!87233 () Bool)

(assert (=> b!55382 m!87233))

(declare-fun m!87235 () Bool)

(assert (=> b!55385 m!87235))

(declare-fun m!87237 () Bool)

(assert (=> b!55385 m!87237))

(declare-fun m!87239 () Bool)

(assert (=> b!55385 m!87239))

(assert (=> b!55385 m!87237))

(declare-fun m!87241 () Bool)

(assert (=> b!55385 m!87241))

(declare-fun m!87243 () Bool)

(assert (=> b!55385 m!87243))

(declare-fun m!87245 () Bool)

(assert (=> b!55383 m!87245))

(assert (=> b!55383 m!87245))

(declare-fun m!87247 () Bool)

(assert (=> b!55383 m!87247))

(declare-fun m!87249 () Bool)

(assert (=> b!55383 m!87249))

(assert (=> b!55383 m!87249))

(declare-fun m!87251 () Bool)

(assert (=> b!55383 m!87251))

(declare-fun m!87253 () Bool)

(assert (=> b!55387 m!87253))

(declare-fun m!87255 () Bool)

(assert (=> b!55387 m!87255))

(declare-fun m!87257 () Bool)

(assert (=> b!55387 m!87257))

(declare-fun m!87259 () Bool)

(assert (=> b!55381 m!87259))

(declare-fun m!87261 () Bool)

(assert (=> b!55381 m!87261))

(declare-fun m!87263 () Bool)

(assert (=> b!55381 m!87263))

(declare-fun m!87265 () Bool)

(assert (=> b!55381 m!87265))

(declare-fun m!87267 () Bool)

(assert (=> b!55381 m!87267))

(declare-fun m!87269 () Bool)

(assert (=> b!55381 m!87269))

(declare-fun m!87271 () Bool)

(assert (=> b!55381 m!87271))

(declare-fun m!87273 () Bool)

(assert (=> start!11164 m!87273))

(declare-fun m!87275 () Bool)

(assert (=> start!11164 m!87275))

(declare-fun m!87277 () Bool)

(assert (=> b!55386 m!87277))

(declare-fun m!87279 () Bool)

(assert (=> b!55384 m!87279))

(declare-fun m!87281 () Bool)

(assert (=> b!55380 m!87281))

(push 1)

(assert (not b!55385))

(assert (not b!55381))

(assert (not b!55380))

(assert (not b!55387))

(assert (not b!55384))

(assert (not b!55382))

(assert (not b!55383))

(assert (not start!11164))

(assert (not b!55386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

