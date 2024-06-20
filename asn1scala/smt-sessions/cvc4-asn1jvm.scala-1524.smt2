; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42606 () Bool)

(assert start!42606)

(declare-fun res!168245 () Bool)

(declare-fun e!137824 () Bool)

(assert (=> start!42606 (=> (not res!168245) (not e!137824))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42606 (= res!168245 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42606 e!137824))

(assert (=> start!42606 true))

(declare-datatypes ((array!10188 0))(
  ( (array!10189 (arr!5415 (Array (_ BitVec 32) (_ BitVec 8))) (size!4485 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8078 0))(
  ( (BitStream!8079 (buf!4986 array!10188) (currentByte!9384 (_ BitVec 32)) (currentBit!9379 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8078)

(declare-fun e!137825 () Bool)

(declare-fun inv!12 (BitStream!8078) Bool)

(assert (=> start!42606 (and (inv!12 thiss!1204) e!137825)))

(declare-fun b!200946 () Bool)

(declare-fun e!137827 () Bool)

(declare-fun lt!313893 () (_ BitVec 64))

(assert (=> b!200946 (= e!137827 (not (bvsge lt!313893 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!17196 0))(
  ( (tuple2!17197 (_1!9249 BitStream!8078) (_2!9249 BitStream!8078)) )
))
(declare-fun lt!313892 () tuple2!17196)

(declare-fun reader!0 (BitStream!8078 BitStream!8078) tuple2!17196)

(assert (=> b!200946 (= lt!313892 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!8078 BitStream!8078) Bool)

(assert (=> b!200946 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14272 0))(
  ( (Unit!14273) )
))
(declare-fun lt!313894 () Unit!14272)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8078) Unit!14272)

(assert (=> b!200946 (= lt!313894 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!200947 () Bool)

(declare-fun e!137826 () Bool)

(assert (=> b!200947 (= e!137824 e!137826)))

(declare-fun res!168248 () Bool)

(assert (=> b!200947 (=> (not res!168248) (not e!137826))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200947 (= res!168248 (validate_offset_bits!1 ((_ sign_extend 32) (size!4485 (buf!4986 thiss!1204))) ((_ sign_extend 32) (currentByte!9384 thiss!1204)) ((_ sign_extend 32) (currentBit!9379 thiss!1204)) lt!313893))))

(assert (=> b!200947 (= lt!313893 ((_ sign_extend 32) (bvsub nBits!348 i!590)))))

(declare-fun b!200948 () Bool)

(assert (=> b!200948 (= e!137826 e!137827)))

(declare-fun res!168249 () Bool)

(assert (=> b!200948 (=> (not res!168249) (not e!137827))))

(declare-fun lt!313891 () (_ BitVec 64))

(assert (=> b!200948 (= res!168249 (= lt!313891 (bvsub (bvadd lt!313891 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200948 (= lt!313891 (bitIndex!0 (size!4485 (buf!4986 thiss!1204)) (currentByte!9384 thiss!1204) (currentBit!9379 thiss!1204)))))

(declare-fun b!200949 () Bool)

(declare-fun res!168247 () Bool)

(assert (=> b!200949 (=> (not res!168247) (not e!137826))))

(assert (=> b!200949 (= res!168247 (= i!590 nBits!348))))

(declare-fun b!200950 () Bool)

(declare-fun res!168246 () Bool)

(assert (=> b!200950 (=> (not res!168246) (not e!137826))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200950 (= res!168246 (invariant!0 (currentBit!9379 thiss!1204) (currentByte!9384 thiss!1204) (size!4485 (buf!4986 thiss!1204))))))

(declare-fun b!200951 () Bool)

(declare-fun array_inv!4226 (array!10188) Bool)

(assert (=> b!200951 (= e!137825 (array_inv!4226 (buf!4986 thiss!1204)))))

(assert (= (and start!42606 res!168245) b!200947))

(assert (= (and b!200947 res!168248) b!200950))

(assert (= (and b!200950 res!168246) b!200949))

(assert (= (and b!200949 res!168247) b!200948))

(assert (= (and b!200948 res!168249) b!200946))

(assert (= start!42606 b!200951))

(declare-fun m!311607 () Bool)

(assert (=> b!200947 m!311607))

(declare-fun m!311609 () Bool)

(assert (=> b!200948 m!311609))

(declare-fun m!311611 () Bool)

(assert (=> b!200951 m!311611))

(declare-fun m!311613 () Bool)

(assert (=> b!200946 m!311613))

(declare-fun m!311615 () Bool)

(assert (=> b!200946 m!311615))

(declare-fun m!311617 () Bool)

(assert (=> b!200946 m!311617))

(declare-fun m!311619 () Bool)

(assert (=> start!42606 m!311619))

(declare-fun m!311621 () Bool)

(assert (=> b!200950 m!311621))

(push 1)

(assert (not b!200947))

(assert (not b!200946))

(assert (not b!200951))

(assert (not b!200948))

(assert (not b!200950))

(assert (not start!42606))

(check-sat)

(pop 1)

(push 1)

(check-sat)

