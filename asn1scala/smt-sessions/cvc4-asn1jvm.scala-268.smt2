; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5168 () Bool)

(assert start!5168)

(declare-datatypes ((array!1503 0))(
  ( (array!1504 (arr!1086 (Array (_ BitVec 32) (_ BitVec 8))) (size!642 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1503)

(declare-fun b!20835 () Bool)

(declare-datatypes ((BitStream!1118 0))(
  ( (BitStream!1119 (buf!951 array!1503) (currentByte!2240 (_ BitVec 32)) (currentBit!2235 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2476 0))(
  ( (tuple2!2477 (_1!1323 BitStream!1118) (_2!1323 BitStream!1118)) )
))
(declare-fun lt!29547 () tuple2!2476)

(declare-datatypes ((Unit!1837 0))(
  ( (Unit!1838) )
))
(declare-datatypes ((tuple2!2478 0))(
  ( (tuple2!2479 (_1!1324 Unit!1837) (_2!1324 BitStream!1118)) )
))
(declare-fun lt!29546 () tuple2!2478)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun e!14175 () Bool)

(declare-datatypes ((List!260 0))(
  ( (Nil!257) (Cons!256 (h!375 Bool) (t!1010 List!260)) )
))
(declare-fun head!97 (List!260) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1118 array!1503 (_ BitVec 64) (_ BitVec 64)) List!260)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1118 BitStream!1118 (_ BitVec 64)) List!260)

(assert (=> b!20835 (= e!14175 (= (head!97 (byteArrayBitContentToList!0 (_2!1324 lt!29546) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!97 (bitStreamReadBitsIntoList!0 (_2!1324 lt!29546) (_1!1323 lt!29547) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20836 () Bool)

(declare-fun res!18089 () Bool)

(declare-fun e!14176 () Bool)

(assert (=> b!20836 (=> (not res!18089) (not e!14176))))

(declare-fun thiss!1379 () BitStream!1118)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20836 (= res!18089 (validate_offset_bits!1 ((_ sign_extend 32) (size!642 (buf!951 thiss!1379))) ((_ sign_extend 32) (currentByte!2240 thiss!1379)) ((_ sign_extend 32) (currentBit!2235 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20837 () Bool)

(declare-fun e!14181 () Bool)

(assert (=> b!20837 (= e!14181 true)))

(declare-fun lt!29545 () Bool)

(declare-fun isPrefixOf!0 (BitStream!1118 BitStream!1118) Bool)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1118 array!1503 (_ BitVec 64) (_ BitVec 64)) tuple2!2478)

(assert (=> b!20837 (= lt!29545 (isPrefixOf!0 (_2!1324 lt!29546) (_2!1324 (appendBitsMSBFirstLoop!0 (_2!1324 lt!29546) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))))

(assert (=> b!20837 e!14175))

(declare-fun res!18087 () Bool)

(assert (=> b!20837 (=> (not res!18087) (not e!14175))))

(assert (=> b!20837 (= res!18087 (validate_offset_bits!1 ((_ sign_extend 32) (size!642 (buf!951 (_2!1324 lt!29546)))) ((_ sign_extend 32) (currentByte!2240 thiss!1379)) ((_ sign_extend 32) (currentBit!2235 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29549 () Unit!1837)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1118 array!1503 (_ BitVec 64)) Unit!1837)

(assert (=> b!20837 (= lt!29549 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!951 (_2!1324 lt!29546)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1118 BitStream!1118) tuple2!2476)

(assert (=> b!20837 (= lt!29547 (reader!0 thiss!1379 (_2!1324 lt!29546)))))

(declare-fun b!20838 () Bool)

(declare-fun e!14179 () Bool)

(assert (=> b!20838 (= e!14176 (not e!14179))))

(declare-fun res!18086 () Bool)

(assert (=> b!20838 (=> res!18086 e!14179)))

(assert (=> b!20838 (= res!18086 (bvsge i!635 to!314))))

(assert (=> b!20838 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29550 () Unit!1837)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1118) Unit!1837)

(assert (=> b!20838 (= lt!29550 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29548 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20838 (= lt!29548 (bitIndex!0 (size!642 (buf!951 thiss!1379)) (currentByte!2240 thiss!1379) (currentBit!2235 thiss!1379)))))

(declare-fun res!18085 () Bool)

(assert (=> start!5168 (=> (not res!18085) (not e!14176))))

(assert (=> start!5168 (= res!18085 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!642 srcBuffer!2))))))))

(assert (=> start!5168 e!14176))

(assert (=> start!5168 true))

(declare-fun array_inv!612 (array!1503) Bool)

(assert (=> start!5168 (array_inv!612 srcBuffer!2)))

(declare-fun e!14178 () Bool)

(declare-fun inv!12 (BitStream!1118) Bool)

(assert (=> start!5168 (and (inv!12 thiss!1379) e!14178)))

(declare-fun b!20839 () Bool)

(assert (=> b!20839 (= e!14178 (array_inv!612 (buf!951 thiss!1379)))))

(declare-fun b!20840 () Bool)

(assert (=> b!20840 (= e!14179 e!14181)))

(declare-fun res!18088 () Bool)

(assert (=> b!20840 (=> res!18088 e!14181)))

(assert (=> b!20840 (= res!18088 (not (isPrefixOf!0 thiss!1379 (_2!1324 lt!29546))))))

(assert (=> b!20840 (validate_offset_bits!1 ((_ sign_extend 32) (size!642 (buf!951 (_2!1324 lt!29546)))) ((_ sign_extend 32) (currentByte!2240 (_2!1324 lt!29546))) ((_ sign_extend 32) (currentBit!2235 (_2!1324 lt!29546))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29551 () Unit!1837)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1118 BitStream!1118 (_ BitVec 64) (_ BitVec 64)) Unit!1837)

(assert (=> b!20840 (= lt!29551 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1324 lt!29546) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1118 (_ BitVec 8) (_ BitVec 32)) tuple2!2478)

(assert (=> b!20840 (= lt!29546 (appendBitFromByte!0 thiss!1379 (select (arr!1086 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5168 res!18085) b!20836))

(assert (= (and b!20836 res!18089) b!20838))

(assert (= (and b!20838 (not res!18086)) b!20840))

(assert (= (and b!20840 (not res!18088)) b!20837))

(assert (= (and b!20837 res!18087) b!20835))

(assert (= start!5168 b!20839))

(declare-fun m!28563 () Bool)

(assert (=> b!20837 m!28563))

(declare-fun m!28565 () Bool)

(assert (=> b!20837 m!28565))

(declare-fun m!28567 () Bool)

(assert (=> b!20837 m!28567))

(declare-fun m!28569 () Bool)

(assert (=> b!20837 m!28569))

(declare-fun m!28571 () Bool)

(assert (=> b!20837 m!28571))

(declare-fun m!28573 () Bool)

(assert (=> b!20836 m!28573))

(declare-fun m!28575 () Bool)

(assert (=> b!20838 m!28575))

(declare-fun m!28577 () Bool)

(assert (=> b!20838 m!28577))

(declare-fun m!28579 () Bool)

(assert (=> b!20838 m!28579))

(declare-fun m!28581 () Bool)

(assert (=> start!5168 m!28581))

(declare-fun m!28583 () Bool)

(assert (=> start!5168 m!28583))

(declare-fun m!28585 () Bool)

(assert (=> b!20835 m!28585))

(assert (=> b!20835 m!28585))

(declare-fun m!28587 () Bool)

(assert (=> b!20835 m!28587))

(declare-fun m!28589 () Bool)

(assert (=> b!20835 m!28589))

(assert (=> b!20835 m!28589))

(declare-fun m!28591 () Bool)

(assert (=> b!20835 m!28591))

(declare-fun m!28593 () Bool)

(assert (=> b!20840 m!28593))

(declare-fun m!28595 () Bool)

(assert (=> b!20840 m!28595))

(declare-fun m!28597 () Bool)

(assert (=> b!20840 m!28597))

(declare-fun m!28599 () Bool)

(assert (=> b!20840 m!28599))

(assert (=> b!20840 m!28593))

(declare-fun m!28601 () Bool)

(assert (=> b!20840 m!28601))

(declare-fun m!28603 () Bool)

(assert (=> b!20839 m!28603))

(push 1)

(assert (not b!20840))

(assert (not b!20835))

(assert (not b!20836))

(assert (not b!20839))

(assert (not b!20837))

(assert (not start!5168))

(assert (not b!20838))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

