; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38922 () Bool)

(assert start!38922)

(declare-fun b!175183 () Bool)

(declare-fun e!122156 () Bool)

(declare-fun e!122157 () Bool)

(assert (=> b!175183 (= e!122156 e!122157)))

(declare-fun res!145066 () Bool)

(assert (=> b!175183 (=> (not res!145066) (not e!122157))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!270364 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!175183 (= res!145066 (= lt!270364 (bvsub (bvadd lt!270364 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-datatypes ((array!9432 0))(
  ( (array!9433 (arr!5091 (Array (_ BitVec 32) (_ BitVec 8))) (size!4161 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7430 0))(
  ( (BitStream!7431 (buf!4598 array!9432) (currentByte!8721 (_ BitVec 32)) (currentBit!8716 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7430)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!175183 (= lt!270364 (bitIndex!0 (size!4161 (buf!4598 thiss!1204)) (currentByte!8721 thiss!1204) (currentBit!8716 thiss!1204)))))

(declare-fun b!175184 () Bool)

(declare-fun res!145067 () Bool)

(assert (=> b!175184 (=> (not res!145067) (not e!122156))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!175184 (= res!145067 (invariant!0 (currentBit!8716 thiss!1204) (currentByte!8721 thiss!1204) (size!4161 (buf!4598 thiss!1204))))))

(declare-fun b!175185 () Bool)

(declare-fun res!145065 () Bool)

(assert (=> b!175185 (=> (not res!145065) (not e!122156))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!175185 (= res!145065 (validate_offset_bits!1 ((_ sign_extend 32) (size!4161 (buf!4598 thiss!1204))) ((_ sign_extend 32) (currentByte!8721 thiss!1204)) ((_ sign_extend 32) (currentBit!8716 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun res!145064 () Bool)

(assert (=> start!38922 (=> (not res!145064) (not e!122156))))

(assert (=> start!38922 (= res!145064 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!38922 e!122156))

(assert (=> start!38922 true))

(declare-fun e!122158 () Bool)

(declare-fun inv!12 (BitStream!7430) Bool)

(assert (=> start!38922 (and (inv!12 thiss!1204) e!122158)))

(declare-fun b!175186 () Bool)

(declare-fun array_inv!3902 (array!9432) Bool)

(assert (=> b!175186 (= e!122158 (array_inv!3902 (buf!4598 thiss!1204)))))

(declare-fun b!175187 () Bool)

(declare-fun res!145068 () Bool)

(assert (=> b!175187 (=> (not res!145068) (not e!122156))))

(assert (=> b!175187 (= res!145068 (= i!590 nBits!348))))

(declare-fun b!175188 () Bool)

(assert (=> b!175188 (= e!122157 (not true))))

(declare-fun isPrefixOf!0 (BitStream!7430 BitStream!7430) Bool)

(assert (=> b!175188 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!12630 0))(
  ( (Unit!12631) )
))
(declare-fun lt!270365 () Unit!12630)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7430) Unit!12630)

(assert (=> b!175188 (= lt!270365 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (= (and start!38922 res!145064) b!175185))

(assert (= (and b!175185 res!145065) b!175184))

(assert (= (and b!175184 res!145067) b!175187))

(assert (= (and b!175187 res!145068) b!175183))

(assert (= (and b!175183 res!145066) b!175188))

(assert (= start!38922 b!175186))

(declare-fun m!275399 () Bool)

(assert (=> b!175184 m!275399))

(declare-fun m!275401 () Bool)

(assert (=> b!175183 m!275401))

(declare-fun m!275403 () Bool)

(assert (=> b!175188 m!275403))

(declare-fun m!275405 () Bool)

(assert (=> b!175188 m!275405))

(declare-fun m!275407 () Bool)

(assert (=> b!175185 m!275407))

(declare-fun m!275409 () Bool)

(assert (=> b!175186 m!275409))

(declare-fun m!275411 () Bool)

(assert (=> start!38922 m!275411))

(push 1)

(assert (not start!38922))

(assert (not b!175184))

(assert (not b!175186))

(assert (not b!175185))

(assert (not b!175188))

