; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41590 () Bool)

(assert start!41590)

(declare-fun b!195328 () Bool)

(declare-fun res!163386 () Bool)

(declare-fun e!134305 () Bool)

(assert (=> b!195328 (=> (not res!163386) (not e!134305))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-datatypes ((array!10027 0))(
  ( (array!10028 (arr!5351 (Array (_ BitVec 32) (_ BitVec 8))) (size!4421 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7950 0))(
  ( (BitStream!7951 (buf!4907 array!10027) (currentByte!9209 (_ BitVec 32)) (currentBit!9204 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7950)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195328 (= res!163386 (validate_offset_bits!1 ((_ sign_extend 32) (size!4421 (buf!4907 thiss!1204))) ((_ sign_extend 32) (currentByte!9209 thiss!1204)) ((_ sign_extend 32) (currentBit!9204 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!195329 () Bool)

(declare-fun e!134306 () Bool)

(declare-fun array_inv!4162 (array!10027) Bool)

(assert (=> b!195329 (= e!134306 (array_inv!4162 (buf!4907 thiss!1204)))))

(declare-fun b!195330 () Bool)

(declare-fun res!163387 () Bool)

(assert (=> b!195330 (=> (not res!163387) (not e!134305))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195330 (= res!163387 (invariant!0 (currentBit!9204 thiss!1204) (currentByte!9209 thiss!1204) (size!4421 (buf!4907 thiss!1204))))))

(declare-fun b!195331 () Bool)

(declare-fun res!163389 () Bool)

(assert (=> b!195331 (=> (not res!163389) (not e!134305))))

(assert (=> b!195331 (= res!163389 (= i!590 nBits!348))))

(declare-fun res!163388 () Bool)

(assert (=> start!41590 (=> (not res!163388) (not e!134305))))

(assert (=> start!41590 (= res!163388 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41590 e!134305))

(assert (=> start!41590 true))

(declare-fun inv!12 (BitStream!7950) Bool)

(assert (=> start!41590 (and (inv!12 thiss!1204) e!134306)))

(declare-fun lt!303796 () (_ BitVec 64))

(declare-fun b!195332 () Bool)

(assert (=> b!195332 (= e!134305 (not (= lt!303796 (bvsub (bvadd lt!303796 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195332 (= lt!303796 (bitIndex!0 (size!4421 (buf!4907 thiss!1204)) (currentByte!9209 thiss!1204) (currentBit!9204 thiss!1204)))))

(assert (= (and start!41590 res!163388) b!195328))

(assert (= (and b!195328 res!163386) b!195330))

(assert (= (and b!195330 res!163387) b!195331))

(assert (= (and b!195331 res!163389) b!195332))

(assert (= start!41590 b!195329))

(declare-fun m!302565 () Bool)

(assert (=> start!41590 m!302565))

(declare-fun m!302567 () Bool)

(assert (=> b!195329 m!302567))

(declare-fun m!302569 () Bool)

(assert (=> b!195332 m!302569))

(declare-fun m!302571 () Bool)

(assert (=> b!195328 m!302571))

(declare-fun m!302573 () Bool)

(assert (=> b!195330 m!302573))

(check-sat (not b!195329) (not b!195330) (not b!195332) (not b!195328) (not start!41590))
