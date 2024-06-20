; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42620 () Bool)

(assert start!42620)

(declare-fun b!201072 () Bool)

(declare-fun res!168350 () Bool)

(declare-fun e!137909 () Bool)

(assert (=> b!201072 (=> (not res!168350) (not e!137909))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!201072 (= res!168350 (= i!590 nBits!348))))

(declare-fun b!201073 () Bool)

(declare-fun e!137911 () Bool)

(assert (=> b!201073 (= e!137911 (not true))))

(declare-datatypes ((array!10202 0))(
  ( (array!10203 (arr!5422 (Array (_ BitVec 32) (_ BitVec 8))) (size!4492 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8092 0))(
  ( (BitStream!8093 (buf!4993 array!10202) (currentByte!9391 (_ BitVec 32)) (currentBit!9386 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8092)

(declare-fun isPrefixOf!0 (BitStream!8092 BitStream!8092) Bool)

(assert (=> b!201073 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14286 0))(
  ( (Unit!14287) )
))
(declare-fun lt!313945 () Unit!14286)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8092) Unit!14286)

(assert (=> b!201073 (= lt!313945 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!201074 () Bool)

(assert (=> b!201074 (= e!137909 e!137911)))

(declare-fun res!168352 () Bool)

(assert (=> b!201074 (=> (not res!168352) (not e!137911))))

(declare-fun lt!313944 () (_ BitVec 64))

(assert (=> b!201074 (= res!168352 (= lt!313944 (bvsub (bvadd lt!313944 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201074 (= lt!313944 (bitIndex!0 (size!4492 (buf!4993 thiss!1204)) (currentByte!9391 thiss!1204) (currentBit!9386 thiss!1204)))))

(declare-fun b!201075 () Bool)

(declare-fun e!137910 () Bool)

(declare-fun array_inv!4233 (array!10202) Bool)

(assert (=> b!201075 (= e!137910 (array_inv!4233 (buf!4993 thiss!1204)))))

(declare-fun res!168353 () Bool)

(assert (=> start!42620 (=> (not res!168353) (not e!137909))))

(assert (=> start!42620 (= res!168353 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42620 e!137909))

(assert (=> start!42620 true))

(declare-fun inv!12 (BitStream!8092) Bool)

(assert (=> start!42620 (and (inv!12 thiss!1204) e!137910)))

(declare-fun b!201076 () Bool)

(declare-fun res!168351 () Bool)

(assert (=> b!201076 (=> (not res!168351) (not e!137909))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201076 (= res!168351 (invariant!0 (currentBit!9386 thiss!1204) (currentByte!9391 thiss!1204) (size!4492 (buf!4993 thiss!1204))))))

(declare-fun b!201077 () Bool)

(declare-fun res!168354 () Bool)

(assert (=> b!201077 (=> (not res!168354) (not e!137909))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201077 (= res!168354 (validate_offset_bits!1 ((_ sign_extend 32) (size!4492 (buf!4993 thiss!1204))) ((_ sign_extend 32) (currentByte!9391 thiss!1204)) ((_ sign_extend 32) (currentBit!9386 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(assert (= (and start!42620 res!168353) b!201077))

(assert (= (and b!201077 res!168354) b!201076))

(assert (= (and b!201076 res!168351) b!201072))

(assert (= (and b!201072 res!168350) b!201074))

(assert (= (and b!201074 res!168352) b!201073))

(assert (= start!42620 b!201075))

(declare-fun m!311713 () Bool)

(assert (=> b!201074 m!311713))

(declare-fun m!311715 () Bool)

(assert (=> start!42620 m!311715))

(declare-fun m!311717 () Bool)

(assert (=> b!201076 m!311717))

(declare-fun m!311719 () Bool)

(assert (=> b!201073 m!311719))

(declare-fun m!311721 () Bool)

(assert (=> b!201073 m!311721))

(declare-fun m!311723 () Bool)

(assert (=> b!201077 m!311723))

(declare-fun m!311725 () Bool)

(assert (=> b!201075 m!311725))

(push 1)

(assert (not start!42620))

(assert (not b!201077))

(assert (not b!201074))

(assert (not b!201076))

(assert (not b!201075))

(assert (not b!201073))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

