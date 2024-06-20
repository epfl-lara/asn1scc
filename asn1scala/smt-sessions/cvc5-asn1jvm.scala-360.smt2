; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8374 () Bool)

(assert start!8374)

(declare-fun res!35597 () Bool)

(declare-fun e!27823 () Bool)

(assert (=> start!8374 (=> (not res!35597) (not e!27823))))

(declare-datatypes ((array!2126 0))(
  ( (array!2127 (arr!1460 (Array (_ BitVec 32) (_ BitVec 8))) (size!961 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2126)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8374 (= res!35597 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!961 srcBuffer!2))))))))

(assert (=> start!8374 e!27823))

(assert (=> start!8374 true))

(declare-fun array_inv!886 (array!2126) Bool)

(assert (=> start!8374 (array_inv!886 srcBuffer!2)))

(declare-datatypes ((BitStream!1666 0))(
  ( (BitStream!1667 (buf!1289 array!2126) (currentByte!2741 (_ BitVec 32)) (currentBit!2736 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1666)

(declare-fun e!27819 () Bool)

(declare-fun inv!12 (BitStream!1666) Bool)

(assert (=> start!8374 (and (inv!12 thiss!1379) e!27819)))

(declare-fun b!41849 () Bool)

(assert (=> b!41849 (= e!27819 (array_inv!886 (buf!1289 thiss!1379)))))

(declare-fun b!41850 () Bool)

(declare-fun res!35595 () Bool)

(declare-fun e!27822 () Bool)

(assert (=> b!41850 (=> res!35595 e!27822)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41850 (= res!35595 (not (invariant!0 (currentBit!2736 thiss!1379) (currentByte!2741 thiss!1379) (size!961 (buf!1289 thiss!1379)))))))

(declare-fun b!41851 () Bool)

(declare-fun e!27820 () Bool)

(assert (=> b!41851 (= e!27820 true)))

(declare-datatypes ((tuple2!4066 0))(
  ( (tuple2!4067 (_1!2123 array!2126) (_2!2123 BitStream!1666)) )
))
(declare-fun lt!63093 () tuple2!4066)

(declare-fun checkByteArrayBitContent!0 (BitStream!1666 array!2126 array!2126 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41851 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2123 lt!63093) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!41852 () Bool)

(assert (=> b!41852 (= e!27823 (not e!27822))))

(declare-fun res!35596 () Bool)

(assert (=> b!41852 (=> res!35596 e!27822)))

(declare-fun lt!63092 () (_ BitVec 64))

(assert (=> b!41852 (= res!35596 (or (bvslt i!635 to!314) (not (= lt!63092 (bvsub (bvadd lt!63092 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1666 BitStream!1666) Bool)

(assert (=> b!41852 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2973 0))(
  ( (Unit!2974) )
))
(declare-fun lt!63094 () Unit!2973)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1666) Unit!2973)

(assert (=> b!41852 (= lt!63094 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41852 (= lt!63092 (bitIndex!0 (size!961 (buf!1289 thiss!1379)) (currentByte!2741 thiss!1379) (currentBit!2736 thiss!1379)))))

(declare-fun b!41853 () Bool)

(assert (=> b!41853 (= e!27822 e!27820)))

(declare-fun res!35598 () Bool)

(assert (=> b!41853 (=> res!35598 e!27820)))

(assert (=> b!41853 (= res!35598 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1666 (_ BitVec 64)) tuple2!4066)

(declare-datatypes ((tuple2!4068 0))(
  ( (tuple2!4069 (_1!2124 BitStream!1666) (_2!2124 BitStream!1666)) )
))
(declare-fun reader!0 (BitStream!1666 BitStream!1666) tuple2!4068)

(assert (=> b!41853 (= lt!63093 (readBits!0 (_1!2124 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41854 () Bool)

(declare-fun res!35594 () Bool)

(assert (=> b!41854 (=> (not res!35594) (not e!27823))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41854 (= res!35594 (validate_offset_bits!1 ((_ sign_extend 32) (size!961 (buf!1289 thiss!1379))) ((_ sign_extend 32) (currentByte!2741 thiss!1379)) ((_ sign_extend 32) (currentBit!2736 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8374 res!35597) b!41854))

(assert (= (and b!41854 res!35594) b!41852))

(assert (= (and b!41852 (not res!35596)) b!41850))

(assert (= (and b!41850 (not res!35595)) b!41853))

(assert (= (and b!41853 (not res!35598)) b!41851))

(assert (= start!8374 b!41849))

(declare-fun m!63625 () Bool)

(assert (=> b!41851 m!63625))

(declare-fun m!63627 () Bool)

(assert (=> b!41849 m!63627))

(declare-fun m!63629 () Bool)

(assert (=> start!8374 m!63629))

(declare-fun m!63631 () Bool)

(assert (=> start!8374 m!63631))

(declare-fun m!63633 () Bool)

(assert (=> b!41852 m!63633))

(declare-fun m!63635 () Bool)

(assert (=> b!41852 m!63635))

(declare-fun m!63637 () Bool)

(assert (=> b!41852 m!63637))

(declare-fun m!63639 () Bool)

(assert (=> b!41850 m!63639))

(declare-fun m!63641 () Bool)

(assert (=> b!41853 m!63641))

(declare-fun m!63643 () Bool)

(assert (=> b!41853 m!63643))

(declare-fun m!63645 () Bool)

(assert (=> b!41854 m!63645))

(push 1)

(assert (not b!41852))

(assert (not b!41854))

(assert (not b!41849))

(assert (not b!41851))

(assert (not b!41853))

(assert (not b!41850))

(assert (not start!8374))

(check-sat)

