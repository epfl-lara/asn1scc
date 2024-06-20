; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!49058 () Bool)

(assert start!49058)

(declare-fun b!233049 () Bool)

(declare-fun e!160531 () Bool)

(assert (=> b!233049 (= e!160531 false)))

(declare-fun lt!369090 () (_ BitVec 64))

(declare-datatypes ((array!12027 0))(
  ( (array!12028 (arr!6266 (Array (_ BitVec 32) (_ BitVec 8))) (size!5279 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!9654 0))(
  ( (BitStream!9655 (buf!5820 array!12027) (currentByte!10827 (_ BitVec 32)) (currentBit!10822 (_ BitVec 32))) )
))
(declare-fun b1!101 () BitStream!9654)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!233049 (= lt!369090 (bitIndex!0 (size!5279 (buf!5820 b1!101)) (currentByte!10827 b1!101) (currentBit!10822 b1!101)))))

(declare-fun b!233051 () Bool)

(declare-fun e!160528 () Bool)

(declare-fun b2!99 () BitStream!9654)

(declare-fun array_inv!5020 (array!12027) Bool)

(assert (=> b!233051 (= e!160528 (array_inv!5020 (buf!5820 b2!99)))))

(declare-fun b!233052 () Bool)

(declare-fun res!194987 () Bool)

(assert (=> b!233052 (=> (not res!194987) (not e!160531))))

(declare-fun bytes!19 () (_ BitVec 32))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!233052 (= res!194987 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5279 (buf!5820 b1!101))) ((_ sign_extend 32) (currentByte!10827 b1!101)) ((_ sign_extend 32) (currentBit!10822 b1!101)) bytes!19))))

(declare-fun b!233053 () Bool)

(declare-fun res!194988 () Bool)

(assert (=> b!233053 (=> (not res!194988) (not e!160531))))

(declare-fun bits!86 () (_ BitVec 64))

(assert (=> b!233053 (= res!194988 (bvsle bits!86 (bitIndex!0 (size!5279 (buf!5820 b2!99)) (currentByte!10827 b2!99) (currentBit!10822 b2!99))))))

(declare-fun b!233054 () Bool)

(declare-fun e!160532 () Bool)

(assert (=> b!233054 (= e!160532 (array_inv!5020 (buf!5820 b1!101)))))

(declare-fun res!194985 () Bool)

(assert (=> start!49058 (=> (not res!194985) (not e!160531))))

(assert (=> start!49058 (= res!194985 (and (= (size!5279 (buf!5820 b1!101)) (size!5279 (buf!5820 b2!99))) (bvslt #b00000000000000000000000000000000 bytes!19) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 bits!86)))))

(assert (=> start!49058 e!160531))

(declare-fun inv!12 (BitStream!9654) Bool)

(assert (=> start!49058 (and (inv!12 b1!101) e!160532)))

(assert (=> start!49058 (and (inv!12 b2!99) e!160528)))

(assert (=> start!49058 true))

(declare-fun b!233050 () Bool)

(declare-fun res!194986 () Bool)

(assert (=> b!233050 (=> (not res!194986) (not e!160531))))

(assert (=> b!233050 (= res!194986 (bvsle ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000111 bits!86) #b0000000000000000000000000000000000000000000000000000000000001000)) bytes!19))))

(assert (= (and start!49058 res!194985) b!233053))

(assert (= (and b!233053 res!194988) b!233050))

(assert (= (and b!233050 res!194986) b!233052))

(assert (= (and b!233052 res!194987) b!233049))

(assert (= start!49058 b!233054))

(assert (= start!49058 b!233051))

(declare-fun m!355783 () Bool)

(assert (=> b!233051 m!355783))

(declare-fun m!355785 () Bool)

(assert (=> b!233053 m!355785))

(declare-fun m!355787 () Bool)

(assert (=> b!233049 m!355787))

(declare-fun m!355789 () Bool)

(assert (=> b!233054 m!355789))

(declare-fun m!355791 () Bool)

(assert (=> start!49058 m!355791))

(declare-fun m!355793 () Bool)

(assert (=> start!49058 m!355793))

(declare-fun m!355795 () Bool)

(assert (=> b!233052 m!355795))

(check-sat (not b!233049) (not start!49058) (not b!233053) (not b!233051) (not b!233052) (not b!233054))
