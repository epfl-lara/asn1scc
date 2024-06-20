; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41592 () Bool)

(assert start!41592)

(declare-fun i!590 () (_ BitVec 32))

(declare-fun lt!303799 () (_ BitVec 64))

(declare-fun e!134315 () Bool)

(declare-fun b!195343 () Bool)

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!195343 (= e!134315 (not (= lt!303799 (bvsub (bvadd lt!303799 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)))))))

(declare-datatypes ((array!10029 0))(
  ( (array!10030 (arr!5352 (Array (_ BitVec 32) (_ BitVec 8))) (size!4422 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7952 0))(
  ( (BitStream!7953 (buf!4908 array!10029) (currentByte!9210 (_ BitVec 32)) (currentBit!9205 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!7952)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195343 (= lt!303799 (bitIndex!0 (size!4422 (buf!4908 thiss!1204)) (currentByte!9210 thiss!1204) (currentBit!9205 thiss!1204)))))

(declare-fun b!195344 () Bool)

(declare-fun res!163399 () Bool)

(assert (=> b!195344 (=> (not res!163399) (not e!134315))))

(assert (=> b!195344 (= res!163399 (= i!590 nBits!348))))

(declare-fun b!195345 () Bool)

(declare-fun res!163401 () Bool)

(assert (=> b!195345 (=> (not res!163401) (not e!134315))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195345 (= res!163401 (invariant!0 (currentBit!9205 thiss!1204) (currentByte!9210 thiss!1204) (size!4422 (buf!4908 thiss!1204))))))

(declare-fun b!195346 () Bool)

(declare-fun res!163400 () Bool)

(assert (=> b!195346 (=> (not res!163400) (not e!134315))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195346 (= res!163400 (validate_offset_bits!1 ((_ sign_extend 32) (size!4422 (buf!4908 thiss!1204))) ((_ sign_extend 32) (currentByte!9210 thiss!1204)) ((_ sign_extend 32) (currentBit!9205 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!195347 () Bool)

(declare-fun e!134314 () Bool)

(declare-fun array_inv!4163 (array!10029) Bool)

(assert (=> b!195347 (= e!134314 (array_inv!4163 (buf!4908 thiss!1204)))))

(declare-fun res!163398 () Bool)

(assert (=> start!41592 (=> (not res!163398) (not e!134315))))

(assert (=> start!41592 (= res!163398 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41592 e!134315))

(assert (=> start!41592 true))

(declare-fun inv!12 (BitStream!7952) Bool)

(assert (=> start!41592 (and (inv!12 thiss!1204) e!134314)))

(assert (= (and start!41592 res!163398) b!195346))

(assert (= (and b!195346 res!163400) b!195345))

(assert (= (and b!195345 res!163401) b!195344))

(assert (= (and b!195344 res!163399) b!195343))

(assert (= start!41592 b!195347))

(declare-fun m!302575 () Bool)

(assert (=> b!195345 m!302575))

(declare-fun m!302577 () Bool)

(assert (=> b!195346 m!302577))

(declare-fun m!302579 () Bool)

(assert (=> b!195347 m!302579))

(declare-fun m!302581 () Bool)

(assert (=> b!195343 m!302581))

(declare-fun m!302583 () Bool)

(assert (=> start!41592 m!302583))

(push 1)

(assert (not b!195346))

(assert (not start!41592))

(assert (not b!195345))

(assert (not b!195347))

(assert (not b!195343))

(check-sat)

