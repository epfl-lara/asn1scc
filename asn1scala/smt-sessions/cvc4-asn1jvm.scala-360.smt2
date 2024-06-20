; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8378 () Bool)

(assert start!8378)

(declare-fun res!35625 () Bool)

(declare-fun e!27855 () Bool)

(assert (=> start!8378 (=> (not res!35625) (not e!27855))))

(declare-datatypes ((array!2130 0))(
  ( (array!2131 (arr!1462 (Array (_ BitVec 32) (_ BitVec 8))) (size!963 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2130)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8378 (= res!35625 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!963 srcBuffer!2))))))))

(assert (=> start!8378 e!27855))

(assert (=> start!8378 true))

(declare-fun array_inv!888 (array!2130) Bool)

(assert (=> start!8378 (array_inv!888 srcBuffer!2)))

(declare-datatypes ((BitStream!1670 0))(
  ( (BitStream!1671 (buf!1291 array!2130) (currentByte!2743 (_ BitVec 32)) (currentBit!2738 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1670)

(declare-fun e!27854 () Bool)

(declare-fun inv!12 (BitStream!1670) Bool)

(assert (=> start!8378 (and (inv!12 thiss!1379) e!27854)))

(declare-fun b!41885 () Bool)

(declare-fun res!35627 () Bool)

(declare-fun e!27856 () Bool)

(assert (=> b!41885 (=> res!35627 e!27856)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41885 (= res!35627 (not (invariant!0 (currentBit!2738 thiss!1379) (currentByte!2743 thiss!1379) (size!963 (buf!1291 thiss!1379)))))))

(declare-fun b!41886 () Bool)

(assert (=> b!41886 (= e!27855 (not e!27856))))

(declare-fun res!35624 () Bool)

(assert (=> b!41886 (=> res!35624 e!27856)))

(declare-fun lt!63110 () (_ BitVec 64))

(assert (=> b!41886 (= res!35624 (or (bvslt i!635 to!314) (not (= lt!63110 (bvsub (bvadd lt!63110 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1670 BitStream!1670) Bool)

(assert (=> b!41886 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2977 0))(
  ( (Unit!2978) )
))
(declare-fun lt!63112 () Unit!2977)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1670) Unit!2977)

(assert (=> b!41886 (= lt!63112 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41886 (= lt!63110 (bitIndex!0 (size!963 (buf!1291 thiss!1379)) (currentByte!2743 thiss!1379) (currentBit!2738 thiss!1379)))))

(declare-fun b!41887 () Bool)

(declare-fun e!27858 () Bool)

(assert (=> b!41887 (= e!27858 true)))

(declare-datatypes ((tuple2!4074 0))(
  ( (tuple2!4075 (_1!2127 array!2130) (_2!2127 BitStream!1670)) )
))
(declare-fun lt!63111 () tuple2!4074)

(declare-fun checkByteArrayBitContent!0 (BitStream!1670 array!2130 array!2130 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41887 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2127 lt!63111) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!41888 () Bool)

(declare-fun res!35626 () Bool)

(assert (=> b!41888 (=> (not res!35626) (not e!27855))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41888 (= res!35626 (validate_offset_bits!1 ((_ sign_extend 32) (size!963 (buf!1291 thiss!1379))) ((_ sign_extend 32) (currentByte!2743 thiss!1379)) ((_ sign_extend 32) (currentBit!2738 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41889 () Bool)

(assert (=> b!41889 (= e!27854 (array_inv!888 (buf!1291 thiss!1379)))))

(declare-fun b!41890 () Bool)

(assert (=> b!41890 (= e!27856 e!27858)))

(declare-fun res!35628 () Bool)

(assert (=> b!41890 (=> res!35628 e!27858)))

(assert (=> b!41890 (= res!35628 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1670 (_ BitVec 64)) tuple2!4074)

(declare-datatypes ((tuple2!4076 0))(
  ( (tuple2!4077 (_1!2128 BitStream!1670) (_2!2128 BitStream!1670)) )
))
(declare-fun reader!0 (BitStream!1670 BitStream!1670) tuple2!4076)

(assert (=> b!41890 (= lt!63111 (readBits!0 (_1!2128 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8378 res!35625) b!41888))

(assert (= (and b!41888 res!35626) b!41886))

(assert (= (and b!41886 (not res!35624)) b!41885))

(assert (= (and b!41885 (not res!35627)) b!41890))

(assert (= (and b!41890 (not res!35628)) b!41887))

(assert (= start!8378 b!41889))

(declare-fun m!63669 () Bool)

(assert (=> start!8378 m!63669))

(declare-fun m!63671 () Bool)

(assert (=> start!8378 m!63671))

(declare-fun m!63673 () Bool)

(assert (=> b!41885 m!63673))

(declare-fun m!63675 () Bool)

(assert (=> b!41886 m!63675))

(declare-fun m!63677 () Bool)

(assert (=> b!41886 m!63677))

(declare-fun m!63679 () Bool)

(assert (=> b!41886 m!63679))

(declare-fun m!63681 () Bool)

(assert (=> b!41888 m!63681))

(declare-fun m!63683 () Bool)

(assert (=> b!41889 m!63683))

(declare-fun m!63685 () Bool)

(assert (=> b!41887 m!63685))

(declare-fun m!63687 () Bool)

(assert (=> b!41890 m!63687))

(declare-fun m!63689 () Bool)

(assert (=> b!41890 m!63689))

(push 1)

(assert (not b!41886))

(assert (not b!41890))

(assert (not b!41885))

(assert (not b!41887))

(assert (not b!41888))

(assert (not b!41889))

(assert (not start!8378))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

