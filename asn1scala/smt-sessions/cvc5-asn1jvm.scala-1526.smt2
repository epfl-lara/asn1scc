; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42614 () Bool)

(assert start!42614)

(declare-fun b!201018 () Bool)

(declare-fun e!137876 () Bool)

(declare-datatypes ((array!10196 0))(
  ( (array!10197 (arr!5419 (Array (_ BitVec 32) (_ BitVec 8))) (size!4489 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8086 0))(
  ( (BitStream!8087 (buf!4990 array!10196) (currentByte!9388 (_ BitVec 32)) (currentBit!9383 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8086)

(declare-fun array_inv!4230 (array!10196) Bool)

(assert (=> b!201018 (= e!137876 (array_inv!4230 (buf!4990 thiss!1204)))))

(declare-fun b!201020 () Bool)

(declare-fun res!168309 () Bool)

(declare-fun e!137873 () Bool)

(assert (=> b!201020 (=> (not res!168309) (not e!137873))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201020 (= res!168309 (invariant!0 (currentBit!9383 thiss!1204) (currentByte!9388 thiss!1204) (size!4489 (buf!4990 thiss!1204))))))

(declare-fun b!201021 () Bool)

(declare-fun e!137874 () Bool)

(assert (=> b!201021 (= e!137873 e!137874)))

(declare-fun res!168306 () Bool)

(assert (=> b!201021 (=> (not res!168306) (not e!137874))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!313927 () (_ BitVec 64))

(assert (=> b!201021 (= res!168306 (= lt!313927 (bvsub (bvadd lt!313927 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201021 (= lt!313927 (bitIndex!0 (size!4489 (buf!4990 thiss!1204)) (currentByte!9388 thiss!1204) (currentBit!9383 thiss!1204)))))

(declare-fun b!201022 () Bool)

(assert (=> b!201022 (= e!137874 (not true))))

(declare-fun isPrefixOf!0 (BitStream!8086 BitStream!8086) Bool)

(assert (=> b!201022 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14280 0))(
  ( (Unit!14281) )
))
(declare-fun lt!313926 () Unit!14280)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8086) Unit!14280)

(assert (=> b!201022 (= lt!313926 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!201023 () Bool)

(declare-fun res!168308 () Bool)

(assert (=> b!201023 (=> (not res!168308) (not e!137873))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201023 (= res!168308 (validate_offset_bits!1 ((_ sign_extend 32) (size!4489 (buf!4990 thiss!1204))) ((_ sign_extend 32) (currentByte!9388 thiss!1204)) ((_ sign_extend 32) (currentBit!9383 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201019 () Bool)

(declare-fun res!168305 () Bool)

(assert (=> b!201019 (=> (not res!168305) (not e!137873))))

(assert (=> b!201019 (= res!168305 (= i!590 nBits!348))))

(declare-fun res!168307 () Bool)

(assert (=> start!42614 (=> (not res!168307) (not e!137873))))

(assert (=> start!42614 (= res!168307 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42614 e!137873))

(assert (=> start!42614 true))

(declare-fun inv!12 (BitStream!8086) Bool)

(assert (=> start!42614 (and (inv!12 thiss!1204) e!137876)))

(assert (= (and start!42614 res!168307) b!201023))

(assert (= (and b!201023 res!168308) b!201020))

(assert (= (and b!201020 res!168309) b!201019))

(assert (= (and b!201019 res!168305) b!201021))

(assert (= (and b!201021 res!168306) b!201022))

(assert (= start!42614 b!201018))

(declare-fun m!311671 () Bool)

(assert (=> b!201018 m!311671))

(declare-fun m!311673 () Bool)

(assert (=> b!201023 m!311673))

(declare-fun m!311675 () Bool)

(assert (=> b!201021 m!311675))

(declare-fun m!311677 () Bool)

(assert (=> b!201020 m!311677))

(declare-fun m!311679 () Bool)

(assert (=> b!201022 m!311679))

(declare-fun m!311681 () Bool)

(assert (=> b!201022 m!311681))

(declare-fun m!311683 () Bool)

(assert (=> start!42614 m!311683))

(push 1)

(assert (not b!201022))

(assert (not b!201020))

(assert (not b!201018))

(assert (not b!201021))

(assert (not b!201023))

(assert (not start!42614))

(check-sat)

