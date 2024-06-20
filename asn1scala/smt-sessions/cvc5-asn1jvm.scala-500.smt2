; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14760 () Bool)

(assert start!14760)

(declare-fun b!76060 () Bool)

(declare-fun res!62893 () Bool)

(declare-fun e!49841 () Bool)

(assert (=> b!76060 (=> res!62893 e!49841)))

(declare-datatypes ((array!3127 0))(
  ( (array!3128 (arr!2055 (Array (_ BitVec 32) (_ BitVec 8))) (size!1457 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!2488 0))(
  ( (BitStream!2489 (buf!1838 array!3127) (currentByte!3629 (_ BitVec 32)) (currentBit!3624 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2488)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!76060 (= res!62893 (not (invariant!0 (currentBit!3624 thiss!1379) (currentByte!3629 thiss!1379) (size!1457 (buf!1838 thiss!1379)))))))

(declare-fun b!76061 () Bool)

(declare-fun e!49842 () Bool)

(assert (=> b!76061 (= e!49841 e!49842)))

(declare-fun res!62890 () Bool)

(assert (=> b!76061 (=> res!62890 e!49842)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!76061 (= res!62890 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6586 0))(
  ( (tuple2!6587 (_1!3424 array!3127) (_2!3424 BitStream!2488)) )
))
(declare-fun lt!122084 () tuple2!6586)

(declare-fun readBits!0 (BitStream!2488 (_ BitVec 64)) tuple2!6586)

(declare-datatypes ((tuple2!6588 0))(
  ( (tuple2!6589 (_1!3425 BitStream!2488) (_2!3425 BitStream!2488)) )
))
(declare-fun reader!0 (BitStream!2488 BitStream!2488) tuple2!6588)

(assert (=> b!76061 (= lt!122084 (readBits!0 (_1!3425 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!76062 () Bool)

(declare-fun e!49840 () Bool)

(assert (=> b!76062 (= e!49840 (not e!49841))))

(declare-fun res!62892 () Bool)

(assert (=> b!76062 (=> res!62892 e!49841)))

(declare-fun lt!122083 () (_ BitVec 64))

(assert (=> b!76062 (= res!62892 (or (bvslt i!635 to!314) (not (= lt!122083 (bvsub (bvadd lt!122083 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!2488 BitStream!2488) Bool)

(assert (=> b!76062 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!5014 0))(
  ( (Unit!5015) )
))
(declare-fun lt!122085 () Unit!5014)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2488) Unit!5014)

(assert (=> b!76062 (= lt!122085 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!76062 (= lt!122083 (bitIndex!0 (size!1457 (buf!1838 thiss!1379)) (currentByte!3629 thiss!1379) (currentBit!3624 thiss!1379)))))

(declare-fun b!76063 () Bool)

(declare-fun e!49838 () Bool)

(declare-fun array_inv!1303 (array!3127) Bool)

(assert (=> b!76063 (= e!49838 (array_inv!1303 (buf!1838 thiss!1379)))))

(declare-fun b!76064 () Bool)

(declare-fun res!62889 () Bool)

(assert (=> b!76064 (=> (not res!62889) (not e!49840))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76064 (= res!62889 (validate_offset_bits!1 ((_ sign_extend 32) (size!1457 (buf!1838 thiss!1379))) ((_ sign_extend 32) (currentByte!3629 thiss!1379)) ((_ sign_extend 32) (currentBit!3624 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!62891 () Bool)

(assert (=> start!14760 (=> (not res!62891) (not e!49840))))

(declare-fun srcBuffer!2 () array!3127)

(assert (=> start!14760 (= res!62891 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1457 srcBuffer!2))))))))

(assert (=> start!14760 e!49840))

(assert (=> start!14760 true))

(assert (=> start!14760 (array_inv!1303 srcBuffer!2)))

(declare-fun inv!12 (BitStream!2488) Bool)

(assert (=> start!14760 (and (inv!12 thiss!1379) e!49838)))

(declare-fun b!76065 () Bool)

(assert (=> b!76065 (= e!49842 true)))

(declare-fun checkByteArrayBitContent!0 (BitStream!2488 array!3127 array!3127 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!76065 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!3424 lt!122084) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(assert (= (and start!14760 res!62891) b!76064))

(assert (= (and b!76064 res!62889) b!76062))

(assert (= (and b!76062 (not res!62892)) b!76060))

(assert (= (and b!76060 (not res!62893)) b!76061))

(assert (= (and b!76061 (not res!62890)) b!76065))

(assert (= start!14760 b!76063))

(declare-fun m!121235 () Bool)

(assert (=> b!76065 m!121235))

(declare-fun m!121237 () Bool)

(assert (=> start!14760 m!121237))

(declare-fun m!121239 () Bool)

(assert (=> start!14760 m!121239))

(declare-fun m!121241 () Bool)

(assert (=> b!76064 m!121241))

(declare-fun m!121243 () Bool)

(assert (=> b!76060 m!121243))

(declare-fun m!121245 () Bool)

(assert (=> b!76062 m!121245))

(declare-fun m!121247 () Bool)

(assert (=> b!76062 m!121247))

(declare-fun m!121249 () Bool)

(assert (=> b!76062 m!121249))

(declare-fun m!121251 () Bool)

(assert (=> b!76061 m!121251))

(declare-fun m!121253 () Bool)

(assert (=> b!76061 m!121253))

(declare-fun m!121255 () Bool)

(assert (=> b!76063 m!121255))

(push 1)

(assert (not start!14760))

(assert (not b!76060))

(assert (not b!76061))

(assert (not b!76063))

(assert (not b!76064))

(assert (not b!76065))

(assert (not b!76062))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

