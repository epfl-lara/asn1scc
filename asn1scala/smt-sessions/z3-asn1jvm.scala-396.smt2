; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10364 () Bool)

(assert start!10364)

(declare-fun b!52164 () Bool)

(declare-fun e!34468 () Bool)

(declare-fun e!34470 () Bool)

(assert (=> b!52164 (= e!34468 (not e!34470))))

(declare-fun res!43591 () Bool)

(assert (=> b!52164 (=> res!43591 e!34470)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun lt!81264 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!52164 (= res!43591 (or (bvslt i!635 to!314) (not (= lt!81264 (bvsub (bvadd lt!81264 to!314) i!635)))))))

(declare-datatypes ((array!2391 0))(
  ( (array!2392 (arr!1626 (Array (_ BitVec 32) (_ BitVec 8))) (size!1090 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1884 0))(
  ( (BitStream!1885 (buf!1446 array!2391) (currentByte!2989 (_ BitVec 32)) (currentBit!2984 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1884)

(declare-fun isPrefixOf!0 (BitStream!1884 BitStream!1884) Bool)

(assert (=> b!52164 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3602 0))(
  ( (Unit!3603) )
))
(declare-fun lt!81263 () Unit!3602)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1884) Unit!3602)

(assert (=> b!52164 (= lt!81263 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52164 (= lt!81264 (bitIndex!0 (size!1090 (buf!1446 thiss!1379)) (currentByte!2989 thiss!1379) (currentBit!2984 thiss!1379)))))

(declare-fun res!43590 () Bool)

(assert (=> start!10364 (=> (not res!43590) (not e!34468))))

(declare-fun srcBuffer!2 () array!2391)

(assert (=> start!10364 (= res!43590 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1090 srcBuffer!2))))))))

(assert (=> start!10364 e!34468))

(assert (=> start!10364 true))

(declare-fun array_inv!995 (array!2391) Bool)

(assert (=> start!10364 (array_inv!995 srcBuffer!2)))

(declare-fun e!34471 () Bool)

(declare-fun inv!12 (BitStream!1884) Bool)

(assert (=> start!10364 (and (inv!12 thiss!1379) e!34471)))

(declare-fun b!52165 () Bool)

(assert (=> b!52165 (= e!34470 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!4752 0))(
  ( (tuple2!4753 (_1!2481 array!2391) (_2!2481 BitStream!1884)) )
))
(declare-fun lt!81265 () tuple2!4752)

(declare-fun readBits!0 (BitStream!1884 (_ BitVec 64)) tuple2!4752)

(declare-datatypes ((tuple2!4754 0))(
  ( (tuple2!4755 (_1!2482 BitStream!1884) (_2!2482 BitStream!1884)) )
))
(declare-fun reader!0 (BitStream!1884 BitStream!1884) tuple2!4754)

(assert (=> b!52165 (= lt!81265 (readBits!0 (_1!2482 (reader!0 thiss!1379 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52166 () Bool)

(declare-fun res!43592 () Bool)

(assert (=> b!52166 (=> res!43592 e!34470)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!52166 (= res!43592 (not (invariant!0 (currentBit!2984 thiss!1379) (currentByte!2989 thiss!1379) (size!1090 (buf!1446 thiss!1379)))))))

(declare-fun b!52167 () Bool)

(declare-fun res!43593 () Bool)

(assert (=> b!52167 (=> (not res!43593) (not e!34468))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52167 (= res!43593 (validate_offset_bits!1 ((_ sign_extend 32) (size!1090 (buf!1446 thiss!1379))) ((_ sign_extend 32) (currentByte!2989 thiss!1379)) ((_ sign_extend 32) (currentBit!2984 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52168 () Bool)

(assert (=> b!52168 (= e!34471 (array_inv!995 (buf!1446 thiss!1379)))))

(assert (= (and start!10364 res!43590) b!52167))

(assert (= (and b!52167 res!43593) b!52164))

(assert (= (and b!52164 (not res!43591)) b!52166))

(assert (= (and b!52166 (not res!43592)) b!52165))

(assert (= start!10364 b!52168))

(declare-fun m!82365 () Bool)

(assert (=> start!10364 m!82365))

(declare-fun m!82367 () Bool)

(assert (=> start!10364 m!82367))

(declare-fun m!82369 () Bool)

(assert (=> b!52164 m!82369))

(declare-fun m!82371 () Bool)

(assert (=> b!52164 m!82371))

(declare-fun m!82373 () Bool)

(assert (=> b!52164 m!82373))

(declare-fun m!82375 () Bool)

(assert (=> b!52165 m!82375))

(declare-fun m!82377 () Bool)

(assert (=> b!52165 m!82377))

(declare-fun m!82379 () Bool)

(assert (=> b!52167 m!82379))

(declare-fun m!82381 () Bool)

(assert (=> b!52166 m!82381))

(declare-fun m!82383 () Bool)

(assert (=> b!52168 m!82383))

(check-sat (not b!52168) (not b!52164) (not b!52165) (not b!52167) (not b!52166) (not start!10364))
