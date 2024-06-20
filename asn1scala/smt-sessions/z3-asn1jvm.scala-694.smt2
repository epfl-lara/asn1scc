; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!19556 () Bool)

(assert start!19556)

(declare-fun b!97523 () Bool)

(declare-fun e!63887 () Bool)

(declare-datatypes ((array!4560 0))(
  ( (array!4561 (arr!2677 (Array (_ BitVec 32) (_ BitVec 8))) (size!2084 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3642 0))(
  ( (BitStream!3643 (buf!2432 array!4560) (currentByte!4853 (_ BitVec 32)) (currentBit!4848 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3642)

(declare-fun array_inv!1886 (array!4560) Bool)

(assert (=> b!97523 (= e!63887 (array_inv!1886 (buf!2432 thiss!1288)))))

(declare-fun b!97524 () Bool)

(declare-fun res!80015 () Bool)

(declare-fun e!63886 () Bool)

(assert (=> b!97524 (=> (not res!80015) (not e!63886))))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97524 (= res!80015 (validate_offset_bits!1 ((_ sign_extend 32) (size!2084 (buf!2432 thiss!1288))) ((_ sign_extend 32) (currentByte!4853 thiss!1288)) ((_ sign_extend 32) (currentBit!4848 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!97525 () Bool)

(declare-fun res!80013 () Bool)

(declare-fun e!63888 () Bool)

(assert (=> b!97525 (=> (not res!80013) (not e!63888))))

(declare-datatypes ((Unit!5938 0))(
  ( (Unit!5939) )
))
(declare-datatypes ((tuple2!7808 0))(
  ( (tuple2!7809 (_1!4156 Unit!5938) (_2!4156 BitStream!3642)) )
))
(declare-fun lt!141286 () tuple2!7808)

(declare-fun isPrefixOf!0 (BitStream!3642 BitStream!3642) Bool)

(assert (=> b!97525 (= res!80013 (isPrefixOf!0 thiss!1288 (_2!4156 lt!141286)))))

(declare-fun b!97526 () Bool)

(declare-fun res!80016 () Bool)

(assert (=> b!97526 (=> (not res!80016) (not e!63886))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97526 (= res!80016 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!97527 () Bool)

(declare-fun res!80014 () Bool)

(assert (=> b!97527 (=> (not res!80014) (not e!63888))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97527 (= res!80014 (= (bitIndex!0 (size!2084 (buf!2432 (_2!4156 lt!141286))) (currentByte!4853 (_2!4156 lt!141286)) (currentBit!4848 (_2!4156 lt!141286))) (bvadd (bitIndex!0 (size!2084 (buf!2432 thiss!1288)) (currentByte!4853 thiss!1288) (currentBit!4848 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!97529 () Bool)

(assert (=> b!97529 (= e!63886 e!63888)))

(declare-fun res!80018 () Bool)

(assert (=> b!97529 (=> (not res!80018) (not e!63888))))

(assert (=> b!97529 (= res!80018 (= (size!2084 (buf!2432 thiss!1288)) (size!2084 (buf!2432 (_2!4156 lt!141286)))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3642 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7808)

(assert (=> b!97529 (= lt!141286 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun res!80017 () Bool)

(assert (=> start!19556 (=> (not res!80017) (not e!63886))))

(assert (=> start!19556 (= res!80017 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19556 e!63886))

(assert (=> start!19556 true))

(declare-fun inv!12 (BitStream!3642) Bool)

(assert (=> start!19556 (and (inv!12 thiss!1288) e!63887)))

(declare-fun b!97528 () Bool)

(assert (=> b!97528 (= e!63888 false)))

(declare-datatypes ((tuple2!7810 0))(
  ( (tuple2!7811 (_1!4157 BitStream!3642) (_2!4157 BitStream!3642)) )
))
(declare-fun lt!141285 () tuple2!7810)

(declare-fun reader!0 (BitStream!3642 BitStream!3642) tuple2!7810)

(assert (=> b!97528 (= lt!141285 (reader!0 thiss!1288 (_2!4156 lt!141286)))))

(assert (= (and start!19556 res!80017) b!97524))

(assert (= (and b!97524 res!80015) b!97526))

(assert (= (and b!97526 res!80016) b!97529))

(assert (= (and b!97529 res!80018) b!97527))

(assert (= (and b!97527 res!80014) b!97525))

(assert (= (and b!97525 res!80013) b!97528))

(assert (= start!19556 b!97523))

(declare-fun m!141799 () Bool)

(assert (=> b!97526 m!141799))

(declare-fun m!141801 () Bool)

(assert (=> b!97524 m!141801))

(declare-fun m!141803 () Bool)

(assert (=> b!97525 m!141803))

(declare-fun m!141805 () Bool)

(assert (=> b!97523 m!141805))

(declare-fun m!141807 () Bool)

(assert (=> b!97529 m!141807))

(declare-fun m!141809 () Bool)

(assert (=> b!97527 m!141809))

(declare-fun m!141811 () Bool)

(assert (=> b!97527 m!141811))

(declare-fun m!141813 () Bool)

(assert (=> start!19556 m!141813))

(declare-fun m!141815 () Bool)

(assert (=> b!97528 m!141815))

(check-sat (not b!97528) (not b!97523) (not b!97524) (not start!19556) (not b!97526) (not b!97525) (not b!97527) (not b!97529))
