; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48608 () Bool)

(assert start!48608)

(declare-fun b!230286 () Bool)

(declare-fun e!158137 () Bool)

(declare-datatypes ((array!11733 0))(
  ( (array!11734 (arr!6130 (Array (_ BitVec 32) (_ BitVec 8))) (size!5143 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9382 0))(
  ( (BitStream!9383 (buf!5684 array!11733) (currentByte!10646 (_ BitVec 32)) (currentBit!10641 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9382)

(declare-fun array_inv!4884 (array!11733) Bool)

(assert (=> b!230286 (= e!158137 (array_inv!4884 (buf!5684 b1!101)))))

(declare-fun res!193041 () Bool)

(declare-fun e!158139 () Bool)

(assert (=> start!48608 (=> (not res!193041) (not e!158139))))

(declare-fun bits!86 () (_ BitVec 64))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun b2!99 () BitStream!9382)

(assert (=> start!48608 (= res!193041 (and (= (size!5143 (buf!5684 b1!101)) (size!5143 (buf!5684 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!48608 e!158139))

(declare-fun inv!12 (BitStream!9382) Bool)

(assert (=> start!48608 (and (inv!12 b1!101) e!158137)))

(declare-fun e!158141 () Bool)

(assert (=> start!48608 (and (inv!12 b2!99) e!158141)))

(assert (=> start!48608 true))

(declare-fun b!230287 () Bool)

(declare-fun res!193039 () Bool)

(assert (=> b!230287 (=> (not res!193039) (not e!158139))))

(assert (=> b!230287 (= res!193039 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(declare-fun b!230288 () Bool)

(declare-fun res!193040 () Bool)

(assert (=> b!230288 (=> (not res!193040) (not e!158139))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!230288 (= res!193040 (bvsle bits!86 (bitIndex!0 (size!5143 (buf!5684 b2!99)) (currentByte!10646 b2!99) (currentBit!10641 b2!99))))))

(declare-fun b!230289 () Bool)

(declare-fun res!193038 () Bool)

(assert (=> b!230289 (=> (not res!193038) (not e!158139))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!230289 (= res!193038 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5143 (buf!5684 b1!101))) ((_ sign_extend 32) (currentByte!10646 b1!101)) ((_ sign_extend 32) (currentBit!10641 b1!101)) bytes!19))))

(declare-fun b!230290 () Bool)

(assert (=> b!230290 (= e!158141 (array_inv!4884 (buf!5684 b2!99)))))

(declare-fun b!230291 () Bool)

(assert (=> b!230291 (= e!158139 false)))

(declare-fun lt!367971 () (_ BitVec 64))

(assert (=> b!230291 (= lt!367971 (bitIndex!0 (size!5143 (buf!5684 b1!101)) (currentByte!10646 b1!101) (currentBit!10641 b1!101)))))

(assert (= (and start!48608 res!193041) b!230288))

(assert (= (and b!230288 res!193040) b!230287))

(assert (= (and b!230287 res!193039) b!230289))

(assert (= (and b!230289 res!193038) b!230291))

(assert (= start!48608 b!230286))

(assert (= start!48608 b!230290))

(declare-fun m!353641 () Bool)

(assert (=> b!230289 m!353641))

(declare-fun m!353643 () Bool)

(assert (=> start!48608 m!353643))

(declare-fun m!353645 () Bool)

(assert (=> start!48608 m!353645))

(declare-fun m!353647 () Bool)

(assert (=> b!230288 m!353647))

(declare-fun m!353649 () Bool)

(assert (=> b!230290 m!353649))

(declare-fun m!353651 () Bool)

(assert (=> b!230291 m!353651))

(declare-fun m!353653 () Bool)

(assert (=> b!230286 m!353653))

(push 1)

(assert (not b!230288))

(assert (not start!48608))

(assert (not b!230290))

(assert (not b!230286))

(assert (not b!230291))

(assert (not b!230289))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

