; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4948 () Bool)

(assert start!4948)

(declare-fun b!19657 () Bool)

(declare-fun res!17163 () Bool)

(declare-fun e!13096 () Bool)

(assert (=> b!19657 (=> (not res!17163) (not e!13096))))

(declare-datatypes ((array!1415 0))(
  ( (array!1416 (arr!1042 (Array (_ BitVec 32) (_ BitVec 8))) (size!601 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1036 0))(
  ( (BitStream!1037 (buf!904 array!1415) (currentByte!2187 (_ BitVec 32)) (currentBit!2182 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1036)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!19657 (= res!17163 (validate_offset_bits!1 ((_ sign_extend 32) (size!601 (buf!904 thiss!1379))) ((_ sign_extend 32) (currentByte!2187 thiss!1379)) ((_ sign_extend 32) (currentBit!2182 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!19658 () Bool)

(declare-fun e!13093 () Bool)

(assert (=> b!19658 (= e!13093 (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111110))))

(declare-datatypes ((List!219 0))(
  ( (Nil!216) (Cons!215 (h!334 Bool) (t!969 List!219)) )
))
(declare-fun lt!27966 () List!219)

(declare-datatypes ((Unit!1749 0))(
  ( (Unit!1750) )
))
(declare-datatypes ((tuple2!2264 0))(
  ( (tuple2!2265 (_1!1217 Unit!1749) (_2!1217 BitStream!1036)) )
))
(declare-fun lt!27969 () tuple2!2264)

(declare-datatypes ((tuple2!2266 0))(
  ( (tuple2!2267 (_1!1218 BitStream!1036) (_2!1218 BitStream!1036)) )
))
(declare-fun lt!27970 () tuple2!2266)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1036 BitStream!1036 (_ BitVec 64)) List!219)

(assert (=> b!19658 (= lt!27966 (bitStreamReadBitsIntoList!0 (_2!1217 lt!27969) (_1!1218 lt!27970) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!19658 (validate_offset_bits!1 ((_ sign_extend 32) (size!601 (buf!904 (_2!1217 lt!27969)))) ((_ sign_extend 32) (currentByte!2187 thiss!1379)) ((_ sign_extend 32) (currentBit!2182 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!27964 () Unit!1749)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1036 array!1415 (_ BitVec 64)) Unit!1749)

(assert (=> b!19658 (= lt!27964 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!904 (_2!1217 lt!27969)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1036 BitStream!1036) tuple2!2266)

(assert (=> b!19658 (= lt!27970 (reader!0 thiss!1379 (_2!1217 lt!27969)))))

(declare-fun b!19659 () Bool)

(declare-fun e!13095 () Bool)

(assert (=> b!19659 (= e!13096 (not e!13095))))

(declare-fun res!17162 () Bool)

(assert (=> b!19659 (=> res!17162 e!13095)))

(assert (=> b!19659 (= res!17162 (bvsge i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1036 BitStream!1036) Bool)

(assert (=> b!19659 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!27968 () Unit!1749)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1036) Unit!1749)

(assert (=> b!19659 (= lt!27968 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!27965 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!19659 (= lt!27965 (bitIndex!0 (size!601 (buf!904 thiss!1379)) (currentByte!2187 thiss!1379) (currentBit!2182 thiss!1379)))))

(declare-fun b!19660 () Bool)

(declare-fun e!13094 () Bool)

(declare-fun array_inv!571 (array!1415) Bool)

(assert (=> b!19660 (= e!13094 (array_inv!571 (buf!904 thiss!1379)))))

(declare-fun b!19661 () Bool)

(assert (=> b!19661 (= e!13095 e!13093)))

(declare-fun res!17165 () Bool)

(assert (=> b!19661 (=> res!17165 e!13093)))

(assert (=> b!19661 (= res!17165 (not (isPrefixOf!0 thiss!1379 (_2!1217 lt!27969))))))

(assert (=> b!19661 (validate_offset_bits!1 ((_ sign_extend 32) (size!601 (buf!904 (_2!1217 lt!27969)))) ((_ sign_extend 32) (currentByte!2187 (_2!1217 lt!27969))) ((_ sign_extend 32) (currentBit!2182 (_2!1217 lt!27969))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!27967 () Unit!1749)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1036 BitStream!1036 (_ BitVec 64) (_ BitVec 64)) Unit!1749)

(assert (=> b!19661 (= lt!27967 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1217 lt!27969) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1415)

(declare-fun appendBitFromByte!0 (BitStream!1036 (_ BitVec 8) (_ BitVec 32)) tuple2!2264)

(assert (=> b!19661 (= lt!27969 (appendBitFromByte!0 thiss!1379 (select (arr!1042 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!17164 () Bool)

(assert (=> start!4948 (=> (not res!17164) (not e!13096))))

(assert (=> start!4948 (= res!17164 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!601 srcBuffer!2))))))))

(assert (=> start!4948 e!13096))

(assert (=> start!4948 true))

(assert (=> start!4948 (array_inv!571 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1036) Bool)

(assert (=> start!4948 (and (inv!12 thiss!1379) e!13094)))

(assert (= (and start!4948 res!17164) b!19657))

(assert (= (and b!19657 res!17163) b!19659))

(assert (= (and b!19659 (not res!17162)) b!19661))

(assert (= (and b!19661 (not res!17165)) b!19658))

(assert (= start!4948 b!19660))

(declare-fun m!26547 () Bool)

(assert (=> b!19659 m!26547))

(declare-fun m!26549 () Bool)

(assert (=> b!19659 m!26549))

(declare-fun m!26551 () Bool)

(assert (=> b!19659 m!26551))

(declare-fun m!26553 () Bool)

(assert (=> start!4948 m!26553))

(declare-fun m!26555 () Bool)

(assert (=> start!4948 m!26555))

(declare-fun m!26557 () Bool)

(assert (=> b!19661 m!26557))

(declare-fun m!26559 () Bool)

(assert (=> b!19661 m!26559))

(declare-fun m!26561 () Bool)

(assert (=> b!19661 m!26561))

(declare-fun m!26563 () Bool)

(assert (=> b!19661 m!26563))

(assert (=> b!19661 m!26561))

(declare-fun m!26565 () Bool)

(assert (=> b!19661 m!26565))

(declare-fun m!26567 () Bool)

(assert (=> b!19658 m!26567))

(declare-fun m!26569 () Bool)

(assert (=> b!19658 m!26569))

(declare-fun m!26571 () Bool)

(assert (=> b!19658 m!26571))

(declare-fun m!26573 () Bool)

(assert (=> b!19658 m!26573))

(declare-fun m!26575 () Bool)

(assert (=> b!19660 m!26575))

(declare-fun m!26577 () Bool)

(assert (=> b!19657 m!26577))

(push 1)

(assert (not start!4948))

(assert (not b!19657))

(assert (not b!19658))

(assert (not b!19660))

(assert (not b!19659))

(assert (not b!19661))

(check-sat)

(pop 1)

(push 1)

(check-sat)

