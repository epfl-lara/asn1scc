; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5140 () Bool)

(assert start!5140)

(declare-fun b!20574 () Bool)

(declare-fun e!13874 () Bool)

(declare-fun e!13876 () Bool)

(assert (=> b!20574 (= e!13874 (not e!13876))))

(declare-fun res!17867 () Bool)

(assert (=> b!20574 (=> res!17867 e!13876)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!20574 (= res!17867 (bvsge i!635 to!314))))

(declare-datatypes ((array!1475 0))(
  ( (array!1476 (arr!1072 (Array (_ BitVec 32) (_ BitVec 8))) (size!628 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1090 0))(
  ( (BitStream!1091 (buf!937 array!1475) (currentByte!2226 (_ BitVec 32)) (currentBit!2221 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1090)

(declare-fun isPrefixOf!0 (BitStream!1090 BitStream!1090) Bool)

(assert (=> b!20574 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1809 0))(
  ( (Unit!1810) )
))
(declare-fun lt!29278 () Unit!1809)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1090) Unit!1809)

(assert (=> b!20574 (= lt!29278 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29281 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20574 (= lt!29281 (bitIndex!0 (size!628 (buf!937 thiss!1379)) (currentByte!2226 thiss!1379) (currentBit!2221 thiss!1379)))))

(declare-fun b!20575 () Bool)

(declare-fun e!13873 () Bool)

(assert (=> b!20575 (= e!13876 e!13873)))

(declare-fun res!17869 () Bool)

(assert (=> b!20575 (=> res!17869 e!13873)))

(declare-datatypes ((tuple2!2420 0))(
  ( (tuple2!2421 (_1!1295 Unit!1809) (_2!1295 BitStream!1090)) )
))
(declare-fun lt!29279 () tuple2!2420)

(assert (=> b!20575 (= res!17869 (not (isPrefixOf!0 thiss!1379 (_2!1295 lt!29279))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20575 (validate_offset_bits!1 ((_ sign_extend 32) (size!628 (buf!937 (_2!1295 lt!29279)))) ((_ sign_extend 32) (currentByte!2226 (_2!1295 lt!29279))) ((_ sign_extend 32) (currentBit!2221 (_2!1295 lt!29279))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29276 () Unit!1809)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1090 BitStream!1090 (_ BitVec 64) (_ BitVec 64)) Unit!1809)

(assert (=> b!20575 (= lt!29276 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1295 lt!29279) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1475)

(declare-fun appendBitFromByte!0 (BitStream!1090 (_ BitVec 8) (_ BitVec 32)) tuple2!2420)

(assert (=> b!20575 (= lt!29279 (appendBitFromByte!0 thiss!1379 (select (arr!1072 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun e!13872 () Bool)

(declare-fun b!20576 () Bool)

(declare-datatypes ((tuple2!2422 0))(
  ( (tuple2!2423 (_1!1296 BitStream!1090) (_2!1296 BitStream!1090)) )
))
(declare-fun lt!29280 () tuple2!2422)

(declare-datatypes ((List!246 0))(
  ( (Nil!243) (Cons!242 (h!361 Bool) (t!996 List!246)) )
))
(declare-fun head!83 (List!246) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1090 array!1475 (_ BitVec 64) (_ BitVec 64)) List!246)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1090 BitStream!1090 (_ BitVec 64)) List!246)

(assert (=> b!20576 (= e!13872 (= (head!83 (byteArrayBitContentToList!0 (_2!1295 lt!29279) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!83 (bitStreamReadBitsIntoList!0 (_2!1295 lt!29279) (_1!1296 lt!29280) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!17870 () Bool)

(assert (=> start!5140 (=> (not res!17870) (not e!13874))))

(assert (=> start!5140 (= res!17870 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!628 srcBuffer!2))))))))

(assert (=> start!5140 e!13874))

(assert (=> start!5140 true))

(declare-fun array_inv!598 (array!1475) Bool)

(assert (=> start!5140 (array_inv!598 srcBuffer!2)))

(declare-fun e!13877 () Bool)

(declare-fun inv!12 (BitStream!1090) Bool)

(assert (=> start!5140 (and (inv!12 thiss!1379) e!13877)))

(declare-fun b!20577 () Bool)

(declare-fun res!17868 () Bool)

(assert (=> b!20577 (=> (not res!17868) (not e!13874))))

(assert (=> b!20577 (= res!17868 (validate_offset_bits!1 ((_ sign_extend 32) (size!628 (buf!937 thiss!1379))) ((_ sign_extend 32) (currentByte!2226 thiss!1379)) ((_ sign_extend 32) (currentBit!2221 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20578 () Bool)

(assert (=> b!20578 (= e!13877 (array_inv!598 (buf!937 thiss!1379)))))

(declare-fun b!20579 () Bool)

(assert (=> b!20579 (= e!13873 true)))

(assert (=> b!20579 e!13872))

(declare-fun res!17866 () Bool)

(assert (=> b!20579 (=> (not res!17866) (not e!13872))))

(assert (=> b!20579 (= res!17866 (validate_offset_bits!1 ((_ sign_extend 32) (size!628 (buf!937 (_2!1295 lt!29279)))) ((_ sign_extend 32) (currentByte!2226 thiss!1379)) ((_ sign_extend 32) (currentBit!2221 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29277 () Unit!1809)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1090 array!1475 (_ BitVec 64)) Unit!1809)

(assert (=> b!20579 (= lt!29277 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!937 (_2!1295 lt!29279)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1090 BitStream!1090) tuple2!2422)

(assert (=> b!20579 (= lt!29280 (reader!0 thiss!1379 (_2!1295 lt!29279)))))

(assert (= (and start!5140 res!17870) b!20577))

(assert (= (and b!20577 res!17868) b!20574))

(assert (= (and b!20574 (not res!17867)) b!20575))

(assert (= (and b!20575 (not res!17869)) b!20579))

(assert (= (and b!20579 res!17866) b!20576))

(assert (= start!5140 b!20578))

(declare-fun m!28005 () Bool)

(assert (=> b!20576 m!28005))

(assert (=> b!20576 m!28005))

(declare-fun m!28007 () Bool)

(assert (=> b!20576 m!28007))

(declare-fun m!28009 () Bool)

(assert (=> b!20576 m!28009))

(assert (=> b!20576 m!28009))

(declare-fun m!28011 () Bool)

(assert (=> b!20576 m!28011))

(declare-fun m!28013 () Bool)

(assert (=> b!20575 m!28013))

(declare-fun m!28015 () Bool)

(assert (=> b!20575 m!28015))

(declare-fun m!28017 () Bool)

(assert (=> b!20575 m!28017))

(declare-fun m!28019 () Bool)

(assert (=> b!20575 m!28019))

(assert (=> b!20575 m!28015))

(declare-fun m!28021 () Bool)

(assert (=> b!20575 m!28021))

(declare-fun m!28023 () Bool)

(assert (=> b!20579 m!28023))

(declare-fun m!28025 () Bool)

(assert (=> b!20579 m!28025))

(declare-fun m!28027 () Bool)

(assert (=> b!20579 m!28027))

(declare-fun m!28029 () Bool)

(assert (=> b!20574 m!28029))

(declare-fun m!28031 () Bool)

(assert (=> b!20574 m!28031))

(declare-fun m!28033 () Bool)

(assert (=> b!20574 m!28033))

(declare-fun m!28035 () Bool)

(assert (=> start!5140 m!28035))

(declare-fun m!28037 () Bool)

(assert (=> start!5140 m!28037))

(declare-fun m!28039 () Bool)

(assert (=> b!20578 m!28039))

(declare-fun m!28041 () Bool)

(assert (=> b!20577 m!28041))

(push 1)

(assert (not start!5140))

(assert (not b!20577))

(assert (not b!20579))

(assert (not b!20576))

(assert (not b!20574))

(assert (not b!20578))

(assert (not b!20575))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

