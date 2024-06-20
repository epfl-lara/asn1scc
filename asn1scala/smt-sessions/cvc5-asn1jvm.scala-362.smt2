; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8386 () Bool)

(assert start!8386)

(declare-fun res!35686 () Bool)

(declare-fun e!27930 () Bool)

(assert (=> start!8386 (=> (not res!35686) (not e!27930))))

(declare-datatypes ((array!2138 0))(
  ( (array!2139 (arr!1466 (Array (_ BitVec 32) (_ BitVec 8))) (size!967 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2138)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8386 (= res!35686 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!967 srcBuffer!2))))))))

(assert (=> start!8386 e!27930))

(assert (=> start!8386 true))

(declare-fun array_inv!892 (array!2138) Bool)

(assert (=> start!8386 (array_inv!892 srcBuffer!2)))

(declare-datatypes ((BitStream!1678 0))(
  ( (BitStream!1679 (buf!1295 array!2138) (currentByte!2747 (_ BitVec 32)) (currentBit!2742 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1678)

(declare-fun e!27926 () Bool)

(declare-fun inv!12 (BitStream!1678) Bool)

(assert (=> start!8386 (and (inv!12 thiss!1379) e!27926)))

(declare-fun b!41957 () Bool)

(declare-fun res!35687 () Bool)

(assert (=> b!41957 (=> (not res!35687) (not e!27930))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41957 (= res!35687 (validate_offset_bits!1 ((_ sign_extend 32) (size!967 (buf!1295 thiss!1379))) ((_ sign_extend 32) (currentByte!2747 thiss!1379)) ((_ sign_extend 32) (currentBit!2742 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!41958 () Bool)

(declare-fun res!35685 () Bool)

(declare-fun e!27931 () Bool)

(assert (=> b!41958 (=> res!35685 e!27931)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41958 (= res!35685 (not (invariant!0 (currentBit!2742 thiss!1379) (currentByte!2747 thiss!1379) (size!967 (buf!1295 thiss!1379)))))))

(declare-fun b!41959 () Bool)

(assert (=> b!41959 (= e!27930 (not e!27931))))

(declare-fun res!35688 () Bool)

(assert (=> b!41959 (=> res!35688 e!27931)))

(declare-fun lt!63148 () (_ BitVec 64))

(assert (=> b!41959 (= res!35688 (or (bvslt i!635 to!314) (not (= lt!63148 (bvsub (bvadd lt!63148 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1678 BitStream!1678) Bool)

(assert (=> b!41959 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2985 0))(
  ( (Unit!2986) )
))
(declare-fun lt!63149 () Unit!2985)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1678) Unit!2985)

(assert (=> b!41959 (= lt!63149 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41959 (= lt!63148 (bitIndex!0 (size!967 (buf!1295 thiss!1379)) (currentByte!2747 thiss!1379) (currentBit!2742 thiss!1379)))))

(declare-fun b!41960 () Bool)

(assert (=> b!41960 (= e!27926 (array_inv!892 (buf!1295 thiss!1379)))))

(declare-fun b!41961 () Bool)

(declare-fun e!27927 () Bool)

(assert (=> b!41961 (= e!27927 true)))

(declare-fun lt!63150 () Unit!2985)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1678 array!2138 (_ BitVec 64)) Unit!2985)

(assert (=> b!41961 (= lt!63150 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1295 thiss!1379) (bvsub to!314 i!635)))))

(declare-datatypes ((tuple2!4090 0))(
  ( (tuple2!4091 (_1!2135 array!2138) (_2!2135 BitStream!1678)) )
))
(declare-fun lt!63151 () tuple2!4090)

(declare-fun checkByteArrayBitContent!0 (BitStream!1678 array!2138 array!2138 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41961 (checkByteArrayBitContent!0 thiss!1379 srcBuffer!2 (_1!2135 lt!63151) i!635 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 i!635))))

(declare-fun b!41962 () Bool)

(assert (=> b!41962 (= e!27931 e!27927)))

(declare-fun res!35684 () Bool)

(assert (=> b!41962 (=> res!35684 e!27927)))

(assert (=> b!41962 (= res!35684 (not (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun readBits!0 (BitStream!1678 (_ BitVec 64)) tuple2!4090)

(declare-datatypes ((tuple2!4092 0))(
  ( (tuple2!4093 (_1!2136 BitStream!1678) (_2!2136 BitStream!1678)) )
))
(declare-fun reader!0 (BitStream!1678 BitStream!1678) tuple2!4092)

(assert (=> b!41962 (= lt!63151 (readBits!0 (_1!2136 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8386 res!35686) b!41957))

(assert (= (and b!41957 res!35687) b!41959))

(assert (= (and b!41959 (not res!35688)) b!41958))

(assert (= (and b!41958 (not res!35685)) b!41962))

(assert (= (and b!41962 (not res!35684)) b!41961))

(assert (= start!8386 b!41960))

(declare-fun m!63757 () Bool)

(assert (=> b!41958 m!63757))

(declare-fun m!63759 () Bool)

(assert (=> b!41960 m!63759))

(declare-fun m!63761 () Bool)

(assert (=> b!41961 m!63761))

(declare-fun m!63763 () Bool)

(assert (=> b!41961 m!63763))

(declare-fun m!63765 () Bool)

(assert (=> b!41962 m!63765))

(declare-fun m!63767 () Bool)

(assert (=> b!41962 m!63767))

(declare-fun m!63769 () Bool)

(assert (=> start!8386 m!63769))

(declare-fun m!63771 () Bool)

(assert (=> start!8386 m!63771))

(declare-fun m!63773 () Bool)

(assert (=> b!41957 m!63773))

(declare-fun m!63775 () Bool)

(assert (=> b!41959 m!63775))

(declare-fun m!63777 () Bool)

(assert (=> b!41959 m!63777))

(declare-fun m!63779 () Bool)

(assert (=> b!41959 m!63779))

(push 1)

