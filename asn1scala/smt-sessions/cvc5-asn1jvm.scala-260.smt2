; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5116 () Bool)

(assert start!5116)

(declare-datatypes ((array!1451 0))(
  ( (array!1452 (arr!1060 (Array (_ BitVec 32) (_ BitVec 8))) (size!616 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1066 0))(
  ( (BitStream!1067 (buf!925 array!1451) (currentByte!2214 (_ BitVec 32)) (currentBit!2209 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!2372 0))(
  ( (tuple2!2373 (_1!1271 BitStream!1066) (_2!1271 BitStream!1066)) )
))
(declare-fun lt!29063 () tuple2!2372)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!20358 () Bool)

(declare-datatypes ((Unit!1785 0))(
  ( (Unit!1786) )
))
(declare-datatypes ((tuple2!2374 0))(
  ( (tuple2!2375 (_1!1272 Unit!1785) (_2!1272 BitStream!1066)) )
))
(declare-fun lt!29065 () tuple2!2374)

(declare-fun srcBuffer!2 () array!1451)

(declare-fun e!13626 () Bool)

(declare-datatypes ((List!234 0))(
  ( (Nil!231) (Cons!230 (h!349 Bool) (t!984 List!234)) )
))
(declare-fun head!71 (List!234) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1066 array!1451 (_ BitVec 64) (_ BitVec 64)) List!234)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1066 BitStream!1066 (_ BitVec 64)) List!234)

(assert (=> b!20358 (= e!13626 (= (head!71 (byteArrayBitContentToList!0 (_2!1272 lt!29065) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!71 (bitStreamReadBitsIntoList!0 (_2!1272 lt!29065) (_1!1271 lt!29063) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20359 () Bool)

(declare-fun e!13621 () Bool)

(declare-fun e!13622 () Bool)

(assert (=> b!20359 (= e!13621 (not e!13622))))

(declare-fun res!17688 () Bool)

(assert (=> b!20359 (=> res!17688 e!13622)))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!20359 (= res!17688 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1066)

(declare-fun isPrefixOf!0 (BitStream!1066 BitStream!1066) Bool)

(assert (=> b!20359 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29061 () Unit!1785)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1066) Unit!1785)

(assert (=> b!20359 (= lt!29061 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29064 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20359 (= lt!29064 (bitIndex!0 (size!616 (buf!925 thiss!1379)) (currentByte!2214 thiss!1379) (currentBit!2209 thiss!1379)))))

(declare-fun res!17690 () Bool)

(assert (=> start!5116 (=> (not res!17690) (not e!13621))))

(assert (=> start!5116 (= res!17690 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!616 srcBuffer!2))))))))

(assert (=> start!5116 e!13621))

(assert (=> start!5116 true))

(declare-fun array_inv!586 (array!1451) Bool)

(assert (=> start!5116 (array_inv!586 srcBuffer!2)))

(declare-fun e!13623 () Bool)

(declare-fun inv!12 (BitStream!1066) Bool)

(assert (=> start!5116 (and (inv!12 thiss!1379) e!13623)))

(declare-fun b!20360 () Bool)

(declare-fun e!13620 () Bool)

(assert (=> b!20360 (= e!13620 (bvsge (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!20360 e!13626))

(declare-fun res!17686 () Bool)

(assert (=> b!20360 (=> (not res!17686) (not e!13626))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20360 (= res!17686 (validate_offset_bits!1 ((_ sign_extend 32) (size!616 (buf!925 (_2!1272 lt!29065)))) ((_ sign_extend 32) (currentByte!2214 thiss!1379)) ((_ sign_extend 32) (currentBit!2209 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29062 () Unit!1785)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1066 array!1451 (_ BitVec 64)) Unit!1785)

(assert (=> b!20360 (= lt!29062 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!925 (_2!1272 lt!29065)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1066 BitStream!1066) tuple2!2372)

(assert (=> b!20360 (= lt!29063 (reader!0 thiss!1379 (_2!1272 lt!29065)))))

(declare-fun b!20361 () Bool)

(assert (=> b!20361 (= e!13623 (array_inv!586 (buf!925 thiss!1379)))))

(declare-fun b!20362 () Bool)

(assert (=> b!20362 (= e!13622 e!13620)))

(declare-fun res!17687 () Bool)

(assert (=> b!20362 (=> res!17687 e!13620)))

(assert (=> b!20362 (= res!17687 (not (isPrefixOf!0 thiss!1379 (_2!1272 lt!29065))))))

(assert (=> b!20362 (validate_offset_bits!1 ((_ sign_extend 32) (size!616 (buf!925 (_2!1272 lt!29065)))) ((_ sign_extend 32) (currentByte!2214 (_2!1272 lt!29065))) ((_ sign_extend 32) (currentBit!2209 (_2!1272 lt!29065))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29060 () Unit!1785)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1066 BitStream!1066 (_ BitVec 64) (_ BitVec 64)) Unit!1785)

(assert (=> b!20362 (= lt!29060 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1272 lt!29065) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1066 (_ BitVec 8) (_ BitVec 32)) tuple2!2374)

(assert (=> b!20362 (= lt!29065 (appendBitFromByte!0 thiss!1379 (select (arr!1060 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!20363 () Bool)

(declare-fun res!17689 () Bool)

(assert (=> b!20363 (=> (not res!17689) (not e!13621))))

(assert (=> b!20363 (= res!17689 (validate_offset_bits!1 ((_ sign_extend 32) (size!616 (buf!925 thiss!1379))) ((_ sign_extend 32) (currentByte!2214 thiss!1379)) ((_ sign_extend 32) (currentBit!2209 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!5116 res!17690) b!20363))

(assert (= (and b!20363 res!17689) b!20359))

(assert (= (and b!20359 (not res!17688)) b!20362))

(assert (= (and b!20362 (not res!17687)) b!20360))

(assert (= (and b!20360 res!17686) b!20358))

(assert (= start!5116 b!20361))

(declare-fun m!27549 () Bool)

(assert (=> start!5116 m!27549))

(declare-fun m!27551 () Bool)

(assert (=> start!5116 m!27551))

(declare-fun m!27553 () Bool)

(assert (=> b!20360 m!27553))

(declare-fun m!27555 () Bool)

(assert (=> b!20360 m!27555))

(declare-fun m!27557 () Bool)

(assert (=> b!20360 m!27557))

(declare-fun m!27559 () Bool)

(assert (=> b!20358 m!27559))

(assert (=> b!20358 m!27559))

(declare-fun m!27561 () Bool)

(assert (=> b!20358 m!27561))

(declare-fun m!27563 () Bool)

(assert (=> b!20358 m!27563))

(assert (=> b!20358 m!27563))

(declare-fun m!27565 () Bool)

(assert (=> b!20358 m!27565))

(declare-fun m!27567 () Bool)

(assert (=> b!20362 m!27567))

(declare-fun m!27569 () Bool)

(assert (=> b!20362 m!27569))

(declare-fun m!27571 () Bool)

(assert (=> b!20362 m!27571))

(declare-fun m!27573 () Bool)

(assert (=> b!20362 m!27573))

(assert (=> b!20362 m!27569))

(declare-fun m!27575 () Bool)

(assert (=> b!20362 m!27575))

(declare-fun m!27577 () Bool)

(assert (=> b!20363 m!27577))

(declare-fun m!27579 () Bool)

(assert (=> b!20359 m!27579))

(declare-fun m!27581 () Bool)

(assert (=> b!20359 m!27581))

(declare-fun m!27583 () Bool)

(assert (=> b!20359 m!27583))

(declare-fun m!27585 () Bool)

(assert (=> b!20361 m!27585))

(push 1)

(assert (not b!20363))

(assert (not start!5116))

(assert (not b!20361))

(assert (not b!20358))

(assert (not b!20362))

(assert (not b!20359))

(assert (not b!20360))

(check-sat)

(pop 1)

(push 1)

(check-sat)

