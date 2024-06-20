; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!66348 () Bool)

(assert start!66348)

(declare-fun b!297324 () Bool)

(declare-fun e!212811 () Bool)

(declare-datatypes ((array!17785 0))(
  ( (array!17786 (arr!8786 (Array (_ BitVec 32) (_ BitVec 8))) (size!7706 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13416 0))(
  ( (BitStream!13417 (buf!7769 array!17785) (currentByte!14311 (_ BitVec 32)) (currentBit!14306 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13416)

(declare-fun array_inv!7318 (array!17785) Bool)

(assert (=> b!297324 (= e!212811 (array_inv!7318 (buf!7769 thiss!1728)))))

(declare-fun res!245404 () Bool)

(declare-fun e!212812 () Bool)

(assert (=> start!66348 (=> (not res!245404) (not e!212812))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun arr!273 () array!17785)

(assert (=> start!66348 (= res!245404 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7706 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!66348 e!212812))

(declare-fun inv!12 (BitStream!13416) Bool)

(assert (=> start!66348 (and (inv!12 thiss!1728) e!212811)))

(assert (=> start!66348 true))

(assert (=> start!66348 (array_inv!7318 arr!273)))

(declare-fun b!297322 () Bool)

(declare-fun res!245403 () Bool)

(assert (=> b!297322 (=> (not res!245403) (not e!212812))))

(assert (=> b!297322 (= res!245403 (bvsge from!505 to!474))))

(declare-fun b!297323 () Bool)

(declare-fun lt!433655 () (_ BitVec 64))

(assert (=> b!297323 (= e!212812 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!433655)))))

(declare-fun arrayBitRangesEq!0 (array!17785 array!17785 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297323 (arrayBitRangesEq!0 arr!273 arr!273 #b0000000000000000000000000000000000000000000000000000000000000000 lt!433655)))

(assert (=> b!297323 (= lt!433655 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7706 arr!273))))))

(declare-datatypes ((Unit!20733 0))(
  ( (Unit!20734) )
))
(declare-fun lt!433656 () Unit!20733)

(declare-fun arrayBitRangesEqReflexiveLemma!0 (array!17785) Unit!20733)

(assert (=> b!297323 (= lt!433656 (arrayBitRangesEqReflexiveLemma!0 arr!273))))

(declare-fun b!297321 () Bool)

(declare-fun res!245405 () Bool)

(assert (=> b!297321 (=> (not res!245405) (not e!212812))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!297321 (= res!245405 (validate_offset_bits!1 ((_ sign_extend 32) (size!7706 (buf!7769 thiss!1728))) ((_ sign_extend 32) (currentByte!14311 thiss!1728)) ((_ sign_extend 32) (currentBit!14306 thiss!1728)) (bvsub nBits!523 from!505)))))

(assert (= (and start!66348 res!245404) b!297321))

(assert (= (and b!297321 res!245405) b!297322))

(assert (= (and b!297322 res!245403) b!297323))

(assert (= start!66348 b!297324))

(declare-fun m!436141 () Bool)

(assert (=> b!297324 m!436141))

(declare-fun m!436143 () Bool)

(assert (=> start!66348 m!436143))

(declare-fun m!436145 () Bool)

(assert (=> start!66348 m!436145))

(declare-fun m!436147 () Bool)

(assert (=> b!297323 m!436147))

(declare-fun m!436149 () Bool)

(assert (=> b!297323 m!436149))

(declare-fun m!436151 () Bool)

(assert (=> b!297321 m!436151))

(check-sat (not b!297321) (not start!66348) (not b!297323) (not b!297324))
(check-sat)
