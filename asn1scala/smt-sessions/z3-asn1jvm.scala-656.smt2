; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!18444 () Bool)

(assert start!18444)

(declare-fun b!91535 () Bool)

(declare-fun res!75592 () Bool)

(declare-fun e!60171 () Bool)

(assert (=> b!91535 (=> (not res!75592) (not e!60171))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!91535 (= res!75592 (bvslt i!576 nBits!336))))

(declare-fun b!91536 () Bool)

(declare-fun res!75580 () Bool)

(declare-fun e!60175 () Bool)

(assert (=> b!91536 (=> (not res!75580) (not e!60175))))

(assert (=> b!91536 (= res!75580 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!91537 () Bool)

(declare-fun e!60176 () Bool)

(declare-datatypes ((array!4277 0))(
  ( (array!4278 (arr!2563 (Array (_ BitVec 32) (_ BitVec 8))) (size!1926 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3414 0))(
  ( (BitStream!3415 (buf!2316 array!4277) (currentByte!4615 (_ BitVec 32)) (currentBit!4610 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3414)

(declare-fun array_inv!1772 (array!4277) Bool)

(assert (=> b!91537 (= e!60176 (array_inv!1772 (buf!2316 thiss!1151)))))

(declare-fun b!91538 () Bool)

(declare-fun res!75586 () Bool)

(declare-fun e!60173 () Bool)

(assert (=> b!91538 (=> (not res!75586) (not e!60173))))

(declare-fun thiss!1152 () BitStream!3414)

(declare-datatypes ((Unit!5844 0))(
  ( (Unit!5845) )
))
(declare-datatypes ((tuple2!7610 0))(
  ( (tuple2!7611 (_1!4050 Unit!5844) (_2!4050 BitStream!3414)) )
))
(declare-fun lt!137902 () tuple2!7610)

(declare-fun isPrefixOf!0 (BitStream!3414 BitStream!3414) Bool)

(assert (=> b!91538 (= res!75586 (isPrefixOf!0 thiss!1152 (_2!4050 lt!137902)))))

(declare-fun b!91539 () Bool)

(declare-fun e!60169 () Bool)

(assert (=> b!91539 (= e!60169 e!60173)))

(declare-fun res!75589 () Bool)

(assert (=> b!91539 (=> (not res!75589) (not e!60173))))

(declare-fun lt!137903 () (_ BitVec 64))

(declare-fun lt!137901 () (_ BitVec 64))

(assert (=> b!91539 (= res!75589 (= lt!137903 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!137901)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!91539 (= lt!137903 (bitIndex!0 (size!1926 (buf!2316 (_2!4050 lt!137902))) (currentByte!4615 (_2!4050 lt!137902)) (currentBit!4610 (_2!4050 lt!137902))))))

(declare-fun b!91540 () Bool)

(assert (=> b!91540 (= e!60175 e!60171)))

(declare-fun res!75590 () Bool)

(assert (=> b!91540 (=> (not res!75590) (not e!60171))))

(declare-fun lt!137899 () (_ BitVec 64))

(assert (=> b!91540 (= res!75590 (= lt!137901 (bvadd lt!137899 ((_ sign_extend 32) i!576))))))

(assert (=> b!91540 (= lt!137901 (bitIndex!0 (size!1926 (buf!2316 thiss!1152)) (currentByte!4615 thiss!1152) (currentBit!4610 thiss!1152)))))

(assert (=> b!91540 (= lt!137899 (bitIndex!0 (size!1926 (buf!2316 thiss!1151)) (currentByte!4615 thiss!1151) (currentBit!4610 thiss!1151)))))

(declare-fun res!75581 () Bool)

(assert (=> start!18444 (=> (not res!75581) (not e!60175))))

(assert (=> start!18444 (= res!75581 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18444 e!60175))

(declare-fun e!60177 () Bool)

(declare-fun inv!12 (BitStream!3414) Bool)

(assert (=> start!18444 (and (inv!12 thiss!1152) e!60177)))

(assert (=> start!18444 (and (inv!12 thiss!1151) e!60176)))

(assert (=> start!18444 true))

(declare-fun b!91541 () Bool)

(declare-fun res!75588 () Bool)

(assert (=> b!91541 (=> (not res!75588) (not e!60175))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!91541 (= res!75588 (validate_offset_bits!1 ((_ sign_extend 32) (size!1926 (buf!2316 thiss!1151))) ((_ sign_extend 32) (currentByte!4615 thiss!1151)) ((_ sign_extend 32) (currentBit!4610 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!91542 () Bool)

(assert (=> b!91542 (= e!60177 (array_inv!1772 (buf!2316 thiss!1152)))))

(declare-fun b!91543 () Bool)

(declare-fun e!60174 () Bool)

(assert (=> b!91543 (= e!60173 e!60174)))

(declare-fun res!75582 () Bool)

(assert (=> b!91543 (=> (not res!75582) (not e!60174))))

(declare-datatypes ((tuple2!7612 0))(
  ( (tuple2!7613 (_1!4051 BitStream!3414) (_2!4051 Bool)) )
))
(declare-fun lt!137904 () tuple2!7612)

(declare-fun lt!137900 () Bool)

(assert (=> b!91543 (= res!75582 (and (= (_2!4051 lt!137904) lt!137900) (= (_1!4051 lt!137904) (_2!4050 lt!137902))))))

(declare-fun readBitPure!0 (BitStream!3414) tuple2!7612)

(declare-fun readerFrom!0 (BitStream!3414 (_ BitVec 32) (_ BitVec 32)) BitStream!3414)

(assert (=> b!91543 (= lt!137904 (readBitPure!0 (readerFrom!0 (_2!4050 lt!137902) (currentBit!4610 thiss!1152) (currentByte!4615 thiss!1152))))))

(declare-fun b!91544 () Bool)

(declare-fun res!75591 () Bool)

(assert (=> b!91544 (=> (not res!75591) (not e!60175))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!91544 (= res!75591 (invariant!0 (currentBit!4610 thiss!1151) (currentByte!4615 thiss!1151) (size!1926 (buf!2316 thiss!1151))))))

(declare-fun b!91545 () Bool)

(assert (=> b!91545 (= e!60174 (= (bitIndex!0 (size!1926 (buf!2316 (_1!4051 lt!137904))) (currentByte!4615 (_1!4051 lt!137904)) (currentBit!4610 (_1!4051 lt!137904))) lt!137903))))

(declare-fun b!91546 () Bool)

(declare-fun res!75583 () Bool)

(assert (=> b!91546 (=> (not res!75583) (not e!60175))))

(assert (=> b!91546 (= res!75583 (and (bvsle i!576 nBits!336) (= (size!1926 (buf!2316 thiss!1152)) (size!1926 (buf!2316 thiss!1151)))))))

(declare-fun b!91547 () Bool)

(declare-fun res!75584 () Bool)

(assert (=> b!91547 (=> (not res!75584) (not e!60175))))

(assert (=> b!91547 (= res!75584 (invariant!0 (currentBit!4610 thiss!1152) (currentByte!4615 thiss!1152) (size!1926 (buf!2316 thiss!1152))))))

(declare-fun b!91548 () Bool)

(declare-fun res!75587 () Bool)

(assert (=> b!91548 (=> (not res!75587) (not e!60171))))

(assert (=> b!91548 (= res!75587 (validate_offset_bits!1 ((_ sign_extend 32) (size!1926 (buf!2316 thiss!1152))) ((_ sign_extend 32) (currentByte!4615 thiss!1152)) ((_ sign_extend 32) (currentBit!4610 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!91549 () Bool)

(assert (=> b!91549 (= e!60171 (not true))))

(assert (=> b!91549 e!60169))

(declare-fun res!75585 () Bool)

(assert (=> b!91549 (=> (not res!75585) (not e!60169))))

(assert (=> b!91549 (= res!75585 (= (size!1926 (buf!2316 thiss!1152)) (size!1926 (buf!2316 (_2!4050 lt!137902)))))))

(declare-fun appendBit!0 (BitStream!3414 Bool) tuple2!7610)

(assert (=> b!91549 (= lt!137902 (appendBit!0 thiss!1152 lt!137900))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!91549 (= lt!137900 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!18444 res!75581) b!91541))

(assert (= (and b!91541 res!75588) b!91544))

(assert (= (and b!91544 res!75591) b!91536))

(assert (= (and b!91536 res!75580) b!91547))

(assert (= (and b!91547 res!75584) b!91546))

(assert (= (and b!91546 res!75583) b!91540))

(assert (= (and b!91540 res!75590) b!91548))

(assert (= (and b!91548 res!75587) b!91535))

(assert (= (and b!91535 res!75592) b!91549))

(assert (= (and b!91549 res!75585) b!91539))

(assert (= (and b!91539 res!75589) b!91538))

(assert (= (and b!91538 res!75586) b!91543))

(assert (= (and b!91543 res!75582) b!91545))

(assert (= start!18444 b!91542))

(assert (= start!18444 b!91537))

(declare-fun m!135661 () Bool)

(assert (=> b!91544 m!135661))

(declare-fun m!135663 () Bool)

(assert (=> b!91540 m!135663))

(declare-fun m!135665 () Bool)

(assert (=> b!91540 m!135665))

(declare-fun m!135667 () Bool)

(assert (=> b!91543 m!135667))

(assert (=> b!91543 m!135667))

(declare-fun m!135669 () Bool)

(assert (=> b!91543 m!135669))

(declare-fun m!135671 () Bool)

(assert (=> b!91549 m!135671))

(declare-fun m!135673 () Bool)

(assert (=> start!18444 m!135673))

(declare-fun m!135675 () Bool)

(assert (=> start!18444 m!135675))

(declare-fun m!135677 () Bool)

(assert (=> b!91538 m!135677))

(declare-fun m!135679 () Bool)

(assert (=> b!91547 m!135679))

(declare-fun m!135681 () Bool)

(assert (=> b!91537 m!135681))

(declare-fun m!135683 () Bool)

(assert (=> b!91548 m!135683))

(declare-fun m!135685 () Bool)

(assert (=> b!91545 m!135685))

(declare-fun m!135687 () Bool)

(assert (=> b!91542 m!135687))

(declare-fun m!135689 () Bool)

(assert (=> b!91541 m!135689))

(declare-fun m!135691 () Bool)

(assert (=> b!91539 m!135691))

(check-sat (not b!91545) (not b!91541) (not b!91542) (not b!91543) (not b!91537) (not start!18444) (not b!91544) (not b!91548) (not b!91538) (not b!91539) (not b!91549) (not b!91547) (not b!91540))
