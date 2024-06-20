; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5126 () Bool)

(assert start!5126)

(declare-fun b!20448 () Bool)

(declare-fun e!13727 () Bool)

(assert (=> b!20448 (= e!13727 true)))

(declare-fun e!13725 () Bool)

(assert (=> b!20448 e!13725))

(declare-fun res!17761 () Bool)

(assert (=> b!20448 (=> (not res!17761) (not e!13725))))

(declare-datatypes ((array!1461 0))(
  ( (array!1462 (arr!1065 (Array (_ BitVec 32) (_ BitVec 8))) (size!621 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1076 0))(
  ( (BitStream!1077 (buf!930 array!1461) (currentByte!2219 (_ BitVec 32)) (currentBit!2214 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1795 0))(
  ( (Unit!1796) )
))
(declare-datatypes ((tuple2!2392 0))(
  ( (tuple2!2393 (_1!1281 Unit!1795) (_2!1281 BitStream!1076)) )
))
(declare-fun lt!29153 () tuple2!2392)

(declare-fun thiss!1379 () BitStream!1076)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20448 (= res!17761 (validate_offset_bits!1 ((_ sign_extend 32) (size!621 (buf!930 (_2!1281 lt!29153)))) ((_ sign_extend 32) (currentByte!2219 thiss!1379)) ((_ sign_extend 32) (currentBit!2214 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29151 () Unit!1795)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1076 array!1461 (_ BitVec 64)) Unit!1795)

(assert (=> b!20448 (= lt!29151 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!930 (_2!1281 lt!29153)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2394 0))(
  ( (tuple2!2395 (_1!1282 BitStream!1076) (_2!1282 BitStream!1076)) )
))
(declare-fun lt!29155 () tuple2!2394)

(declare-fun reader!0 (BitStream!1076 BitStream!1076) tuple2!2394)

(assert (=> b!20448 (= lt!29155 (reader!0 thiss!1379 (_2!1281 lt!29153)))))

(declare-fun b!20449 () Bool)

(declare-fun e!13731 () Bool)

(declare-fun e!13726 () Bool)

(assert (=> b!20449 (= e!13731 (not e!13726))))

(declare-fun res!17763 () Bool)

(assert (=> b!20449 (=> res!17763 e!13726)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!20449 (= res!17763 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1076 BitStream!1076) Bool)

(assert (=> b!20449 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29154 () Unit!1795)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1076) Unit!1795)

(assert (=> b!20449 (= lt!29154 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29150 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20449 (= lt!29150 (bitIndex!0 (size!621 (buf!930 thiss!1379)) (currentByte!2219 thiss!1379) (currentBit!2214 thiss!1379)))))

(declare-fun b!20450 () Bool)

(declare-fun res!17765 () Bool)

(assert (=> b!20450 (=> (not res!17765) (not e!13731))))

(assert (=> b!20450 (= res!17765 (validate_offset_bits!1 ((_ sign_extend 32) (size!621 (buf!930 thiss!1379))) ((_ sign_extend 32) (currentByte!2219 thiss!1379)) ((_ sign_extend 32) (currentBit!2214 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!17764 () Bool)

(assert (=> start!5126 (=> (not res!17764) (not e!13731))))

(declare-fun srcBuffer!2 () array!1461)

(assert (=> start!5126 (= res!17764 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!621 srcBuffer!2))))))))

(assert (=> start!5126 e!13731))

(assert (=> start!5126 true))

(declare-fun array_inv!591 (array!1461) Bool)

(assert (=> start!5126 (array_inv!591 srcBuffer!2)))

(declare-fun e!13728 () Bool)

(declare-fun inv!12 (BitStream!1076) Bool)

(assert (=> start!5126 (and (inv!12 thiss!1379) e!13728)))

(declare-fun b!20451 () Bool)

(assert (=> b!20451 (= e!13726 e!13727)))

(declare-fun res!17762 () Bool)

(assert (=> b!20451 (=> res!17762 e!13727)))

(assert (=> b!20451 (= res!17762 (not (isPrefixOf!0 thiss!1379 (_2!1281 lt!29153))))))

(assert (=> b!20451 (validate_offset_bits!1 ((_ sign_extend 32) (size!621 (buf!930 (_2!1281 lt!29153)))) ((_ sign_extend 32) (currentByte!2219 (_2!1281 lt!29153))) ((_ sign_extend 32) (currentBit!2214 (_2!1281 lt!29153))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29152 () Unit!1795)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1076 BitStream!1076 (_ BitVec 64) (_ BitVec 64)) Unit!1795)

(assert (=> b!20451 (= lt!29152 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1281 lt!29153) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1076 (_ BitVec 8) (_ BitVec 32)) tuple2!2392)

(assert (=> b!20451 (= lt!29153 (appendBitFromByte!0 thiss!1379 (select (arr!1065 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!20452 () Bool)

(declare-datatypes ((List!239 0))(
  ( (Nil!236) (Cons!235 (h!354 Bool) (t!989 List!239)) )
))
(declare-fun head!76 (List!239) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1076 array!1461 (_ BitVec 64) (_ BitVec 64)) List!239)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1076 BitStream!1076 (_ BitVec 64)) List!239)

(assert (=> b!20452 (= e!13725 (= (head!76 (byteArrayBitContentToList!0 (_2!1281 lt!29153) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!76 (bitStreamReadBitsIntoList!0 (_2!1281 lt!29153) (_1!1282 lt!29155) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20453 () Bool)

(assert (=> b!20453 (= e!13728 (array_inv!591 (buf!930 thiss!1379)))))

(assert (= (and start!5126 res!17764) b!20450))

(assert (= (and b!20450 res!17765) b!20449))

(assert (= (and b!20449 (not res!17763)) b!20451))

(assert (= (and b!20451 (not res!17762)) b!20448))

(assert (= (and b!20448 res!17761) b!20452))

(assert (= start!5126 b!20453))

(declare-fun m!27739 () Bool)

(assert (=> b!20453 m!27739))

(declare-fun m!27741 () Bool)

(assert (=> b!20451 m!27741))

(declare-fun m!27743 () Bool)

(assert (=> b!20451 m!27743))

(declare-fun m!27745 () Bool)

(assert (=> b!20451 m!27745))

(declare-fun m!27747 () Bool)

(assert (=> b!20451 m!27747))

(declare-fun m!27749 () Bool)

(assert (=> b!20451 m!27749))

(assert (=> b!20451 m!27743))

(declare-fun m!27751 () Bool)

(assert (=> b!20450 m!27751))

(declare-fun m!27753 () Bool)

(assert (=> b!20449 m!27753))

(declare-fun m!27755 () Bool)

(assert (=> b!20449 m!27755))

(declare-fun m!27757 () Bool)

(assert (=> b!20449 m!27757))

(declare-fun m!27759 () Bool)

(assert (=> start!5126 m!27759))

(declare-fun m!27761 () Bool)

(assert (=> start!5126 m!27761))

(declare-fun m!27763 () Bool)

(assert (=> b!20452 m!27763))

(assert (=> b!20452 m!27763))

(declare-fun m!27765 () Bool)

(assert (=> b!20452 m!27765))

(declare-fun m!27767 () Bool)

(assert (=> b!20452 m!27767))

(assert (=> b!20452 m!27767))

(declare-fun m!27769 () Bool)

(assert (=> b!20452 m!27769))

(declare-fun m!27771 () Bool)

(assert (=> b!20448 m!27771))

(declare-fun m!27773 () Bool)

(assert (=> b!20448 m!27773))

(declare-fun m!27775 () Bool)

(assert (=> b!20448 m!27775))

(push 1)

(assert (not b!20451))

(assert (not b!20453))

(assert (not start!5126))

(assert (not b!20452))

(assert (not b!20448))

(assert (not b!20449))

(assert (not b!20450))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

