; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8188 () Bool)

(assert start!8188)

(declare-fun res!34868 () Bool)

(declare-fun e!27052 () Bool)

(assert (=> start!8188 (=> (not res!34868) (not e!27052))))

(declare-datatypes ((array!2036 0))(
  ( (array!2037 (arr!1418 (Array (_ BitVec 32) (_ BitVec 8))) (size!919 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2036)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8188 (= res!34868 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!919 srcBuffer!2))))))))

(assert (=> start!8188 e!27052))

(assert (=> start!8188 true))

(declare-fun array_inv!844 (array!2036) Bool)

(assert (=> start!8188 (array_inv!844 srcBuffer!2)))

(declare-datatypes ((BitStream!1582 0))(
  ( (BitStream!1583 (buf!1247 array!2036) (currentByte!2681 (_ BitVec 32)) (currentBit!2676 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1582)

(declare-fun e!27050 () Bool)

(declare-fun inv!12 (BitStream!1582) Bool)

(assert (=> start!8188 (and (inv!12 thiss!1379) e!27050)))

(declare-fun b!40961 () Bool)

(declare-fun res!34869 () Bool)

(assert (=> b!40961 (=> (not res!34869) (not e!27052))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40961 (= res!34869 (validate_offset_bits!1 ((_ sign_extend 32) (size!919 (buf!1247 thiss!1379))) ((_ sign_extend 32) (currentByte!2681 thiss!1379)) ((_ sign_extend 32) (currentBit!2676 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!40962 () Bool)

(assert (=> b!40962 (= e!27052 (not true))))

(declare-fun isPrefixOf!0 (BitStream!1582 BitStream!1582) Bool)

(assert (=> b!40962 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2883 0))(
  ( (Unit!2884) )
))
(declare-fun lt!62154 () Unit!2883)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1582) Unit!2883)

(assert (=> b!40962 (= lt!62154 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!62155 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!40962 (= lt!62155 (bitIndex!0 (size!919 (buf!1247 thiss!1379)) (currentByte!2681 thiss!1379) (currentBit!2676 thiss!1379)))))

(declare-fun b!40963 () Bool)

(assert (=> b!40963 (= e!27050 (array_inv!844 (buf!1247 thiss!1379)))))

(assert (= (and start!8188 res!34868) b!40961))

(assert (= (and b!40961 res!34869) b!40962))

(assert (= start!8188 b!40963))

(declare-fun m!62587 () Bool)

(assert (=> start!8188 m!62587))

(declare-fun m!62589 () Bool)

(assert (=> start!8188 m!62589))

(declare-fun m!62591 () Bool)

(assert (=> b!40961 m!62591))

(declare-fun m!62593 () Bool)

(assert (=> b!40962 m!62593))

(declare-fun m!62595 () Bool)

(assert (=> b!40962 m!62595))

(declare-fun m!62597 () Bool)

(assert (=> b!40962 m!62597))

(declare-fun m!62599 () Bool)

(assert (=> b!40963 m!62599))

(push 1)

(assert (not b!40961))

(assert (not start!8188))

(assert (not b!40962))

(assert (not b!40963))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

