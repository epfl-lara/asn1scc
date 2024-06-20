; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5166 () Bool)

(assert start!5166)

(declare-fun b!20817 () Bool)

(declare-fun e!14158 () Bool)

(declare-fun e!14155 () Bool)

(assert (=> b!20817 (= e!14158 (not e!14155))))

(declare-fun res!18073 () Bool)

(assert (=> b!20817 (=> res!18073 e!14155)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!20817 (= res!18073 (bvsge i!635 to!314))))

(declare-datatypes ((array!1501 0))(
  ( (array!1502 (arr!1085 (Array (_ BitVec 32) (_ BitVec 8))) (size!641 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1116 0))(
  ( (BitStream!1117 (buf!950 array!1501) (currentByte!2239 (_ BitVec 32)) (currentBit!2234 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1116)

(declare-fun isPrefixOf!0 (BitStream!1116 BitStream!1116) Bool)

(assert (=> b!20817 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1835 0))(
  ( (Unit!1836) )
))
(declare-fun lt!29524 () Unit!1835)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1116) Unit!1835)

(assert (=> b!20817 (= lt!29524 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29528 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20817 (= lt!29528 (bitIndex!0 (size!641 (buf!950 thiss!1379)) (currentByte!2239 thiss!1379) (currentBit!2234 thiss!1379)))))

(declare-fun b!20818 () Bool)

(declare-fun res!18072 () Bool)

(assert (=> b!20818 (=> (not res!18072) (not e!14158))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20818 (= res!18072 (validate_offset_bits!1 ((_ sign_extend 32) (size!641 (buf!950 thiss!1379))) ((_ sign_extend 32) (currentByte!2239 thiss!1379)) ((_ sign_extend 32) (currentBit!2234 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun srcBuffer!2 () array!1501)

(declare-fun b!20819 () Bool)

(declare-datatypes ((tuple2!2472 0))(
  ( (tuple2!2473 (_1!1321 Unit!1835) (_2!1321 BitStream!1116)) )
))
(declare-fun lt!29526 () tuple2!2472)

(declare-datatypes ((tuple2!2474 0))(
  ( (tuple2!2475 (_1!1322 BitStream!1116) (_2!1322 BitStream!1116)) )
))
(declare-fun lt!29529 () tuple2!2474)

(declare-fun e!14156 () Bool)

(declare-datatypes ((List!259 0))(
  ( (Nil!256) (Cons!255 (h!374 Bool) (t!1009 List!259)) )
))
(declare-fun head!96 (List!259) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1116 array!1501 (_ BitVec 64) (_ BitVec 64)) List!259)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1116 BitStream!1116 (_ BitVec 64)) List!259)

(assert (=> b!20819 (= e!14156 (= (head!96 (byteArrayBitContentToList!0 (_2!1321 lt!29526) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!96 (bitStreamReadBitsIntoList!0 (_2!1321 lt!29526) (_1!1322 lt!29529) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20820 () Bool)

(declare-fun e!14160 () Bool)

(assert (=> b!20820 (= e!14160 true)))

(declare-fun lt!29525 () Bool)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1116 array!1501 (_ BitVec 64) (_ BitVec 64)) tuple2!2472)

(assert (=> b!20820 (= lt!29525 (isPrefixOf!0 (_2!1321 lt!29526) (_2!1321 (appendBitsMSBFirstLoop!0 (_2!1321 lt!29526) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))))

(assert (=> b!20820 e!14156))

(declare-fun res!18071 () Bool)

(assert (=> b!20820 (=> (not res!18071) (not e!14156))))

(assert (=> b!20820 (= res!18071 (validate_offset_bits!1 ((_ sign_extend 32) (size!641 (buf!950 (_2!1321 lt!29526)))) ((_ sign_extend 32) (currentByte!2239 thiss!1379)) ((_ sign_extend 32) (currentBit!2234 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29530 () Unit!1835)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1116 array!1501 (_ BitVec 64)) Unit!1835)

(assert (=> b!20820 (= lt!29530 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!950 (_2!1321 lt!29526)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1116 BitStream!1116) tuple2!2474)

(assert (=> b!20820 (= lt!29529 (reader!0 thiss!1379 (_2!1321 lt!29526)))))

(declare-fun b!20822 () Bool)

(declare-fun e!14154 () Bool)

(declare-fun array_inv!611 (array!1501) Bool)

(assert (=> b!20822 (= e!14154 (array_inv!611 (buf!950 thiss!1379)))))

(declare-fun res!18074 () Bool)

(assert (=> start!5166 (=> (not res!18074) (not e!14158))))

(assert (=> start!5166 (= res!18074 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!641 srcBuffer!2))))))))

(assert (=> start!5166 e!14158))

(assert (=> start!5166 true))

(assert (=> start!5166 (array_inv!611 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1116) Bool)

(assert (=> start!5166 (and (inv!12 thiss!1379) e!14154)))

(declare-fun b!20821 () Bool)

(assert (=> b!20821 (= e!14155 e!14160)))

(declare-fun res!18070 () Bool)

(assert (=> b!20821 (=> res!18070 e!14160)))

(assert (=> b!20821 (= res!18070 (not (isPrefixOf!0 thiss!1379 (_2!1321 lt!29526))))))

(assert (=> b!20821 (validate_offset_bits!1 ((_ sign_extend 32) (size!641 (buf!950 (_2!1321 lt!29526)))) ((_ sign_extend 32) (currentByte!2239 (_2!1321 lt!29526))) ((_ sign_extend 32) (currentBit!2234 (_2!1321 lt!29526))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29527 () Unit!1835)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1116 BitStream!1116 (_ BitVec 64) (_ BitVec 64)) Unit!1835)

(assert (=> b!20821 (= lt!29527 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1321 lt!29526) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1116 (_ BitVec 8) (_ BitVec 32)) tuple2!2472)

(assert (=> b!20821 (= lt!29526 (appendBitFromByte!0 thiss!1379 (select (arr!1085 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5166 res!18074) b!20818))

(assert (= (and b!20818 res!18072) b!20817))

(assert (= (and b!20817 (not res!18073)) b!20821))

(assert (= (and b!20821 (not res!18070)) b!20820))

(assert (= (and b!20820 res!18071) b!20819))

(assert (= start!5166 b!20822))

(declare-fun m!28521 () Bool)

(assert (=> b!20820 m!28521))

(declare-fun m!28523 () Bool)

(assert (=> b!20820 m!28523))

(declare-fun m!28525 () Bool)

(assert (=> b!20820 m!28525))

(declare-fun m!28527 () Bool)

(assert (=> b!20820 m!28527))

(declare-fun m!28529 () Bool)

(assert (=> b!20820 m!28529))

(declare-fun m!28531 () Bool)

(assert (=> b!20821 m!28531))

(declare-fun m!28533 () Bool)

(assert (=> b!20821 m!28533))

(declare-fun m!28535 () Bool)

(assert (=> b!20821 m!28535))

(declare-fun m!28537 () Bool)

(assert (=> b!20821 m!28537))

(assert (=> b!20821 m!28535))

(declare-fun m!28539 () Bool)

(assert (=> b!20821 m!28539))

(declare-fun m!28541 () Bool)

(assert (=> b!20818 m!28541))

(declare-fun m!28543 () Bool)

(assert (=> b!20819 m!28543))

(assert (=> b!20819 m!28543))

(declare-fun m!28545 () Bool)

(assert (=> b!20819 m!28545))

(declare-fun m!28547 () Bool)

(assert (=> b!20819 m!28547))

(assert (=> b!20819 m!28547))

(declare-fun m!28549 () Bool)

(assert (=> b!20819 m!28549))

(declare-fun m!28551 () Bool)

(assert (=> start!5166 m!28551))

(declare-fun m!28553 () Bool)

(assert (=> start!5166 m!28553))

(declare-fun m!28555 () Bool)

(assert (=> b!20822 m!28555))

(declare-fun m!28557 () Bool)

(assert (=> b!20817 m!28557))

(declare-fun m!28559 () Bool)

(assert (=> b!20817 m!28559))

(declare-fun m!28561 () Bool)

(assert (=> b!20817 m!28561))

(check-sat (not b!20822) (not b!20820) (not b!20818) (not b!20821) (not b!20817) (not start!5166) (not b!20819))
