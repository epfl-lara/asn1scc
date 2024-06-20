; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41616 () Bool)

(assert start!41616)

(declare-fun b!195636 () Bool)

(declare-fun res!163656 () Bool)

(declare-fun e!134511 () Bool)

(assert (=> b!195636 (=> (not res!163656) (not e!134511))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!10053 0))(
  ( (array!10054 (arr!5364 (Array (_ BitVec 32) (_ BitVec 8))) (size!4434 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7976 0))(
  ( (BitStream!7977 (buf!4920 array!10053) (currentByte!9222 (_ BitVec 32)) (currentBit!9217 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7976)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195636 (= res!163656 (validate_offset_bits!1 ((_ sign_extend 32) (size!4434 (buf!4920 thiss!1204))) ((_ sign_extend 32) (currentByte!9222 thiss!1204)) ((_ sign_extend 32) (currentBit!9217 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!195637 () Bool)

(declare-fun e!134510 () Bool)

(declare-datatypes ((tuple2!16924 0))(
  ( (tuple2!16925 (_1!9107 BitStream!7976) (_2!9107 Bool)) )
))
(declare-fun lt!303988 () tuple2!16924)

(declare-fun lt!303986 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195637 (= e!134510 (= (bitIndex!0 (size!4434 (buf!4920 (_1!9107 lt!303988))) (currentByte!9222 (_1!9107 lt!303988)) (currentBit!9217 (_1!9107 lt!303988))) lt!303986))))

(declare-fun res!163660 () Bool)

(assert (=> start!41616 (=> (not res!163660) (not e!134511))))

(assert (=> start!41616 (= res!163660 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41616 e!134511))

(assert (=> start!41616 true))

(declare-fun e!134509 () Bool)

(declare-fun inv!12 (BitStream!7976) Bool)

(assert (=> start!41616 (and (inv!12 thiss!1204) e!134509)))

(declare-fun b!195638 () Bool)

(declare-fun e!134512 () Bool)

(declare-fun e!134508 () Bool)

(assert (=> b!195638 (= e!134512 e!134508)))

(declare-fun res!163657 () Bool)

(assert (=> b!195638 (=> (not res!163657) (not e!134508))))

(declare-fun lt!303985 () (_ BitVec 64))

(assert (=> b!195638 (= res!163657 (= lt!303986 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!303985)))))

(declare-datatypes ((Unit!13811 0))(
  ( (Unit!13812) )
))
(declare-datatypes ((tuple2!16926 0))(
  ( (tuple2!16927 (_1!9108 Unit!13811) (_2!9108 BitStream!7976)) )
))
(declare-fun lt!303984 () tuple2!16926)

(assert (=> b!195638 (= lt!303986 (bitIndex!0 (size!4434 (buf!4920 (_2!9108 lt!303984))) (currentByte!9222 (_2!9108 lt!303984)) (currentBit!9217 (_2!9108 lt!303984))))))

(assert (=> b!195638 (= lt!303985 (bitIndex!0 (size!4434 (buf!4920 thiss!1204)) (currentByte!9222 thiss!1204) (currentBit!9217 thiss!1204)))))

(declare-fun b!195639 () Bool)

(assert (=> b!195639 (= e!134511 (not true))))

(declare-fun lt!303983 () (_ BitVec 64))

(assert (=> b!195639 (= lt!303983 (bitIndex!0 (size!4434 (buf!4920 (_2!9108 lt!303984))) (currentByte!9222 (_2!9108 lt!303984)) (currentBit!9217 (_2!9108 lt!303984))))))

(declare-fun lt!303982 () (_ BitVec 64))

(assert (=> b!195639 (= lt!303982 (bitIndex!0 (size!4434 (buf!4920 thiss!1204)) (currentByte!9222 thiss!1204) (currentBit!9217 thiss!1204)))))

(assert (=> b!195639 e!134512))

(declare-fun res!163659 () Bool)

(assert (=> b!195639 (=> (not res!163659) (not e!134512))))

(assert (=> b!195639 (= res!163659 (= (size!4434 (buf!4920 thiss!1204)) (size!4434 (buf!4920 (_2!9108 lt!303984)))))))

(declare-fun lt!303987 () Bool)

(declare-fun appendBit!0 (BitStream!7976 Bool) tuple2!16926)

(assert (=> b!195639 (= lt!303984 (appendBit!0 thiss!1204 lt!303987))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!195639 (= lt!303987 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195640 () Bool)

(declare-fun res!163658 () Bool)

(assert (=> b!195640 (=> (not res!163658) (not e!134511))))

(assert (=> b!195640 (= res!163658 (not (= i!590 nBits!348)))))

(declare-fun b!195641 () Bool)

(declare-fun res!163655 () Bool)

(assert (=> b!195641 (=> (not res!163655) (not e!134508))))

(declare-fun isPrefixOf!0 (BitStream!7976 BitStream!7976) Bool)

(assert (=> b!195641 (= res!163655 (isPrefixOf!0 thiss!1204 (_2!9108 lt!303984)))))

(declare-fun b!195642 () Bool)

(declare-fun array_inv!4175 (array!10053) Bool)

(assert (=> b!195642 (= e!134509 (array_inv!4175 (buf!4920 thiss!1204)))))

(declare-fun b!195643 () Bool)

(declare-fun res!163661 () Bool)

(assert (=> b!195643 (=> (not res!163661) (not e!134511))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195643 (= res!163661 (invariant!0 (currentBit!9217 thiss!1204) (currentByte!9222 thiss!1204) (size!4434 (buf!4920 thiss!1204))))))

(declare-fun b!195644 () Bool)

(assert (=> b!195644 (= e!134508 e!134510)))

(declare-fun res!163662 () Bool)

(assert (=> b!195644 (=> (not res!163662) (not e!134510))))

(assert (=> b!195644 (= res!163662 (and (= (_2!9107 lt!303988) lt!303987) (= (_1!9107 lt!303988) (_2!9108 lt!303984))))))

(declare-fun readBitPure!0 (BitStream!7976) tuple2!16924)

(declare-fun readerFrom!0 (BitStream!7976 (_ BitVec 32) (_ BitVec 32)) BitStream!7976)

(assert (=> b!195644 (= lt!303988 (readBitPure!0 (readerFrom!0 (_2!9108 lt!303984) (currentBit!9217 thiss!1204) (currentByte!9222 thiss!1204))))))

(assert (= (and start!41616 res!163660) b!195636))

(assert (= (and b!195636 res!163656) b!195643))

(assert (= (and b!195643 res!163661) b!195640))

(assert (= (and b!195640 res!163658) b!195639))

(assert (= (and b!195639 res!163659) b!195638))

(assert (= (and b!195638 res!163657) b!195641))

(assert (= (and b!195641 res!163655) b!195644))

(assert (= (and b!195644 res!163662) b!195637))

(assert (= start!41616 b!195642))

(declare-fun m!302803 () Bool)

(assert (=> b!195637 m!302803))

(declare-fun m!302805 () Bool)

(assert (=> b!195638 m!302805))

(declare-fun m!302807 () Bool)

(assert (=> b!195638 m!302807))

(declare-fun m!302809 () Bool)

(assert (=> start!41616 m!302809))

(declare-fun m!302811 () Bool)

(assert (=> b!195641 m!302811))

(declare-fun m!302813 () Bool)

(assert (=> b!195643 m!302813))

(assert (=> b!195639 m!302805))

(assert (=> b!195639 m!302807))

(declare-fun m!302815 () Bool)

(assert (=> b!195639 m!302815))

(declare-fun m!302817 () Bool)

(assert (=> b!195644 m!302817))

(assert (=> b!195644 m!302817))

(declare-fun m!302819 () Bool)

(assert (=> b!195644 m!302819))

(declare-fun m!302821 () Bool)

(assert (=> b!195636 m!302821))

(declare-fun m!302823 () Bool)

(assert (=> b!195642 m!302823))

(push 1)

