; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41600 () Bool)

(assert start!41600)

(declare-fun b!195420 () Bool)

(declare-fun e!134369 () Bool)

(declare-fun e!134367 () Bool)

(assert (=> b!195420 (= e!134369 e!134367)))

(declare-fun res!163463 () Bool)

(assert (=> b!195420 (=> (not res!163463) (not e!134367))))

(declare-fun lt!303831 () Bool)

(declare-datatypes ((array!10037 0))(
  ( (array!10038 (arr!5356 (Array (_ BitVec 32) (_ BitVec 8))) (size!4426 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7960 0))(
  ( (BitStream!7961 (buf!4912 array!10037) (currentByte!9214 (_ BitVec 32)) (currentBit!9209 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16892 0))(
  ( (tuple2!16893 (_1!9091 BitStream!7960) (_2!9091 Bool)) )
))
(declare-fun lt!303830 () tuple2!16892)

(declare-datatypes ((Unit!13795 0))(
  ( (Unit!13796) )
))
(declare-datatypes ((tuple2!16894 0))(
  ( (tuple2!16895 (_1!9092 Unit!13795) (_2!9092 BitStream!7960)) )
))
(declare-fun lt!303828 () tuple2!16894)

(assert (=> b!195420 (= res!163463 (and (= (_2!9091 lt!303830) lt!303831) (= (_1!9091 lt!303830) (_2!9092 lt!303828))))))

(declare-fun thiss!1204 () BitStream!7960)

(declare-fun readBitPure!0 (BitStream!7960) tuple2!16892)

(declare-fun readerFrom!0 (BitStream!7960 (_ BitVec 32) (_ BitVec 32)) BitStream!7960)

(assert (=> b!195420 (= lt!303830 (readBitPure!0 (readerFrom!0 (_2!9092 lt!303828) (currentBit!9209 thiss!1204) (currentByte!9214 thiss!1204))))))

(declare-fun b!195421 () Bool)

(declare-fun res!163465 () Bool)

(declare-fun e!134368 () Bool)

(assert (=> b!195421 (=> (not res!163465) (not e!134368))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195421 (= res!163465 (invariant!0 (currentBit!9209 thiss!1204) (currentByte!9214 thiss!1204) (size!4426 (buf!4912 thiss!1204))))))

(declare-fun b!195422 () Bool)

(declare-fun res!163469 () Bool)

(assert (=> b!195422 (=> (not res!163469) (not e!134368))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!195422 (= res!163469 (not (= i!590 nBits!348)))))

(declare-fun b!195423 () Bool)

(declare-fun res!163464 () Bool)

(assert (=> b!195423 (=> (not res!163464) (not e!134368))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195423 (= res!163464 (validate_offset_bits!1 ((_ sign_extend 32) (size!4426 (buf!4912 thiss!1204))) ((_ sign_extend 32) (currentByte!9214 thiss!1204)) ((_ sign_extend 32) (currentBit!9209 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!195424 () Bool)

(declare-fun e!134365 () Bool)

(assert (=> b!195424 (= e!134365 e!134369)))

(declare-fun res!163466 () Bool)

(assert (=> b!195424 (=> (not res!163466) (not e!134369))))

(declare-fun lt!303829 () (_ BitVec 64))

(declare-fun lt!303832 () (_ BitVec 64))

(assert (=> b!195424 (= res!163466 (= lt!303829 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!303832)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195424 (= lt!303829 (bitIndex!0 (size!4426 (buf!4912 (_2!9092 lt!303828))) (currentByte!9214 (_2!9092 lt!303828)) (currentBit!9209 (_2!9092 lt!303828))))))

(assert (=> b!195424 (= lt!303832 (bitIndex!0 (size!4426 (buf!4912 thiss!1204)) (currentByte!9214 thiss!1204) (currentBit!9209 thiss!1204)))))

(declare-fun res!163470 () Bool)

(assert (=> start!41600 (=> (not res!163470) (not e!134368))))

(assert (=> start!41600 (= res!163470 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41600 e!134368))

(assert (=> start!41600 true))

(declare-fun e!134366 () Bool)

(declare-fun inv!12 (BitStream!7960) Bool)

(assert (=> start!41600 (and (inv!12 thiss!1204) e!134366)))

(declare-fun b!195425 () Bool)

(assert (=> b!195425 (= e!134368 (not (= (bitIndex!0 (size!4426 (buf!4912 (_2!9092 lt!303828))) (currentByte!9214 (_2!9092 lt!303828)) (currentBit!9209 (_2!9092 lt!303828))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 (bitIndex!0 (size!4426 (buf!4912 thiss!1204)) (currentByte!9214 thiss!1204) (currentBit!9209 thiss!1204))))))))

(assert (=> b!195425 e!134365))

(declare-fun res!163468 () Bool)

(assert (=> b!195425 (=> (not res!163468) (not e!134365))))

(assert (=> b!195425 (= res!163468 (= (size!4426 (buf!4912 thiss!1204)) (size!4426 (buf!4912 (_2!9092 lt!303828)))))))

(declare-fun appendBit!0 (BitStream!7960 Bool) tuple2!16894)

(assert (=> b!195425 (= lt!303828 (appendBit!0 thiss!1204 lt!303831))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!195425 (= lt!303831 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195426 () Bool)

(assert (=> b!195426 (= e!134367 (= (bitIndex!0 (size!4426 (buf!4912 (_1!9091 lt!303830))) (currentByte!9214 (_1!9091 lt!303830)) (currentBit!9209 (_1!9091 lt!303830))) lt!303829))))

(declare-fun b!195427 () Bool)

(declare-fun res!163467 () Bool)

(assert (=> b!195427 (=> (not res!163467) (not e!134369))))

(declare-fun isPrefixOf!0 (BitStream!7960 BitStream!7960) Bool)

(assert (=> b!195427 (= res!163467 (isPrefixOf!0 thiss!1204 (_2!9092 lt!303828)))))

(declare-fun b!195428 () Bool)

(declare-fun array_inv!4167 (array!10037) Bool)

(assert (=> b!195428 (= e!134366 (array_inv!4167 (buf!4912 thiss!1204)))))

(assert (= (and start!41600 res!163470) b!195423))

(assert (= (and b!195423 res!163464) b!195421))

(assert (= (and b!195421 res!163465) b!195422))

(assert (= (and b!195422 res!163469) b!195425))

(assert (= (and b!195425 res!163468) b!195424))

(assert (= (and b!195424 res!163466) b!195427))

(assert (= (and b!195427 res!163467) b!195420))

(assert (= (and b!195420 res!163463) b!195426))

(assert (= start!41600 b!195428))

(declare-fun m!302627 () Bool)

(assert (=> start!41600 m!302627))

(declare-fun m!302629 () Bool)

(assert (=> b!195425 m!302629))

(declare-fun m!302631 () Bool)

(assert (=> b!195425 m!302631))

(declare-fun m!302633 () Bool)

(assert (=> b!195425 m!302633))

(declare-fun m!302635 () Bool)

(assert (=> b!195421 m!302635))

(declare-fun m!302637 () Bool)

(assert (=> b!195426 m!302637))

(declare-fun m!302639 () Bool)

(assert (=> b!195420 m!302639))

(assert (=> b!195420 m!302639))

(declare-fun m!302641 () Bool)

(assert (=> b!195420 m!302641))

(declare-fun m!302643 () Bool)

(assert (=> b!195423 m!302643))

(assert (=> b!195424 m!302629))

(assert (=> b!195424 m!302631))

(declare-fun m!302645 () Bool)

(assert (=> b!195428 m!302645))

(declare-fun m!302647 () Bool)

(assert (=> b!195427 m!302647))

(push 1)

(assert (not b!195428))

(assert (not b!195423))

(assert (not b!195427))

(assert (not b!195426))

(assert (not start!41600))

(assert (not b!195420))

(assert (not b!195425))

(assert (not b!195424))

(assert (not b!195421))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

