; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27428 () Bool)

(assert start!27428)

(declare-fun b!140788 () Bool)

(declare-fun res!117394 () Bool)

(declare-fun e!93797 () Bool)

(assert (=> b!140788 (=> (not res!117394) (not e!93797))))

(declare-datatypes ((array!6443 0))(
  ( (array!6444 (arr!3622 (Array (_ BitVec 32) (_ BitVec 8))) (size!2915 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!5088 0))(
  ( (BitStream!5089 (buf!3336 array!6443) (currentByte!6196 (_ BitVec 32)) (currentBit!6191 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5088)

(declare-datatypes ((Unit!8812 0))(
  ( (Unit!8813) )
))
(declare-datatypes ((tuple2!12370 0))(
  ( (tuple2!12371 (_1!6515 Unit!8812) (_2!6515 BitStream!5088)) )
))
(declare-fun lt!219135 () tuple2!12370)

(declare-fun isPrefixOf!0 (BitStream!5088 BitStream!5088) Bool)

(assert (=> b!140788 (= res!117394 (isPrefixOf!0 thiss!1634 (_2!6515 lt!219135)))))

(declare-fun b!140789 () Bool)

(declare-fun res!117399 () Bool)

(declare-fun e!93799 () Bool)

(assert (=> b!140789 (=> (not res!117399) (not e!93799))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!140789 (= res!117399 (invariant!0 (currentBit!6191 thiss!1634) (currentByte!6196 thiss!1634) (size!2915 (buf!3336 thiss!1634))))))

(declare-fun b!140790 () Bool)

(declare-fun e!93798 () Bool)

(declare-fun array_inv!2704 (array!6443) Bool)

(assert (=> b!140790 (= e!93798 (array_inv!2704 (buf!3336 thiss!1634)))))

(declare-fun b!140791 () Bool)

(declare-fun res!117398 () Bool)

(assert (=> b!140791 (=> (not res!117398) (not e!93799))))

(declare-fun from!447 () (_ BitVec 32))

(declare-fun to!404 () (_ BitVec 32))

(assert (=> b!140791 (= res!117398 (bvslt from!447 to!404))))

(declare-fun b!140792 () Bool)

(assert (=> b!140792 (= e!93799 (not true))))

(declare-fun lt!219134 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!140792 (= lt!219134 (bitIndex!0 (size!2915 (buf!3336 (_2!6515 lt!219135))) (currentByte!6196 (_2!6515 lt!219135)) (currentBit!6191 (_2!6515 lt!219135))))))

(assert (=> b!140792 e!93797))

(declare-fun res!117397 () Bool)

(assert (=> b!140792 (=> (not res!117397) (not e!93797))))

(assert (=> b!140792 (= res!117397 (= (size!2915 (buf!3336 thiss!1634)) (size!2915 (buf!3336 (_2!6515 lt!219135)))))))

(declare-fun arr!237 () array!6443)

(declare-fun appendByte!0 (BitStream!5088 (_ BitVec 8)) tuple2!12370)

(assert (=> b!140792 (= lt!219135 (appendByte!0 thiss!1634 (select (arr!3622 arr!237) from!447)))))

(declare-fun b!140793 () Bool)

(declare-datatypes ((tuple2!12372 0))(
  ( (tuple2!12373 (_1!6516 BitStream!5088) (_2!6516 (_ BitVec 8))) )
))
(declare-fun lt!219137 () tuple2!12372)

(declare-datatypes ((tuple2!12374 0))(
  ( (tuple2!12375 (_1!6517 BitStream!5088) (_2!6517 BitStream!5088)) )
))
(declare-fun lt!219136 () tuple2!12374)

(assert (=> b!140793 (= e!93797 (and (= (_2!6516 lt!219137) (select (arr!3622 arr!237) from!447)) (= (_1!6516 lt!219137) (_2!6517 lt!219136))))))

(declare-fun readBytePure!0 (BitStream!5088) tuple2!12372)

(assert (=> b!140793 (= lt!219137 (readBytePure!0 (_1!6517 lt!219136)))))

(declare-fun reader!0 (BitStream!5088 BitStream!5088) tuple2!12374)

(assert (=> b!140793 (= lt!219136 (reader!0 thiss!1634 (_2!6515 lt!219135)))))

(declare-fun b!140794 () Bool)

(declare-fun res!117395 () Bool)

(assert (=> b!140794 (=> (not res!117395) (not e!93797))))

(assert (=> b!140794 (= res!117395 (= (bitIndex!0 (size!2915 (buf!3336 (_2!6515 lt!219135))) (currentByte!6196 (_2!6515 lt!219135)) (currentBit!6191 (_2!6515 lt!219135))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2915 (buf!3336 thiss!1634)) (currentByte!6196 thiss!1634) (currentBit!6191 thiss!1634)))))))

(declare-fun b!140795 () Bool)

(declare-fun res!117396 () Bool)

(assert (=> b!140795 (=> (not res!117396) (not e!93799))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140795 (= res!117396 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2915 (buf!3336 thiss!1634))) ((_ sign_extend 32) (currentByte!6196 thiss!1634)) ((_ sign_extend 32) (currentBit!6191 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun res!117400 () Bool)

(assert (=> start!27428 (=> (not res!117400) (not e!93799))))

(assert (=> start!27428 (= res!117400 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2915 arr!237))))))

(assert (=> start!27428 e!93799))

(assert (=> start!27428 true))

(assert (=> start!27428 (array_inv!2704 arr!237)))

(declare-fun inv!12 (BitStream!5088) Bool)

(assert (=> start!27428 (and (inv!12 thiss!1634) e!93798)))

(assert (= (and start!27428 res!117400) b!140795))

(assert (= (and b!140795 res!117396) b!140791))

(assert (= (and b!140791 res!117398) b!140789))

(assert (= (and b!140789 res!117399) b!140792))

(assert (= (and b!140792 res!117397) b!140794))

(assert (= (and b!140794 res!117395) b!140788))

(assert (= (and b!140788 res!117394) b!140793))

(assert (= start!27428 b!140790))

(declare-fun m!216605 () Bool)

(assert (=> b!140793 m!216605))

(declare-fun m!216607 () Bool)

(assert (=> b!140793 m!216607))

(declare-fun m!216609 () Bool)

(assert (=> b!140793 m!216609))

(declare-fun m!216611 () Bool)

(assert (=> start!27428 m!216611))

(declare-fun m!216613 () Bool)

(assert (=> start!27428 m!216613))

(declare-fun m!216615 () Bool)

(assert (=> b!140795 m!216615))

(declare-fun m!216617 () Bool)

(assert (=> b!140794 m!216617))

(declare-fun m!216619 () Bool)

(assert (=> b!140794 m!216619))

(declare-fun m!216621 () Bool)

(assert (=> b!140790 m!216621))

(declare-fun m!216623 () Bool)

(assert (=> b!140788 m!216623))

(declare-fun m!216625 () Bool)

(assert (=> b!140789 m!216625))

(assert (=> b!140792 m!216617))

(assert (=> b!140792 m!216605))

(assert (=> b!140792 m!216605))

(declare-fun m!216627 () Bool)

(assert (=> b!140792 m!216627))

(check-sat (not b!140789) (not b!140790) (not b!140794) (not b!140795) (not b!140793) (not b!140788) (not b!140792) (not start!27428))
