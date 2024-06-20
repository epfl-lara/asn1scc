; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5156 () Bool)

(assert start!5156)

(declare-fun b!20726 () Bool)

(declare-fun e!14054 () Bool)

(declare-fun e!14051 () Bool)

(assert (=> b!20726 (= e!14054 (not e!14051))))

(declare-fun res!17998 () Bool)

(assert (=> b!20726 (=> res!17998 e!14051)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!20726 (= res!17998 (bvsge i!635 to!314))))

(declare-datatypes ((array!1491 0))(
  ( (array!1492 (arr!1080 (Array (_ BitVec 32) (_ BitVec 8))) (size!636 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1106 0))(
  ( (BitStream!1107 (buf!945 array!1491) (currentByte!2234 (_ BitVec 32)) (currentBit!2229 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1106)

(declare-fun isPrefixOf!0 (BitStream!1106 BitStream!1106) Bool)

(assert (=> b!20726 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1825 0))(
  ( (Unit!1826) )
))
(declare-fun lt!29420 () Unit!1825)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1106) Unit!1825)

(assert (=> b!20726 (= lt!29420 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29421 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20726 (= lt!29421 (bitIndex!0 (size!636 (buf!945 thiss!1379)) (currentByte!2234 thiss!1379) (currentBit!2229 thiss!1379)))))

(declare-fun b!20727 () Bool)

(declare-fun e!14049 () Bool)

(assert (=> b!20727 (= e!14051 e!14049)))

(declare-fun res!17997 () Bool)

(assert (=> b!20727 (=> res!17997 e!14049)))

(declare-datatypes ((tuple2!2452 0))(
  ( (tuple2!2453 (_1!1311 Unit!1825) (_2!1311 BitStream!1106)) )
))
(declare-fun lt!29423 () tuple2!2452)

(assert (=> b!20727 (= res!17997 (not (isPrefixOf!0 thiss!1379 (_2!1311 lt!29423))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20727 (validate_offset_bits!1 ((_ sign_extend 32) (size!636 (buf!945 (_2!1311 lt!29423)))) ((_ sign_extend 32) (currentByte!2234 (_2!1311 lt!29423))) ((_ sign_extend 32) (currentBit!2229 (_2!1311 lt!29423))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29425 () Unit!1825)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1106 BitStream!1106 (_ BitVec 64) (_ BitVec 64)) Unit!1825)

(assert (=> b!20727 (= lt!29425 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1311 lt!29423) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1491)

(declare-fun appendBitFromByte!0 (BitStream!1106 (_ BitVec 8) (_ BitVec 32)) tuple2!2452)

(assert (=> b!20727 (= lt!29423 (appendBitFromByte!0 thiss!1379 (select (arr!1080 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!17999 () Bool)

(assert (=> start!5156 (=> (not res!17999) (not e!14054))))

(assert (=> start!5156 (= res!17999 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!636 srcBuffer!2))))))))

(assert (=> start!5156 e!14054))

(assert (=> start!5156 true))

(declare-fun array_inv!606 (array!1491) Bool)

(assert (=> start!5156 (array_inv!606 srcBuffer!2)))

(declare-fun e!14050 () Bool)

(declare-fun inv!12 (BitStream!1106) Bool)

(assert (=> start!5156 (and (inv!12 thiss!1379) e!14050)))

(declare-fun e!14052 () Bool)

(declare-fun b!20728 () Bool)

(assert (=> b!20728 (= e!14052 (validate_offset_bits!1 ((_ sign_extend 32) (size!636 (buf!945 (_2!1311 lt!29423)))) ((_ sign_extend 32) (currentByte!2234 (_2!1311 lt!29423))) ((_ sign_extend 32) (currentBit!2229 (_2!1311 lt!29423))) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun e!14055 () Bool)

(declare-datatypes ((tuple2!2454 0))(
  ( (tuple2!2455 (_1!1312 BitStream!1106) (_2!1312 BitStream!1106)) )
))
(declare-fun lt!29422 () tuple2!2454)

(declare-fun b!20729 () Bool)

(declare-datatypes ((List!254 0))(
  ( (Nil!251) (Cons!250 (h!369 Bool) (t!1004 List!254)) )
))
(declare-fun head!91 (List!254) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1106 array!1491 (_ BitVec 64) (_ BitVec 64)) List!254)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1106 BitStream!1106 (_ BitVec 64)) List!254)

(assert (=> b!20729 (= e!14055 (= (head!91 (byteArrayBitContentToList!0 (_2!1311 lt!29423) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!91 (bitStreamReadBitsIntoList!0 (_2!1311 lt!29423) (_1!1312 lt!29422) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20730 () Bool)

(assert (=> b!20730 (= e!14049 e!14052)))

(declare-fun res!17995 () Bool)

(assert (=> b!20730 (=> res!17995 e!14052)))

(assert (=> b!20730 (= res!17995 (or (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0111111111111111111111111111111111111111111111111111111111111111)))))

(assert (=> b!20730 e!14055))

(declare-fun res!17996 () Bool)

(assert (=> b!20730 (=> (not res!17996) (not e!14055))))

(assert (=> b!20730 (= res!17996 (validate_offset_bits!1 ((_ sign_extend 32) (size!636 (buf!945 (_2!1311 lt!29423)))) ((_ sign_extend 32) (currentByte!2234 thiss!1379)) ((_ sign_extend 32) (currentBit!2229 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29424 () Unit!1825)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1106 array!1491 (_ BitVec 64)) Unit!1825)

(assert (=> b!20730 (= lt!29424 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!945 (_2!1311 lt!29423)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1106 BitStream!1106) tuple2!2454)

(assert (=> b!20730 (= lt!29422 (reader!0 thiss!1379 (_2!1311 lt!29423)))))

(declare-fun b!20731 () Bool)

(assert (=> b!20731 (= e!14050 (array_inv!606 (buf!945 thiss!1379)))))

(declare-fun b!20732 () Bool)

(declare-fun res!17994 () Bool)

(assert (=> b!20732 (=> (not res!17994) (not e!14054))))

(assert (=> b!20732 (= res!17994 (validate_offset_bits!1 ((_ sign_extend 32) (size!636 (buf!945 thiss!1379))) ((_ sign_extend 32) (currentByte!2234 thiss!1379)) ((_ sign_extend 32) (currentBit!2229 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!5156 res!17999) b!20732))

(assert (= (and b!20732 res!17994) b!20726))

(assert (= (and b!20726 (not res!17998)) b!20727))

(assert (= (and b!20727 (not res!17997)) b!20730))

(assert (= (and b!20730 res!17996) b!20729))

(assert (= (and b!20730 (not res!17995)) b!20728))

(assert (= start!5156 b!20731))

(declare-fun m!28313 () Bool)

(assert (=> b!20732 m!28313))

(declare-fun m!28315 () Bool)

(assert (=> b!20729 m!28315))

(assert (=> b!20729 m!28315))

(declare-fun m!28317 () Bool)

(assert (=> b!20729 m!28317))

(declare-fun m!28319 () Bool)

(assert (=> b!20729 m!28319))

(assert (=> b!20729 m!28319))

(declare-fun m!28321 () Bool)

(assert (=> b!20729 m!28321))

(declare-fun m!28323 () Bool)

(assert (=> b!20727 m!28323))

(declare-fun m!28325 () Bool)

(assert (=> b!20727 m!28325))

(declare-fun m!28327 () Bool)

(assert (=> b!20727 m!28327))

(assert (=> b!20727 m!28327))

(declare-fun m!28329 () Bool)

(assert (=> b!20727 m!28329))

(declare-fun m!28331 () Bool)

(assert (=> b!20727 m!28331))

(declare-fun m!28333 () Bool)

(assert (=> b!20728 m!28333))

(declare-fun m!28335 () Bool)

(assert (=> b!20730 m!28335))

(declare-fun m!28337 () Bool)

(assert (=> b!20730 m!28337))

(declare-fun m!28339 () Bool)

(assert (=> b!20730 m!28339))

(declare-fun m!28341 () Bool)

(assert (=> b!20726 m!28341))

(declare-fun m!28343 () Bool)

(assert (=> b!20726 m!28343))

(declare-fun m!28345 () Bool)

(assert (=> b!20726 m!28345))

(declare-fun m!28347 () Bool)

(assert (=> start!5156 m!28347))

(declare-fun m!28349 () Bool)

(assert (=> start!5156 m!28349))

(declare-fun m!28351 () Bool)

(assert (=> b!20731 m!28351))

(push 1)

(assert (not start!5156))

(assert (not b!20726))

(assert (not b!20731))

(assert (not b!20727))

(assert (not b!20728))

(assert (not b!20729))

(assert (not b!20730))

(assert (not b!20732))

(check-sat)

(pop 1)

(push 1)

(check-sat)

