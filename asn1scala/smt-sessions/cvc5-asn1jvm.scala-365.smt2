; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8470 () Bool)

(assert start!8470)

(declare-fun b!42272 () Bool)

(declare-fun e!28162 () Bool)

(assert (=> b!42272 (= e!28162 true)))

(declare-datatypes ((array!2159 0))(
  ( (array!2160 (arr!1475 (Array (_ BitVec 32) (_ BitVec 8))) (size!976 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1696 0))(
  ( (BitStream!1697 (buf!1307 array!2159) (currentByte!2765 (_ BitVec 32)) (currentBit!2760 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1696)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!4126 0))(
  ( (tuple2!4127 (_1!2156 BitStream!1696) (_2!2156 BitStream!1696)) )
))
(declare-fun lt!63622 () tuple2!4126)

(declare-datatypes ((List!495 0))(
  ( (Nil!492) (Cons!491 (h!610 Bool) (t!1245 List!495)) )
))
(declare-fun lt!63621 () List!495)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1696 BitStream!1696 (_ BitVec 64)) List!495)

(assert (=> b!42272 (= lt!63621 (bitStreamReadBitsIntoList!0 thiss!1379 (_1!2156 lt!63622) (bvsub to!314 i!635)))))

(declare-datatypes ((Unit!3006 0))(
  ( (Unit!3007) )
))
(declare-fun lt!63623 () Unit!3006)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1696 array!2159 (_ BitVec 64)) Unit!3006)

(assert (=> b!42272 (= lt!63623 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1307 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!2159)

(declare-datatypes ((tuple2!4128 0))(
  ( (tuple2!4129 (_1!2157 array!2159) (_2!2157 BitStream!1696)) )
))
(declare-fun lt!63625 () tuple2!4128)

(declare-fun checkByteArrayBitContent!0 (BitStream!1696 array!2159 array!2159 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42272 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2157 lt!63625) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun res!35954 () Bool)

(declare-fun e!28160 () Bool)

(assert (=> start!8470 (=> (not res!35954) (not e!28160))))

(assert (=> start!8470 (= res!35954 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!976 srcBuffer!2))))))))

(assert (=> start!8470 e!28160))

(assert (=> start!8470 true))

(declare-fun array_inv!901 (array!2159) Bool)

(assert (=> start!8470 (array_inv!901 srcBuffer!2)))

(declare-fun e!28161 () Bool)

(declare-fun inv!12 (BitStream!1696) Bool)

(assert (=> start!8470 (and (inv!12 thiss!1379) e!28161)))

(declare-fun b!42273 () Bool)

(declare-fun res!35957 () Bool)

(assert (=> b!42273 (=> (not res!35957) (not e!28160))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42273 (= res!35957 (validate_offset_bits!1 ((_ sign_extend 32) (size!976 (buf!1307 thiss!1379))) ((_ sign_extend 32) (currentByte!2765 thiss!1379)) ((_ sign_extend 32) (currentBit!2760 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!42274 () Bool)

(declare-fun e!28164 () Bool)

(assert (=> b!42274 (= e!28160 (not e!28164))))

(declare-fun res!35958 () Bool)

(assert (=> b!42274 (=> res!35958 e!28164)))

(declare-fun lt!63620 () (_ BitVec 64))

(assert (=> b!42274 (= res!35958 (or (bvslt i!635 to!314) (not (= lt!63620 (bvsub (bvadd lt!63620 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1696 BitStream!1696) Bool)

(assert (=> b!42274 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!63624 () Unit!3006)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1696) Unit!3006)

(assert (=> b!42274 (= lt!63624 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42274 (= lt!63620 (bitIndex!0 (size!976 (buf!1307 thiss!1379)) (currentByte!2765 thiss!1379) (currentBit!2760 thiss!1379)))))

(declare-fun b!42275 () Bool)

(assert (=> b!42275 (= e!28164 e!28162)))

(declare-fun res!35956 () Bool)

(assert (=> b!42275 (=> res!35956 e!28162)))

(assert (=> b!42275 (= res!35956 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1696 (_ BitVec 64)) tuple2!4128)

(assert (=> b!42275 (= lt!63625 (readBits!0 (_1!2156 lt!63622) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!1696 BitStream!1696) tuple2!4126)

(assert (=> b!42275 (= lt!63622 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!42276 () Bool)

(declare-fun res!35955 () Bool)

(assert (=> b!42276 (=> res!35955 e!28164)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!42276 (= res!35955 (not (invariant!0 (currentBit!2760 thiss!1379) (currentByte!2765 thiss!1379) (size!976 (buf!1307 thiss!1379)))))))

(declare-fun b!42277 () Bool)

(assert (=> b!42277 (= e!28161 (array_inv!901 (buf!1307 thiss!1379)))))

(assert (= (and start!8470 res!35954) b!42273))

(assert (= (and b!42273 res!35957) b!42274))

(assert (= (and b!42274 (not res!35958)) b!42276))

(assert (= (and b!42276 (not res!35955)) b!42275))

(assert (= (and b!42275 (not res!35956)) b!42272))

(assert (= start!8470 b!42277))

(declare-fun m!64141 () Bool)

(assert (=> b!42276 m!64141))

(declare-fun m!64143 () Bool)

(assert (=> b!42273 m!64143))

(declare-fun m!64145 () Bool)

(assert (=> b!42272 m!64145))

(declare-fun m!64147 () Bool)

(assert (=> b!42272 m!64147))

(declare-fun m!64149 () Bool)

(assert (=> b!42272 m!64149))

(declare-fun m!64151 () Bool)

(assert (=> start!8470 m!64151))

(declare-fun m!64153 () Bool)

(assert (=> start!8470 m!64153))

(declare-fun m!64155 () Bool)

(assert (=> b!42274 m!64155))

(declare-fun m!64157 () Bool)

(assert (=> b!42274 m!64157))

(declare-fun m!64159 () Bool)

(assert (=> b!42274 m!64159))

(declare-fun m!64161 () Bool)

(assert (=> b!42275 m!64161))

(declare-fun m!64163 () Bool)

(assert (=> b!42275 m!64163))

(declare-fun m!64165 () Bool)

(assert (=> b!42277 m!64165))

(push 1)

(assert (not b!42277))

(assert (not b!42275))

(assert (not b!42274))

(assert (not b!42276))

(assert (not b!42273))

(assert (not b!42272))

(assert (not start!8470))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

