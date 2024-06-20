; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10392 () Bool)

(assert start!10392)

(declare-fun res!43629 () Bool)

(declare-fun e!34553 () Bool)

(assert (=> start!10392 (=> (not res!43629) (not e!34553))))

(declare-datatypes ((array!2413 0))(
  ( (array!2414 (arr!1637 (Array (_ BitVec 32) (_ BitVec 8))) (size!1101 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2413)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10392 (= res!43629 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1101 srcBuffer!2))))))))

(assert (=> start!10392 e!34553))

(assert (=> start!10392 true))

(declare-fun array_inv!1006 (array!2413) Bool)

(assert (=> start!10392 (array_inv!1006 srcBuffer!2)))

(declare-datatypes ((BitStream!1894 0))(
  ( (BitStream!1895 (buf!1451 array!2413) (currentByte!2994 (_ BitVec 32)) (currentBit!2989 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1894)

(declare-fun e!34551 () Bool)

(declare-fun inv!12 (BitStream!1894) Bool)

(assert (=> start!10392 (and (inv!12 thiss!1379) e!34551)))

(declare-fun b!52217 () Bool)

(declare-fun res!43628 () Bool)

(assert (=> b!52217 (=> (not res!43628) (not e!34553))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52217 (= res!43628 (validate_offset_bits!1 ((_ sign_extend 32) (size!1101 (buf!1451 thiss!1379))) ((_ sign_extend 32) (currentByte!2994 thiss!1379)) ((_ sign_extend 32) (currentBit!2989 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52218 () Bool)

(assert (=> b!52218 (= e!34553 (not true))))

(declare-fun isPrefixOf!0 (BitStream!1894 BitStream!1894) Bool)

(assert (=> b!52218 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3606 0))(
  ( (Unit!3607) )
))
(declare-fun lt!81279 () Unit!3606)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1894) Unit!3606)

(assert (=> b!52218 (= lt!81279 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81280 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52218 (= lt!81280 (bitIndex!0 (size!1101 (buf!1451 thiss!1379)) (currentByte!2994 thiss!1379) (currentBit!2989 thiss!1379)))))

(declare-fun b!52219 () Bool)

(assert (=> b!52219 (= e!34551 (array_inv!1006 (buf!1451 thiss!1379)))))

(assert (= (and start!10392 res!43629) b!52217))

(assert (= (and b!52217 res!43628) b!52218))

(assert (= start!10392 b!52219))

(declare-fun m!82441 () Bool)

(assert (=> start!10392 m!82441))

(declare-fun m!82443 () Bool)

(assert (=> start!10392 m!82443))

(declare-fun m!82445 () Bool)

(assert (=> b!52217 m!82445))

(declare-fun m!82447 () Bool)

(assert (=> b!52218 m!82447))

(declare-fun m!82449 () Bool)

(assert (=> b!52218 m!82449))

(declare-fun m!82451 () Bool)

(assert (=> b!52218 m!82451))

(declare-fun m!82453 () Bool)

(assert (=> b!52219 m!82453))

(push 1)

(assert (not b!52217))

(assert (not b!52219))

(assert (not b!52218))

(assert (not start!10392))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

