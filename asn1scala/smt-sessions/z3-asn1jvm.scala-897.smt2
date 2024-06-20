; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25458 () Bool)

(assert start!25458)

(declare-fun b!128610 () Bool)

(declare-fun e!85255 () Bool)

(declare-fun e!85252 () Bool)

(assert (=> b!128610 (= e!85255 (not e!85252))))

(declare-fun res!106451 () Bool)

(assert (=> b!128610 (=> res!106451 e!85252)))

(declare-datatypes ((array!5943 0))(
  ( (array!5944 (arr!3304 (Array (_ BitVec 32) (_ BitVec 8))) (size!2687 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4638 0))(
  ( (BitStream!4639 (buf!3045 array!5943) (currentByte!5806 (_ BitVec 32)) (currentBit!5801 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7979 0))(
  ( (Unit!7980) )
))
(declare-datatypes ((tuple2!10888 0))(
  ( (tuple2!10889 (_1!5741 Unit!7979) (_2!5741 BitStream!4638)) )
))
(declare-fun lt!199507 () tuple2!10888)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!128610 (= res!106451 (bvsgt #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2687 (buf!3045 (_2!5741 lt!199507))) (currentByte!5806 (_2!5741 lt!199507)) (currentBit!5801 (_2!5741 lt!199507)))))))

(declare-fun e!85253 () Bool)

(assert (=> b!128610 e!85253))

(declare-fun res!106452 () Bool)

(assert (=> b!128610 (=> (not res!106452) (not e!85253))))

(declare-fun thiss!1634 () BitStream!4638)

(assert (=> b!128610 (= res!106452 (= (size!2687 (buf!3045 thiss!1634)) (size!2687 (buf!3045 (_2!5741 lt!199507)))))))

(declare-fun arr!237 () array!5943)

(declare-fun from!447 () (_ BitVec 32))

(declare-fun appendByte!0 (BitStream!4638 (_ BitVec 8)) tuple2!10888)

(assert (=> b!128610 (= lt!199507 (appendByte!0 thiss!1634 (select (arr!3304 arr!237) from!447)))))

(declare-fun b!128611 () Bool)

(declare-fun res!106449 () Bool)

(assert (=> b!128611 (=> (not res!106449) (not e!85255))))

(declare-fun to!404 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!128611 (= res!106449 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2687 (buf!3045 thiss!1634))) ((_ sign_extend 32) (currentByte!5806 thiss!1634)) ((_ sign_extend 32) (currentBit!5801 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!128612 () Bool)

(declare-fun e!85254 () Bool)

(declare-fun array_inv!2476 (array!5943) Bool)

(assert (=> b!128612 (= e!85254 (array_inv!2476 (buf!3045 thiss!1634)))))

(declare-fun res!106448 () Bool)

(assert (=> start!25458 (=> (not res!106448) (not e!85255))))

(assert (=> start!25458 (= res!106448 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2687 arr!237))))))

(assert (=> start!25458 e!85255))

(assert (=> start!25458 true))

(assert (=> start!25458 (array_inv!2476 arr!237)))

(declare-fun inv!12 (BitStream!4638) Bool)

(assert (=> start!25458 (and (inv!12 thiss!1634) e!85254)))

(declare-fun b!128613 () Bool)

(declare-fun res!106446 () Bool)

(assert (=> b!128613 (=> (not res!106446) (not e!85253))))

(declare-fun isPrefixOf!0 (BitStream!4638 BitStream!4638) Bool)

(assert (=> b!128613 (= res!106446 (isPrefixOf!0 thiss!1634 (_2!5741 lt!199507)))))

(declare-fun b!128614 () Bool)

(declare-fun res!106453 () Bool)

(assert (=> b!128614 (=> (not res!106453) (not e!85253))))

(assert (=> b!128614 (= res!106453 (= (bitIndex!0 (size!2687 (buf!3045 (_2!5741 lt!199507))) (currentByte!5806 (_2!5741 lt!199507)) (currentBit!5801 (_2!5741 lt!199507))) (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!2687 (buf!3045 thiss!1634)) (currentByte!5806 thiss!1634) (currentBit!5801 thiss!1634)))))))

(declare-fun b!128615 () Bool)

(declare-fun res!106447 () Bool)

(assert (=> b!128615 (=> (not res!106447) (not e!85255))))

(assert (=> b!128615 (= res!106447 (bvslt from!447 to!404))))

(declare-fun b!128616 () Bool)

(assert (=> b!128616 (= e!85252 true)))

(declare-fun lt!199505 () (_ BitVec 64))

(assert (=> b!128616 (= lt!199505 (bitIndex!0 (size!2687 (buf!3045 thiss!1634)) (currentByte!5806 thiss!1634) (currentBit!5801 thiss!1634)))))

(declare-fun b!128617 () Bool)

(declare-fun res!106450 () Bool)

(assert (=> b!128617 (=> (not res!106450) (not e!85255))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!128617 (= res!106450 (invariant!0 (currentBit!5801 thiss!1634) (currentByte!5806 thiss!1634) (size!2687 (buf!3045 thiss!1634))))))

(declare-datatypes ((tuple2!10890 0))(
  ( (tuple2!10891 (_1!5742 BitStream!4638) (_2!5742 BitStream!4638)) )
))
(declare-fun lt!199508 () tuple2!10890)

(declare-fun b!128618 () Bool)

(declare-datatypes ((tuple2!10892 0))(
  ( (tuple2!10893 (_1!5743 BitStream!4638) (_2!5743 (_ BitVec 8))) )
))
(declare-fun lt!199506 () tuple2!10892)

(assert (=> b!128618 (= e!85253 (and (= (_2!5743 lt!199506) (select (arr!3304 arr!237) from!447)) (= (_1!5743 lt!199506) (_2!5742 lt!199508))))))

(declare-fun readBytePure!0 (BitStream!4638) tuple2!10892)

(assert (=> b!128618 (= lt!199506 (readBytePure!0 (_1!5742 lt!199508)))))

(declare-fun reader!0 (BitStream!4638 BitStream!4638) tuple2!10890)

(assert (=> b!128618 (= lt!199508 (reader!0 thiss!1634 (_2!5741 lt!199507)))))

(assert (= (and start!25458 res!106448) b!128611))

(assert (= (and b!128611 res!106449) b!128615))

(assert (= (and b!128615 res!106447) b!128617))

(assert (= (and b!128617 res!106450) b!128610))

(assert (= (and b!128610 res!106452) b!128614))

(assert (= (and b!128614 res!106453) b!128613))

(assert (= (and b!128613 res!106446) b!128618))

(assert (= (and b!128610 (not res!106451)) b!128616))

(assert (= start!25458 b!128612))

(declare-fun m!194389 () Bool)

(assert (=> b!128617 m!194389))

(declare-fun m!194391 () Bool)

(assert (=> b!128610 m!194391))

(declare-fun m!194393 () Bool)

(assert (=> b!128610 m!194393))

(assert (=> b!128610 m!194393))

(declare-fun m!194395 () Bool)

(assert (=> b!128610 m!194395))

(declare-fun m!194397 () Bool)

(assert (=> b!128611 m!194397))

(assert (=> b!128618 m!194393))

(declare-fun m!194399 () Bool)

(assert (=> b!128618 m!194399))

(declare-fun m!194401 () Bool)

(assert (=> b!128618 m!194401))

(declare-fun m!194403 () Bool)

(assert (=> b!128616 m!194403))

(declare-fun m!194405 () Bool)

(assert (=> start!25458 m!194405))

(declare-fun m!194407 () Bool)

(assert (=> start!25458 m!194407))

(declare-fun m!194409 () Bool)

(assert (=> b!128613 m!194409))

(declare-fun m!194411 () Bool)

(assert (=> b!128612 m!194411))

(assert (=> b!128614 m!194391))

(assert (=> b!128614 m!194403))

(check-sat (not b!128618) (not b!128617) (not b!128613) (not b!128614) (not b!128616) (not b!128611) (not b!128610) (not start!25458) (not b!128612))
