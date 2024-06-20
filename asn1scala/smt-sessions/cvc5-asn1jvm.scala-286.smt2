; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5696 () Bool)

(assert start!5696)

(declare-fun res!20924 () Bool)

(declare-fun e!16512 () Bool)

(assert (=> start!5696 (=> (not res!20924) (not e!16512))))

(declare-datatypes ((array!1619 0))(
  ( (array!1620 (arr!1151 (Array (_ BitVec 32) (_ BitVec 8))) (size!695 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1619)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!5696 (= res!20924 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!695 srcBuffer!2))))))))

(assert (=> start!5696 e!16512))

(assert (=> start!5696 true))

(declare-fun array_inv!664 (array!1619) Bool)

(assert (=> start!5696 (array_inv!664 srcBuffer!2)))

(declare-datatypes ((BitStream!1222 0))(
  ( (BitStream!1223 (buf!1016 array!1619) (currentByte!2329 (_ BitVec 32)) (currentBit!2324 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1222)

(declare-fun e!16509 () Bool)

(declare-fun inv!12 (BitStream!1222) Bool)

(assert (=> start!5696 (and (inv!12 thiss!1379) e!16509)))

(declare-fun b!24252 () Bool)

(declare-fun res!20919 () Bool)

(declare-fun e!16515 () Bool)

(assert (=> b!24252 (=> res!20919 e!16515)))

(declare-datatypes ((Unit!2033 0))(
  ( (Unit!2034) )
))
(declare-datatypes ((tuple2!2762 0))(
  ( (tuple2!2763 (_1!1468 Unit!2033) (_2!1468 BitStream!1222)) )
))
(declare-fun lt!34731 () tuple2!2762)

(declare-fun lt!34737 () tuple2!2762)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!24252 (= res!20919 (not (invariant!0 (currentBit!2324 (_2!1468 lt!34731)) (currentByte!2329 (_2!1468 lt!34731)) (size!695 (buf!1016 (_2!1468 lt!34737))))))))

(declare-fun b!24253 () Bool)

(declare-fun res!20925 () Bool)

(assert (=> b!24253 (=> res!20925 e!16515)))

(assert (=> b!24253 (= res!20925 (not (invariant!0 (currentBit!2324 (_2!1468 lt!34731)) (currentByte!2329 (_2!1468 lt!34731)) (size!695 (buf!1016 (_2!1468 lt!34731))))))))

(declare-fun b!24254 () Bool)

(declare-fun res!20920 () Bool)

(declare-fun e!16507 () Bool)

(assert (=> b!24254 (=> res!20920 e!16507)))

(assert (=> b!24254 (= res!20920 (not (= (size!695 (buf!1016 thiss!1379)) (size!695 (buf!1016 (_2!1468 lt!34737))))))))

(declare-fun b!24255 () Bool)

(assert (=> b!24255 (= e!16507 e!16515)))

(declare-fun res!20926 () Bool)

(assert (=> b!24255 (=> res!20926 e!16515)))

(assert (=> b!24255 (= res!20926 (not (= (size!695 (buf!1016 (_2!1468 lt!34731))) (size!695 (buf!1016 (_2!1468 lt!34737))))))))

(declare-fun e!16516 () Bool)

(assert (=> b!24255 e!16516))

(declare-fun res!20928 () Bool)

(assert (=> b!24255 (=> (not res!20928) (not e!16516))))

(assert (=> b!24255 (= res!20928 (= (size!695 (buf!1016 (_2!1468 lt!34737))) (size!695 (buf!1016 thiss!1379))))))

(declare-fun lt!34728 () (_ BitVec 64))

(declare-fun b!24256 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!24256 (= e!16516 (= lt!34728 (bvsub (bvsub (bvadd (bitIndex!0 (size!695 (buf!1016 (_2!1468 lt!34731))) (currentByte!2329 (_2!1468 lt!34731)) (currentBit!2324 (_2!1468 lt!34731))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!24257 () Bool)

(assert (=> b!24257 (= e!16515 true)))

(declare-fun lt!34736 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!24257 (validate_offset_bits!1 ((_ sign_extend 32) (size!695 (buf!1016 (_2!1468 lt!34737)))) ((_ sign_extend 32) (currentByte!2329 (_2!1468 lt!34731))) ((_ sign_extend 32) (currentBit!2324 (_2!1468 lt!34731))) lt!34736)))

(declare-fun lt!34741 () Unit!2033)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1222 array!1619 (_ BitVec 64)) Unit!2033)

(assert (=> b!24257 (= lt!34741 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1468 lt!34731) (buf!1016 (_2!1468 lt!34737)) lt!34736))))

(declare-datatypes ((tuple2!2764 0))(
  ( (tuple2!2765 (_1!1469 BitStream!1222) (_2!1469 BitStream!1222)) )
))
(declare-fun lt!34732 () tuple2!2764)

(declare-fun reader!0 (BitStream!1222 BitStream!1222) tuple2!2764)

(assert (=> b!24257 (= lt!34732 (reader!0 (_2!1468 lt!34731) (_2!1468 lt!34737)))))

(assert (=> b!24257 (validate_offset_bits!1 ((_ sign_extend 32) (size!695 (buf!1016 (_2!1468 lt!34737)))) ((_ sign_extend 32) (currentByte!2329 thiss!1379)) ((_ sign_extend 32) (currentBit!2324 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34733 () Unit!2033)

(assert (=> b!24257 (= lt!34733 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1016 (_2!1468 lt!34737)) (bvsub to!314 i!635)))))

(declare-fun lt!34734 () tuple2!2764)

(assert (=> b!24257 (= lt!34734 (reader!0 thiss!1379 (_2!1468 lt!34737)))))

(declare-fun b!24258 () Bool)

(declare-fun e!16510 () Bool)

(declare-fun e!16513 () Bool)

(assert (=> b!24258 (= e!16510 e!16513)))

(declare-fun res!20916 () Bool)

(assert (=> b!24258 (=> res!20916 e!16513)))

(declare-fun isPrefixOf!0 (BitStream!1222 BitStream!1222) Bool)

(assert (=> b!24258 (= res!20916 (not (isPrefixOf!0 thiss!1379 (_2!1468 lt!34731))))))

(assert (=> b!24258 (validate_offset_bits!1 ((_ sign_extend 32) (size!695 (buf!1016 (_2!1468 lt!34731)))) ((_ sign_extend 32) (currentByte!2329 (_2!1468 lt!34731))) ((_ sign_extend 32) (currentBit!2324 (_2!1468 lt!34731))) lt!34736)))

(assert (=> b!24258 (= lt!34736 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34740 () Unit!2033)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1222 BitStream!1222 (_ BitVec 64) (_ BitVec 64)) Unit!2033)

(assert (=> b!24258 (= lt!34740 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1468 lt!34731) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1222 (_ BitVec 8) (_ BitVec 32)) tuple2!2762)

(assert (=> b!24258 (= lt!34731 (appendBitFromByte!0 thiss!1379 (select (arr!1151 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!24259 () Bool)

(declare-fun e!16506 () Bool)

(assert (=> b!24259 (= e!16506 e!16507)))

(declare-fun res!20923 () Bool)

(assert (=> b!24259 (=> res!20923 e!16507)))

(declare-fun lt!34735 () (_ BitVec 64))

(assert (=> b!24259 (= res!20923 (not (= lt!34728 (bvsub (bvadd lt!34735 to!314) i!635))))))

(assert (=> b!24259 (= lt!34728 (bitIndex!0 (size!695 (buf!1016 (_2!1468 lt!34737))) (currentByte!2329 (_2!1468 lt!34737)) (currentBit!2324 (_2!1468 lt!34737))))))

(declare-fun b!24260 () Bool)

(assert (=> b!24260 (= e!16512 (not e!16510))))

(declare-fun res!20922 () Bool)

(assert (=> b!24260 (=> res!20922 e!16510)))

(assert (=> b!24260 (= res!20922 (bvsge i!635 to!314))))

(assert (=> b!24260 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34729 () Unit!2033)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1222) Unit!2033)

(assert (=> b!24260 (= lt!34729 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!24260 (= lt!34735 (bitIndex!0 (size!695 (buf!1016 thiss!1379)) (currentByte!2329 thiss!1379) (currentBit!2324 thiss!1379)))))

(declare-fun b!24261 () Bool)

(declare-fun res!20917 () Bool)

(assert (=> b!24261 (=> res!20917 e!16507)))

(assert (=> b!24261 (= res!20917 (not (invariant!0 (currentBit!2324 (_2!1468 lt!34737)) (currentByte!2329 (_2!1468 lt!34737)) (size!695 (buf!1016 (_2!1468 lt!34737))))))))

(declare-fun b!24262 () Bool)

(declare-fun res!20927 () Bool)

(assert (=> b!24262 (=> (not res!20927) (not e!16512))))

(assert (=> b!24262 (= res!20927 (validate_offset_bits!1 ((_ sign_extend 32) (size!695 (buf!1016 thiss!1379))) ((_ sign_extend 32) (currentByte!2329 thiss!1379)) ((_ sign_extend 32) (currentBit!2324 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun e!16508 () Bool)

(declare-fun b!24263 () Bool)

(declare-fun lt!34739 () tuple2!2764)

(declare-datatypes ((List!312 0))(
  ( (Nil!309) (Cons!308 (h!427 Bool) (t!1062 List!312)) )
))
(declare-fun head!149 (List!312) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1222 array!1619 (_ BitVec 64) (_ BitVec 64)) List!312)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1222 BitStream!1222 (_ BitVec 64)) List!312)

(assert (=> b!24263 (= e!16508 (= (head!149 (byteArrayBitContentToList!0 (_2!1468 lt!34731) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!149 (bitStreamReadBitsIntoList!0 (_2!1468 lt!34731) (_1!1469 lt!34739) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!24264 () Bool)

(assert (=> b!24264 (= e!16509 (array_inv!664 (buf!1016 thiss!1379)))))

(declare-fun b!24265 () Bool)

(assert (=> b!24265 (= e!16513 e!16506)))

(declare-fun res!20921 () Bool)

(assert (=> b!24265 (=> res!20921 e!16506)))

(assert (=> b!24265 (= res!20921 (not (isPrefixOf!0 (_2!1468 lt!34731) (_2!1468 lt!34737))))))

(assert (=> b!24265 (isPrefixOf!0 thiss!1379 (_2!1468 lt!34737))))

(declare-fun lt!34738 () Unit!2033)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1222 BitStream!1222 BitStream!1222) Unit!2033)

(assert (=> b!24265 (= lt!34738 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1468 lt!34731) (_2!1468 lt!34737)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1222 array!1619 (_ BitVec 64) (_ BitVec 64)) tuple2!2762)

(assert (=> b!24265 (= lt!34737 (appendBitsMSBFirstLoop!0 (_2!1468 lt!34731) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!24265 e!16508))

(declare-fun res!20918 () Bool)

(assert (=> b!24265 (=> (not res!20918) (not e!16508))))

(assert (=> b!24265 (= res!20918 (validate_offset_bits!1 ((_ sign_extend 32) (size!695 (buf!1016 (_2!1468 lt!34731)))) ((_ sign_extend 32) (currentByte!2329 thiss!1379)) ((_ sign_extend 32) (currentBit!2324 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34730 () Unit!2033)

(assert (=> b!24265 (= lt!34730 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1016 (_2!1468 lt!34731)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!24265 (= lt!34739 (reader!0 thiss!1379 (_2!1468 lt!34731)))))

(assert (= (and start!5696 res!20924) b!24262))

(assert (= (and b!24262 res!20927) b!24260))

(assert (= (and b!24260 (not res!20922)) b!24258))

(assert (= (and b!24258 (not res!20916)) b!24265))

(assert (= (and b!24265 res!20918) b!24263))

(assert (= (and b!24265 (not res!20921)) b!24259))

(assert (= (and b!24259 (not res!20923)) b!24261))

(assert (= (and b!24261 (not res!20917)) b!24254))

(assert (= (and b!24254 (not res!20920)) b!24255))

(assert (= (and b!24255 res!20928) b!24256))

(assert (= (and b!24255 (not res!20926)) b!24253))

(assert (= (and b!24253 (not res!20925)) b!24252))

(assert (= (and b!24252 (not res!20919)) b!24257))

(assert (= start!5696 b!24264))

(declare-fun m!34209 () Bool)

(assert (=> start!5696 m!34209))

(declare-fun m!34211 () Bool)

(assert (=> start!5696 m!34211))

(declare-fun m!34213 () Bool)

(assert (=> b!24263 m!34213))

(assert (=> b!24263 m!34213))

(declare-fun m!34215 () Bool)

(assert (=> b!24263 m!34215))

(declare-fun m!34217 () Bool)

(assert (=> b!24263 m!34217))

(assert (=> b!24263 m!34217))

(declare-fun m!34219 () Bool)

(assert (=> b!24263 m!34219))

(declare-fun m!34221 () Bool)

(assert (=> b!24262 m!34221))

(declare-fun m!34223 () Bool)

(assert (=> b!24265 m!34223))

(declare-fun m!34225 () Bool)

(assert (=> b!24265 m!34225))

(declare-fun m!34227 () Bool)

(assert (=> b!24265 m!34227))

(declare-fun m!34229 () Bool)

(assert (=> b!24265 m!34229))

(declare-fun m!34231 () Bool)

(assert (=> b!24265 m!34231))

(declare-fun m!34233 () Bool)

(assert (=> b!24265 m!34233))

(declare-fun m!34235 () Bool)

(assert (=> b!24265 m!34235))

(declare-fun m!34237 () Bool)

(assert (=> b!24258 m!34237))

(declare-fun m!34239 () Bool)

(assert (=> b!24258 m!34239))

(assert (=> b!24258 m!34239))

(declare-fun m!34241 () Bool)

(assert (=> b!24258 m!34241))

(declare-fun m!34243 () Bool)

(assert (=> b!24258 m!34243))

(declare-fun m!34245 () Bool)

(assert (=> b!24258 m!34245))

(declare-fun m!34247 () Bool)

(assert (=> b!24260 m!34247))

(declare-fun m!34249 () Bool)

(assert (=> b!24260 m!34249))

(declare-fun m!34251 () Bool)

(assert (=> b!24260 m!34251))

(declare-fun m!34253 () Bool)

(assert (=> b!24257 m!34253))

(declare-fun m!34255 () Bool)

(assert (=> b!24257 m!34255))

(declare-fun m!34257 () Bool)

(assert (=> b!24257 m!34257))

(declare-fun m!34259 () Bool)

(assert (=> b!24257 m!34259))

(declare-fun m!34261 () Bool)

(assert (=> b!24257 m!34261))

(declare-fun m!34263 () Bool)

(assert (=> b!24257 m!34263))

(declare-fun m!34265 () Bool)

(assert (=> b!24264 m!34265))

(declare-fun m!34267 () Bool)

(assert (=> b!24252 m!34267))

(declare-fun m!34269 () Bool)

(assert (=> b!24259 m!34269))

(declare-fun m!34271 () Bool)

(assert (=> b!24256 m!34271))

(declare-fun m!34273 () Bool)

(assert (=> b!24261 m!34273))

(declare-fun m!34275 () Bool)

(assert (=> b!24253 m!34275))

(push 1)

