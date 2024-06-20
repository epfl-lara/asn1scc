; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8254 () Bool)

(assert start!8254)

(declare-fun b!41181 () Bool)

(declare-fun e!27232 () Bool)

(declare-datatypes ((array!2057 0))(
  ( (array!2058 (arr!1427 (Array (_ BitVec 32) (_ BitVec 8))) (size!928 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1600 0))(
  ( (BitStream!1601 (buf!1256 array!2057) (currentByte!2699 (_ BitVec 32)) (currentBit!2694 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1600)

(declare-fun array_inv!853 (array!2057) Bool)

(assert (=> b!41181 (= e!27232 (array_inv!853 (buf!1256 thiss!1379)))))

(declare-fun b!41182 () Bool)

(declare-fun e!27233 () Bool)

(declare-fun e!27231 () Bool)

(assert (=> b!41182 (= e!27233 (not e!27231))))

(declare-fun res!35045 () Bool)

(assert (=> b!41182 (=> res!35045 e!27231)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun lt!62473 () (_ BitVec 64))

(assert (=> b!41182 (= res!35045 (or (bvslt i!635 to!314) (not (= lt!62473 (bvsub (bvadd lt!62473 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1600 BitStream!1600) Bool)

(assert (=> b!41182 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2904 0))(
  ( (Unit!2905) )
))
(declare-fun lt!62472 () Unit!2904)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1600) Unit!2904)

(assert (=> b!41182 (= lt!62472 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41182 (= lt!62473 (bitIndex!0 (size!928 (buf!1256 thiss!1379)) (currentByte!2699 thiss!1379) (currentBit!2694 thiss!1379)))))

(declare-fun b!41183 () Bool)

(declare-fun res!35043 () Bool)

(assert (=> b!41183 (=> res!35043 e!27231)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41183 (= res!35043 (not (invariant!0 (currentBit!2694 thiss!1379) (currentByte!2699 thiss!1379) (size!928 (buf!1256 thiss!1379)))))))

(declare-fun b!41184 () Bool)

(declare-fun res!35046 () Bool)

(assert (=> b!41184 (=> (not res!35046) (not e!27233))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41184 (= res!35046 (validate_offset_bits!1 ((_ sign_extend 32) (size!928 (buf!1256 thiss!1379))) ((_ sign_extend 32) (currentByte!2699 thiss!1379)) ((_ sign_extend 32) (currentBit!2694 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!35044 () Bool)

(assert (=> start!8254 (=> (not res!35044) (not e!27233))))

(declare-fun srcBuffer!2 () array!2057)

(assert (=> start!8254 (= res!35044 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!928 srcBuffer!2))))))))

(assert (=> start!8254 e!27233))

(assert (=> start!8254 true))

(assert (=> start!8254 (array_inv!853 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1600) Bool)

(assert (=> start!8254 (and (inv!12 thiss!1379) e!27232)))

(declare-fun b!41185 () Bool)

(assert (=> b!41185 (= e!27231 true)))

(declare-datatypes ((tuple2!3934 0))(
  ( (tuple2!3935 (_1!2054 array!2057) (_2!2054 BitStream!1600)) )
))
(declare-fun lt!62471 () tuple2!3934)

(declare-fun readBits!0 (BitStream!1600 (_ BitVec 64)) tuple2!3934)

(declare-datatypes ((tuple2!3936 0))(
  ( (tuple2!3937 (_1!2055 BitStream!1600) (_2!2055 BitStream!1600)) )
))
(declare-fun reader!0 (BitStream!1600 BitStream!1600) tuple2!3936)

(assert (=> b!41185 (= lt!62471 (readBits!0 (_1!2055 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8254 res!35044) b!41184))

(assert (= (and b!41184 res!35046) b!41182))

(assert (= (and b!41182 (not res!35045)) b!41183))

(assert (= (and b!41183 (not res!35043)) b!41185))

(assert (= start!8254 b!41181))

(declare-fun m!62827 () Bool)

(assert (=> b!41183 m!62827))

(declare-fun m!62829 () Bool)

(assert (=> start!8254 m!62829))

(declare-fun m!62831 () Bool)

(assert (=> start!8254 m!62831))

(declare-fun m!62833 () Bool)

(assert (=> b!41184 m!62833))

(declare-fun m!62835 () Bool)

(assert (=> b!41185 m!62835))

(declare-fun m!62837 () Bool)

(assert (=> b!41185 m!62837))

(declare-fun m!62839 () Bool)

(assert (=> b!41182 m!62839))

(declare-fun m!62841 () Bool)

(assert (=> b!41182 m!62841))

(declare-fun m!62843 () Bool)

(assert (=> b!41182 m!62843))

(declare-fun m!62845 () Bool)

(assert (=> b!41181 m!62845))

(push 1)

(assert (not b!41181))

(assert (not b!41182))

(assert (not start!8254))

(assert (not b!41183))

(assert (not b!41185))

(assert (not b!41184))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

