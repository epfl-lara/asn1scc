; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49182 () Bool)

(assert start!49182)

(declare-fun b!233580 () Bool)

(declare-fun e!160966 () Bool)

(assert (=> b!233580 (= e!160966 false)))

(declare-fun lt!369510 () (_ BitVec 64))

(declare-datatypes ((array!12070 0))(
  ( (array!12071 (arr!6283 (Array (_ BitVec 32) (_ BitVec 8))) (size!5296 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9688 0))(
  ( (BitStream!9689 (buf!5837 array!12070) (currentByte!10871 (_ BitVec 32)) (currentBit!10866 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9688)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233580 (= lt!369510 (bitIndex!0 (size!5296 (buf!5837 b1!101)) (currentByte!10871 b1!101) (currentBit!10866 b1!101)))))

(declare-fun b!233581 () Bool)

(declare-fun res!195417 () Bool)

(assert (=> b!233581 (=> (not res!195417) (not e!160966))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(assert (=> b!233581 (= res!195417 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!233582 () Bool)

(declare-fun e!160963 () Bool)

(declare-fun array_inv!5037 (array!12070) Bool)

(assert (=> b!233582 (= e!160963 (array_inv!5037 (buf!5837 b1!101)))))

(declare-fun b!233584 () Bool)

(declare-fun res!195414 () Bool)

(assert (=> b!233584 (=> (not res!195414) (not e!160966))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233584 (= res!195414 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5296 (buf!5837 b1!101))) ((_ sign_extend 32) (currentByte!10871 b1!101)) ((_ sign_extend 32) (currentBit!10866 b1!101)) bytes!19))))

(declare-fun b!233585 () Bool)

(declare-fun res!195416 () Bool)

(assert (=> b!233585 (=> (not res!195416) (not e!160966))))

(declare-fun b2!99 () BitStream!9688)

(assert (=> b!233585 (= res!195416 (bvsle bits!86 (bitIndex!0 (size!5296 (buf!5837 b2!99)) (currentByte!10871 b2!99) (currentBit!10866 b2!99))))))

(declare-fun res!195415 () Bool)

(assert (=> start!49182 (=> (not res!195415) (not e!160966))))

(assert (=> start!49182 (= res!195415 (and (= (size!5296 (buf!5837 b1!101)) (size!5296 (buf!5837 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49182 e!160966))

(declare-fun inv!12 (BitStream!9688) Bool)

(assert (=> start!49182 (and (inv!12 b1!101) e!160963)))

(declare-fun e!160967 () Bool)

(assert (=> start!49182 (and (inv!12 b2!99) e!160967)))

(assert (=> start!49182 true))

(declare-fun b!233583 () Bool)

(assert (=> b!233583 (= e!160967 (array_inv!5037 (buf!5837 b2!99)))))

(assert (= (and start!49182 res!195415) b!233585))

(assert (= (and b!233585 res!195416) b!233581))

(assert (= (and b!233581 res!195417) b!233584))

(assert (= (and b!233584 res!195414) b!233580))

(assert (= start!49182 b!233582))

(assert (= start!49182 b!233583))

(declare-fun m!356117 () Bool)

(assert (=> b!233584 m!356117))

(declare-fun m!356119 () Bool)

(assert (=> b!233583 m!356119))

(declare-fun m!356121 () Bool)

(assert (=> b!233582 m!356121))

(declare-fun m!356123 () Bool)

(assert (=> b!233580 m!356123))

(declare-fun m!356125 () Bool)

(assert (=> start!49182 m!356125))

(declare-fun m!356127 () Bool)

(assert (=> start!49182 m!356127))

(declare-fun m!356129 () Bool)

(assert (=> b!233585 m!356129))

(push 1)

(assert (not b!233585))

(assert (not b!233583))

(assert (not b!233584))

(assert (not start!49182))

(assert (not b!233582))

(assert (not b!233580))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

