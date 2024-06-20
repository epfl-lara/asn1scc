; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!10358 () Bool)

(assert start!10358)

(declare-fun res!43562 () Bool)

(declare-fun e!34428 () Bool)

(assert (=> start!10358 (=> (not res!43562) (not e!34428))))

(declare-datatypes ((array!2385 0))(
  ( (array!2386 (arr!1623 (Array (_ BitVec 32) (_ BitVec 8))) (size!1087 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2385)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10358 (= res!43562 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1087 srcBuffer!2))))))))

(assert (=> start!10358 e!34428))

(assert (=> start!10358 true))

(declare-fun array_inv!992 (array!2385) Bool)

(assert (=> start!10358 (array_inv!992 srcBuffer!2)))

(declare-datatypes ((BitStream!1878 0))(
  ( (BitStream!1879 (buf!1443 array!2385) (currentByte!2986 (_ BitVec 32)) (currentBit!2981 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1878)

(declare-fun e!34430 () Bool)

(declare-fun inv!12 (BitStream!1878) Bool)

(assert (=> start!10358 (and (inv!12 thiss!1379) e!34430)))

(declare-fun b!52127 () Bool)

(declare-fun res!43563 () Bool)

(assert (=> b!52127 (=> (not res!43563) (not e!34428))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52127 (= res!43563 (validate_offset_bits!1 ((_ sign_extend 32) (size!1087 (buf!1443 thiss!1379))) ((_ sign_extend 32) (currentByte!2986 thiss!1379)) ((_ sign_extend 32) (currentBit!2981 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52128 () Bool)

(assert (=> b!52128 (= e!34428 (not true))))

(declare-fun isPrefixOf!0 (BitStream!1878 BitStream!1878) Bool)

(assert (=> b!52128 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3596 0))(
  ( (Unit!3597) )
))
(declare-fun lt!81240 () Unit!3596)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1878) Unit!3596)

(assert (=> b!52128 (= lt!81240 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81241 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52128 (= lt!81241 (bitIndex!0 (size!1087 (buf!1443 thiss!1379)) (currentByte!2986 thiss!1379) (currentBit!2981 thiss!1379)))))

(declare-fun b!52129 () Bool)

(assert (=> b!52129 (= e!34430 (array_inv!992 (buf!1443 thiss!1379)))))

(assert (= (and start!10358 res!43562) b!52127))

(assert (= (and b!52127 res!43563) b!52128))

(assert (= start!10358 b!52129))

(declare-fun m!82317 () Bool)

(assert (=> start!10358 m!82317))

(declare-fun m!82319 () Bool)

(assert (=> start!10358 m!82319))

(declare-fun m!82321 () Bool)

(assert (=> b!52127 m!82321))

(declare-fun m!82323 () Bool)

(assert (=> b!52128 m!82323))

(declare-fun m!82325 () Bool)

(assert (=> b!52128 m!82325))

(declare-fun m!82327 () Bool)

(assert (=> b!52128 m!82327))

(declare-fun m!82329 () Bool)

(assert (=> b!52129 m!82329))

(check-sat (not b!52129) (not start!10358) (not b!52128) (not b!52127))
