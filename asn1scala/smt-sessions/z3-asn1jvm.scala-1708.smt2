; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47254 () Bool)

(assert start!47254)

(declare-fun b!225623 () Bool)

(declare-fun res!189327 () Bool)

(declare-fun e!154066 () Bool)

(assert (=> b!225623 (=> (not res!189327) (not e!154066))))

(declare-datatypes ((array!11236 0))(
  ( (array!11237 (arr!5888 (Array (_ BitVec 32) (_ BitVec 8))) (size!4931 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8958 0))(
  ( (BitStream!8959 (buf!5472 array!11236) (currentByte!10256 (_ BitVec 32)) (currentBit!10251 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8958)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!225623 (= res!189327 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4931 (buf!5472 thiss!1870))) ((_ sign_extend 32) (currentByte!10256 thiss!1870)) ((_ sign_extend 32) (currentBit!10251 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!225626 () Bool)

(declare-fun e!154064 () Bool)

(declare-fun array_inv!4672 (array!11236) Bool)

(assert (=> b!225626 (= e!154064 (array_inv!4672 (buf!5472 thiss!1870)))))

(declare-fun b!225625 () Bool)

(assert (=> b!225625 (= e!154066 (and (not (= (bvand to!496 #b10000000000000000000000000000000) (bvand i!761 #b10000000000000000000000000000000))) (not (= (bvand to!496 #b10000000000000000000000000000000) (bvand (bvsub to!496 i!761) #b10000000000000000000000000000000)))))))

(declare-datatypes ((tuple2!19294 0))(
  ( (tuple2!19295 (_1!10434 (_ BitVec 8)) (_2!10434 BitStream!8958)) )
))
(declare-fun lt!358704 () tuple2!19294)

(declare-fun readByte!0 (BitStream!8958) tuple2!19294)

(assert (=> b!225625 (= lt!358704 (readByte!0 thiss!1870))))

(declare-fun res!189326 () Bool)

(assert (=> start!47254 (=> (not res!189326) (not e!154066))))

(declare-fun arr!308 () array!11236)

(assert (=> start!47254 (= res!189326 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4931 arr!308))))))

(assert (=> start!47254 e!154066))

(assert (=> start!47254 true))

(assert (=> start!47254 (array_inv!4672 arr!308)))

(declare-fun inv!12 (BitStream!8958) Bool)

(assert (=> start!47254 (and (inv!12 thiss!1870) e!154064)))

(declare-fun b!225624 () Bool)

(declare-fun res!189325 () Bool)

(assert (=> b!225624 (=> (not res!189325) (not e!154066))))

(assert (=> b!225624 (= res!189325 (bvslt i!761 to!496))))

(assert (= (and start!47254 res!189326) b!225623))

(assert (= (and b!225623 res!189327) b!225624))

(assert (= (and b!225624 res!189325) b!225625))

(assert (= start!47254 b!225626))

(declare-fun m!346657 () Bool)

(assert (=> b!225623 m!346657))

(declare-fun m!346659 () Bool)

(assert (=> b!225626 m!346659))

(declare-fun m!346661 () Bool)

(assert (=> b!225625 m!346661))

(declare-fun m!346663 () Bool)

(assert (=> start!47254 m!346663))

(declare-fun m!346665 () Bool)

(assert (=> start!47254 m!346665))

(check-sat (not b!225623) (not start!47254) (not b!225626) (not b!225625))
(check-sat)
