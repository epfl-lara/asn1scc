; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27422 () Bool)

(assert start!27422)

(declare-datatypes ((array!6437 0))(
  ( (array!6438 (arr!3619 (Array (_ BitVec 32) (_ BitVec 8))) (size!2912 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5082 0))(
  ( (BitStream!5083 (buf!3333 array!6437) (currentByte!6193 (_ BitVec 32)) (currentBit!6188 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!12352 0))(
  ( (tuple2!12353 (_1!6506 BitStream!5082) (_2!6506 BitStream!5082)) )
))
(declare-fun lt!219099 () tuple2!12352)

(declare-fun b!140716 () Bool)

(declare-fun arr!237 () array!6437)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun e!93752 () Bool)

(declare-datatypes ((tuple2!12354 0))(
  ( (tuple2!12355 (_1!6507 BitStream!5082) (_2!6507 (_ BitVec 8))) )
))
(declare-fun lt!219100 () tuple2!12354)

(assert (=> b!140716 (= e!93752 (and (= (_2!6507 lt!219100) (select (arr!3619 arr!237) from!447)) (= (_1!6507 lt!219100) (_2!6506 lt!219099))))))

(declare-fun readBytePure!0 (BitStream!5082) tuple2!12354)

(assert (=> b!140716 (= lt!219100 (readBytePure!0 (_1!6506 lt!219099)))))

(declare-fun thiss!1634 () BitStream!5082)

(declare-datatypes ((Unit!8806 0))(
  ( (Unit!8807) )
))
(declare-datatypes ((tuple2!12356 0))(
  ( (tuple2!12357 (_1!6508 Unit!8806) (_2!6508 BitStream!5082)) )
))
(declare-fun lt!219098 () tuple2!12356)

(declare-fun reader!0 (BitStream!5082 BitStream!5082) tuple2!12352)

(assert (=> b!140716 (= lt!219099 (reader!0 thiss!1634 (_2!6508 lt!219098)))))

(declare-fun b!140717 () Bool)

(declare-fun e!93753 () Bool)

(assert (=> b!140717 (= e!93753 (not true))))

(declare-fun lt!219101 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140717 (= lt!219101 (bitIndex!0 (size!2912 (buf!3333 (_2!6508 lt!219098))) (currentByte!6193 (_2!6508 lt!219098)) (currentBit!6188 (_2!6508 lt!219098))))))

(assert (=> b!140717 e!93752))

(declare-fun res!117334 () Bool)

(assert (=> b!140717 (=> (not res!117334) (not e!93752))))

(assert (=> b!140717 (= res!117334 (= (size!2912 (buf!3333 thiss!1634)) (size!2912 (buf!3333 (_2!6508 lt!219098)))))))

(declare-fun appendByte!0 (BitStream!5082 (_ BitVec 8)) tuple2!12356)

(assert (=> b!140717 (= lt!219098 (appendByte!0 thiss!1634 (select (arr!3619 arr!237) from!447)))))

(declare-fun b!140718 () Bool)

(declare-fun res!117331 () Bool)

(assert (=> b!140718 (=> (not res!117331) (not e!93753))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140718 (= res!117331 (invariant!0 (currentBit!6188 thiss!1634) (currentByte!6193 thiss!1634) (size!2912 (buf!3333 thiss!1634))))))

(declare-fun b!140719 () Bool)

(declare-fun e!93756 () Bool)

(declare-fun array_inv!2701 (array!6437) Bool)

(assert (=> b!140719 (= e!93756 (array_inv!2701 (buf!3333 thiss!1634)))))

(declare-fun b!140720 () Bool)

(declare-fun res!117336 () Bool)

(assert (=> b!140720 (=> (not res!117336) (not e!93752))))

(declare-fun isPrefixOf!0 (BitStream!5082 BitStream!5082) Bool)

(assert (=> b!140720 (= res!117336 (isPrefixOf!0 thiss!1634 (_2!6508 lt!219098)))))

(declare-fun b!140721 () Bool)

(declare-fun res!117335 () Bool)

(assert (=> b!140721 (=> (not res!117335) (not e!93752))))

(assert (=> b!140721 (= res!117335 (= (bitIndex!0 (size!2912 (buf!3333 (_2!6508 lt!219098))) (currentByte!6193 (_2!6508 lt!219098)) (currentBit!6188 (_2!6508 lt!219098))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2912 (buf!3333 thiss!1634)) (currentByte!6193 thiss!1634) (currentBit!6188 thiss!1634)))))))

(declare-fun res!117333 () Bool)

(assert (=> start!27422 (=> (not res!117333) (not e!93753))))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> start!27422 (= res!117333 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2912 arr!237))))))

(assert (=> start!27422 e!93753))

(assert (=> start!27422 true))

(assert (=> start!27422 (array_inv!2701 arr!237)))

(declare-fun inv!12 (BitStream!5082) Bool)

(assert (=> start!27422 (and (inv!12 thiss!1634) e!93756)))

(declare-fun b!140722 () Bool)

(declare-fun res!117332 () Bool)

(assert (=> b!140722 (=> (not res!117332) (not e!93753))))

(assert (=> b!140722 (= res!117332 (bvslt from!447 to!404))))

(declare-fun b!140723 () Bool)

(declare-fun res!117337 () Bool)

(assert (=> b!140723 (=> (not res!117337) (not e!93753))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140723 (= res!117337 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2912 (buf!3333 thiss!1634))) ((_ sign_extend 32) (currentByte!6193 thiss!1634)) ((_ sign_extend 32) (currentBit!6188 thiss!1634)) (bvsub to!404 from!447)))))

(assert (= (and start!27422 res!117333) b!140723))

(assert (= (and b!140723 res!117337) b!140722))

(assert (= (and b!140722 res!117332) b!140718))

(assert (= (and b!140718 res!117331) b!140717))

(assert (= (and b!140717 res!117334) b!140721))

(assert (= (and b!140721 res!117335) b!140720))

(assert (= (and b!140720 res!117336) b!140716))

(assert (= start!27422 b!140719))

(declare-fun m!216533 () Bool)

(assert (=> b!140723 m!216533))

(declare-fun m!216535 () Bool)

(assert (=> b!140716 m!216535))

(declare-fun m!216537 () Bool)

(assert (=> b!140716 m!216537))

(declare-fun m!216539 () Bool)

(assert (=> b!140716 m!216539))

(declare-fun m!216541 () Bool)

(assert (=> start!27422 m!216541))

(declare-fun m!216543 () Bool)

(assert (=> start!27422 m!216543))

(declare-fun m!216545 () Bool)

(assert (=> b!140717 m!216545))

(assert (=> b!140717 m!216535))

(assert (=> b!140717 m!216535))

(declare-fun m!216547 () Bool)

(assert (=> b!140717 m!216547))

(declare-fun m!216549 () Bool)

(assert (=> b!140719 m!216549))

(declare-fun m!216551 () Bool)

(assert (=> b!140720 m!216551))

(assert (=> b!140721 m!216545))

(declare-fun m!216553 () Bool)

(assert (=> b!140721 m!216553))

(declare-fun m!216555 () Bool)

(assert (=> b!140718 m!216555))

(check-sat (not b!140716) (not b!140721) (not b!140718) (not b!140719) (not b!140720) (not start!27422) (not b!140717) (not b!140723))
