; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27434 () Bool)

(assert start!27434)

(declare-fun res!117465 () Bool)

(declare-fun e!93850 () Bool)

(assert (=> start!27434 (=> (not res!117465) (not e!93850))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6449 0))(
  ( (array!6450 (arr!3625 (Array (_ BitVec 32) (_ BitVec 8))) (size!2918 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6449)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27434 (= res!117465 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2918 arr!237))))))

(assert (=> start!27434 e!93850))

(assert (=> start!27434 true))

(declare-fun array_inv!2707 (array!6449) Bool)

(assert (=> start!27434 (array_inv!2707 arr!237)))

(declare-datatypes ((BitStream!5094 0))(
  ( (BitStream!5095 (buf!3339 array!6449) (currentByte!6199 (_ BitVec 32)) (currentBit!6194 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5094)

(declare-fun e!93848 () Bool)

(declare-fun inv!12 (BitStream!5094) Bool)

(assert (=> start!27434 (and (inv!12 thiss!1634) e!93848)))

(declare-fun b!140865 () Bool)

(declare-fun e!93851 () Bool)

(assert (=> b!140865 (= e!93851 true)))

(declare-fun lt!219172 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140865 (= lt!219172 (bitIndex!0 (size!2918 (buf!3339 thiss!1634)) (currentByte!6199 thiss!1634) (currentBit!6194 thiss!1634)))))

(declare-fun b!140866 () Bool)

(assert (=> b!140866 (= e!93850 (not e!93851))))

(declare-fun res!117462 () Bool)

(assert (=> b!140866 (=> res!117462 e!93851)))

(declare-datatypes ((Unit!8818 0))(
  ( (Unit!8819) )
))
(declare-datatypes ((tuple2!12388 0))(
  ( (tuple2!12389 (_1!6524 Unit!8818) (_2!6524 BitStream!5094)) )
))
(declare-fun lt!219171 () tuple2!12388)

(assert (=> b!140866 (= res!117462 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2918 (buf!3339 (_2!6524 lt!219171))) (currentByte!6199 (_2!6524 lt!219171)) (currentBit!6194 (_2!6524 lt!219171)))))))

(declare-fun e!93847 () Bool)

(assert (=> b!140866 e!93847))

(declare-fun res!117466 () Bool)

(assert (=> b!140866 (=> (not res!117466) (not e!93847))))

(assert (=> b!140866 (= res!117466 (= (size!2918 (buf!3339 thiss!1634)) (size!2918 (buf!3339 (_2!6524 lt!219171)))))))

(declare-fun appendByte!0 (BitStream!5094 (_ BitVec 8)) tuple2!12388)

(assert (=> b!140866 (= lt!219171 (appendByte!0 thiss!1634 (select (arr!3625 arr!237) from!447)))))

(declare-fun b!140867 () Bool)

(declare-datatypes ((tuple2!12390 0))(
  ( (tuple2!12391 (_1!6525 BitStream!5094) (_2!6525 BitStream!5094)) )
))
(declare-fun lt!219170 () tuple2!12390)

(declare-datatypes ((tuple2!12392 0))(
  ( (tuple2!12393 (_1!6526 BitStream!5094) (_2!6526 (_ BitVec 8))) )
))
(declare-fun lt!219173 () tuple2!12392)

(assert (=> b!140867 (= e!93847 (and (= (_2!6526 lt!219173) (select (arr!3625 arr!237) from!447)) (= (_1!6526 lt!219173) (_2!6525 lt!219170))))))

(declare-fun readBytePure!0 (BitStream!5094) tuple2!12392)

(assert (=> b!140867 (= lt!219173 (readBytePure!0 (_1!6525 lt!219170)))))

(declare-fun reader!0 (BitStream!5094 BitStream!5094) tuple2!12390)

(assert (=> b!140867 (= lt!219170 (reader!0 thiss!1634 (_2!6524 lt!219171)))))

(declare-fun b!140868 () Bool)

(declare-fun res!117464 () Bool)

(assert (=> b!140868 (=> (not res!117464) (not e!93847))))

(declare-fun isPrefixOf!0 (BitStream!5094 BitStream!5094) Bool)

(assert (=> b!140868 (= res!117464 (isPrefixOf!0 thiss!1634 (_2!6524 lt!219171)))))

(declare-fun b!140869 () Bool)

(declare-fun res!117463 () Bool)

(assert (=> b!140869 (=> (not res!117463) (not e!93850))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140869 (= res!117463 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2918 (buf!3339 thiss!1634))) ((_ sign_extend 32) (currentByte!6199 thiss!1634)) ((_ sign_extend 32) (currentBit!6194 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140870 () Bool)

(declare-fun res!117469 () Bool)

(assert (=> b!140870 (=> (not res!117469) (not e!93847))))

(assert (=> b!140870 (= res!117469 (= (bitIndex!0 (size!2918 (buf!3339 (_2!6524 lt!219171))) (currentByte!6199 (_2!6524 lt!219171)) (currentBit!6194 (_2!6524 lt!219171))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2918 (buf!3339 thiss!1634)) (currentByte!6199 thiss!1634) (currentBit!6194 thiss!1634)))))))

(declare-fun b!140871 () Bool)

(declare-fun res!117468 () Bool)

(assert (=> b!140871 (=> (not res!117468) (not e!93850))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140871 (= res!117468 (invariant!0 (currentBit!6194 thiss!1634) (currentByte!6199 thiss!1634) (size!2918 (buf!3339 thiss!1634))))))

(declare-fun b!140872 () Bool)

(assert (=> b!140872 (= e!93848 (array_inv!2707 (buf!3339 thiss!1634)))))

(declare-fun b!140873 () Bool)

(declare-fun res!117467 () Bool)

(assert (=> b!140873 (=> (not res!117467) (not e!93850))))

(assert (=> b!140873 (= res!117467 (bvslt from!447 to!404))))

(assert (= (and start!27434 res!117465) b!140869))

(assert (= (and b!140869 res!117463) b!140873))

(assert (= (and b!140873 res!117467) b!140871))

(assert (= (and b!140871 res!117468) b!140866))

(assert (= (and b!140866 res!117466) b!140870))

(assert (= (and b!140870 res!117469) b!140868))

(assert (= (and b!140868 res!117464) b!140867))

(assert (= (and b!140866 (not res!117462)) b!140865))

(assert (= start!27434 b!140872))

(declare-fun m!216677 () Bool)

(assert (=> b!140865 m!216677))

(declare-fun m!216679 () Bool)

(assert (=> start!27434 m!216679))

(declare-fun m!216681 () Bool)

(assert (=> start!27434 m!216681))

(declare-fun m!216683 () Bool)

(assert (=> b!140871 m!216683))

(declare-fun m!216685 () Bool)

(assert (=> b!140868 m!216685))

(declare-fun m!216687 () Bool)

(assert (=> b!140869 m!216687))

(declare-fun m!216689 () Bool)

(assert (=> b!140867 m!216689))

(declare-fun m!216691 () Bool)

(assert (=> b!140867 m!216691))

(declare-fun m!216693 () Bool)

(assert (=> b!140867 m!216693))

(declare-fun m!216695 () Bool)

(assert (=> b!140870 m!216695))

(assert (=> b!140870 m!216677))

(declare-fun m!216697 () Bool)

(assert (=> b!140872 m!216697))

(assert (=> b!140866 m!216695))

(assert (=> b!140866 m!216689))

(assert (=> b!140866 m!216689))

(declare-fun m!216699 () Bool)

(assert (=> b!140866 m!216699))

(check-sat (not b!140866) (not b!140865) (not b!140867) (not b!140869) (not b!140872) (not start!27434) (not b!140870) (not b!140871) (not b!140868))
