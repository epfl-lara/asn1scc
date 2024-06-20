; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41604 () Bool)

(assert start!41604)

(declare-fun b!195474 () Bool)

(declare-fun e!134405 () Bool)

(declare-fun e!134401 () Bool)

(assert (=> b!195474 (= e!134405 e!134401)))

(declare-fun res!163512 () Bool)

(assert (=> b!195474 (=> (not res!163512) (not e!134401))))

(declare-fun lt!303862 () (_ BitVec 64))

(declare-fun lt!303861 () (_ BitVec 64))

(assert (=> b!195474 (= res!163512 (= lt!303862 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!303861)))))

(declare-datatypes ((array!10041 0))(
  ( (array!10042 (arr!5358 (Array (_ BitVec 32) (_ BitVec 8))) (size!4428 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7964 0))(
  ( (BitStream!7965 (buf!4914 array!10041) (currentByte!9216 (_ BitVec 32)) (currentBit!9211 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!13799 0))(
  ( (Unit!13800) )
))
(declare-datatypes ((tuple2!16900 0))(
  ( (tuple2!16901 (_1!9095 Unit!13799) (_2!9095 BitStream!7964)) )
))
(declare-fun lt!303860 () tuple2!16900)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195474 (= lt!303862 (bitIndex!0 (size!4428 (buf!4914 (_2!9095 lt!303860))) (currentByte!9216 (_2!9095 lt!303860)) (currentBit!9211 (_2!9095 lt!303860))))))

(declare-fun thiss!1204 () BitStream!7964)

(assert (=> b!195474 (= lt!303861 (bitIndex!0 (size!4428 (buf!4914 thiss!1204)) (currentByte!9216 thiss!1204) (currentBit!9211 thiss!1204)))))

(declare-fun res!163517 () Bool)

(declare-fun e!134404 () Bool)

(assert (=> start!41604 (=> (not res!163517) (not e!134404))))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun i!590 () (_ BitVec 32))

(assert (=> start!41604 (= res!163517 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41604 e!134404))

(assert (=> start!41604 true))

(declare-fun e!134402 () Bool)

(declare-fun inv!12 (BitStream!7964) Bool)

(assert (=> start!41604 (and (inv!12 thiss!1204) e!134402)))

(declare-fun b!195475 () Bool)

(declare-fun e!134400 () Bool)

(assert (=> b!195475 (= e!134401 e!134400)))

(declare-fun res!163518 () Bool)

(assert (=> b!195475 (=> (not res!163518) (not e!134400))))

(declare-datatypes ((tuple2!16902 0))(
  ( (tuple2!16903 (_1!9096 BitStream!7964) (_2!9096 Bool)) )
))
(declare-fun lt!303859 () tuple2!16902)

(declare-fun lt!303858 () Bool)

(assert (=> b!195475 (= res!163518 (and (= (_2!9096 lt!303859) lt!303858) (= (_1!9096 lt!303859) (_2!9095 lt!303860))))))

(declare-fun readBitPure!0 (BitStream!7964) tuple2!16902)

(declare-fun readerFrom!0 (BitStream!7964 (_ BitVec 32) (_ BitVec 32)) BitStream!7964)

(assert (=> b!195475 (= lt!303859 (readBitPure!0 (readerFrom!0 (_2!9095 lt!303860) (currentBit!9211 thiss!1204) (currentByte!9216 thiss!1204))))))

(declare-fun b!195476 () Bool)

(declare-fun res!163515 () Bool)

(assert (=> b!195476 (=> (not res!163515) (not e!134404))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195476 (= res!163515 (invariant!0 (currentBit!9211 thiss!1204) (currentByte!9216 thiss!1204) (size!4428 (buf!4914 thiss!1204))))))

(declare-fun b!195477 () Bool)

(declare-fun array_inv!4169 (array!10041) Bool)

(assert (=> b!195477 (= e!134402 (array_inv!4169 (buf!4914 thiss!1204)))))

(declare-fun b!195478 () Bool)

(declare-fun res!163513 () Bool)

(assert (=> b!195478 (=> (not res!163513) (not e!134401))))

(declare-fun isPrefixOf!0 (BitStream!7964 BitStream!7964) Bool)

(assert (=> b!195478 (= res!163513 (isPrefixOf!0 thiss!1204 (_2!9095 lt!303860)))))

(declare-fun b!195479 () Bool)

(declare-fun res!163516 () Bool)

(assert (=> b!195479 (=> (not res!163516) (not e!134404))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195479 (= res!163516 (validate_offset_bits!1 ((_ sign_extend 32) (size!4428 (buf!4914 thiss!1204))) ((_ sign_extend 32) (currentByte!9216 thiss!1204)) ((_ sign_extend 32) (currentBit!9211 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!195480 () Bool)

(assert (=> b!195480 (= e!134400 (= (bitIndex!0 (size!4428 (buf!4914 (_1!9096 lt!303859))) (currentByte!9216 (_1!9096 lt!303859)) (currentBit!9211 (_1!9096 lt!303859))) lt!303862))))

(declare-fun b!195481 () Bool)

(declare-fun res!163511 () Bool)

(assert (=> b!195481 (=> (not res!163511) (not e!134404))))

(assert (=> b!195481 (= res!163511 (not (= i!590 nBits!348)))))

(declare-fun b!195482 () Bool)

(assert (=> b!195482 (= e!134404 (not (= (bitIndex!0 (size!4428 (buf!4914 (_2!9095 lt!303860))) (currentByte!9216 (_2!9095 lt!303860)) (currentBit!9211 (_2!9095 lt!303860))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4428 (buf!4914 thiss!1204)) (currentByte!9216 thiss!1204) (currentBit!9211 thiss!1204))))))))

(assert (=> b!195482 e!134405))

(declare-fun res!163514 () Bool)

(assert (=> b!195482 (=> (not res!163514) (not e!134405))))

(assert (=> b!195482 (= res!163514 (= (size!4428 (buf!4914 thiss!1204)) (size!4428 (buf!4914 (_2!9095 lt!303860)))))))

(declare-fun appendBit!0 (BitStream!7964 Bool) tuple2!16900)

(assert (=> b!195482 (= lt!303860 (appendBit!0 thiss!1204 lt!303858))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!195482 (= lt!303858 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!41604 res!163517) b!195479))

(assert (= (and b!195479 res!163516) b!195476))

(assert (= (and b!195476 res!163515) b!195481))

(assert (= (and b!195481 res!163511) b!195482))

(assert (= (and b!195482 res!163514) b!195474))

(assert (= (and b!195474 res!163512) b!195478))

(assert (= (and b!195478 res!163513) b!195475))

(assert (= (and b!195475 res!163518) b!195480))

(assert (= start!41604 b!195477))

(declare-fun m!302671 () Bool)

(assert (=> b!195479 m!302671))

(declare-fun m!302673 () Bool)

(assert (=> start!41604 m!302673))

(declare-fun m!302675 () Bool)

(assert (=> b!195482 m!302675))

(declare-fun m!302677 () Bool)

(assert (=> b!195482 m!302677))

(declare-fun m!302679 () Bool)

(assert (=> b!195482 m!302679))

(assert (=> b!195474 m!302675))

(assert (=> b!195474 m!302677))

(declare-fun m!302681 () Bool)

(assert (=> b!195475 m!302681))

(assert (=> b!195475 m!302681))

(declare-fun m!302683 () Bool)

(assert (=> b!195475 m!302683))

(declare-fun m!302685 () Bool)

(assert (=> b!195477 m!302685))

(declare-fun m!302687 () Bool)

(assert (=> b!195478 m!302687))

(declare-fun m!302689 () Bool)

(assert (=> b!195476 m!302689))

(declare-fun m!302691 () Bool)

(assert (=> b!195480 m!302691))

(push 1)

(assert (not b!195480))

(assert (not b!195475))

