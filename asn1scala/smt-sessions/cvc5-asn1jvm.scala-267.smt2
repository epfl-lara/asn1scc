; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5158 () Bool)

(assert start!5158)

(declare-fun b!20745 () Bool)

(declare-fun e!14071 () Bool)

(declare-datatypes ((array!1493 0))(
  ( (array!1494 (arr!1081 (Array (_ BitVec 32) (_ BitVec 8))) (size!637 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1108 0))(
  ( (BitStream!1109 (buf!946 array!1493) (currentByte!2235 (_ BitVec 32)) (currentBit!2230 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1108)

(declare-fun array_inv!607 (array!1493) Bool)

(assert (=> b!20745 (= e!14071 (array_inv!607 (buf!946 thiss!1379)))))

(declare-fun b!20746 () Bool)

(declare-fun e!14072 () Bool)

(assert (=> b!20746 (= e!14072 true)))

(declare-fun srcBuffer!2 () array!1493)

(declare-fun lt!29443 () Bool)

(declare-fun i!635 () (_ BitVec 64))

(declare-datatypes ((Unit!1827 0))(
  ( (Unit!1828) )
))
(declare-datatypes ((tuple2!2456 0))(
  ( (tuple2!2457 (_1!1313 Unit!1827) (_2!1313 BitStream!1108)) )
))
(declare-fun lt!29444 () tuple2!2456)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun isPrefixOf!0 (BitStream!1108 BitStream!1108) Bool)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1108 array!1493 (_ BitVec 64) (_ BitVec 64)) tuple2!2456)

(assert (=> b!20746 (= lt!29443 (isPrefixOf!0 (_2!1313 lt!29444) (_2!1313 (appendBitsMSBFirstLoop!0 (_2!1313 lt!29444) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))))

(declare-fun e!14076 () Bool)

(assert (=> b!20746 e!14076))

(declare-fun res!18013 () Bool)

(assert (=> b!20746 (=> (not res!18013) (not e!14076))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20746 (= res!18013 (validate_offset_bits!1 ((_ sign_extend 32) (size!637 (buf!946 (_2!1313 lt!29444)))) ((_ sign_extend 32) (currentByte!2235 thiss!1379)) ((_ sign_extend 32) (currentBit!2230 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29440 () Unit!1827)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1108 array!1493 (_ BitVec 64)) Unit!1827)

(assert (=> b!20746 (= lt!29440 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!946 (_2!1313 lt!29444)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2458 0))(
  ( (tuple2!2459 (_1!1314 BitStream!1108) (_2!1314 BitStream!1108)) )
))
(declare-fun lt!29442 () tuple2!2458)

(declare-fun reader!0 (BitStream!1108 BitStream!1108) tuple2!2458)

(assert (=> b!20746 (= lt!29442 (reader!0 thiss!1379 (_2!1313 lt!29444)))))

(declare-fun b!20747 () Bool)

(declare-fun res!18012 () Bool)

(declare-fun e!14073 () Bool)

(assert (=> b!20747 (=> (not res!18012) (not e!14073))))

(assert (=> b!20747 (= res!18012 (validate_offset_bits!1 ((_ sign_extend 32) (size!637 (buf!946 thiss!1379))) ((_ sign_extend 32) (currentByte!2235 thiss!1379)) ((_ sign_extend 32) (currentBit!2230 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!20748 () Bool)

(declare-fun e!14070 () Bool)

(assert (=> b!20748 (= e!14073 (not e!14070))))

(declare-fun res!18014 () Bool)

(assert (=> b!20748 (=> res!18014 e!14070)))

(assert (=> b!20748 (= res!18014 (bvsge i!635 to!314))))

(assert (=> b!20748 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29445 () Unit!1827)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1108) Unit!1827)

(assert (=> b!20748 (= lt!29445 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29441 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20748 (= lt!29441 (bitIndex!0 (size!637 (buf!946 thiss!1379)) (currentByte!2235 thiss!1379) (currentBit!2230 thiss!1379)))))

(declare-fun res!18010 () Bool)

(assert (=> start!5158 (=> (not res!18010) (not e!14073))))

(assert (=> start!5158 (= res!18010 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!637 srcBuffer!2))))))))

(assert (=> start!5158 e!14073))

(assert (=> start!5158 true))

(assert (=> start!5158 (array_inv!607 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1108) Bool)

(assert (=> start!5158 (and (inv!12 thiss!1379) e!14071)))

(declare-fun b!20749 () Bool)

(declare-datatypes ((List!255 0))(
  ( (Nil!252) (Cons!251 (h!370 Bool) (t!1005 List!255)) )
))
(declare-fun head!92 (List!255) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1108 array!1493 (_ BitVec 64) (_ BitVec 64)) List!255)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1108 BitStream!1108 (_ BitVec 64)) List!255)

(assert (=> b!20749 (= e!14076 (= (head!92 (byteArrayBitContentToList!0 (_2!1313 lt!29444) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!92 (bitStreamReadBitsIntoList!0 (_2!1313 lt!29444) (_1!1314 lt!29442) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20750 () Bool)

(assert (=> b!20750 (= e!14070 e!14072)))

(declare-fun res!18011 () Bool)

(assert (=> b!20750 (=> res!18011 e!14072)))

(assert (=> b!20750 (= res!18011 (not (isPrefixOf!0 thiss!1379 (_2!1313 lt!29444))))))

(assert (=> b!20750 (validate_offset_bits!1 ((_ sign_extend 32) (size!637 (buf!946 (_2!1313 lt!29444)))) ((_ sign_extend 32) (currentByte!2235 (_2!1313 lt!29444))) ((_ sign_extend 32) (currentBit!2230 (_2!1313 lt!29444))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29446 () Unit!1827)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1108 BitStream!1108 (_ BitVec 64) (_ BitVec 64)) Unit!1827)

(assert (=> b!20750 (= lt!29446 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1313 lt!29444) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1108 (_ BitVec 8) (_ BitVec 32)) tuple2!2456)

(assert (=> b!20750 (= lt!29444 (appendBitFromByte!0 thiss!1379 (select (arr!1081 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (= (and start!5158 res!18010) b!20747))

(assert (= (and b!20747 res!18012) b!20748))

(assert (= (and b!20748 (not res!18014)) b!20750))

(assert (= (and b!20750 (not res!18011)) b!20746))

(assert (= (and b!20746 res!18013) b!20749))

(assert (= start!5158 b!20745))

(declare-fun m!28353 () Bool)

(assert (=> b!20747 m!28353))

(declare-fun m!28355 () Bool)

(assert (=> b!20749 m!28355))

(assert (=> b!20749 m!28355))

(declare-fun m!28357 () Bool)

(assert (=> b!20749 m!28357))

(declare-fun m!28359 () Bool)

(assert (=> b!20749 m!28359))

(assert (=> b!20749 m!28359))

(declare-fun m!28361 () Bool)

(assert (=> b!20749 m!28361))

(declare-fun m!28363 () Bool)

(assert (=> b!20750 m!28363))

(declare-fun m!28365 () Bool)

(assert (=> b!20750 m!28365))

(assert (=> b!20750 m!28363))

(declare-fun m!28367 () Bool)

(assert (=> b!20750 m!28367))

(declare-fun m!28369 () Bool)

(assert (=> b!20750 m!28369))

(declare-fun m!28371 () Bool)

(assert (=> b!20750 m!28371))

(declare-fun m!28373 () Bool)

(assert (=> b!20746 m!28373))

(declare-fun m!28375 () Bool)

(assert (=> b!20746 m!28375))

(declare-fun m!28377 () Bool)

(assert (=> b!20746 m!28377))

(declare-fun m!28379 () Bool)

(assert (=> b!20746 m!28379))

(declare-fun m!28381 () Bool)

(assert (=> b!20746 m!28381))

(declare-fun m!28383 () Bool)

(assert (=> b!20745 m!28383))

(declare-fun m!28385 () Bool)

(assert (=> start!5158 m!28385))

(declare-fun m!28387 () Bool)

(assert (=> start!5158 m!28387))

(declare-fun m!28389 () Bool)

(assert (=> b!20748 m!28389))

(declare-fun m!28391 () Bool)

(assert (=> b!20748 m!28391))

(declare-fun m!28393 () Bool)

(assert (=> b!20748 m!28393))

(push 1)

(assert (not b!20745))

(assert (not b!20746))

(assert (not b!20749))

(assert (not b!20747))

(assert (not start!5158))

(assert (not b!20750))

(assert (not b!20748))

