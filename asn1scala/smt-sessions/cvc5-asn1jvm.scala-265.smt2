; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5146 () Bool)

(assert start!5146)

(declare-fun b!20628 () Bool)

(declare-fun e!13939 () Bool)

(declare-datatypes ((array!1481 0))(
  ( (array!1482 (arr!1075 (Array (_ BitVec 32) (_ BitVec 8))) (size!631 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1096 0))(
  ( (BitStream!1097 (buf!940 array!1481) (currentByte!2229 (_ BitVec 32)) (currentBit!2224 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1096)

(declare-fun array_inv!601 (array!1481) Bool)

(assert (=> b!20628 (= e!13939 (array_inv!601 (buf!940 thiss!1379)))))

(declare-fun srcBuffer!2 () array!1481)

(declare-datatypes ((Unit!1815 0))(
  ( (Unit!1816) )
))
(declare-datatypes ((tuple2!2432 0))(
  ( (tuple2!2433 (_1!1301 Unit!1815) (_2!1301 BitStream!1096)) )
))
(declare-fun lt!29335 () tuple2!2432)

(declare-fun e!13937 () Bool)

(declare-fun b!20629 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((tuple2!2434 0))(
  ( (tuple2!2435 (_1!1302 BitStream!1096) (_2!1302 BitStream!1096)) )
))
(declare-fun lt!29333 () tuple2!2434)

(declare-datatypes ((List!249 0))(
  ( (Nil!246) (Cons!245 (h!364 Bool) (t!999 List!249)) )
))
(declare-fun head!86 (List!249) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1096 array!1481 (_ BitVec 64) (_ BitVec 64)) List!249)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1096 BitStream!1096 (_ BitVec 64)) List!249)

(assert (=> b!20629 (= e!13937 (= (head!86 (byteArrayBitContentToList!0 (_2!1301 lt!29335) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!86 (bitStreamReadBitsIntoList!0 (_2!1301 lt!29335) (_1!1302 lt!29333) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun res!17915 () Bool)

(declare-fun e!13936 () Bool)

(assert (=> start!5146 (=> (not res!17915) (not e!13936))))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5146 (= res!17915 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!631 srcBuffer!2))))))))

(assert (=> start!5146 e!13936))

(assert (=> start!5146 true))

(assert (=> start!5146 (array_inv!601 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1096) Bool)

(assert (=> start!5146 (and (inv!12 thiss!1379) e!13939)))

(declare-fun b!20630 () Bool)

(declare-fun e!13938 () Bool)

(assert (=> b!20630 (= e!13938 true)))

(assert (=> b!20630 e!13937))

(declare-fun res!17913 () Bool)

(assert (=> b!20630 (=> (not res!17913) (not e!13937))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20630 (= res!17913 (validate_offset_bits!1 ((_ sign_extend 32) (size!631 (buf!940 (_2!1301 lt!29335)))) ((_ sign_extend 32) (currentByte!2229 thiss!1379)) ((_ sign_extend 32) (currentBit!2224 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29331 () Unit!1815)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1096 array!1481 (_ BitVec 64)) Unit!1815)

(assert (=> b!20630 (= lt!29331 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!940 (_2!1301 lt!29335)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1096 BitStream!1096) tuple2!2434)

(assert (=> b!20630 (= lt!29333 (reader!0 thiss!1379 (_2!1301 lt!29335)))))

(declare-fun b!20631 () Bool)

(declare-fun e!13941 () Bool)

(assert (=> b!20631 (= e!13936 (not e!13941))))

(declare-fun res!17912 () Bool)

(assert (=> b!20631 (=> res!17912 e!13941)))

(assert (=> b!20631 (= res!17912 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1096 BitStream!1096) Bool)

(assert (=> b!20631 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29330 () Unit!1815)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1096) Unit!1815)

(assert (=> b!20631 (= lt!29330 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29332 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20631 (= lt!29332 (bitIndex!0 (size!631 (buf!940 thiss!1379)) (currentByte!2229 thiss!1379) (currentBit!2224 thiss!1379)))))

(declare-fun b!20632 () Bool)

(declare-fun res!17911 () Bool)

(assert (=> b!20632 (=> (not res!17911) (not e!13936))))

(assert (=> b!20632 (= res!17911 (validate_offset_bits!1 ((_ sign_extend 32) (size!631 (buf!940 thiss!1379))) ((_ sign_extend 32) (currentByte!2229 thiss!1379)) ((_ sign_extend 32) (currentBit!2224 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20633 () Bool)

(assert (=> b!20633 (= e!13941 e!13938)))

(declare-fun res!17914 () Bool)

(assert (=> b!20633 (=> res!17914 e!13938)))

(assert (=> b!20633 (= res!17914 (not (isPrefixOf!0 thiss!1379 (_2!1301 lt!29335))))))

(assert (=> b!20633 (validate_offset_bits!1 ((_ sign_extend 32) (size!631 (buf!940 (_2!1301 lt!29335)))) ((_ sign_extend 32) (currentByte!2229 (_2!1301 lt!29335))) ((_ sign_extend 32) (currentBit!2224 (_2!1301 lt!29335))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29334 () Unit!1815)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1096 BitStream!1096 (_ BitVec 64) (_ BitVec 64)) Unit!1815)

(assert (=> b!20633 (= lt!29334 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1301 lt!29335) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1096 (_ BitVec 8) (_ BitVec 32)) tuple2!2432)

(assert (=> b!20633 (= lt!29335 (appendBitFromByte!0 thiss!1379 (select (arr!1075 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5146 res!17915) b!20632))

(assert (= (and b!20632 res!17911) b!20631))

(assert (= (and b!20631 (not res!17912)) b!20633))

(assert (= (and b!20633 (not res!17914)) b!20630))

(assert (= (and b!20630 res!17913) b!20629))

(assert (= start!5146 b!20628))

(declare-fun m!28119 () Bool)

(assert (=> b!20633 m!28119))

(declare-fun m!28121 () Bool)

(assert (=> b!20633 m!28121))

(declare-fun m!28123 () Bool)

(assert (=> b!20633 m!28123))

(declare-fun m!28125 () Bool)

(assert (=> b!20633 m!28125))

(assert (=> b!20633 m!28123))

(declare-fun m!28127 () Bool)

(assert (=> b!20633 m!28127))

(declare-fun m!28129 () Bool)

(assert (=> b!20628 m!28129))

(declare-fun m!28131 () Bool)

(assert (=> start!5146 m!28131))

(declare-fun m!28133 () Bool)

(assert (=> start!5146 m!28133))

(declare-fun m!28135 () Bool)

(assert (=> b!20631 m!28135))

(declare-fun m!28137 () Bool)

(assert (=> b!20631 m!28137))

(declare-fun m!28139 () Bool)

(assert (=> b!20631 m!28139))

(declare-fun m!28141 () Bool)

(assert (=> b!20632 m!28141))

(declare-fun m!28143 () Bool)

(assert (=> b!20629 m!28143))

(assert (=> b!20629 m!28143))

(declare-fun m!28145 () Bool)

(assert (=> b!20629 m!28145))

(declare-fun m!28147 () Bool)

(assert (=> b!20629 m!28147))

(assert (=> b!20629 m!28147))

(declare-fun m!28149 () Bool)

(assert (=> b!20629 m!28149))

(declare-fun m!28151 () Bool)

(assert (=> b!20630 m!28151))

(declare-fun m!28153 () Bool)

(assert (=> b!20630 m!28153))

(declare-fun m!28155 () Bool)

(assert (=> b!20630 m!28155))

(push 1)

(assert (not start!5146))

(assert (not b!20631))

(assert (not b!20633))

(assert (not b!20632))

(assert (not b!20630))

(assert (not b!20628))

(assert (not b!20629))

(check-sat)

(pop 1)

