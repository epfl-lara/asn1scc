; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42624 () Bool)

(assert start!42624)

(declare-fun res!168382 () Bool)

(declare-fun e!137934 () Bool)

(assert (=> start!42624 (=> (not res!168382) (not e!137934))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!42624 (= res!168382 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42624 e!137934))

(assert (=> start!42624 true))

(declare-datatypes ((array!10206 0))(
  ( (array!10207 (arr!5424 (Array (_ BitVec 32) (_ BitVec 8))) (size!4494 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8096 0))(
  ( (BitStream!8097 (buf!4995 array!10206) (currentByte!9393 (_ BitVec 32)) (currentBit!9388 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8096)

(declare-fun e!137933 () Bool)

(declare-fun inv!12 (BitStream!8096) Bool)

(assert (=> start!42624 (and (inv!12 thiss!1204) e!137933)))

(declare-fun b!201108 () Bool)

(declare-fun e!137935 () Bool)

(assert (=> b!201108 (= e!137935 (not true))))

(declare-fun isPrefixOf!0 (BitStream!8096 BitStream!8096) Bool)

(assert (=> b!201108 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14290 0))(
  ( (Unit!14291) )
))
(declare-fun lt!313957 () Unit!14290)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8096) Unit!14290)

(assert (=> b!201108 (= lt!313957 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!201109 () Bool)

(declare-fun res!168381 () Bool)

(assert (=> b!201109 (=> (not res!168381) (not e!137934))))

(assert (=> b!201109 (= res!168381 (= i!590 nBits!348))))

(declare-fun b!201110 () Bool)

(declare-fun res!168384 () Bool)

(assert (=> b!201110 (=> (not res!168384) (not e!137934))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201110 (= res!168384 (invariant!0 (currentBit!9388 thiss!1204) (currentByte!9393 thiss!1204) (size!4494 (buf!4995 thiss!1204))))))

(declare-fun b!201111 () Bool)

(assert (=> b!201111 (= e!137934 e!137935)))

(declare-fun res!168380 () Bool)

(assert (=> b!201111 (=> (not res!168380) (not e!137935))))

(declare-fun lt!313956 () (_ BitVec 64))

(assert (=> b!201111 (= res!168380 (= lt!313956 (bvsub (bvadd lt!313956 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201111 (= lt!313956 (bitIndex!0 (size!4494 (buf!4995 thiss!1204)) (currentByte!9393 thiss!1204) (currentBit!9388 thiss!1204)))))

(declare-fun b!201112 () Bool)

(declare-fun array_inv!4235 (array!10206) Bool)

(assert (=> b!201112 (= e!137933 (array_inv!4235 (buf!4995 thiss!1204)))))

(declare-fun b!201113 () Bool)

(declare-fun res!168383 () Bool)

(assert (=> b!201113 (=> (not res!168383) (not e!137934))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201113 (= res!168383 (validate_offset_bits!1 ((_ sign_extend 32) (size!4494 (buf!4995 thiss!1204))) ((_ sign_extend 32) (currentByte!9393 thiss!1204)) ((_ sign_extend 32) (currentBit!9388 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(assert (= (and start!42624 res!168382) b!201113))

(assert (= (and b!201113 res!168383) b!201110))

(assert (= (and b!201110 res!168384) b!201109))

(assert (= (and b!201109 res!168381) b!201111))

(assert (= (and b!201111 res!168380) b!201108))

(assert (= start!42624 b!201112))

(declare-fun m!311741 () Bool)

(assert (=> b!201112 m!311741))

(declare-fun m!311743 () Bool)

(assert (=> b!201111 m!311743))

(declare-fun m!311745 () Bool)

(assert (=> b!201108 m!311745))

(declare-fun m!311747 () Bool)

(assert (=> b!201108 m!311747))

(declare-fun m!311749 () Bool)

(assert (=> start!42624 m!311749))

(declare-fun m!311751 () Bool)

(assert (=> b!201113 m!311751))

(declare-fun m!311753 () Bool)

(assert (=> b!201110 m!311753))

(push 1)

