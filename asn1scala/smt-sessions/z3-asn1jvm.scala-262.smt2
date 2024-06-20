; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5130 () Bool)

(assert start!5130)

(declare-datatypes ((array!1465 0))(
  ( (array!1466 (arr!1067 (Array (_ BitVec 32) (_ BitVec 8))) (size!623 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1080 0))(
  ( (BitStream!1081 (buf!932 array!1465) (currentByte!2221 (_ BitVec 32)) (currentBit!2216 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!1799 0))(
  ( (Unit!1800) )
))
(declare-datatypes ((tuple2!2400 0))(
  ( (tuple2!2401 (_1!1285 Unit!1799) (_2!1285 BitStream!1080)) )
))
(declare-fun lt!29190 () tuple2!2400)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun e!13768 () Bool)

(declare-fun b!20484 () Bool)

(declare-datatypes ((tuple2!2402 0))(
  ( (tuple2!2403 (_1!1286 BitStream!1080) (_2!1286 BitStream!1080)) )
))
(declare-fun lt!29187 () tuple2!2402)

(declare-fun srcBuffer!2 () array!1465)

(declare-datatypes ((List!241 0))(
  ( (Nil!238) (Cons!237 (h!356 Bool) (t!991 List!241)) )
))
(declare-fun head!78 (List!241) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1080 array!1465 (_ BitVec 64) (_ BitVec 64)) List!241)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1080 BitStream!1080 (_ BitVec 64)) List!241)

(assert (=> b!20484 (= e!13768 (= (head!78 (byteArrayBitContentToList!0 (_2!1285 lt!29190) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!78 (bitStreamReadBitsIntoList!0 (_2!1285 lt!29190) (_1!1286 lt!29187) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!20485 () Bool)

(declare-fun res!17791 () Bool)

(declare-fun e!13769 () Bool)

(assert (=> b!20485 (=> (not res!17791) (not e!13769))))

(declare-fun thiss!1379 () BitStream!1080)

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!20485 (= res!17791 (validate_offset_bits!1 ((_ sign_extend 32) (size!623 (buf!932 thiss!1379))) ((_ sign_extend 32) (currentByte!2221 thiss!1379)) ((_ sign_extend 32) (currentBit!2216 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!17792 () Bool)

(assert (=> start!5130 (=> (not res!17792) (not e!13769))))

(assert (=> start!5130 (= res!17792 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!623 srcBuffer!2))))))))

(assert (=> start!5130 e!13769))

(assert (=> start!5130 true))

(declare-fun array_inv!593 (array!1465) Bool)

(assert (=> start!5130 (array_inv!593 srcBuffer!2)))

(declare-fun e!13773 () Bool)

(declare-fun inv!12 (BitStream!1080) Bool)

(assert (=> start!5130 (and (inv!12 thiss!1379) e!13773)))

(declare-fun b!20486 () Bool)

(declare-fun e!13771 () Bool)

(declare-fun e!13772 () Bool)

(assert (=> b!20486 (= e!13771 e!13772)))

(declare-fun res!17793 () Bool)

(assert (=> b!20486 (=> res!17793 e!13772)))

(declare-fun isPrefixOf!0 (BitStream!1080 BitStream!1080) Bool)

(assert (=> b!20486 (= res!17793 (not (isPrefixOf!0 thiss!1379 (_2!1285 lt!29190))))))

(assert (=> b!20486 (validate_offset_bits!1 ((_ sign_extend 32) (size!623 (buf!932 (_2!1285 lt!29190)))) ((_ sign_extend 32) (currentByte!2221 (_2!1285 lt!29190))) ((_ sign_extend 32) (currentBit!2216 (_2!1285 lt!29190))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29188 () Unit!1799)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1080 BitStream!1080 (_ BitVec 64) (_ BitVec 64)) Unit!1799)

(assert (=> b!20486 (= lt!29188 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1285 lt!29190) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1080 (_ BitVec 8) (_ BitVec 32)) tuple2!2400)

(assert (=> b!20486 (= lt!29190 (appendBitFromByte!0 thiss!1379 (select (arr!1067 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!20487 () Bool)

(assert (=> b!20487 (= e!13769 (not e!13771))))

(declare-fun res!17795 () Bool)

(assert (=> b!20487 (=> res!17795 e!13771)))

(assert (=> b!20487 (= res!17795 (bvsge i!635 to!314))))

(assert (=> b!20487 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!29191 () Unit!1799)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1080) Unit!1799)

(assert (=> b!20487 (= lt!29191 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!29189 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!20487 (= lt!29189 (bitIndex!0 (size!623 (buf!932 thiss!1379)) (currentByte!2221 thiss!1379) (currentBit!2216 thiss!1379)))))

(declare-fun b!20488 () Bool)

(assert (=> b!20488 (= e!13772 (or (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314))))))

(assert (=> b!20488 e!13768))

(declare-fun res!17794 () Bool)

(assert (=> b!20488 (=> (not res!17794) (not e!13768))))

(assert (=> b!20488 (= res!17794 (validate_offset_bits!1 ((_ sign_extend 32) (size!623 (buf!932 (_2!1285 lt!29190)))) ((_ sign_extend 32) (currentByte!2221 thiss!1379)) ((_ sign_extend 32) (currentBit!2216 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!29186 () Unit!1799)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1080 array!1465 (_ BitVec 64)) Unit!1799)

(assert (=> b!20488 (= lt!29186 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!932 (_2!1285 lt!29190)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun reader!0 (BitStream!1080 BitStream!1080) tuple2!2402)

(assert (=> b!20488 (= lt!29187 (reader!0 thiss!1379 (_2!1285 lt!29190)))))

(declare-fun b!20489 () Bool)

(assert (=> b!20489 (= e!13773 (array_inv!593 (buf!932 thiss!1379)))))

(assert (= (and start!5130 res!17792) b!20485))

(assert (= (and b!20485 res!17791) b!20487))

(assert (= (and b!20487 (not res!17795)) b!20486))

(assert (= (and b!20486 (not res!17793)) b!20488))

(assert (= (and b!20488 res!17794) b!20484))

(assert (= start!5130 b!20489))

(declare-fun m!27815 () Bool)

(assert (=> b!20484 m!27815))

(assert (=> b!20484 m!27815))

(declare-fun m!27817 () Bool)

(assert (=> b!20484 m!27817))

(declare-fun m!27819 () Bool)

(assert (=> b!20484 m!27819))

(assert (=> b!20484 m!27819))

(declare-fun m!27821 () Bool)

(assert (=> b!20484 m!27821))

(declare-fun m!27823 () Bool)

(assert (=> b!20485 m!27823))

(declare-fun m!27825 () Bool)

(assert (=> b!20487 m!27825))

(declare-fun m!27827 () Bool)

(assert (=> b!20487 m!27827))

(declare-fun m!27829 () Bool)

(assert (=> b!20487 m!27829))

(declare-fun m!27831 () Bool)

(assert (=> b!20489 m!27831))

(declare-fun m!27833 () Bool)

(assert (=> b!20486 m!27833))

(declare-fun m!27835 () Bool)

(assert (=> b!20486 m!27835))

(declare-fun m!27837 () Bool)

(assert (=> b!20486 m!27837))

(declare-fun m!27839 () Bool)

(assert (=> b!20486 m!27839))

(assert (=> b!20486 m!27833))

(declare-fun m!27841 () Bool)

(assert (=> b!20486 m!27841))

(declare-fun m!27843 () Bool)

(assert (=> start!5130 m!27843))

(declare-fun m!27845 () Bool)

(assert (=> start!5130 m!27845))

(declare-fun m!27847 () Bool)

(assert (=> b!20488 m!27847))

(declare-fun m!27849 () Bool)

(assert (=> b!20488 m!27849))

(declare-fun m!27851 () Bool)

(assert (=> b!20488 m!27851))

(check-sat (not b!20484) (not b!20485) (not start!5130) (not b!20486) (not b!20489) (not b!20487) (not b!20488))
(check-sat)
