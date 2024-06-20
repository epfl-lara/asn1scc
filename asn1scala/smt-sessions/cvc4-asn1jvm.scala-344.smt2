; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8100 () Bool)

(assert start!8100)

(declare-fun res!34745 () Bool)

(declare-fun e!26940 () Bool)

(assert (=> start!8100 (=> (not res!34745) (not e!26940))))

(declare-datatypes ((array!2022 0))(
  ( (array!2023 (arr!1414 (Array (_ BitVec 32) (_ BitVec 8))) (size!915 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2022)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8100 (= res!34745 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!915 srcBuffer!2))))))))

(assert (=> start!8100 e!26940))

(assert (=> start!8100 true))

(declare-fun array_inv!840 (array!2022) Bool)

(assert (=> start!8100 (array_inv!840 srcBuffer!2)))

(declare-datatypes ((BitStream!1574 0))(
  ( (BitStream!1575 (buf!1243 array!2022) (currentByte!2661 (_ BitVec 32)) (currentBit!2656 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1574)

(declare-fun e!26941 () Bool)

(declare-fun inv!12 (BitStream!1574) Bool)

(assert (=> start!8100 (and (inv!12 thiss!1379) e!26941)))

(declare-fun b!40826 () Bool)

(declare-fun e!26939 () Bool)

(assert (=> b!40826 (= e!26940 (not e!26939))))

(declare-fun res!34746 () Bool)

(assert (=> b!40826 (=> res!34746 e!26939)))

(assert (=> b!40826 (= res!34746 (bvslt i!635 to!314))))

(declare-fun isPrefixOf!0 (BitStream!1574 BitStream!1574) Bool)

(assert (=> b!40826 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2875 0))(
  ( (Unit!2876) )
))
(declare-fun lt!62005 () Unit!2875)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1574) Unit!2875)

(assert (=> b!40826 (= lt!62005 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!62004 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!40826 (= lt!62004 (bitIndex!0 (size!915 (buf!1243 thiss!1379)) (currentByte!2661 thiss!1379) (currentBit!2656 thiss!1379)))))

(declare-fun b!40825 () Bool)

(declare-fun res!34744 () Bool)

(assert (=> b!40825 (=> (not res!34744) (not e!26940))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40825 (= res!34744 (validate_offset_bits!1 ((_ sign_extend 32) (size!915 (buf!1243 thiss!1379))) ((_ sign_extend 32) (currentByte!2661 thiss!1379)) ((_ sign_extend 32) (currentBit!2656 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!40827 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!40827 (= e!26939 (invariant!0 (currentBit!2656 thiss!1379) (currentByte!2661 thiss!1379) (size!915 (buf!1243 thiss!1379))))))

(declare-fun b!40828 () Bool)

(assert (=> b!40828 (= e!26941 (array_inv!840 (buf!1243 thiss!1379)))))

(assert (= (and start!8100 res!34745) b!40825))

(assert (= (and b!40825 res!34744) b!40826))

(assert (= (and b!40826 (not res!34746)) b!40827))

(assert (= start!8100 b!40828))

(declare-fun m!62489 () Bool)

(assert (=> b!40825 m!62489))

(declare-fun m!62491 () Bool)

(assert (=> start!8100 m!62491))

(declare-fun m!62493 () Bool)

(assert (=> start!8100 m!62493))

(declare-fun m!62495 () Bool)

(assert (=> b!40827 m!62495))

(declare-fun m!62497 () Bool)

(assert (=> b!40828 m!62497))

(declare-fun m!62499 () Bool)

(assert (=> b!40826 m!62499))

(declare-fun m!62501 () Bool)

(assert (=> b!40826 m!62501))

(declare-fun m!62503 () Bool)

(assert (=> b!40826 m!62503))

(push 1)

(assert (not b!40825))

(assert (not start!8100))

(assert (not b!40828))

(assert (not b!40827))

(assert (not b!40826))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

