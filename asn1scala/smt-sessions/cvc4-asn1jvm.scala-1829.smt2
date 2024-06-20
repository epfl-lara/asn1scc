; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49180 () Bool)

(assert start!49180)

(declare-fun b!233556 () Bool)

(declare-fun e!160946 () Bool)

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!233556 (= e!160946 (and (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand bits!86 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!233557 () Bool)

(declare-fun e!160952 () Bool)

(declare-datatypes ((array!12068 0))(
  ( (array!12069 (arr!6282 (Array (_ BitVec 32) (_ BitVec 8))) (size!5295 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9686 0))(
  ( (BitStream!9687 (buf!5836 array!12068) (currentByte!10870 (_ BitVec 32)) (currentBit!10865 (_ BitVec 32))) )
))
(declare-fun b2!99 () BitStream!9686)

(declare-fun array_inv!5036 (array!12068) Bool)

(assert (=> b!233557 (= e!160952 (array_inv!5036 (buf!5836 b2!99)))))

(declare-fun b!233558 () Bool)

(declare-fun res!195399 () Bool)

(assert (=> b!233558 (=> (not res!195399) (not e!160946))))

(declare-fun lt!369504 () (_ BitVec 32))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233558 (= res!195399 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5295 (buf!5836 b2!99))) ((_ sign_extend 32) (currentByte!10870 b2!99)) ((_ sign_extend 32) (currentBit!10865 b2!99)) (bvsub bytes!19 lt!369504)))))

(declare-fun b!233559 () Bool)

(declare-fun res!195401 () Bool)

(declare-fun e!160948 () Bool)

(assert (=> b!233559 (=> (not res!195401) (not e!160948))))

(declare-fun b1!101 () BitStream!9686)

(assert (=> b!233559 (= res!195401 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5295 (buf!5836 b1!101))) ((_ sign_extend 32) (currentByte!10870 b1!101)) ((_ sign_extend 32) (currentBit!10865 b1!101)) bytes!19))))

(declare-fun b!233560 () Bool)

(declare-fun e!160944 () Bool)

(assert (=> b!233560 (= e!160944 e!160948)))

(declare-fun res!195404 () Bool)

(assert (=> b!233560 (=> (not res!195404) (not e!160948))))

(assert (=> b!233560 (= res!195404 (bvsle lt!369504 bytes!19))))

(declare-fun lt!369502 () (_ BitVec 64))

(assert (=> b!233560 (= lt!369504 ((_ extract 31 0) lt!369502))))

(assert (=> b!233560 (= lt!369502 (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000))))

(declare-fun res!195397 () Bool)

(declare-fun e!160945 () Bool)

(assert (=> start!49180 (=> (not res!195397) (not e!160945))))

(assert (=> start!49180 (= res!195397 (and (= (size!5295 (buf!5836 b1!101)) (size!5295 (buf!5836 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49180 e!160945))

(declare-fun e!160947 () Bool)

(declare-fun inv!12 (BitStream!9686) Bool)

(assert (=> start!49180 (and (inv!12 b1!101) e!160947)))

(assert (=> start!49180 (and (inv!12 b2!99) e!160952)))

(assert (=> start!49180 true))

(declare-fun b!233561 () Bool)

(declare-fun res!195398 () Bool)

(assert (=> b!233561 (=> (not res!195398) (not e!160948))))

(declare-fun lt!369505 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233561 (= res!195398 (= lt!369505 (bvadd (bitIndex!0 (size!5295 (buf!5836 b1!101)) (currentByte!10870 b1!101) (currentBit!10865 b1!101)) bits!86)))))

(declare-fun b!233562 () Bool)

(declare-fun e!160949 () Bool)

(declare-fun e!160951 () Bool)

(assert (=> b!233562 (= e!160949 e!160951)))

(declare-fun res!195400 () Bool)

(assert (=> b!233562 (=> (not res!195400) (not e!160951))))

(declare-fun lt!369507 () (_ BitVec 64))

(declare-fun lt!369503 () (_ BitVec 64))

(assert (=> b!233562 (= res!195400 (and (= lt!369505 lt!369507) (= (bvsub lt!369505 bits!86) lt!369503)))))

(assert (=> b!233562 (= lt!369507 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10870 b2!99))) ((_ sign_extend 32) (currentBit!10865 b2!99))))))

(declare-fun b!233563 () Bool)

(assert (=> b!233563 (= e!160945 e!160944)))

(declare-fun res!195402 () Bool)

(assert (=> b!233563 (=> (not res!195402) (not e!160944))))

(assert (=> b!233563 (= res!195402 (bvsle bits!86 lt!369505))))

(assert (=> b!233563 (= lt!369505 (bitIndex!0 (size!5295 (buf!5836 b2!99)) (currentByte!10870 b2!99) (currentBit!10865 b2!99)))))

(declare-fun b!233564 () Bool)

(assert (=> b!233564 (= e!160951 e!160946)))

(declare-fun res!195405 () Bool)

(assert (=> b!233564 (=> (not res!195405) (not e!160946))))

(declare-fun lt!369506 () (_ BitVec 64))

(assert (=> b!233564 (= res!195405 (and (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub lt!369506 (bvsub lt!369507 bits!86)) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle ((_ sign_extend 32) bytes!19) (bvadd (bvsdiv (bvsub lt!369506 lt!369507) #b0000000000000000000000000000000000000000000000000000000000001000) lt!369502))))))

(assert (=> b!233564 (= lt!369506 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5295 (buf!5836 b2!99)))))))

(declare-fun b!233565 () Bool)

(assert (=> b!233565 (= e!160947 (array_inv!5036 (buf!5836 b1!101)))))

(declare-fun b!233566 () Bool)

(declare-fun res!195403 () Bool)

(assert (=> b!233566 (=> (not res!195403) (not e!160948))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!233566 (= res!195403 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (remainingBits!0 ((_ sign_extend 32) (size!5295 (buf!5836 b1!101))) ((_ sign_extend 32) (currentByte!10870 b1!101)) ((_ sign_extend 32) (currentBit!10865 b1!101))) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!233567 () Bool)

(assert (=> b!233567 (= e!160948 e!160949)))

(declare-fun res!195396 () Bool)

(assert (=> b!233567 (=> (not res!195396) (not e!160949))))

(assert (=> b!233567 (= res!195396 (bvsle ((_ sign_extend 32) bytes!19) (bvsdiv (bvsub (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!5295 (buf!5836 b1!101)))) lt!369503) #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!233567 (= lt!369503 (bvadd (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (currentByte!10870 b1!101))) ((_ sign_extend 32) (currentBit!10865 b1!101))))))

(assert (= (and start!49180 res!195397) b!233563))

(assert (= (and b!233563 res!195402) b!233560))

(assert (= (and b!233560 res!195404) b!233559))

(assert (= (and b!233559 res!195401) b!233561))

(assert (= (and b!233561 res!195398) b!233566))

(assert (= (and b!233566 res!195403) b!233567))

(assert (= (and b!233567 res!195396) b!233562))

(assert (= (and b!233562 res!195400) b!233564))

(assert (= (and b!233564 res!195405) b!233558))

(assert (= (and b!233558 res!195399) b!233556))

(assert (= start!49180 b!233565))

(assert (= start!49180 b!233557))

(declare-fun m!356099 () Bool)

(assert (=> b!233563 m!356099))

(declare-fun m!356101 () Bool)

(assert (=> b!233558 m!356101))

(declare-fun m!356103 () Bool)

(assert (=> b!233557 m!356103))

(declare-fun m!356105 () Bool)

(assert (=> b!233566 m!356105))

(declare-fun m!356107 () Bool)

(assert (=> start!49180 m!356107))

(declare-fun m!356109 () Bool)

(assert (=> start!49180 m!356109))

(declare-fun m!356111 () Bool)

(assert (=> b!233565 m!356111))

(declare-fun m!356113 () Bool)

(assert (=> b!233559 m!356113))

(declare-fun m!356115 () Bool)

(assert (=> b!233561 m!356115))

(push 1)

(assert (not b!233561))

(assert (not start!49180))

(assert (not b!233558))

(assert (not b!233563))

(assert (not b!233565))

(assert (not b!233557))

(assert (not b!233559))

(assert (not b!233566))

(check-sat)

(pop 1)

(push 1)

(check-sat)

