; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46262 () Bool)

(assert start!46262)

(declare-fun b!222772 () Bool)

(declare-fun res!187025 () Bool)

(declare-fun e!151525 () Bool)

(assert (=> b!222772 (=> (not res!187025) (not e!151525))))

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> b!222772 (= res!187025 (bvslt i!761 to!496))))

(declare-fun b!222773 () Bool)

(declare-fun res!187029 () Bool)

(assert (=> b!222773 (=> (not res!187029) (not e!151525))))

(declare-datatypes ((array!10920 0))(
  ( (array!10921 (arr!5722 (Array (_ BitVec 32) (_ BitVec 8))) (size!4792 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8686 0))(
  ( (BitStream!8687 (buf!5336 array!10920) (currentByte!10006 (_ BitVec 32)) (currentBit!10001 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!8686)

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!222773 (= res!187029 (validate_offset_bytes!0 ((_ sign_extend 32) (size!4792 (buf!5336 thiss!1870))) ((_ sign_extend 32) (currentByte!10006 thiss!1870)) ((_ sign_extend 32) (currentBit!10001 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!222774 () Bool)

(declare-fun e!151522 () Bool)

(declare-fun array_inv!4533 (array!10920) Bool)

(assert (=> b!222774 (= e!151522 (array_inv!4533 (buf!5336 thiss!1870)))))

(declare-fun b!222775 () Bool)

(declare-fun e!151523 () Bool)

(assert (=> b!222775 (= e!151523 false)))

(declare-fun lt!351427 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!222775 (= lt!351427 (bitIndex!0 (size!4792 (buf!5336 thiss!1870)) (currentByte!10006 thiss!1870) (currentBit!10001 thiss!1870)))))

(declare-fun b!222776 () Bool)

(declare-fun res!187027 () Bool)

(assert (=> b!222776 (=> (not res!187027) (not e!151523))))

(declare-datatypes ((tuple2!19004 0))(
  ( (tuple2!19005 (_1!10211 (_ BitVec 8)) (_2!10211 BitStream!8686)) )
))
(declare-fun lt!351428 () tuple2!19004)

(assert (=> b!222776 (= res!187027 (bvsle #b0000000000000000000000000000000000000000000000000000000000001000 (bitIndex!0 (size!4792 (buf!5336 (_2!10211 lt!351428))) (currentByte!10006 (_2!10211 lt!351428)) (currentBit!10001 (_2!10211 lt!351428)))))))

(declare-fun b!222777 () Bool)

(assert (=> b!222777 (= e!151525 e!151523)))

(declare-fun res!187028 () Bool)

(assert (=> b!222777 (=> (not res!187028) (not e!151523))))

(assert (=> b!222777 (= res!187028 (= (size!4792 (buf!5336 thiss!1870)) (size!4792 (buf!5336 (_2!10211 lt!351428)))))))

(declare-fun readByte!0 (BitStream!8686) tuple2!19004)

(assert (=> b!222777 (= lt!351428 (readByte!0 thiss!1870))))

(declare-fun res!187026 () Bool)

(assert (=> start!46262 (=> (not res!187026) (not e!151525))))

(declare-fun arr!308 () array!10920)

(assert (=> start!46262 (= res!187026 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!4792 arr!308))))))

(assert (=> start!46262 e!151525))

(assert (=> start!46262 true))

(assert (=> start!46262 (array_inv!4533 arr!308)))

(declare-fun inv!12 (BitStream!8686) Bool)

(assert (=> start!46262 (and (inv!12 thiss!1870) e!151522)))

(assert (= (and start!46262 res!187026) b!222773))

(assert (= (and b!222773 res!187029) b!222772))

(assert (= (and b!222772 res!187025) b!222777))

(assert (= (and b!222777 res!187028) b!222776))

(assert (= (and b!222776 res!187027) b!222775))

(assert (= start!46262 b!222774))

(declare-fun m!341035 () Bool)

(assert (=> start!46262 m!341035))

(declare-fun m!341037 () Bool)

(assert (=> start!46262 m!341037))

(declare-fun m!341039 () Bool)

(assert (=> b!222777 m!341039))

(declare-fun m!341041 () Bool)

(assert (=> b!222776 m!341041))

(declare-fun m!341043 () Bool)

(assert (=> b!222775 m!341043))

(declare-fun m!341045 () Bool)

(assert (=> b!222773 m!341045))

(declare-fun m!341047 () Bool)

(assert (=> b!222774 m!341047))

(push 1)

(assert (not b!222774))

(assert (not b!222777))

(assert (not b!222776))

(assert (not b!222775))

(assert (not start!46262))

(assert (not b!222773))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

