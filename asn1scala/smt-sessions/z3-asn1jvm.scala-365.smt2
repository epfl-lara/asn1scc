; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!8472 () Bool)

(assert start!8472)

(declare-fun b!42290 () Bool)

(declare-fun res!35973 () Bool)

(declare-fun e!28182 () Bool)

(assert (=> b!42290 (=> res!35973 e!28182)))

(declare-datatypes ((array!2161 0))(
  ( (array!2162 (arr!1476 (Array (_ BitVec 32) (_ BitVec 8))) (size!977 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1698 0))(
  ( (BitStream!1699 (buf!1308 array!2161) (currentByte!2766 (_ BitVec 32)) (currentBit!2761 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1698)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!42290 (= res!35973 (not (invariant!0 (currentBit!2761 thiss!1379) (currentByte!2766 thiss!1379) (size!977 (buf!1308 thiss!1379)))))))

(declare-fun b!42291 () Bool)

(declare-fun e!28179 () Bool)

(assert (=> b!42291 (= e!28182 e!28179)))

(declare-fun res!35969 () Bool)

(assert (=> b!42291 (=> res!35969 e!28179)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!42291 (= res!35969 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4130 0))(
  ( (tuple2!4131 (_1!2158 array!2161) (_2!2158 BitStream!1698)) )
))
(declare-fun lt!63643 () tuple2!4130)

(declare-datatypes ((tuple2!4132 0))(
  ( (tuple2!4133 (_1!2159 BitStream!1698) (_2!2159 BitStream!1698)) )
))
(declare-fun lt!63639 () tuple2!4132)

(declare-fun readBits!0 (BitStream!1698 (_ BitVec 64)) tuple2!4130)

(assert (=> b!42291 (= lt!63643 (readBits!0 (_1!2159 lt!63639) (bvsub to!314 i!635)))))

(declare-fun reader!0 (BitStream!1698 BitStream!1698) tuple2!4132)

(assert (=> b!42291 (= lt!63639 (reader!0 thiss!1379 thiss!1379))))

(declare-fun b!42292 () Bool)

(declare-fun e!28181 () Bool)

(declare-fun array_inv!902 (array!2161) Bool)

(assert (=> b!42292 (= e!28181 (array_inv!902 (buf!1308 thiss!1379)))))

(declare-fun b!42293 () Bool)

(declare-fun e!28180 () Bool)

(assert (=> b!42293 (= e!28180 (not e!28182))))

(declare-fun res!35970 () Bool)

(assert (=> b!42293 (=> res!35970 e!28182)))

(declare-fun lt!63642 () (_ BitVec 64))

(assert (=> b!42293 (= res!35970 (or (bvslt i!635 to!314) (not (= lt!63642 (bvsub (bvadd lt!63642 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1698 BitStream!1698) Bool)

(assert (=> b!42293 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3008 0))(
  ( (Unit!3009) )
))
(declare-fun lt!63638 () Unit!3008)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1698) Unit!3008)

(assert (=> b!42293 (= lt!63638 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!42293 (= lt!63642 (bitIndex!0 (size!977 (buf!1308 thiss!1379)) (currentByte!2766 thiss!1379) (currentBit!2761 thiss!1379)))))

(declare-fun res!35971 () Bool)

(assert (=> start!8472 (=> (not res!35971) (not e!28180))))

(declare-fun srcBuffer!2 () array!2161)

(assert (=> start!8472 (= res!35971 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!977 srcBuffer!2))))))))

(assert (=> start!8472 e!28180))

(assert (=> start!8472 true))

(assert (=> start!8472 (array_inv!902 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1698) Bool)

(assert (=> start!8472 (and (inv!12 thiss!1379) e!28181)))

(declare-fun b!42294 () Bool)

(declare-fun res!35972 () Bool)

(assert (=> b!42294 (=> (not res!35972) (not e!28180))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42294 (= res!35972 (validate_offset_bits!1 ((_ sign_extend 32) (size!977 (buf!1308 thiss!1379))) ((_ sign_extend 32) (currentByte!2766 thiss!1379)) ((_ sign_extend 32) (currentBit!2761 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!42295 () Bool)

(assert (=> b!42295 (= e!28179 true)))

(declare-datatypes ((List!496 0))(
  ( (Nil!493) (Cons!492 (h!611 Bool) (t!1246 List!496)) )
))
(declare-fun lt!63640 () List!496)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1698 BitStream!1698 (_ BitVec 64)) List!496)

(assert (=> b!42295 (= lt!63640 (bitStreamReadBitsIntoList!0 thiss!1379 (_1!2159 lt!63639) (bvsub to!314 i!635)))))

(declare-fun lt!63641 () Unit!3008)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1698 array!2161 (_ BitVec 64)) Unit!3008)

(assert (=> b!42295 (= lt!63641 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1308 thiss!1379) (bvsub to!314 i!635)))))

(declare-fun checkByteArrayBitContent!0 (BitStream!1698 array!2161 array!2161 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!42295 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2158 lt!63643) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(assert (= (and start!8472 res!35971) b!42294))

(assert (= (and b!42294 res!35972) b!42293))

(assert (= (and b!42293 (not res!35970)) b!42290))

(assert (= (and b!42290 (not res!35973)) b!42291))

(assert (= (and b!42291 (not res!35969)) b!42295))

(assert (= start!8472 b!42292))

(declare-fun m!64167 () Bool)

(assert (=> start!8472 m!64167))

(declare-fun m!64169 () Bool)

(assert (=> start!8472 m!64169))

(declare-fun m!64171 () Bool)

(assert (=> b!42292 m!64171))

(declare-fun m!64173 () Bool)

(assert (=> b!42294 m!64173))

(declare-fun m!64175 () Bool)

(assert (=> b!42293 m!64175))

(declare-fun m!64177 () Bool)

(assert (=> b!42293 m!64177))

(declare-fun m!64179 () Bool)

(assert (=> b!42293 m!64179))

(declare-fun m!64181 () Bool)

(assert (=> b!42291 m!64181))

(declare-fun m!64183 () Bool)

(assert (=> b!42291 m!64183))

(declare-fun m!64185 () Bool)

(assert (=> b!42295 m!64185))

(declare-fun m!64187 () Bool)

(assert (=> b!42295 m!64187))

(declare-fun m!64189 () Bool)

(assert (=> b!42295 m!64189))

(declare-fun m!64191 () Bool)

(assert (=> b!42290 m!64191))

(check-sat (not b!42292) (not b!42290) (not b!42293) (not b!42291) (not b!42294) (not b!42295) (not start!8472))
