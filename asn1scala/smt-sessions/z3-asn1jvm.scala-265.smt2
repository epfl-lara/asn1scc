; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5148 () Bool)

(assert start!5148)

(declare-fun res!17929 () Bool)

(declare-fun e!13962 () Bool)

(assert (=> start!5148 (=> (not res!17929) (not e!13962))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((array!1483 0))(
  ( (array!1484 (arr!1076 (Array (_ BitVec 32) (_ BitVec 8))) (size!632 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1483)

(assert (=> start!5148 (= res!17929 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!632 srcBuffer!2))))))))

(assert (=> start!5148 e!13962))

(assert (=> start!5148 true))

(declare-fun array_inv!602 (array!1483) Bool)

(assert (=> start!5148 (array_inv!602 srcBuffer!2)))

(declare-datatypes ((BitStream!1098 0))(
  ( (BitStream!1099 (buf!941 array!1483) (currentByte!2230 (_ BitVec 32)) (currentBit!2225 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1098)

(declare-fun e!13961 () Bool)

(declare-fun inv!12 (BitStream!1098) Bool)

(assert (=> start!5148 (and (inv!12 thiss!1379) e!13961)))

(declare-fun b!20646 () Bool)

(declare-fun e!13959 () Bool)

(assert (=> b!20646 (= e!13962 (not e!13959))))

(declare-fun res!17928 () Bool)

(assert (=> b!20646 (=> res!17928 e!13959)))

(assert (=> b!20646 (= res!17928 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1098 BitStream!1098) Bool)

(assert (=> b!20646 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!1817 0))(
  ( (Unit!1818) )
))
(declare-fun lt!29348 () Unit!1817)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1098) Unit!1817)

(assert (=> b!20646 (= lt!29348 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29350 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20646 (= lt!29350 (bitIndex!0 (size!632 (buf!941 thiss!1379)) (currentByte!2230 thiss!1379) (currentBit!2225 thiss!1379)))))

(declare-fun b!20647 () Bool)

(declare-fun e!13957 () Bool)

(assert (=> b!20647 (= e!13959 e!13957)))

(declare-fun res!17926 () Bool)

(assert (=> b!20647 (=> res!17926 e!13957)))

(declare-datatypes ((tuple2!2436 0))(
  ( (tuple2!2437 (_1!1303 Unit!1817) (_2!1303 BitStream!1098)) )
))
(declare-fun lt!29351 () tuple2!2436)

(assert (=> b!20647 (= res!17926 (not (isPrefixOf!0 thiss!1379 (_2!1303 lt!29351))))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20647 (validate_offset_bits!1 ((_ sign_extend 32) (size!632 (buf!941 (_2!1303 lt!29351)))) ((_ sign_extend 32) (currentByte!2230 (_2!1303 lt!29351))) ((_ sign_extend 32) (currentBit!2225 (_2!1303 lt!29351))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29353 () Unit!1817)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1098 BitStream!1098 (_ BitVec 64) (_ BitVec 64)) Unit!1817)

(assert (=> b!20647 (= lt!29353 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1303 lt!29351) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1098 (_ BitVec 8) (_ BitVec 32)) tuple2!2436)

(assert (=> b!20647 (= lt!29351 (appendBitFromByte!0 thiss!1379 (select (arr!1076 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!20648 () Bool)

(declare-fun e!13956 () Bool)

(declare-datatypes ((tuple2!2438 0))(
  ( (tuple2!2439 (_1!1304 BitStream!1098) (_2!1304 BitStream!1098)) )
))
(declare-fun lt!29352 () tuple2!2438)

(declare-datatypes ((List!250 0))(
  ( (Nil!247) (Cons!246 (h!365 Bool) (t!1000 List!250)) )
))
(declare-fun head!87 (List!250) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1098 array!1483 (_ BitVec 64) (_ BitVec 64)) List!250)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1098 BitStream!1098 (_ BitVec 64)) List!250)

(assert (=> b!20648 (= e!13956 (= (head!87 (byteArrayBitContentToList!0 (_2!1303 lt!29351) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!87 (bitStreamReadBitsIntoList!0 (_2!1303 lt!29351) (_1!1304 lt!29352) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20649 () Bool)

(assert (=> b!20649 (= e!13961 (array_inv!602 (buf!941 thiss!1379)))))

(declare-fun b!20650 () Bool)

(assert (=> b!20650 (= e!13957 true)))

(assert (=> b!20650 e!13956))

(declare-fun res!17930 () Bool)

(assert (=> b!20650 (=> (not res!17930) (not e!13956))))

(assert (=> b!20650 (= res!17930 (validate_offset_bits!1 ((_ sign_extend 32) (size!632 (buf!941 (_2!1303 lt!29351)))) ((_ sign_extend 32) (currentByte!2230 thiss!1379)) ((_ sign_extend 32) (currentBit!2225 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29349 () Unit!1817)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1098 array!1483 (_ BitVec 64)) Unit!1817)

(assert (=> b!20650 (= lt!29349 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!941 (_2!1303 lt!29351)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1098 BitStream!1098) tuple2!2438)

(assert (=> b!20650 (= lt!29352 (reader!0 thiss!1379 (_2!1303 lt!29351)))))

(declare-fun b!20651 () Bool)

(declare-fun res!17927 () Bool)

(assert (=> b!20651 (=> (not res!17927) (not e!13962))))

(assert (=> b!20651 (= res!17927 (validate_offset_bits!1 ((_ sign_extend 32) (size!632 (buf!941 thiss!1379))) ((_ sign_extend 32) (currentByte!2230 thiss!1379)) ((_ sign_extend 32) (currentBit!2225 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!5148 res!17929) b!20651))

(assert (= (and b!20651 res!17927) b!20646))

(assert (= (and b!20646 (not res!17928)) b!20647))

(assert (= (and b!20647 (not res!17926)) b!20650))

(assert (= (and b!20650 res!17930) b!20648))

(assert (= start!5148 b!20649))

(declare-fun m!28157 () Bool)

(assert (=> b!20649 m!28157))

(declare-fun m!28159 () Bool)

(assert (=> start!5148 m!28159))

(declare-fun m!28161 () Bool)

(assert (=> start!5148 m!28161))

(declare-fun m!28163 () Bool)

(assert (=> b!20650 m!28163))

(declare-fun m!28165 () Bool)

(assert (=> b!20650 m!28165))

(declare-fun m!28167 () Bool)

(assert (=> b!20650 m!28167))

(declare-fun m!28169 () Bool)

(assert (=> b!20647 m!28169))

(declare-fun m!28171 () Bool)

(assert (=> b!20647 m!28171))

(declare-fun m!28173 () Bool)

(assert (=> b!20647 m!28173))

(assert (=> b!20647 m!28169))

(declare-fun m!28175 () Bool)

(assert (=> b!20647 m!28175))

(declare-fun m!28177 () Bool)

(assert (=> b!20647 m!28177))

(declare-fun m!28179 () Bool)

(assert (=> b!20648 m!28179))

(assert (=> b!20648 m!28179))

(declare-fun m!28181 () Bool)

(assert (=> b!20648 m!28181))

(declare-fun m!28183 () Bool)

(assert (=> b!20648 m!28183))

(assert (=> b!20648 m!28183))

(declare-fun m!28185 () Bool)

(assert (=> b!20648 m!28185))

(declare-fun m!28187 () Bool)

(assert (=> b!20646 m!28187))

(declare-fun m!28189 () Bool)

(assert (=> b!20646 m!28189))

(declare-fun m!28191 () Bool)

(assert (=> b!20646 m!28191))

(declare-fun m!28193 () Bool)

(assert (=> b!20651 m!28193))

(check-sat (not b!20651) (not b!20650) (not b!20649) (not b!20646) (not b!20648) (not b!20647) (not start!5148))
