; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42610 () Bool)

(assert start!42610)

(declare-fun b!200982 () Bool)

(declare-fun res!168276 () Bool)

(declare-fun e!137851 () Bool)

(assert (=> b!200982 (=> (not res!168276) (not e!137851))))

(declare-datatypes ((array!10192 0))(
  ( (array!10193 (arr!5417 (Array (_ BitVec 32) (_ BitVec 8))) (size!4487 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8082 0))(
  ( (BitStream!8083 (buf!4988 array!10192) (currentByte!9386 (_ BitVec 32)) (currentBit!9381 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8082)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!200982 (= res!168276 (invariant!0 (currentBit!9381 thiss!1204) (currentByte!9386 thiss!1204) (size!4487 (buf!4988 thiss!1204))))))

(declare-fun b!200983 () Bool)

(declare-fun e!137852 () Bool)

(assert (=> b!200983 (= e!137851 e!137852)))

(declare-fun res!168275 () Bool)

(assert (=> b!200983 (=> (not res!168275) (not e!137852))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!313910 () (_ BitVec 64))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!200983 (= res!168275 (= lt!313910 (bvsub (bvadd lt!313910 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!200983 (= lt!313910 (bitIndex!0 (size!4487 (buf!4988 thiss!1204)) (currentByte!9386 thiss!1204) (currentBit!9381 thiss!1204)))))

(declare-fun b!200984 () Bool)

(declare-fun res!168277 () Bool)

(assert (=> b!200984 (=> (not res!168277) (not e!137851))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!200984 (= res!168277 (validate_offset_bits!1 ((_ sign_extend 32) (size!4487 (buf!4988 thiss!1204))) ((_ sign_extend 32) (currentByte!9386 thiss!1204)) ((_ sign_extend 32) (currentBit!9381 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun res!168279 () Bool)

(assert (=> start!42610 (=> (not res!168279) (not e!137851))))

(assert (=> start!42610 (= res!168279 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42610 e!137851))

(assert (=> start!42610 true))

(declare-fun e!137849 () Bool)

(declare-fun inv!12 (BitStream!8082) Bool)

(assert (=> start!42610 (and (inv!12 thiss!1204) e!137849)))

(declare-fun b!200985 () Bool)

(declare-fun array_inv!4228 (array!10192) Bool)

(assert (=> b!200985 (= e!137849 (array_inv!4228 (buf!4988 thiss!1204)))))

(declare-fun b!200986 () Bool)

(declare-fun res!168278 () Bool)

(assert (=> b!200986 (=> (not res!168278) (not e!137851))))

(assert (=> b!200986 (= res!168278 (= i!590 nBits!348))))

(declare-fun b!200987 () Bool)

(assert (=> b!200987 (= e!137852 (not true))))

(declare-datatypes ((tuple2!17200 0))(
  ( (tuple2!17201 (_1!9251 BitStream!8082) (_2!9251 BitStream!8082)) )
))
(declare-fun lt!313912 () tuple2!17200)

(declare-fun reader!0 (BitStream!8082 BitStream!8082) tuple2!17200)

(assert (=> b!200987 (= lt!313912 (reader!0 thiss!1204 thiss!1204))))

(declare-fun isPrefixOf!0 (BitStream!8082 BitStream!8082) Bool)

(assert (=> b!200987 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14276 0))(
  ( (Unit!14277) )
))
(declare-fun lt!313911 () Unit!14276)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8082) Unit!14276)

(assert (=> b!200987 (= lt!313911 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (= (and start!42610 res!168279) b!200984))

(assert (= (and b!200984 res!168277) b!200982))

(assert (= (and b!200982 res!168276) b!200986))

(assert (= (and b!200986 res!168278) b!200983))

(assert (= (and b!200983 res!168275) b!200987))

(assert (= start!42610 b!200985))

(declare-fun m!311639 () Bool)

(assert (=> b!200982 m!311639))

(declare-fun m!311641 () Bool)

(assert (=> b!200985 m!311641))

(declare-fun m!311643 () Bool)

(assert (=> b!200984 m!311643))

(declare-fun m!311645 () Bool)

(assert (=> start!42610 m!311645))

(declare-fun m!311647 () Bool)

(assert (=> b!200987 m!311647))

(declare-fun m!311649 () Bool)

(assert (=> b!200987 m!311649))

(declare-fun m!311651 () Bool)

(assert (=> b!200987 m!311651))

(declare-fun m!311653 () Bool)

(assert (=> b!200983 m!311653))

(check-sat (not b!200983) (not b!200985) (not b!200982) (not b!200984) (not start!42610) (not b!200987))
