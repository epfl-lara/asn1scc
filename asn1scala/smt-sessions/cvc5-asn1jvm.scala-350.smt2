; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8260 () Bool)

(assert start!8260)

(declare-fun b!41226 () Bool)

(declare-fun res!35082 () Bool)

(declare-fun e!27277 () Bool)

(assert (=> b!41226 (=> res!35082 e!27277)))

(declare-datatypes ((array!2063 0))(
  ( (array!2064 (arr!1430 (Array (_ BitVec 32) (_ BitVec 8))) (size!931 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1606 0))(
  ( (BitStream!1607 (buf!1259 array!2063) (currentByte!2702 (_ BitVec 32)) (currentBit!2697 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1606)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!41226 (= res!35082 (not (invariant!0 (currentBit!2697 thiss!1379) (currentByte!2702 thiss!1379) (size!931 (buf!1259 thiss!1379)))))))

(declare-fun b!41227 () Bool)

(declare-fun res!35079 () Bool)

(declare-fun e!27279 () Bool)

(assert (=> b!41227 (=> (not res!35079) (not e!27279))))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!41227 (= res!35079 (validate_offset_bits!1 ((_ sign_extend 32) (size!931 (buf!1259 thiss!1379))) ((_ sign_extend 32) (currentByte!2702 thiss!1379)) ((_ sign_extend 32) (currentBit!2697 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun res!35080 () Bool)

(assert (=> start!8260 (=> (not res!35080) (not e!27279))))

(declare-fun srcBuffer!2 () array!2063)

(assert (=> start!8260 (= res!35080 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!931 srcBuffer!2))))))))

(assert (=> start!8260 e!27279))

(assert (=> start!8260 true))

(declare-fun array_inv!856 (array!2063) Bool)

(assert (=> start!8260 (array_inv!856 srcBuffer!2)))

(declare-fun e!27276 () Bool)

(declare-fun inv!12 (BitStream!1606) Bool)

(assert (=> start!8260 (and (inv!12 thiss!1379) e!27276)))

(declare-fun b!41228 () Bool)

(assert (=> b!41228 (= e!27276 (array_inv!856 (buf!1259 thiss!1379)))))

(declare-fun b!41229 () Bool)

(assert (=> b!41229 (= e!27279 (not e!27277))))

(declare-fun res!35081 () Bool)

(assert (=> b!41229 (=> res!35081 e!27277)))

(declare-fun lt!62500 () (_ BitVec 64))

(assert (=> b!41229 (= res!35081 (or (bvslt i!635 to!314) (not (= lt!62500 (bvsub (bvadd lt!62500 to!314) i!635)))))))

(declare-fun isPrefixOf!0 (BitStream!1606 BitStream!1606) Bool)

(assert (=> b!41229 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!2910 0))(
  ( (Unit!2911) )
))
(declare-fun lt!62499 () Unit!2910)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1606) Unit!2910)

(assert (=> b!41229 (= lt!62499 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!41229 (= lt!62500 (bitIndex!0 (size!931 (buf!1259 thiss!1379)) (currentByte!2702 thiss!1379) (currentBit!2697 thiss!1379)))))

(declare-fun b!41230 () Bool)

(assert (=> b!41230 (= e!27277 true)))

(declare-datatypes ((tuple2!3946 0))(
  ( (tuple2!3947 (_1!2060 array!2063) (_2!2060 BitStream!1606)) )
))
(declare-fun lt!62498 () tuple2!3946)

(declare-fun readBits!0 (BitStream!1606 (_ BitVec 64)) tuple2!3946)

(declare-datatypes ((tuple2!3948 0))(
  ( (tuple2!3949 (_1!2061 BitStream!1606) (_2!2061 BitStream!1606)) )
))
(declare-fun reader!0 (BitStream!1606 BitStream!1606) tuple2!3948)

(assert (=> b!41230 (= lt!62498 (readBits!0 (_1!2061 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(assert (= (and start!8260 res!35080) b!41227))

(assert (= (and b!41227 res!35079) b!41229))

(assert (= (and b!41229 (not res!35081)) b!41226))

(assert (= (and b!41226 (not res!35082)) b!41230))

(assert (= start!8260 b!41228))

(declare-fun m!62887 () Bool)

(assert (=> start!8260 m!62887))

(declare-fun m!62889 () Bool)

(assert (=> start!8260 m!62889))

(declare-fun m!62891 () Bool)

(assert (=> b!41226 m!62891))

(declare-fun m!62893 () Bool)

(assert (=> b!41228 m!62893))

(declare-fun m!62895 () Bool)

(assert (=> b!41230 m!62895))

(declare-fun m!62897 () Bool)

(assert (=> b!41230 m!62897))

(declare-fun m!62899 () Bool)

(assert (=> b!41227 m!62899))

(declare-fun m!62901 () Bool)

(assert (=> b!41229 m!62901))

(declare-fun m!62903 () Bool)

(assert (=> b!41229 m!62903))

(declare-fun m!62905 () Bool)

(assert (=> b!41229 m!62905))

(push 1)

(assert (not b!41228))

(assert (not b!41230))

(assert (not b!41227))

(assert (not start!8260))

(assert (not b!41229))

(assert (not b!41226))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

