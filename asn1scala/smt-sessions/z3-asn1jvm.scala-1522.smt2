; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42592 () Bool)

(assert start!42592)

(declare-fun b!200820 () Bool)

(declare-fun res!168142 () Bool)

(declare-fun e!137734 () Bool)

(assert (=> b!200820 (=> (not res!168142) (not e!137734))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!10174 0))(
  ( (array!10175 (arr!5408 (Array (_ BitVec 32) (_ BitVec 8))) (size!4478 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8064 0))(
  ( (BitStream!8065 (buf!4979 array!10174) (currentByte!9377 (_ BitVec 32)) (currentBit!9372 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8064)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200820 (= res!168142 (validate_offset_bits!1 ((_ sign_extend 32) (size!4478 (buf!4979 thiss!1204))) ((_ sign_extend 32) (currentByte!9377 thiss!1204)) ((_ sign_extend 32) (currentBit!9372 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!200821 () Bool)

(declare-fun res!168143 () Bool)

(assert (=> b!200821 (=> (not res!168143) (not e!137734))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200821 (= res!168143 (invariant!0 (currentBit!9372 thiss!1204) (currentByte!9377 thiss!1204) (size!4478 (buf!4979 thiss!1204))))))

(declare-fun b!200822 () Bool)

(declare-fun e!137732 () Bool)

(assert (=> b!200822 (= e!137732 (not (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand i!590 #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 i!590) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!17182 0))(
  ( (tuple2!17183 (_1!9242 BitStream!8064) (_2!9242 BitStream!8064)) )
))
(declare-fun lt!313820 () tuple2!17182)

(declare-fun reader!0 (BitStream!8064 BitStream!8064) tuple2!17182)

(assert (=> b!200822 (= lt!313820 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!8064 BitStream!8064) Bool)

(assert (=> b!200822 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14258 0))(
  ( (Unit!14259) )
))
(declare-fun lt!313821 () Unit!14258)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8064) Unit!14258)

(assert (=> b!200822 (= lt!313821 (lemmaIsPrefixRefl!0 thiss!1204))))

(declare-fun b!200824 () Bool)

(declare-fun res!168144 () Bool)

(assert (=> b!200824 (=> (not res!168144) (not e!137734))))

(assert (=> b!200824 (= res!168144 (= i!590 nBits!348))))

(declare-fun b!200825 () Bool)

(declare-fun e!137735 () Bool)

(declare-fun array_inv!4219 (array!10174) Bool)

(assert (=> b!200825 (= e!137735 (array_inv!4219 (buf!4979 thiss!1204)))))

(declare-fun res!168140 () Bool)

(assert (=> start!42592 (=> (not res!168140) (not e!137734))))

(assert (=> start!42592 (= res!168140 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42592 e!137734))

(assert (=> start!42592 true))

(declare-fun inv!12 (BitStream!8064) Bool)

(assert (=> start!42592 (and (inv!12 thiss!1204) e!137735)))

(declare-fun b!200823 () Bool)

(assert (=> b!200823 (= e!137734 e!137732)))

(declare-fun res!168141 () Bool)

(assert (=> b!200823 (=> (not res!168141) (not e!137732))))

(declare-fun lt!313822 () (_ BitVec 64))

(assert (=> b!200823 (= res!168141 (= lt!313822 (bvsub (bvadd lt!313822 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200823 (= lt!313822 (bitIndex!0 (size!4478 (buf!4979 thiss!1204)) (currentByte!9377 thiss!1204) (currentBit!9372 thiss!1204)))))

(assert (= (and start!42592 res!168140) b!200820))

(assert (= (and b!200820 res!168142) b!200821))

(assert (= (and b!200821 res!168143) b!200824))

(assert (= (and b!200824 res!168144) b!200823))

(assert (= (and b!200823 res!168141) b!200822))

(assert (= start!42592 b!200825))

(declare-fun m!311495 () Bool)

(assert (=> start!42592 m!311495))

(declare-fun m!311497 () Bool)

(assert (=> b!200821 m!311497))

(declare-fun m!311499 () Bool)

(assert (=> b!200823 m!311499))

(declare-fun m!311501 () Bool)

(assert (=> b!200822 m!311501))

(declare-fun m!311503 () Bool)

(assert (=> b!200822 m!311503))

(declare-fun m!311505 () Bool)

(assert (=> b!200822 m!311505))

(declare-fun m!311507 () Bool)

(assert (=> b!200825 m!311507))

(declare-fun m!311509 () Bool)

(assert (=> b!200820 m!311509))

(check-sat (not b!200825) (not b!200822) (not start!42592) (not b!200820) (not b!200823) (not b!200821))
