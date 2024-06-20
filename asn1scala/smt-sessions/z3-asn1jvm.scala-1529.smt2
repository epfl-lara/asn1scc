; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42634 () Bool)

(assert start!42634)

(declare-fun b!201198 () Bool)

(declare-fun e!137996 () Bool)

(declare-fun e!137993 () Bool)

(assert (=> b!201198 (= e!137996 e!137993)))

(declare-fun res!168457 () Bool)

(assert (=> b!201198 (=> (not res!168457) (not e!137993))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun lt!313986 () (_ BitVec 64))

(assert (=> b!201198 (= res!168457 (= lt!313986 (bvsub (bvadd lt!313986 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-datatypes ((array!10216 0))(
  ( (array!10217 (arr!5429 (Array (_ BitVec 32) (_ BitVec 8))) (size!4499 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8106 0))(
  ( (BitStream!8107 (buf!5000 array!10216) (currentByte!9398 (_ BitVec 32)) (currentBit!9393 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8106)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201198 (= lt!313986 (bitIndex!0 (size!4499 (buf!5000 thiss!1204)) (currentByte!9398 thiss!1204) (currentBit!9393 thiss!1204)))))

(declare-fun b!201199 () Bool)

(declare-fun res!168458 () Bool)

(assert (=> b!201199 (=> (not res!168458) (not e!137996))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201199 (= res!168458 (validate_offset_bits!1 ((_ sign_extend 32) (size!4499 (buf!5000 thiss!1204))) ((_ sign_extend 32) (currentByte!9398 thiss!1204)) ((_ sign_extend 32) (currentBit!9393 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201200 () Bool)

(declare-fun res!168456 () Bool)

(assert (=> b!201200 (=> (not res!168456) (not e!137996))))

(assert (=> b!201200 (= res!168456 (= i!590 nBits!348))))

(declare-fun b!201201 () Bool)

(declare-fun res!168455 () Bool)

(assert (=> b!201201 (=> (not res!168455) (not e!137996))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201201 (= res!168455 (invariant!0 (currentBit!9393 thiss!1204) (currentByte!9398 thiss!1204) (size!4499 (buf!5000 thiss!1204))))))

(declare-fun b!201202 () Bool)

(assert (=> b!201202 (= e!137993 (not true))))

(declare-fun isPrefixOf!0 (BitStream!8106 BitStream!8106) Bool)

(assert (=> b!201202 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14300 0))(
  ( (Unit!14301) )
))
(declare-fun lt!313987 () Unit!14300)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8106) Unit!14300)

(assert (=> b!201202 (= lt!313987 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!201203 () Bool)

(declare-fun e!137994 () Bool)

(declare-fun array_inv!4240 (array!10216) Bool)

(assert (=> b!201203 (= e!137994 (array_inv!4240 (buf!5000 thiss!1204)))))

(declare-fun res!168459 () Bool)

(assert (=> start!42634 (=> (not res!168459) (not e!137996))))

(assert (=> start!42634 (= res!168459 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42634 e!137996))

(assert (=> start!42634 true))

(declare-fun inv!12 (BitStream!8106) Bool)

(assert (=> start!42634 (and (inv!12 thiss!1204) e!137994)))

(assert (= (and start!42634 res!168459) b!201199))

(assert (= (and b!201199 res!168458) b!201201))

(assert (= (and b!201201 res!168455) b!201200))

(assert (= (and b!201200 res!168456) b!201198))

(assert (= (and b!201198 res!168457) b!201202))

(assert (= start!42634 b!201203))

(declare-fun m!311811 () Bool)

(assert (=> b!201202 m!311811))

(declare-fun m!311813 () Bool)

(assert (=> b!201202 m!311813))

(declare-fun m!311815 () Bool)

(assert (=> b!201201 m!311815))

(declare-fun m!311817 () Bool)

(assert (=> b!201199 m!311817))

(declare-fun m!311819 () Bool)

(assert (=> b!201203 m!311819))

(declare-fun m!311821 () Bool)

(assert (=> b!201198 m!311821))

(declare-fun m!311823 () Bool)

(assert (=> start!42634 m!311823))

(check-sat (not b!201198) (not start!42634) (not b!201201) (not b!201199) (not b!201202) (not b!201203))
