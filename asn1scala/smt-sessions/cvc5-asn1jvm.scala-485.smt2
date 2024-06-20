; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14334 () Bool)

(assert start!14334)

(declare-fun res!61439 () Bool)

(declare-fun e!48567 () Bool)

(assert (=> start!14334 (=> (not res!61439) (not e!48567))))

(declare-datatypes ((array!3022 0))(
  ( (array!3023 (arr!2006 (Array (_ BitVec 32) (_ BitVec 8))) (size!1412 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!3022)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!14334 (= res!61439 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1412 srcBuffer!2))))))))

(assert (=> start!14334 e!48567))

(assert (=> start!14334 true))

(declare-fun array_inv!1258 (array!3022) Bool)

(assert (=> start!14334 (array_inv!1258 srcBuffer!2)))

(declare-datatypes ((BitStream!2398 0))(
  ( (BitStream!2399 (buf!1793 array!3022) (currentByte!3537 (_ BitVec 32)) (currentBit!3532 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!2398)

(declare-fun e!48569 () Bool)

(declare-fun inv!12 (BitStream!2398) Bool)

(assert (=> start!14334 (and (inv!12 thiss!1379) e!48569)))

(declare-fun b!74321 () Bool)

(declare-fun res!61440 () Bool)

(assert (=> b!74321 (=> (not res!61440) (not e!48567))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!74321 (= res!61440 (validate_offset_bits!1 ((_ sign_extend 32) (size!1412 (buf!1793 thiss!1379))) ((_ sign_extend 32) (currentByte!3537 thiss!1379)) ((_ sign_extend 32) (currentBit!3532 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!74322 () Bool)

(assert (=> b!74322 (= e!48567 (not true))))

(declare-fun isPrefixOf!0 (BitStream!2398 BitStream!2398) Bool)

(assert (=> b!74322 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!4901 0))(
  ( (Unit!4902) )
))
(declare-fun lt!119659 () Unit!4901)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!2398) Unit!4901)

(assert (=> b!74322 (= lt!119659 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!119658 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!74322 (= lt!119658 (bitIndex!0 (size!1412 (buf!1793 thiss!1379)) (currentByte!3537 thiss!1379) (currentBit!3532 thiss!1379)))))

(declare-fun b!74323 () Bool)

(assert (=> b!74323 (= e!48569 (array_inv!1258 (buf!1793 thiss!1379)))))

(assert (= (and start!14334 res!61439) b!74321))

(assert (= (and b!74321 res!61440) b!74322))

(assert (= start!14334 b!74323))

(declare-fun m!119263 () Bool)

(assert (=> start!14334 m!119263))

(declare-fun m!119265 () Bool)

(assert (=> start!14334 m!119265))

(declare-fun m!119267 () Bool)

(assert (=> b!74321 m!119267))

(declare-fun m!119269 () Bool)

(assert (=> b!74322 m!119269))

(declare-fun m!119271 () Bool)

(assert (=> b!74322 m!119271))

(declare-fun m!119273 () Bool)

(assert (=> b!74322 m!119273))

(declare-fun m!119275 () Bool)

(assert (=> b!74323 m!119275))

(push 1)

(assert (not b!74323))

(assert (not start!14334))

(assert (not b!74322))

(assert (not b!74321))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

