; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8194 () Bool)

(assert start!8194)

(declare-fun res!34893 () Bool)

(declare-fun e!27087 () Bool)

(assert (=> start!8194 (=> (not res!34893) (not e!27087))))

(declare-datatypes ((array!2042 0))(
  ( (array!2043 (arr!1421 (Array (_ BitVec 32) (_ BitVec 8))) (size!922 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2042)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!8194 (= res!34893 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!922 srcBuffer!2))))))))

(assert (=> start!8194 e!27087))

(assert (=> start!8194 true))

(declare-fun array_inv!847 (array!2042) Bool)

(assert (=> start!8194 (array_inv!847 srcBuffer!2)))

(declare-datatypes ((BitStream!1588 0))(
  ( (BitStream!1589 (buf!1250 array!2042) (currentByte!2684 (_ BitVec 32)) (currentBit!2679 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1588)

(declare-fun e!27090 () Bool)

(declare-fun inv!12 (BitStream!1588) Bool)

(assert (=> start!8194 (and (inv!12 thiss!1379) e!27090)))

(declare-fun b!40992 () Bool)

(assert (=> b!40992 (= e!27090 (array_inv!847 (buf!1250 thiss!1379)))))

(declare-fun b!40993 () Bool)

(declare-fun e!27089 () Bool)

(assert (=> b!40993 (= e!27087 (not e!27089))))

(declare-fun res!34891 () Bool)

(assert (=> b!40993 (=> res!34891 e!27089)))

(declare-fun lt!62176 () (_ BitVec 64))

(assert (=> b!40993 (= res!34891 (or (bvslt i!635 to!314) (not (= lt!62176 (bvsub (bvadd lt!62176 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1588 BitStream!1588) Bool)

(assert (=> b!40993 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2889 0))(
  ( (Unit!2890) )
))
(declare-fun lt!62174 () Unit!2889)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1588) Unit!2889)

(assert (=> b!40993 (= lt!62174 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!40993 (= lt!62176 (bitIndex!0 (size!922 (buf!1250 thiss!1379)) (currentByte!2684 thiss!1379) (currentBit!2679 thiss!1379)))))

(declare-fun b!40994 () Bool)

(declare-fun res!34892 () Bool)

(assert (=> b!40994 (=> (not res!34892) (not e!27087))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!40994 (= res!34892 (validate_offset_bits!1 ((_ sign_extend 32) (size!922 (buf!1250 thiss!1379))) ((_ sign_extend 32) (currentByte!2684 thiss!1379)) ((_ sign_extend 32) (currentBit!2679 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!40995 () Bool)

(declare-fun res!34890 () Bool)

(assert (=> b!40995 (=> res!34890 e!27089)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!40995 (= res!34890 (not (invariant!0 (currentBit!2679 thiss!1379) (currentByte!2684 thiss!1379) (size!922 (buf!1250 thiss!1379)))))))

(declare-fun b!40996 () Bool)

(assert (=> b!40996 (= e!27089 (bvsle (bvsub to!314 i!635) #b0000000000000000000000000000001111111111111111111111111111111000))))

(declare-datatypes ((tuple2!3922 0))(
  ( (tuple2!3923 (_1!2048 BitStream!1588) (_2!2048 BitStream!1588)) )
))
(declare-fun lt!62175 () tuple2!3922)

(declare-fun reader!0 (BitStream!1588 BitStream!1588) tuple2!3922)

(assert (=> b!40996 (= lt!62175 (reader!0 thiss!1379 thiss!1379))))

(assert (= (and start!8194 res!34893) b!40994))

(assert (= (and b!40994 res!34892) b!40993))

(assert (= (and b!40993 (not res!34891)) b!40995))

(assert (= (and b!40995 (not res!34890)) b!40996))

(assert (= start!8194 b!40992))

(declare-fun m!62629 () Bool)

(assert (=> b!40993 m!62629))

(declare-fun m!62631 () Bool)

(assert (=> b!40993 m!62631))

(declare-fun m!62633 () Bool)

(assert (=> b!40993 m!62633))

(declare-fun m!62635 () Bool)

(assert (=> start!8194 m!62635))

(declare-fun m!62637 () Bool)

(assert (=> start!8194 m!62637))

(declare-fun m!62639 () Bool)

(assert (=> b!40996 m!62639))

(declare-fun m!62641 () Bool)

(assert (=> b!40995 m!62641))

(declare-fun m!62643 () Bool)

(assert (=> b!40992 m!62643))

(declare-fun m!62645 () Bool)

(assert (=> b!40994 m!62645))

(push 1)

(assert (not b!40996))

(assert (not b!40994))

(assert (not b!40993))

(assert (not b!40992))

(assert (not start!8194))

(assert (not b!40995))

(check-sat)

(pop 1)

(push 1)

(check-sat)

