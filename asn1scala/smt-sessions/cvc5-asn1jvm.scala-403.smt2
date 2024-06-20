; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!10404 () Bool)

(assert start!10404)

(declare-fun res!43665 () Bool)

(declare-fun e!34622 () Bool)

(assert (=> start!10404 (=> (not res!43665) (not e!34622))))

(declare-datatypes ((array!2425 0))(
  ( (array!2426 (arr!1643 (Array (_ BitVec 32) (_ BitVec 8))) (size!1107 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!2425)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> start!10404 (= res!43665 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1107 srcBuffer!2))))))))

(assert (=> start!10404 e!34622))

(assert (=> start!10404 true))

(declare-fun array_inv!1012 (array!2425) Bool)

(assert (=> start!10404 (array_inv!1012 srcBuffer!2)))

(declare-datatypes ((BitStream!1906 0))(
  ( (BitStream!1907 (buf!1457 array!2425) (currentByte!3000 (_ BitVec 32)) (currentBit!2995 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1906)

(declare-fun e!34623 () Bool)

(declare-fun inv!12 (BitStream!1906) Bool)

(assert (=> start!10404 (and (inv!12 thiss!1379) e!34623)))

(declare-fun b!52271 () Bool)

(declare-fun res!43664 () Bool)

(assert (=> b!52271 (=> (not res!43664) (not e!34622))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!52271 (= res!43664 (validate_offset_bits!1 ((_ sign_extend 32) (size!1107 (buf!1457 thiss!1379))) ((_ sign_extend 32) (currentByte!3000 thiss!1379)) ((_ sign_extend 32) (currentBit!2995 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!52272 () Bool)

(assert (=> b!52272 (= e!34622 (not (or (bvsge i!635 to!314) (bvslt (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000))))))

(declare-fun isPrefixOf!0 (BitStream!1906 BitStream!1906) Bool)

(assert (=> b!52272 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-datatypes ((Unit!3618 0))(
  ( (Unit!3619) )
))
(declare-fun lt!81315 () Unit!3618)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1906) Unit!3618)

(assert (=> b!52272 (= lt!81315 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!81316 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!52272 (= lt!81316 (bitIndex!0 (size!1107 (buf!1457 thiss!1379)) (currentByte!3000 thiss!1379) (currentBit!2995 thiss!1379)))))

(declare-fun b!52273 () Bool)

(assert (=> b!52273 (= e!34623 (array_inv!1012 (buf!1457 thiss!1379)))))

(assert (= (and start!10404 res!43665) b!52271))

(assert (= (and b!52271 res!43664) b!52272))

(assert (= start!10404 b!52273))

(declare-fun m!82525 () Bool)

(assert (=> start!10404 m!82525))

(declare-fun m!82527 () Bool)

(assert (=> start!10404 m!82527))

(declare-fun m!82529 () Bool)

(assert (=> b!52271 m!82529))

(declare-fun m!82531 () Bool)

(assert (=> b!52272 m!82531))

(declare-fun m!82533 () Bool)

(assert (=> b!52272 m!82533))

(declare-fun m!82535 () Bool)

(assert (=> b!52272 m!82535))

(declare-fun m!82537 () Bool)

(assert (=> b!52273 m!82537))

(push 1)

(assert (not start!10404))

(assert (not b!52272))

(assert (not b!52273))

(assert (not b!52271))

(check-sat)

(pop 1)

(push 1)

(check-sat)

