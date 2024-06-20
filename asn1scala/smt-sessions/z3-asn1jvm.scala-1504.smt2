; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41602 () Bool)

(assert start!41602)

(declare-fun b!195447 () Bool)

(declare-fun res!163489 () Bool)

(declare-fun e!134385 () Bool)

(assert (=> b!195447 (=> (not res!163489) (not e!134385))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!195447 (= res!163489 (not (= i!590 nBits!348)))))

(declare-fun res!163493 () Bool)

(assert (=> start!41602 (=> (not res!163493) (not e!134385))))

(assert (=> start!41602 (= res!163493 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41602 e!134385))

(assert (=> start!41602 true))

(declare-datatypes ((array!10039 0))(
  ( (array!10040 (arr!5357 (Array (_ BitVec 32) (_ BitVec 8))) (size!4427 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7962 0))(
  ( (BitStream!7963 (buf!4913 array!10039) (currentByte!9215 (_ BitVec 32)) (currentBit!9210 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7962)

(declare-fun e!134384 () Bool)

(declare-fun inv!12 (BitStream!7962) Bool)

(assert (=> start!41602 (and (inv!12 thiss!1204) e!134384)))

(declare-fun b!195448 () Bool)

(declare-fun res!163487 () Bool)

(assert (=> b!195448 (=> (not res!163487) (not e!134385))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195448 (= res!163487 (validate_offset_bits!1 ((_ sign_extend 32) (size!4427 (buf!4913 thiss!1204))) ((_ sign_extend 32) (currentByte!9215 thiss!1204)) ((_ sign_extend 32) (currentBit!9210 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!195449 () Bool)

(declare-fun res!163492 () Bool)

(declare-fun e!134386 () Bool)

(assert (=> b!195449 (=> (not res!163492) (not e!134386))))

(declare-datatypes ((Unit!13797 0))(
  ( (Unit!13798) )
))
(declare-datatypes ((tuple2!16896 0))(
  ( (tuple2!16897 (_1!9093 Unit!13797) (_2!9093 BitStream!7962)) )
))
(declare-fun lt!303843 () tuple2!16896)

(declare-fun isPrefixOf!0 (BitStream!7962 BitStream!7962) Bool)

(assert (=> b!195449 (= res!163492 (isPrefixOf!0 thiss!1204 (_2!9093 lt!303843)))))

(declare-fun b!195450 () Bool)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195450 (= e!134385 (not (= (bitIndex!0 (size!4427 (buf!4913 (_2!9093 lt!303843))) (currentByte!9215 (_2!9093 lt!303843)) (currentBit!9210 (_2!9093 lt!303843))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4427 (buf!4913 thiss!1204)) (currentByte!9215 thiss!1204) (currentBit!9210 thiss!1204))))))))

(declare-fun e!134382 () Bool)

(assert (=> b!195450 e!134382))

(declare-fun res!163490 () Bool)

(assert (=> b!195450 (=> (not res!163490) (not e!134382))))

(assert (=> b!195450 (= res!163490 (= (size!4427 (buf!4913 thiss!1204)) (size!4427 (buf!4913 (_2!9093 lt!303843)))))))

(declare-fun lt!303846 () Bool)

(declare-fun appendBit!0 (BitStream!7962 Bool) tuple2!16896)

(assert (=> b!195450 (= lt!303843 (appendBit!0 thiss!1204 lt!303846))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!195450 (= lt!303846 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195451 () Bool)

(declare-fun e!134387 () Bool)

(declare-datatypes ((tuple2!16898 0))(
  ( (tuple2!16899 (_1!9094 BitStream!7962) (_2!9094 Bool)) )
))
(declare-fun lt!303847 () tuple2!16898)

(declare-fun lt!303844 () (_ BitVec 64))

(assert (=> b!195451 (= e!134387 (= (bitIndex!0 (size!4427 (buf!4913 (_1!9094 lt!303847))) (currentByte!9215 (_1!9094 lt!303847)) (currentBit!9210 (_1!9094 lt!303847))) lt!303844))))

(declare-fun b!195452 () Bool)

(assert (=> b!195452 (= e!134386 e!134387)))

(declare-fun res!163491 () Bool)

(assert (=> b!195452 (=> (not res!163491) (not e!134387))))

(assert (=> b!195452 (= res!163491 (and (= (_2!9094 lt!303847) lt!303846) (= (_1!9094 lt!303847) (_2!9093 lt!303843))))))

(declare-fun readBitPure!0 (BitStream!7962) tuple2!16898)

(declare-fun readerFrom!0 (BitStream!7962 (_ BitVec 32) (_ BitVec 32)) BitStream!7962)

(assert (=> b!195452 (= lt!303847 (readBitPure!0 (readerFrom!0 (_2!9093 lt!303843) (currentBit!9210 thiss!1204) (currentByte!9215 thiss!1204))))))

(declare-fun b!195453 () Bool)

(declare-fun array_inv!4168 (array!10039) Bool)

(assert (=> b!195453 (= e!134384 (array_inv!4168 (buf!4913 thiss!1204)))))

(declare-fun b!195454 () Bool)

(assert (=> b!195454 (= e!134382 e!134386)))

(declare-fun res!163494 () Bool)

(assert (=> b!195454 (=> (not res!163494) (not e!134386))))

(declare-fun lt!303845 () (_ BitVec 64))

(assert (=> b!195454 (= res!163494 (= lt!303844 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!303845)))))

(assert (=> b!195454 (= lt!303844 (bitIndex!0 (size!4427 (buf!4913 (_2!9093 lt!303843))) (currentByte!9215 (_2!9093 lt!303843)) (currentBit!9210 (_2!9093 lt!303843))))))

(assert (=> b!195454 (= lt!303845 (bitIndex!0 (size!4427 (buf!4913 thiss!1204)) (currentByte!9215 thiss!1204) (currentBit!9210 thiss!1204)))))

(declare-fun b!195455 () Bool)

(declare-fun res!163488 () Bool)

(assert (=> b!195455 (=> (not res!163488) (not e!134385))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195455 (= res!163488 (invariant!0 (currentBit!9210 thiss!1204) (currentByte!9215 thiss!1204) (size!4427 (buf!4913 thiss!1204))))))

(assert (= (and start!41602 res!163493) b!195448))

(assert (= (and b!195448 res!163487) b!195455))

(assert (= (and b!195455 res!163488) b!195447))

(assert (= (and b!195447 res!163489) b!195450))

(assert (= (and b!195450 res!163490) b!195454))

(assert (= (and b!195454 res!163494) b!195449))

(assert (= (and b!195449 res!163492) b!195452))

(assert (= (and b!195452 res!163491) b!195451))

(assert (= start!41602 b!195453))

(declare-fun m!302649 () Bool)

(assert (=> b!195449 m!302649))

(declare-fun m!302651 () Bool)

(assert (=> b!195455 m!302651))

(declare-fun m!302653 () Bool)

(assert (=> b!195451 m!302653))

(declare-fun m!302655 () Bool)

(assert (=> b!195452 m!302655))

(assert (=> b!195452 m!302655))

(declare-fun m!302657 () Bool)

(assert (=> b!195452 m!302657))

(declare-fun m!302659 () Bool)

(assert (=> start!41602 m!302659))

(declare-fun m!302661 () Bool)

(assert (=> b!195450 m!302661))

(declare-fun m!302663 () Bool)

(assert (=> b!195450 m!302663))

(declare-fun m!302665 () Bool)

(assert (=> b!195450 m!302665))

(assert (=> b!195454 m!302661))

(assert (=> b!195454 m!302663))

(declare-fun m!302667 () Bool)

(assert (=> b!195448 m!302667))

(declare-fun m!302669 () Bool)

(assert (=> b!195453 m!302669))

(check-sat (not start!41602) (not b!195451) (not b!195449) (not b!195454) (not b!195455) (not b!195448) (not b!195452) (not b!195453) (not b!195450))
