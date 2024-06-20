; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8542 () Bool)

(assert start!8542)

(declare-fun res!36248 () Bool)

(declare-fun e!28445 () Bool)

(assert (=> start!8542 (=> (not res!36248) (not e!28445))))

(declare-datatypes ((array!2186 0))(
  ( (array!2187 (arr!1487 (Array (_ BitVec 32) (_ BitVec 8))) (size!988 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2186)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8542 (= res!36248 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!988 srcBuffer!2))))))))

(assert (=> start!8542 e!28445))

(assert (=> start!8542 true))

(declare-fun array_inv!913 (array!2186) Bool)

(assert (=> start!8542 (array_inv!913 srcBuffer!2)))

(declare-datatypes ((BitStream!1720 0))(
  ( (BitStream!1721 (buf!1319 array!2186) (currentByte!2783 (_ BitVec 32)) (currentBit!2778 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1720)

(declare-fun e!28447 () Bool)

(declare-fun inv!12 (BitStream!1720) Bool)

(assert (=> start!8542 (and (inv!12 thiss!1379) e!28447)))

(declare-fun b!42604 () Bool)

(declare-fun res!36247 () Bool)

(assert (=> b!42604 (=> (not res!36247) (not e!28445))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42604 (= res!36247 (validate_offset_bits!1 ((_ sign_extend 32) (size!988 (buf!1319 thiss!1379))) ((_ sign_extend 32) (currentByte!2783 thiss!1379)) ((_ sign_extend 32) (currentBit!2778 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!42606 () Bool)

(declare-fun e!28446 () Bool)

(assert (=> b!42606 (= e!28446 true)))

(declare-fun lt!63996 () Bool)

(declare-datatypes ((Unit!3030 0))(
  ( (Unit!3031) )
))
(declare-datatypes ((tuple2!4180 0))(
  ( (tuple2!4181 (_1!2183 Unit!3030) (_2!2183 BitStream!1720)) )
))
(declare-fun lt!64000 () tuple2!4180)

(declare-fun isPrefixOf!0 (BitStream!1720 BitStream!1720) Bool)

(assert (=> b!42606 (= lt!63996 (isPrefixOf!0 thiss!1379 (_2!2183 lt!64000)))))

(assert (=> b!42606 (validate_offset_bits!1 ((_ sign_extend 32) (size!988 (buf!1319 (_2!2183 lt!64000)))) ((_ sign_extend 32) (currentByte!2783 (_2!2183 lt!64000))) ((_ sign_extend 32) (currentBit!2778 (_2!2183 lt!64000))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!63997 () Unit!3030)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1720 BitStream!1720 (_ BitVec 64) (_ BitVec 64)) Unit!3030)

(assert (=> b!42606 (= lt!63997 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!2183 lt!64000) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1720 (_ BitVec 8) (_ BitVec 32)) tuple2!4180)

(assert (=> b!42606 (= lt!64000 (appendBitFromByte!0 thiss!1379 (select (arr!1487 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!42607 () Bool)

(assert (=> b!42607 (= e!28447 (array_inv!913 (buf!1319 thiss!1379)))))

(declare-fun b!42605 () Bool)

(assert (=> b!42605 (= e!28445 (not e!28446))))

(declare-fun res!36249 () Bool)

(assert (=> b!42605 (=> res!36249 e!28446)))

(assert (=> b!42605 (= res!36249 (bvsge i!635 to!314))))

(assert (=> b!42605 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!63999 () Unit!3030)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1720) Unit!3030)

(assert (=> b!42605 (= lt!63999 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!63998 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42605 (= lt!63998 (bitIndex!0 (size!988 (buf!1319 thiss!1379)) (currentByte!2783 thiss!1379) (currentBit!2778 thiss!1379)))))

(assert (= (and start!8542 res!36248) b!42604))

(assert (= (and b!42604 res!36247) b!42605))

(assert (= (and b!42605 (not res!36249)) b!42606))

(assert (= start!8542 b!42607))

(declare-fun m!64579 () Bool)

(assert (=> b!42606 m!64579))

(declare-fun m!64581 () Bool)

(assert (=> b!42606 m!64581))

(declare-fun m!64583 () Bool)

(assert (=> b!42606 m!64583))

(declare-fun m!64585 () Bool)

(assert (=> b!42606 m!64585))

(assert (=> b!42606 m!64583))

(declare-fun m!64587 () Bool)

(assert (=> b!42606 m!64587))

(declare-fun m!64589 () Bool)

(assert (=> b!42607 m!64589))

(declare-fun m!64591 () Bool)

(assert (=> start!8542 m!64591))

(declare-fun m!64593 () Bool)

(assert (=> start!8542 m!64593))

(declare-fun m!64595 () Bool)

(assert (=> b!42605 m!64595))

(declare-fun m!64597 () Bool)

(assert (=> b!42605 m!64597))

(declare-fun m!64599 () Bool)

(assert (=> b!42605 m!64599))

(declare-fun m!64601 () Bool)

(assert (=> b!42604 m!64601))

(push 1)

(assert (not b!42607))

(assert (not b!42605))

(assert (not start!8542))

(assert (not b!42606))

(assert (not b!42604))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

